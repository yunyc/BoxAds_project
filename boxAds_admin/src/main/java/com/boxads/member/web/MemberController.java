package com.boxads.member.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.commons.beanutils.BeanUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.authentication.encoding.ShaPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.boxads.cash.service.CashService;
import com.boxads.cash.vo.CashVO;
import com.boxads.common.service.MailService;
import com.boxads.common.vo.PageVO;
import com.boxads.coupon.service.CouponService;
import com.boxads.coupon.vo.CouponVO;
import com.boxads.main.service.FileService;

import com.boxads.member.service.MemberService;

import com.boxads.member.vo.MemberVO;
import com.boxads.product.service.ProductService;


@Controller
@RequestMapping(value = "/member")
public class MemberController {	

	private static final Logger log = LoggerFactory.getLogger(MemberController.class);
	@Resource(name="ShaPasswordEncoder") private ShaPasswordEncoder spe;
	@Resource MemberService memberService;
	@Resource ProductService productService;
	@Resource FileService fileService;
	@Resource MailService mailService;
	@Resource CashService cashService;
	@Resource CouponService couponService;
	
	@RequestMapping(value = "/")
    public String chkAuth() throws Exception{	
	
        return "redirect:/member/list";
    }
	
	
	// 활동, 휴면 , 탈퇴 회원 리스트 조회
	@RequestMapping(value = "/list")
    public String memberInit(@ModelAttribute MemberVO memberVO, PageVO pvo, Model model) throws Exception{
		
		memberVO.setStart(pvo.getStart());
		memberVO.setEnd(pvo.getEnd());
		
		List<MemberVO> memberList = memberService.selectMemberList(memberVO);
		
		pvo.setTotalCnt(memberService.selectMemberCnt(memberVO));
		
		model.addAttribute("memberList", memberList);
		model.addAttribute("page", pvo);
		
		//  /member/list?state=Y: 활동회원, /member/list?state=H: 휴면회원,  /member/list?state=N: 탈퇴 회원
		return "member_manage/member_list";    
    }
	
	// 회원 상세 페이지 
	@RequestMapping(value = "/detail")
	public String memberDetail(@ModelAttribute MemberVO memberVO, 
								@RequestParam(defaultValue="1") int cashP,
								@RequestParam(defaultValue="1") int couponeP,
			CashVO cashVO, CouponVO couponVO, Model model) throws Exception{
		PageVO cashPvo = new PageVO();
		PageVO couponPvo = new PageVO();
		
		cashPvo.setCurPage(cashP);
		couponPvo.setCurPage(couponeP);
		
		cashVO.setStart(cashPvo.getStart());
		cashVO.setEnd(cashPvo.getEnd());
		
		List<MemberVO> memberList = memberService.selectMemberList(memberVO);
		List<HashMap<String, Object>> reasonList = productService.selectReason(memberVO.getIdx(), "M");
		List<HashMap<String, Object>> confirmList = memberService.selectConfirmList(memberVO);
		int myCash = memberService.selectCash(memberVO.getIdx());
		
		cashVO.setmIdx(memberVO.getIdx());
		List<CashVO> cashList = cashService.selectCashLogList(cashVO);
		List<HashMap<String, Object>> issueList = couponService.selectCouponIssue(memberVO.getIdx(), couponPvo.getStart(), couponPvo.getEnd());
		
		cashPvo.setTotalCnt(cashService.selectCashLogCnt(cashVO));
		couponPvo.setTotalCnt(couponService.selectCouponIssueCnt(memberVO.getIdx()));
		
		// 은행 정보
		HashMap<String, String> bankInfo = memberService.selectBankInfo(memberVO.getIdx());
			
		model.addAttribute("memberList", memberList);
		model.addAttribute("reasonList", reasonList);
		model.addAttribute("confirmList", confirmList);
		model.addAttribute("cashList", cashList);
		model.addAttribute("issueList", issueList);
		model.addAttribute("cashPvo", cashPvo);
		model.addAttribute("couponPvo", couponPvo);
		model.addAttribute("myCash", myCash);
		model.addAttribute("bank", bankInfo);
		
		return "member_manage/member_view";        
	}
	
	
	// 사업자 인증처리
	@RequestMapping(value = "/confirm_change")
	@ResponseBody
	public void confirmChange(@ModelAttribute MemberVO memberVO) throws Exception{
		
		memberService.updateMemberList(memberVO);
		List<MemberVO> memberList = memberService.selectMemberList(memberVO);
		
		if (memberVO.getConfirmFlag().equals("Y")) {
			
			if (memberList != null) {
				Map<String, String> data = BeanUtils.describe(memberList.get(0));
		    	mailService.sendMail(data, "biz_confirm");
		    	
		    	memberService.insertConfirmList(memberList.get(0));
			}
		}
		
		
	}
	
	// 회원 상태 변경
	@RequestMapping(value = "/change")
	@ResponseBody
	public void change(@ModelAttribute MemberVO memberVO, @RequestParam HashMap<String, Object> param) throws Exception{
			
		memberService.updateMemberList(memberVO);
		
		if (!memberVO.getState().equals("Y")) {
			param.put("type", "M");
			param.put("parent", memberVO.getIdx());
			productService.insertReason(param);
		}
		
	}
	
	// 비밀번호 초기화 
	@RequestMapping(value = "/reset")
	@ResponseBody
	public void resetPw(@ModelAttribute MemberVO memberVO) throws Exception{
		
		List<MemberVO> memberList = memberService.selectMemberList(memberVO);
		
		if (memberList != null) {
			Map<String, String> data = BeanUtils.describe(memberList.get(0));
	    	mailService.sendMail(data, "mail_reset");
		}
		
	}
	
	// 메세지
	@RequestMapping(value = "/message")
	public String message(Model model, @RequestParam HashMap<String, Object> param, PageVO page) throws Exception{			
		log.info("LOG: 정산 리스트 정보 " + param);
		
		param.put("start", page.getStart());
		param.put("end", page.getEnd());
		
		List<HashMap<String, String>> list = memberService.selectMessageList(param);
		page.setTotalCnt((long) memberService.selectMessageListCnt(param));
		
		model.addAttribute("list", list);
		model.addAttribute("page", page);
		
		return "message/message_list";		
	}
	
}
