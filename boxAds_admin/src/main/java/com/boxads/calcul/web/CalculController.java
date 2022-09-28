package com.boxads.calcul.web;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

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

import com.boxads.calcul.service.CalculService;
import com.boxads.cash.vo.CashVO;
import com.boxads.common.vo.PageVO;
import com.boxads.member.service.MemberService;
import com.boxads.member.vo.MemberVO;
import com.boxads.order.vo.LogVO;


@Controller
@RequestMapping(value = "/calcul")
public class CalculController {

	private static final Logger log = LoggerFactory.getLogger(CalculController.class);
	@Resource(name="ShaPasswordEncoder") private ShaPasswordEncoder spe;	
	
	@Resource private CalculService calculService;
	@Resource private MemberService memberService;
	
	// 정산관리
	@RequestMapping(value = "/calcul_list")
	public String list(Model model, PageVO page, @RequestParam HashMap<String, Object> param,
			@RequestParam(required = false) String[] state) throws Exception {
		param.put("state", state);
		log.info("LOG: 정산 리스트 정보 " + param);
		
		param.put("start", page.getStart());
		param.put("end", page.getEnd());
		
		// 정산 리스트
		List<HashMap<String, String>> list = calculService.selectCalculList(param);
		page.setTotalCnt((long) calculService.selectCalculListCnt(param));
		
		model.addAttribute("calculList", list);
		model.addAttribute("page", page);
		
		return "calcul/calculate_list";
	}
	
	// 정산 상태 변경
	@RequestMapping(value = "/updateState", method = RequestMethod.POST)
	@ResponseBody
	public int updateState(Model model, @RequestParam HashMap<String, Object> param) throws Exception { 
		log.info("LOG: 정산 상태 변경 정보 " + param);
		
		int success = 0;

    	// 상태 변경 및 로그 입력
    	success = calculService.updateState(param);    		
    	
    	return success;
	}
	
	// 지급 이력 팝업
	@RequestMapping(value = "/popup")
	public String popup(@RequestParam HashMap<String, Object> param, PageVO page, Model model) throws Exception{
		log.info("LOG: 지급 이력 정보 " + param);
		
		param.put("start", page.getStart());
		param.put("end", page.getEnd());
		
		List<HashMap<String, String>> list = calculService.selectCalculList(param);
		page.setTotalCnt((long) calculService.selectCalculListCnt(param));
		
		model.addAttribute("hList", list);
		model.addAttribute("page", page);
		model.addAttribute("name", param.get("name"));
		model.addAttribute("mIdx", param.get("mIdx"));
		
		return "calcul/popup";		
	}
	
	// 지급 이력 팝업
	@RequestMapping(value = "/popupAjax")
	public String popupAjax(@RequestParam HashMap<String, Object> param, PageVO page, Model model) throws Exception{
		log.info("LOG: 지급 이력 정보 " + param);
		
		param.put("start", page.getStart());
		param.put("end", page.getEnd());
		
		List<HashMap<String, String>> list = calculService.selectCalculList(param);
		page.setTotalCnt((long) calculService.selectCalculListCnt(param));
		
		model.addAttribute("hList", list);
		model.addAttribute("page", page);
		model.addAttribute("name", param.get("name"));
		model.addAttribute("mIdx", param.get("mIdx"));
		
		return "calcul/popup_list";		
	}
	
	// 출금관리
	@RequestMapping(value = "/withdraw_list")
	public String wlist(Model model, PageVO page, @RequestParam HashMap<String, Object> param,
			@RequestParam(required = false) String[] state) throws Exception {
		param.put("state", state);
		
		log.info("LOG: 출금 리스트 정보 " + param);
		
		param.put("start", page.getStart());
		param.put("end", page.getEnd());
		
		// 출금 리스트
		List<HashMap<String, String>> list = calculService.selectWithdrawList(param);
		page.setTotalCnt((long) calculService.selectWithdrawListCnt(param));
		
		model.addAttribute("wdwList", list);
		model.addAttribute("page", page);
		
		return "calcul/withdraw_list";
	}
	
	// 증빙자료 관리
	@RequestMapping(value = "/bill_list")
	public String blist(Model model, PageVO page, @RequestParam HashMap<String, Object> param,
			@RequestParam(required = false) String[] state,
			@RequestParam(required = false) String[] type,
			@RequestParam(required = false) String[] subject) throws Exception {
		
		param.put("state", state);
		param.put("type", type);
		param.put("subject", subject);
		
		log.info("LOG: 증빙 리스트 정보 " + param);
		
		param.put("start", page.getStart());
		param.put("end", page.getEnd());
		
		// 증빙 리스트
		List<HashMap<String, String>> list = calculService.selectBillList(param);
		page.setTotalCnt((long) calculService.selectBillListCnt(param));
		
		model.addAttribute("billList", list);
		model.addAttribute("page", page);
		
		return "calcul/bill_list";
	}
	
	// 증빙자료 관리 상세
	@RequestMapping(value = "/bill_detail")
	public String billDetail(Model model, @RequestParam HashMap<String, Object> param) throws Exception {
		log.info("LOG: 증빙 상세 정보 " + param);
		
		// 증빙 정보
		param.put("start", 0);
		param.put("end", 1);
		HashMap<String, String> vo = calculService.selectBillIssue(param);
		
		// 사업자 정보
		param.put("mIdx", vo.get("mIdx"));
		HashMap<String, String> mvo = calculService.selectMemberInfo(param);
		
		model.addAttribute("bill", vo);
		model.addAttribute("info", mvo);
				
		return "calcul/bill_detail";
	}
	
	// 출금 상태 변경
	@RequestMapping(value = "/updateStateWithdraw", method = RequestMethod.POST)
	@ResponseBody
	public int updateStateWithdraw(Model model, @RequestParam HashMap<String, Object> param) throws Exception { 
		log.info("LOG: 출금 상태 변경 정보 " + param);
		
		// 상태 변경 및 로그 입력
		int success = calculService.updateStateWithdraw(param);    		
    	
    	return success;
	}
	
	// 증빙 상태 변경
	@RequestMapping(value = "/updateBillState", method = RequestMethod.POST)
	@ResponseBody
	public int updateBillState(Model model, @RequestParam HashMap<String, Object> param) throws Exception { 
		log.info("LOG: 증빙 상태 변경 정보 " + param);
		
		// 상태 변경 및 로그 입력
		int success = calculService.updateBillState(param);    		
    	
    	return success;
	}
	
	// 결제내역 관리
	@RequestMapping(value = "/cash_list")
	public String clist(Model model, PageVO page, CashVO param, @RequestParam(required = false) String[] type) throws Exception {
		
		if(type != null && type.length > 0) { param.setTypeArr(type); }
		
		log.info("LOG: 결제 리스트 정보 " + param);
		
		param.setStart(page.getStart());
		param.setEnd(page.getEnd());

		List<HashMap<String, String>> list = calculService.selectCashList(param);
		page.setTotalCnt((long) calculService.selectCashListCnt(param));
		
		model.addAttribute("list", list);
		model.addAttribute("page", page);
		
		return "calcul/payment_list";
	}
	
}
