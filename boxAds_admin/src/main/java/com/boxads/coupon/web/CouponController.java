package com.boxads.coupon.web;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

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

import com.boxads.common.vo.PageVO;
import com.boxads.coupon.service.CouponService;
import com.boxads.coupon.vo.CouponVO;
import com.boxads.main.ObjectUtil;
import com.boxads.main.service.CommonService;
import com.boxads.setting.service.SettingService;
import com.boxads.setting.vo.CodeVO;
import com.boxads.setting.vo.FeesVO;
import com.boxads.setting.vo.UnitVO;
import com.boxads.main.vo.AdminVO;


@Controller
@RequestMapping(value = "/coupon")
public class CouponController {
	@Resource private CouponService couponService;
	@Resource private CommonService cservice;	

	private static final Logger log = LoggerFactory.getLogger(CouponController.class);
	@Resource(name="ShaPasswordEncoder") private ShaPasswordEncoder spe;	
	
	// 쿠폰 리스트 조회
	@RequestMapping(value = "/list")
	public String couponInit(@ModelAttribute CouponVO couponVO, Model model, PageVO pvo) throws Exception {
		
		couponVO.setStart(pvo.getStart());
		couponVO.setEnd(pvo.getEnd());
		
		List<CouponVO> couponList = couponService.selectCouponList(couponVO);
		pvo.setTotalCnt((long) couponService.selectCouponListCnt(couponVO));
		
		model.addAttribute("couponList", couponList);
		model.addAttribute("page", pvo);
		
		return "coupon/coupon_list";
	}
		
	// 쿠폰 등록 페이지 이동
	@RequestMapping(value = "/write")
	public String couponWriteInit(CouponVO couponVO, Model model) throws Exception {
		String rtUrl = "coupon/coupon_write";
		
		
		if(couponVO.getIdx() > 0) {
			List<CouponVO> couponList = couponService.selectCouponList(couponVO);			
			model.addAttribute("cvo", couponList.get(0));
			
			String state = couponList.get(0).getState(); 
			if(state.equals("Y") || state.equals("E")) {
				rtUrl = "coupon/coupon_view";
			}
		}
		
		return rtUrl;
	}
	
	// 쿠폰 등록 처리
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String couponWrite(@ModelAttribute CouponVO cvo, Model model, HttpSession session) throws Exception {
		cvo.setWriter(ObjectUtil.getAdmin(session).getIdx());		
		
		Calendar today = Calendar.getInstance();			
		
		boolean dateChk = ObjectUtil.checkBetweenDate(today, cvo.getStartDate(), cvo.getEndDate());
		boolean dateAfter = ObjectUtil.checkAfterDate(today, cvo.getStartDate(), cvo.getEndDate());		
		
		if(dateChk && dateAfter){
			cvo.setState("E");			
		} else if(cvo.getUseFlag().equals("Y") && dateChk) { 
			cvo.setState("Y"); 			
		} 
		
		couponService.insertCouponList(cvo);
			
		return "redirect:list";
	}
	
	// 쿠폰 사용여부 수정
	@RequestMapping(value = "/update_state", method = RequestMethod.POST)
	public String updateState(CouponVO cvo, Model model) throws Exception {
		List<CouponVO> couponList = couponService.selectCouponList(cvo);
		CouponVO newCvo = couponList.get(0);
		newCvo.setUseFlag(cvo.getUseFlag());		
		
		int success = 0;
		Calendar today = Calendar.getInstance();
		boolean dateChk = ObjectUtil.checkBetweenDate(today, newCvo.getStartDate(), newCvo.getEndDate());
		
		// state:Y && useFlag:N = state:E
		// state:E && dateChk:false = modX
		
		String state = newCvo.getState();
		
		if(state.equals("E") && !dateChk) {
			success = -1;		
		} else {
			if(state.equals("Y") && newCvo.getUseFlag().equals("N")) {
				newCvo.setState("E");
			} else if(state.equals("E") && dateChk && newCvo.getUseFlag().equals("Y")) {
				newCvo.setState("Y");
			} 
			
			success = couponService.updateCouponState(newCvo);			
		}
		
		if(success == 0) {
    		model.addAttribute("alertMsg","수정을 실패했습니다.");
		} else if(success == -1) {
			model.addAttribute("alertMsg","사용이 종료된 쿠폰은 수정할 수 없습니다.");		
			model.addAttribute("redirectUrl", "/coupon/write?idx="+newCvo.getIdx());
		} else {
			model.addAttribute("alertMsg","수정 되었습니다.");		
			model.addAttribute("redirectUrl", "/coupon/list");
		}
		
		return "common/alert";
	}
	
	
		
}
