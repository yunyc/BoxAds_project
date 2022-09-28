package com.boxads.deal.web;

import java.util.HashMap;
import java.util.List;
import java.util.Locale;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.sound.midi.MidiDevice.Info;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.MessageSource;
import org.springframework.security.authentication.encoding.ShaPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.boxads.cash.service.CashService;
import com.boxads.cash.vo.CashVO;
import com.boxads.deal.service.BankInfoService;
import com.boxads.deal.service.BillService;
import com.boxads.deal.vo.BankInfoVO;
import com.boxads.deal.vo.BillVO;
import com.boxads.main.ObjectUtil;
import com.boxads.main.service.FileService;
import com.boxads.main.service.MemberService;
import com.boxads.main.vo.FileVO;
import com.boxads.main.vo.MemberVO;

@Controller
@RequestMapping("/deal")
public class DealController {

    private static final Logger log = LoggerFactory.getLogger(DealController.class);
    
    //사업자 통장 사본 이미지 타입
    private static final String bankbookFileType = "CB";
    
    @Resource MessageSource msg;
    @Resource(name="ShaPasswordEncoder") private ShaPasswordEncoder spe;
    
    @Resource private BillService billService;
    @Resource private BankInfoService bankInfoService;
    @Resource private CashService cashService;
    
    @Resource FileService fileService;

    
    // 결제 내역
    @RequestMapping(value = "/deal_history")
    public String dealHistory(CashVO csvo, HttpSession session, Model model) throws Exception {
    	log.info("LOG: 결제 내역 " + csvo);
    	
    	csvo.setmIdx(ObjectUtil.getMember(session).getIdx());
    	int total = cashService.selectCashListCnt(csvo);
    	
    	model.addAttribute("total", total);
    	
    	return "deal/deal_history";
    }
    
    // 결제 내역
    @RequestMapping(value = "/dealHistoryAjaxList", method = RequestMethod.POST)
    public String selectCashList(CashVO csvo, HttpSession session, Model model) throws Exception {
    	log.info("LOG: 결제 내역 " + csvo);
    	
    	csvo.setmIdx(ObjectUtil.getMember(session).getIdx());
    	List<CashVO> list = cashService.selectCashList(csvo);
    	model.addAttribute("list", list);
    	
    	return "list/cash_list";
    }
    
    // 증빙서류 발행내역
    @RequestMapping(value = "/deal_certification", method = RequestMethod.GET)
    public String dealCertificationInit(@RequestParam HashMap<String, Object> param, Model model, HttpSession session) throws Exception {
    	log.info("LOG: 증빙 발행 내역 " + param);
       
        // total
    	param.put("writer", ObjectUtil.getMember(session).getIdx());
        int total = billService.selectBillIssueCnt(param);
        
        model.addAttribute("total", total);
        
        return "deal/deal_certification";
    }
    
    // 발행내역 리스트
    @RequestMapping(value = "/dealAjaxList")
    public String dealMore(@RequestParam HashMap<String, Object> param, Model model, HttpSession session) throws Exception {
    	log.info("LOG: 증빙 발행 내역 " + param);
        
    	param.put("writer", ObjectUtil.getMember(session).getIdx());
    	param.put("start", Integer.parseInt(param.get("start").toString()));
    	param.put("end", Integer.parseInt(param.get("end").toString()));
    	
        List<HashMap<String, Object>> billList = billService.selectBillIssue(param);
        model.addAttribute("list", billList);
        
        return "list/bill_issue_list";
    }
    
    @RequestMapping(value = "/deal_info")
    public String dealInfoInit(Model model, HttpSession session) throws Exception {
        log.info("dealInfoInit시작");
        
        log.info("idx : " + ((MemberVO) session.getAttribute("login")).getIdx());
        
        BillVO bvo = new BillVO();
        bvo.setmIdx(((MemberVO)session.getAttribute("login")).getIdx());
        bvo = billService.selectBill(bvo);
        model.addAttribute("bill", bvo);
        
        return "deal/write_deal";
    }
    
    @RequestMapping(value = "/deal_info", method = RequestMethod.POST)
    public String dealInfo(@ModelAttribute BillVO bvo,
    						Model model, HttpSession session, Locale locale) throws Exception{
    	log.info("dealInfo시작");
    	
    	log.info(locale.toString());
    	log.info("modelattribute bvo : " + bvo);
    	if(bvo.getIdx() == 0) {
    		BillVO tBVO = new BillVO();
    		tBVO.setmIdx(((MemberVO)session.getAttribute("login")).getIdx());
    		tBVO = billService.selectBill(tBVO);
    		log.info("tBVO : " + tBVO);
    		if(tBVO != null && tBVO.getIdx() != 0) {
    			bvo.setIdx(tBVO.getIdx());
    			bvo.setmIdx(tBVO.getmIdx());
    			log.info("hidden 지워져서 넣은거 : " + bvo);
    		}
    	} else if(bvo.getmIdx() == 0) {
    		bvo.setmIdx(((MemberVO)session.getAttribute("login")).getIdx());
    	}
    	if(bvo.getPhone() == null || bvo.getPhone().equals("")) {
    		log.info("폰번호 없음");
    		model.addAttribute("alertMsg", msg.getMessage("bill.write.phone", null, locale));
    		model.addAttribute("redirectUrl", "/deal/deal_info");
    	}
    	else if(bvo.getEmail() == null || bvo.getEmail().equals("")) {
    		log.info("이메일 없음");
    		model.addAttribute("alertMsg", msg.getMessage("bill.write.email", null, locale));
    		model.addAttribute("redirectUrl", "/deal/deal_info");
    	}
    	else if(bvo.getType() == null || bvo.getType().equals("")) {
    		log.info("사업자 없음");
    		model.addAttribute("alertMsg", msg.getMessage("bill.write.type", null, locale));
    		model.addAttribute("redirectUrl", "/deal/deal_info");
    	} 
    	else {
    		log.info("다 잘 들어옴");
    		
    		bvo.setmIdx(((MemberVO) session.getAttribute("login")).getIdx());
    		int result = billService.insertBill(bvo);
    		if(result > 0) {
    			model.addAttribute("alertMsg", msg.getMessage("bill.write.submit", null, locale));
	    		model.addAttribute("redirectUrl", "/deal/deal_info");
    		} else {
    			model.addAttribute("alertMsg", msg.getMessage("bill.write.error", null, locale));
	    		model.addAttribute("redirectUrl", "/deal/deal_info");
    		}
    	}
    	
    	return "common/alert";
    }
    
    @RequestMapping(value = "/deal_withdraw")
    public String dealWithdrawInit(Model model, HttpSession session) throws Exception {
        log.info("deal_withdrawInit시작");
        
        int mIdx = (int)((MemberVO) session.getAttribute("login")).getIdx();
        log.info("member idx : " + mIdx);
        
        BankInfoVO bivo = new BankInfoVO();
        bivo.setmIdx(mIdx);
        bivo = bankInfoService.selectBankInfo(bivo);
        
        if(bivo != null && bivo.getIdx() != 0) {
        	List<FileVO> bankbookList = fileService.selectFileList(0, bivo.getIdx(), bankbookFileType);
        	log.info("bankbookList : " + bankbookList);
        	model.addAttribute("bankbookList", bankbookList);
        }
        log.info("bankInfo : " + bivo);
        model.addAttribute("bankInfo", bivo);
        
        return "deal/write_withdraw";
    }
    
    @RequestMapping(value = "/deal_withdraw", method = RequestMethod.POST)
    public String dealWithdraw(@ModelAttribute BankInfoVO bivo,
    						   @RequestParam(required = false) List<MultipartFile> bankbook,
    						   @RequestParam(required = false) int[] fileIdx,
    						   @RequestParam(required = false) int[] deleteIdx,
    						   Model model, HttpSession session, Locale locale) throws Exception {
        log.info("deal_withdraw시작");
        
    	bankInfoService.insertBankInfo(session, model, locale, bivo, bankbook, fileIdx, deleteIdx);
    	
    	return "common/alert";
    }

    
}
