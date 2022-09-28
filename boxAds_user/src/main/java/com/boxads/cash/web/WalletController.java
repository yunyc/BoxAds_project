package com.boxads.cash.web;

import java.io.BufferedOutputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.text.DecimalFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.boxads.cash.service.CashService;
import com.boxads.cash.vo.CashVO;
import com.boxads.deal.service.BankInfoService;
import com.boxads.deal.service.BillService;
import com.boxads.deal.vo.BankInfoVO;
import com.boxads.deal.vo.BillVO;
import com.boxads.etc.vo.CouponVO;
import com.boxads.main.ObjectUtil;
import com.boxads.main.service.MemberService;
import com.boxads.main.vo.MemberVO;

@Controller
@RequestMapping("/wallet")
public class WalletController {

    private static final Logger log = LoggerFactory.getLogger(WalletController.class);
    
    @Resource private CashService cashService;
    @Resource private MemberService memberService;
    @Resource private BankInfoService bankService;
    @Resource private BillService billService;
    
    private final int cashRows = 20; // cash 기본 20줄 표시
    private final int couponRows = 20; // coupon 기본 20줄 표시
    
    // PG_AUTHKEY, MID
    @Resource(name = "pg_authkey") private String PG_AUTHKEY;
    @Resource(name = "p_mid") private String P_MID;
    @Resource private String paylogPath;
    
    // 충전내역보기
    @RequestMapping(value = "/cash", method = RequestMethod.GET)
    public String cash_list(@ModelAttribute CashVO cashVO, HttpSession session, Model model) throws Exception {
        log.info("cashInit시작");
        
        MemberVO memberVO = (MemberVO) session.getAttribute("login");
        HashMap<String, Integer> cash = memberService.selectCashAndEsti(memberVO.getIdx());
        cashVO.setEnd(cashRows);
        cashVO.setmIdx(memberVO.getIdx());
        
        //List<CashVO> cashLogList = cashService.selectCashLogList(cashVO);
        int total = cashService.selectCashLogCnt(cashVO);
        //model.addAttribute("cashLogList", cashLogList);
        //model.addAttribute("cashRows", cashRows);
        model.addAttribute("total", total);
        model.addAttribute("cashVO", cashVO);
        model.addAttribute("myCash", cash);
        
        return "wallet/cash_list";
    }
    
    // 충전내역 더보기
    @RequestMapping(value = "/cashAjaxList", method = RequestMethod.POST)
    public String cashAjaxList(@ModelAttribute CashVO cashVO, HttpSession session, HttpServletRequest request, Model model) throws Exception {
        log.info("cashInit시작");
        
        if (!ObjectUtil.refererChk(request)) return null;
        
        MemberVO memberVO = (MemberVO) session.getAttribute("login");
        HashMap<String, Integer> cash = memberService.selectCashAndEsti(memberVO.getIdx());
        cashVO.setEnd(cashRows);
        cashVO.setmIdx(memberVO.getIdx());
        
        List<CashVO> cashLogList = cashService.selectCashLogList(cashVO);
        
        model.addAttribute("cashLogList", cashLogList);
        model.addAttribute("myCash", cash);
        
        return "wallet/cash_more";
    }
    
    // 캐시 충전
    @RequestMapping(value = "/cash_charge", method = RequestMethod.GET)
    public String cash_charge(Model model, HttpSession session) throws Exception {
        log.info("cash_charge시작");
        
        MemberVO memberVO = (MemberVO) session.getAttribute("login");
        HashMap<String, Integer> cash = memberService.selectCashAndEsti(memberVO.getIdx());
        
        List<Map<String, Object>> chargePriceList = cashService.selectChargePriceList();
        
        // 세금계산서 사전 등록 체크 
        BillVO bvo = new BillVO(memberVO.getIdx());
        bvo = billService.selectBill(bvo);
        
        model.addAttribute("myCash", cash);
        model.addAttribute("chargePriceList", chargePriceList);
        model.addAttribute("bill", bvo);
        
        return "wallet/cash_charge";
    }
    
    // 캐시 충전 이전 처리
    @RequestMapping(value = "/cashChargeAjax", method = RequestMethod.POST)
    @ResponseBody public Map<String, Object> cash_charge(@RequestParam Map<String, Object> map, HttpServletRequest request, HttpSession session) throws Exception {
        log.info("cash_charge시작");

        if (!ObjectUtil.refererChk(request)) return null;
        MemberVO memberVO = (MemberVO) session.getAttribute("login");
        String type = (String)map.get("type");
        String taxBill = (String)map.get("taxBill");
        map = cashService.selectChargePrice(map);
        Map<String, Object> response = new HashMap<String, Object>();
        if (map == null) {
            response.put("result", "error");
            response.put("msg", "......");
        } else {
            // 결제 전 결제정보 처리
            int cash = (int)map.get("price");
            DecimalFormat df = new DecimalFormat("#,###");
            String goods = df.format(cash) + " 원 캐시";
            CashVO cashVO = new CashVO();
            cashVO.setmIdx(memberVO.getIdx());
            cashVO.setCash(cash);
            cashVO.setType(type);
            cashVO.setpGoods(goods);
            cashVO.setTaxBill(taxBill);
            cashService.insertCash(cashVO);
            response.put("result", "success");
            response.put("cashCode", cashVO.getCashCode());
            response.put("PAmt", Math.round(cash * 1.1));
            response.put("PMid", P_MID);
            response.put("PMname", memberVO.getName());
            response.put("PGoods", goods);
        }
        return response;
    }
    
    // 결제처리
    @RequestMapping(value = "/pNote", method = RequestMethod.POST)
    public void pNote(HttpServletRequest request, HttpServletResponse response) throws Exception {
        System.out.println("결제처리");
        //이 페이지는 수정하지 마십시요. 수정시 html태그나 자바스크립트가 들어가는 경우 동작을 보장할 수 없습니다
        
        //hash데이타값이 맞는 지 확인 하는 루틴은 세틀뱅크에서 받은 데이타가 맞는지 확인하는 것이므로 꼭 사용하셔야 합니다
        //정상적인 결제 건임에도 불구하고 노티 페이지의 오류나 네트웍 문제 등으로 인한 hash 값의 오류가 발생할 수도 있습니다.
        //그러므로 hash 오류건에 대해서는 오류 발생시 원인을 파악하여 즉시 수정 및 대처해 주셔야 합니다.
        //그리고 정상적으로 data를 처리한 경우에도 세틀뱅크에서 응답을 받지 못한 경우는 결제결과가 중복해서 나갈 수 있으므로 관련한 처리도 고려되어야 합니다.  (PTrno 가 PAuthDt의 일자(8자리)에 대해 unique 하니 PTrno로 체크 해주세요)

        String P_STATUS, P_TR_NO, P_AUTH_DT, P_TYPE, P_MID, P_OID, P_FN_CD1, P_FN_CD2, P_FN_NM, P_UNAME, P_AMT, P_NOTI, P_RMESG1, P_RMESG2, P_AUTH_NO, P_INT_MON;
        String P_HASH, PG_AUTH_KEY;
        boolean resp = false;

        //세틀뱅크 noti server에서 받은 value
        P_STATUS    = request.getParameter("PStateCd") + "";   // 거래상태 : 0021(성공), 0031(실패), 0051(입금대기중)
        P_TR_NO     = request.getParameter("PTrno") + "";    // 거래번호
        P_AUTH_DT   = request.getParameter("PAuthDt") + "";  // 승인시간
        P_AUTH_NO   = request.getParameter("PAuthNo") + "";  // 승인번호 
        P_TYPE      = request.getParameter("PType") + "";     // 거래종류 (CARD, BANK)
        P_MID       = request.getParameter("PMid") + "";      // 회원사아이디
        P_OID       = request.getParameter("POid") + "";      // 주문번호
        P_FN_CD1    = request.getParameter("PFnCd1") + "";   // 금융사코드 (은행코드, 카드코드)
        P_FN_CD2    = request.getParameter("PFnCd2") + "";  // 금융사코드 (은행코드, 카드코드)
        P_FN_NM     = request.getParameter("PFnNm") + "";     // 금융사명 (은행명, 카드사명)
        P_UNAME     = request.getParameter("PUname") + "";    // 주문자명
        P_AMT       = request.getParameter("PAmt") + "";      // 거래금액
        P_NOTI      = request.getParameter("PNoti") + "";     // 주문정보
        P_RMESG1    = request.getParameter("PRmesg1") + "";   // 메시지1
        P_RMESG2    = request.getParameter("PRmesg2") + "";   // 메시지2
        P_HASH      = request.getParameter("PHash") + "";     // NOTI HASH 코드값
        P_INT_MON   = request.getParameter("PIntMon") + "";   // 카드결제 할부개월수

        //mid가 mid_test인 경우에 사용합니다
        //해당 회원사 id당 하나의 auth_key가 발급됩니다
        //발급받으신 auth_key를 설정하셔야 합니다 
        PG_AUTH_KEY = PG_AUTHKEY;

        StringBuffer sbNoti = new StringBuffer();
        sbNoti.append(P_STATUS);
        sbNoti.append(P_TR_NO);
        sbNoti.append(P_AUTH_DT);
        sbNoti.append(P_TYPE);
        sbNoti.append(P_MID);
        sbNoti.append(P_OID);
        sbNoti.append(P_AMT);
        sbNoti.append(PG_AUTH_KEY);


        String sNoti = sbNoti.toString();
        byte[] bNoti = sNoti.getBytes();

        MessageDigest md = MessageDigest.getInstance("MD5");
        byte[] digest = md.digest(bNoti);

        StringBuffer strBuf = new StringBuffer();

        for (int i = 0; i < digest.length; i++) {
            int c = digest[i] & 0xff;
            if (c <= 15)
                strBuf.append("0");
            strBuf.append(Integer.toHexString(c));
        }

        String HashedData = strBuf.toString();
        String[] noti = {P_STATUS, P_TR_NO, P_AUTH_DT, P_TYPE, P_MID, P_OID, P_FN_CD1, P_FN_CD2, P_FN_NM, P_UNAME, P_AMT, P_NOTI, P_RMESG1, P_RMESG2, P_AUTH_NO, P_HASH, HashedData };


        //관련 db처리는 callback.asp의 noti_success(),noti_failure(),noti_hash_err()에서 관련 루틴을 추가하시면 됩니다
        //각 함수 호출시 값은 배열로 전달되도록 되어 있으므로 처리시 주의하시기 바랍니다.
        //위의 각 함수에는 현재 결제에 관한 log남기게 됩니다. 회원사서버에서 남기실 절대경로로 맞게 수정하여 주세요
        if (HashedData.trim().equals(P_HASH)) {    
            if (P_STATUS.trim().equals("0021")) {
                CashVO cashVO = new CashVO();
                cashVO.setCashCode(P_OID);
                cashVO.setpAmt(P_AMT);
                cashVO.setpUname(P_UNAME);
                cashVO.setpTrNo(P_TR_NO);
                cashVO.setpAuthNo(P_AUTH_NO);
                cashVO.setpAuthDt(P_AUTH_DT);
                cashVO.setpFnCd1(P_FN_CD1);
                cashVO.setpFnCd2(P_FN_CD2);
                cashVO.setpFnNm(P_FN_NM);
                cashVO.setpIntMon(P_INT_MON);
                cashService.updateCash(cashVO);
                resp = noti_success(noti);
            }
            else if (P_STATUS.trim().equals("0031"))
                resp = noti_failure(noti);
            else if (P_STATUS.trim().equals("0051"))
                resp = noti_waiting_pay(noti);
            else
                resp = false;
        }
        else {
            noti_hash_err(noti);
        }
        PrintWriter out = null;
        try {
            out = response.getWriter();
            //세틀뱅크로 전송되어야 하는 값이므로 삭제하지 마세요.
            if (resp)
                out.println("OK");
            else
                out.println("FAIL");
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            if (out != null) out.close();
        }
    }
    
    // 결제결과
    @RequestMapping(value = "/pNext", method = RequestMethod.POST)
    public void pNext(HttpServletRequest request, HttpServletResponse response) {
        String P_STATUS, P_TR_NO, P_AUTH_DT, /*P_AUTH_NO,*/ P_TYPE, P_MID, P_OID, P_AMT;
        String P_HASH;

        P_STATUS    = request.getParameter("PStateCd") + "";   // 거래상태 : 0021(성공), 0031(실패), 0051(입금대기중)
        P_TR_NO     = request.getParameter("PTrno") + "";    // 거래번호
        P_AUTH_DT   = request.getParameter("PAuthDt") + "";  // 승인시간 
        //P_AUTH_NO   = request.getParameter("PAuthNo") + "";  // 승인번호
        P_TYPE      = request.getParameter("PType") + "";     // 거래종류 (CARD, BANK, MOBILE, VBANK)
        P_MID       = request.getParameter("PMid") + "";      // 회원사아이디
        P_OID       = request.getParameter("POid") + "";      // 주문번호
        P_AMT       = request.getParameter("PAmt") + "";      // 거래금액
        P_HASH      = request.getParameter("PHash") + "";      // HASH 코드값
        
        StringBuffer sbNoti = new StringBuffer();
        sbNoti.append(P_STATUS);
        sbNoti.append(P_TR_NO);
        sbNoti.append(P_AUTH_DT);
        sbNoti.append(P_TYPE);
        sbNoti.append(P_MID);
        sbNoti.append(P_OID);
        sbNoti.append(P_AMT);
        String sNoti = sbNoti.toString();
        
        PrintWriter out = null;
        try {
            out = response.getWriter();
            if (P_STATUS.equals("0021")) {
                out.println("<script>top.opener.rstparamSet('"+sNoti+"','"+P_HASH+"','"+P_STATUS+"','"+P_OID+"');</script>");
                out.println("<script>top.opener.goResult();</script>");
            }
            out.println("<script>self.close();</script>");
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            if (out != null) out.close();
        }

    }
    
    // 결제 중 취소버튼 클릭
    @RequestMapping(value = "/pCancel", method = RequestMethod.POST)
    public void pCancel(HttpServletResponse response) {
        PrintWriter out = null;
        try {
            out = response.getWriter();
            out.println("<script>self.close();</script>");
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            if (out != null) out.close();
        }
    }
    
    // 결제결과
    @RequestMapping(value = "/pResult", method = RequestMethod.POST)
    public void pResult(Model model, HttpServletRequest request, HttpServletResponse response) throws NoSuchAlgorithmException {
        System.out.println("결제결과");
        String P_HASH, PG_AUTH_KEY, P_DATA, P_STATUS, P_OID;
        P_HASH      = request.getParameter("PHash") + "";      // HASH 코드값
        P_DATA      = request.getParameter("PData") + "";
        P_STATUS    = request.getParameter("PStateCd")+"";
        P_OID   = request.getParameter("POrderId")+"";
        //mid가 mid_test인 경우에 사용합니다
        //해당 회원사 id당 하나의 auth_key가 발급됩니다
        //발급받으신 auth_key를 설정하셔야 합니다 
        PG_AUTH_KEY = PG_AUTHKEY;

        String sNoti = P_DATA + PG_AUTH_KEY;
        byte[] bNoti = sNoti.getBytes();
        System.out.println("sNoti:"+sNoti);
        MessageDigest md = MessageDigest.getInstance("MD5");
        byte[] digest = md.digest(bNoti);

        StringBuffer strBuf = new StringBuffer();

        for (int i = 0; i < digest.length; i++) {
            int c = digest[i] & 0xff;
            if (c <= 15)
                strBuf.append("0");

            strBuf.append(Integer.toHexString(c));

        }

        String HashedData = strBuf.toString();

        // hash 값 체크는 세틀뱅크 pg 서버에서 전송한 결과 데이타 값들과
        // 회원사 결과 페이지에서 수신한 데이타 값들의 동일 여부를 체크를 위한것입니다.
        // 지불 결과 페이지에서는 결과코드(P_STATUS)의 값에 따라 지불 결과를 고객에게 단순히 화면만 처리하시고
        // 지불 성공/실패 유무의 최종 판단 및 DB 처리는 노티(noti) 에서 처리하시기를 권장합니다
        System.out.println("P_HASH:"+P_HASH+":");
        System.out.println("HashedData:"+HashedData.trim()+":");
        
        PrintWriter out = null;
        
        try {
            out = response.getWriter();
            if (HashedData.trim().equals(P_HASH)) {
                if (P_STATUS.trim().equals("0021")) {
                    out.println("<html><body>");
                    out.println("<form name=\"frm\" action=\"cash_charge_finish\" method=\"post\"><input type=\"hidden\" name=\"cashCode\" value=\""+P_OID+"\"></form>");
                    out.println("<script>document.frm.submit();</script>");
                    out.println("</html></body>");
                }else {
                    out.println("<script>alert('결제실패');history.back();</script>");
                }
            }
            else {
                out.println("<script>alert('결제실패');history.back();</script>");
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    
    // 캐시 충전 완료
    @RequestMapping(value = "/cash_charge_finish", method = RequestMethod.POST)
    public String cash_charge_finish(CashVO cashVO, Model model, HttpServletRequest request, HttpSession session) throws Exception {
        if (!ObjectUtil.refererChk(request)) return null; 
        log.info("cash_charge_finish시작");
        
        MemberVO memberVO = (MemberVO) session.getAttribute("login");
        HashMap<String, Integer> cash = memberService.selectCashAndEsti(memberVO.getIdx());
        cashVO.setmIdx(memberVO.getIdx());
        cashVO = cashService.selectCash(cashVO);
        model.addAttribute("myCash", cash);
        model.addAttribute("cash", cashVO);
        
        return "wallet/cash_charge_finish";
    }
    
    // 캐시 출금
    @RequestMapping(value = "/cash_withdraw", method = RequestMethod.GET)
    public String cash_charge_withdraw(CashVO cashVO, Model model, HttpSession session) throws Exception {    	
        log.info("cash_charge_withdraw시작");
        
        MemberVO memberVO = (MemberVO) session.getAttribute("login");
        HashMap<String, Integer> cash = memberService.selectCashAndEsti(memberVO.getIdx());

        // 계좌정보 
        BankInfoVO bank = bankService.selectBankInfo(new BankInfoVO(memberVO.getIdx()));
        
        // 세금계산서 사전 등록 체크 
        BillVO bvo = new BillVO(memberVO.getIdx());
        bvo = billService.selectBill(bvo);
        
        model.addAttribute("myCash", cash);
        model.addAttribute("bank", bank);
        model.addAttribute("bill", bvo);
        
        return "wallet/cash_withdraw";
    }
    
    // 캐시 출금 - post
    @RequestMapping(value = "/cashWithdraw", method = RequestMethod.POST)
    @ResponseBody
    public int cashWithdrawPost(CashVO cashVO, Model model, HttpSession session) throws Exception {    	
        
        int mIdx = ObjectUtil.getMember(session).getIdx();
        cashVO.setmIdx(mIdx);

        int success = cashService.requestWithdraw(cashVO);
        
        return success;
    }
    
    // 쿠폰 목록
    @RequestMapping(value = "/coupon", method = RequestMethod.GET)
    public String coupon_list(@ModelAttribute CouponVO couponVO, Model model, HttpSession session) throws Exception {
        log.info("couponInit시작");
        
        MemberVO memberVO = (MemberVO) session.getAttribute("login");
        couponVO.setmIdx(memberVO.getIdx());
        couponVO.setEnd(couponRows);
        
        List<CouponVO> couponList = cashService.selectCouponList(couponVO);
        
        HashMap<String, Integer> cash = memberService.selectCashAndEsti(memberVO.getIdx());
        
        model.addAttribute("myCash", cash);
        model.addAttribute("couponList", couponList);
        model.addAttribute("couponRows", couponRows);
        
        return "wallet/coupon_list";
    }
    
    // 쿠폰 목록 더보기
    @RequestMapping(value = "/couponAjaxList", method = RequestMethod.POST)
    public String coupon_list(@ModelAttribute CouponVO couponVO, Model model, HttpServletRequest request, HttpSession session) throws Exception {
        log.info("couponInit시작");
        
        if (!ObjectUtil.refererChk(request)) return null;
        
        MemberVO memberVO = (MemberVO) session.getAttribute("login");
        couponVO.setmIdx(memberVO.getIdx());
        couponVO.setEnd(couponRows);
        
        List<CouponVO> couponList = cashService.selectCouponList(couponVO);
        
        model.addAttribute("couponList", couponList);
        model.addAttribute("couponRows", couponRows);
        
        return "wallet/coupon_more";
    }
    
    boolean noti_success(String noti[]) throws IOException
    {
        //결제에 관한 log남기게 됩니다. log path수정 및 db처리루틴이 추가하여 주십시요.
        noti_write(paylogPath+"/noti_success.log", noti);
        return true;
    }

    boolean noti_failure(String noti[]) throws IOException
    {
        //결제에 관한 log남기게 됩니다. log path수정 및 db처리루틴이 추가하여 주십시요.
        noti_write(paylogPath+"/noti_failure.log", noti);
        return true;
    }

    boolean noti_hash_err(String noti[]) throws IOException
    {
        //결제에 관한 log남기게 됩니다. log path수정 및 db처리루틴이 추가하여 주십시요.
        noti_write(paylogPath+"/noti_hash_err.log", noti);
        return true;
    }

    boolean noti_waiting_pay(String noti[]) throws IOException
    {
        //결제에 관한 log남기게 됩니다. log path수정 및 db처리루틴이 추가하여 주십시요.
        noti_write(paylogPath+"/noti_waiting_pay.log", noti);
        return true;
    }

    void noti_write(String file, String noti[]) throws IOException
    {

        StringBuffer strBuf = new StringBuffer();

        strBuf.append("거래상태:" + noti[0] + "::");
        strBuf.append("거래번호:" + noti[1] + "::");
        strBuf.append("승인날짜:" + noti[2] + "::");
        strBuf.append("거래종류:" + noti[3] + "::");
        strBuf.append("회원사ID:" + noti[4] + "::");
        strBuf.append("주문번호:" + noti[5] + "::");
        strBuf.append("금융사코드:" + noti[6] + "::");
        strBuf.append("금융사코드:" + noti[7] + "::");
        strBuf.append("금융사명:" + noti[8] + "::");
        strBuf.append("주문자명:" + noti[9] + "::");
        strBuf.append("거래금액:" + noti[10] + "::");
        strBuf.append("주문정보:" + noti[11] + "::");
        strBuf.append("메세지1:" + noti[12] + "::");
        strBuf.append("메세지2:" + noti[13] + "::");
        strBuf.append("승인번호:" + noti[14] + "::");
        strBuf.append("P_HASH:" + noti[15] + "::");        
        strBuf.append("HashedData:" + noti[16]);
        strBuf.append("\n");

        byte b[] = strBuf.toString().getBytes("EUC-KR");
        BufferedOutputStream bos = null;
        FileOutputStream fos = null;
        try {
        fos = new FileOutputStream(file, true);
        fos.flush();
        bos = new BufferedOutputStream(fos);
        bos.write(b);
        bos.flush();
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            if (fos != null) fos.close();
            if (bos != null) bos.close();
        }
    }
    
    // test
 // 결제결과
    @RequestMapping(value = "/pResultTest", method = RequestMethod.POST)
    public void pResultTest(Model model, HttpServletRequest request, HttpServletResponse response) throws NoSuchAlgorithmException {
        System.out.println("결제결과");
        String P_HASH, PG_AUTH_KEY, P_DATA, P_STATUS, P_OID;
        P_HASH      = request.getParameter("PHash") + "";      // HASH 코드값
        P_DATA      = request.getParameter("PData") + "";
        P_STATUS    = request.getParameter("PStateCd")+"";
        P_OID   = request.getParameter("POrderId")+"";
        //mid가 mid_test인 경우에 사용합니다
        //해당 회원사 id당 하나의 auth_key가 발급됩니다
        //발급받으신 auth_key를 설정하셔야 합니다 
        PG_AUTH_KEY = PG_AUTHKEY;

        String sNoti = P_DATA + PG_AUTH_KEY;
        byte[] bNoti = sNoti.getBytes();
        System.out.println("sNoti:"+sNoti);
        MessageDigest md = MessageDigest.getInstance("MD5");
        byte[] digest = md.digest(bNoti);

        StringBuffer strBuf = new StringBuffer();

        for (int i = 0; i < digest.length; i++) {
            int c = digest[i] & 0xff;
            if (c <= 15)
                strBuf.append("0");

            strBuf.append(Integer.toHexString(c));

        }

        String HashedData = strBuf.toString();

        // hash 값 체크는 세틀뱅크 pg 서버에서 전송한 결과 데이타 값들과
        // 회원사 결과 페이지에서 수신한 데이타 값들의 동일 여부를 체크를 위한것입니다.
        // 지불 결과 페이지에서는 결과코드(P_STATUS)의 값에 따라 지불 결과를 고객에게 단순히 화면만 처리하시고
        // 지불 성공/실패 유무의 최종 판단 및 DB 처리는 노티(noti) 에서 처리하시기를 권장합니다
        System.out.println("P_HASH:"+P_HASH+":");
        System.out.println("HashedData:"+HashedData.trim()+":");
        
        PrintWriter out = null;
        
        try {
            out = response.getWriter();
            if (HashedData.trim().equals(P_HASH)) {
                if (P_STATUS.trim().equals("0021")) {
                    out.println("<html><body>");
                    out.println("<form name=\"frm\" action=\"../order/order_finish_test\" method=\"post\"><input type=\"hidden\" name=\"cashCode\" value=\""+P_OID+"\"></form>");
                    out.println("<script>document.frm.submit();</script>");
                    out.println("</html></body>");
                }else {
                    out.println("<script>alert('결제실패');history.back();</script>");
                }
            }
            else {
                out.println("<script>alert('결제실패');history.back();</script>");
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
