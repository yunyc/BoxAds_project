package com.boxads.admin.web;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.boxads.ad.service.AdService;
import com.boxads.ad.vo.AdVO;
import com.boxads.box.service.BoxService;
import com.boxads.box.service.CodeService;
import com.boxads.box.vo.BoxVO;
import com.boxads.common.service.OrderService;
import com.boxads.common.vo.LogVO;
import com.boxads.common.vo.MessageVO;
import com.boxads.common.vo.OrderVO;
import com.boxads.common.vo.PriceVO;
import com.boxads.common.web.OrderController;
import com.boxads.main.ObjectUtil;
import com.boxads.main.service.CommonService;
import com.boxads.main.service.MemberService;

@Controller
@RequestMapping(value = "/admin")
public class AdminController {
	
	private static final Logger log = LoggerFactory.getLogger(AdminController.class);

	@Resource private CommonService commonService;
	@Resource private CodeService codeService;
	@Resource private BoxService boxService;
	@Resource private MemberService memberService;
	@Resource private AdService adService;
	@Resource private OrderService odService;

	// 메세지 리스트
    @RequestMapping(value = "/message_detail", method = RequestMethod.POST)
    public String messageDetail(HttpServletRequest request, MessageVO mvo, Model model, HttpSession session) throws Exception {
    	
    	if (!ObjectUtil.refererChk(request)) return null;
    	
    	log.info("LOG: 관리자 메세지 " + mvo);    	
    	    	
    	// total
    	int total = commonService.selectMessageByWriterCnt(mvo);
    	    	
    	mvo = commonService.selectMemberForMesg(mvo);
    	model.addAttribute("receiver", mvo);    	
    	model.addAttribute("total", total);
    	
    	return "message/admin_message_detail";
    }
    
    // 메세지 리스트
    @RequestMapping(value = "/messageDetailAjaxList")
    public String messageDetailList(HttpServletRequest request, MessageVO mvo, Model model, HttpSession session) throws Exception {
    	log.info("LOG: 관리자 메세지 " + mvo);
    	
    	if (!ObjectUtil.refererChk(request)) return null;
   	    	
    	int writer = mvo.getWriter();
    	
    	// 메시지
    	List<MessageVO> list = commonService.selectMessageByWriter(mvo);
    	
    	mvo = commonService.selectMemberForMesg(mvo);
    	model.addAttribute("receiver", mvo);

    	mvo.setReceiver(writer);
    	mvo = commonService.selectMemberForMesg(mvo);
    	model.addAttribute("writer", mvo);    	    	
    	
    	model.addAttribute("list", list);
    	
    	return "message/admin_message_detail_list";
    }
    
	// 주문 상세
    @RequestMapping(value = "/admin_order_detail", method = RequestMethod.POST)
    public String orderDetail(HttpServletRequest request, OrderVO odvo, Model model) throws Exception {
    	
    	if (!ObjectUtil.refererChk(request)) return null;
    	
    	log.info("LOG: 관리자 주문 상세 " + odvo);
    	
    	// 주문 정보
    	odvo = odService.selectOrderDetail(odvo);
    	
    	if(odvo != null) {
    		
	    	// 박스 및 애드 정보
	    	BoxVO bvo = new BoxVO();
	    	bvo.setIdx(odvo.getbIdx());
	    	bvo = boxService.selectBoxDetail(bvo);
	    	
	    	AdVO avo = new AdVO();
	    	avo.setIdx(odvo.getaIdx());
	    	avo = adService.selecAdDetail(avo);
	    	
	    	// 진행 로그 리스트
	    	LogVO lvo = new LogVO();
	    	lvo.setType("B");
	    	lvo.setoIdx(odvo.getIdx());
	    	List<LogVO> list = odService.selectProcessLog(lvo);
	    	
	    	// 예상 캐시 잔액 및 예상 수입액, 수수료
	    	int cash = memberService.selectCash(bvo.getWriter());	    	
	    	PriceVO price = codeService.selectTotalPrice(odvo);	    	
	    	price.setIncomeCash(cash + price.getIncome());
	    	
	    	// 광고 신청 건수
	    	int cnt = odService.adRequestCnt(odvo.getaIdx());
	    		    	
    		model.addAttribute("box", bvo);
	    	model.addAttribute("ad", avo);	    	
	    	model.addAttribute("cashInfo", price);
	    	model.addAttribute("adCnt", cnt);
	    	model.addAttribute("logList", list);	    	
    	}
    	
    	model.addAttribute("order", odvo);
    	    	
    	return "order/admin_order_detail";
    }
	
}
