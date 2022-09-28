package com.boxads.common.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.stream.IntStream;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.resource.HttpResource;

import com.boxads.ad.service.AdService;
import com.boxads.ad.vo.AdVO;
import com.boxads.box.service.BoxService;
import com.boxads.box.service.CodeService;
import com.boxads.box.vo.BoxVO;
import com.boxads.common.service.OrderService;
import com.boxads.common.service.SerialService;
import com.boxads.common.vo.LogVO;
import com.boxads.common.vo.OrderVO;
import com.boxads.common.vo.PriceVO;
import com.boxads.etc.service.EtcService;
import com.boxads.etc.vo.CouponVO;
import com.boxads.main.ObjectUtil;
import com.boxads.main.service.CommonService;
import com.boxads.main.service.FileService;
import com.boxads.main.service.MemberService;
import com.boxads.main.vo.FileVO;

import com.boxads.main.vo.MemberVO;
import com.boxads.main.vo.FileVO;

@Controller
@RequestMapping("/order")
public class OrderController {
	
	/*

		광고주의 주문완료 시 
		-> 광고주의 예상지출 증가 
		-> 광고주의 보유캐시 (광고비 + 인쇄비) 차감
		-> 주문취소 시 100% 환불
		
		판매자의 주문승인 시
		-> 판매자의 예상수입 (광고비 - 광고 수수료) 증가
		
		관리자 정산처리 완료 시 
		-> 판매자의 예상수입 차감 
		-> 판매자의 보유캐시 증가
		-> 구매자 예상지출 차감 캐시 내역 등록
		
		관리자 환불처리 완료 시
		-> 광고주의 예상지출 차감 
		-> 광고주의 보유캐시 증가
		
		사용자 출금신청 시
		-> 사용자 보유캐시 차감
		
		관리자 출금처리 시
		-> 캐시 내역 등록
		
	*/
	
	private static final Logger log = LoggerFactory.getLogger(OrderController.class);

	@Resource private CodeService codeService;
	@Resource private BoxService boxService;
	@Resource private FileService fileService;
	@Resource private MemberService memberService;
	@Resource private AdService adService;
	@Resource private EtcService etcService;
	@Resource private OrderService odService;
	@Resource private SerialService serialService;
	@Resource private CommonService commonService;
	
	// 박스 주문
    @RequestMapping(value = "/order_box", method = RequestMethod.GET)
    public String orderBX(BoxVO bvo, HttpSession session, Model model, HttpServletRequest request) throws Exception { 
    	log.info("LOG: 박스 주문 정보 GET " + bvo);
    	
    	if (!ObjectUtil.refererChk(request)) return null;

    	int mIdx = ObjectUtil.getMember(session).getIdx();
    	// 구매하려는 박스 정보
    	bvo = boxService.selectBoxDetail(bvo);
    	
    	// 나의 광고 정보 목록
    	AdVO avo = new AdVO();
    	avo.setWriter(mIdx);
    	avo.setState("Y");
    	List<AdVO> list = adService.selectAdList(avo);
    	
    	// 보유중인 쿠폰목록
    	CouponVO cvo = new CouponVO();
    	cvo.setUseFlag("N");
    	cvo.setmIdx(mIdx);
    	List<CouponVO> list2 = etcService.selectCouponList(cvo);

    	// 보유중인 캐시 정보
    	int cash = memberService.selectCash(mIdx);
    	
    	model.addAttribute("myAdList", list);
    	model.addAttribute("myCpList", list2);
    	model.addAttribute("myCash", cash);
    	model.addAttribute("box", bvo);

    	return "order/order_box";
    }
    
    // 박스 주문 post
    @RequestMapping(value = "/orderBox", method = RequestMethod.POST)
    @ResponseBody
    public int orderBX(OrderVO odvo, HttpSession session, Model model) throws Exception { 
    	log.info("LOG: 박스 주문 정보 POST " + odvo);   	    	
    	
    	int success = 0;    	
    	int mIdx = ObjectUtil.getMember(session).getIdx();  
    	int myCash = memberService.selectCash(mIdx);
    	String serialNumber = serialService.createSerialNumber("O");
    	
    	odvo.setOrderCode(serialNumber);
    	odvo.setmIdx(mIdx);
    	
    	// 쿠폰 처리 및 발급, 판매 상품 카운트, 이력 로그 발행 등
    	success = odService.insertOrderBox(odvo, myCash, session);
    	
    	return success;
    }
    
	@RequestMapping(value = "/pdtCheck", method = RequestMethod.POST)
    @ResponseBody
    public HashMap<String, Object> pdtCheck(@RequestParam HashMap<String, String> param, Model model) throws Exception { 
    	log.info("LOG: 제품 일치 체크 " + param); 
    	
    	/* 인쇄 idx가 변경되는 경우 해당 부분을 수정해야 합니다. */    	

    	int bxCidx = Integer.parseInt(param.get("bxCidx"));
    	int adCidx = Integer.parseInt(param.get("adCidx"));
    	
    	boolean chk = false;
    	String arrStr = "";
    	
    	switch (bxCidx) {
		case 21:
			arrStr = "21, 22, 23";
			break;
		case 22:
			arrStr = "22, 23";
			break;
		case 23:
			arrStr = "23";
			break;
		case 25:
			arrStr = "25, 26";
			break;
		case 26:
			arrStr = "26";
			break;
		case 27:
			arrStr = "27, 28";
			break;
		case 28:
			arrStr = "28";
			break;			
		default:
			break;
		}
    	
    	int[] arr = ObjectUtil.stringArrayToIntArray(arrStr.split(", "));
    	chk = IntStream.of(arr).anyMatch(n -> n == adCidx);
    	
    	HashMap<String, Object> result = new HashMap<String, Object>();
    	
    	if(chk) {
    		// 인쇄 idx 일치하는 경우 단가 가져오기
    		result = codeService.selectUnitInfo(param);

    		if(result == null) {
    			result = new HashMap<String, Object>();
    			result.put("msg", "해당 구간의 단가가 없습니다.");
    		}
    	} else {
    		result.put("msg", "선택하신 애드(Ads) 상품은 광고 유형이 맞지 않아 광고하실 수 없습니다.\n광고 유형 확인 후 다른 애드(Ads) 상품을 선택해주세요.");
    	}    	
    	
    	return result;
    }
	
	// 박스 주문 완료
    @RequestMapping(value = "/order_finish", method = RequestMethod.POST)
    public String orderFinish(OrderVO odvo, Model model) throws Exception { 
    	log.info("LOG: 박스 주문 완료 " + odvo);
    	
    	// 주문 정보
    	odvo = odService.selectOrderDetail(odvo);
    	
    	// 박스 및 애드 정보
    	BoxVO bvo = new BoxVO();
    	bvo.setIdx(odvo.getbIdx());
    	bvo = boxService.selectBoxDetail(bvo);
    	
    	AdVO avo = new AdVO();
    	avo.setIdx(odvo.getaIdx());
    	avo = adService.selecAdDetail(avo);
    	
    	model.addAttribute("order", odvo);
    	model.addAttribute("box", bvo);
    	model.addAttribute("ad", avo);
    	
    	return "order/order_finish";
    }
    
    // 박스 주문 완료 - test
    @RequestMapping(value = "/order_finish_test")
    public String orderFinishTEst(Model model) throws Exception { 
    	
    	return "order/order_finish_test";
    }
    
    // 애드 주문 post
    @RequestMapping(value = "/orderAd", method = RequestMethod.POST)
    @ResponseBody
    public int orderAd(OrderVO odvo, HttpSession session, Model model) throws Exception { 
    	log.info("LOG: 광고 주문 정보 POST " + odvo);   	    	
    	
    	int success = 0;    	
    	int mIdx = ObjectUtil.getMember(session).getIdx();  
    	String serialNumber = serialService.createSerialNumber("O");
    	
    	odvo.setOrderCode(serialNumber);
    	odvo.setmIdx(mIdx);

    	success = odService.insertOrderAd(odvo);
    	
    	return success;
    }
    
    // 상태 변경
    @RequestMapping(value = "/updateState", method = RequestMethod.POST)
    @ResponseBody
    public int updateState(OrderVO odvo, @RequestParam String logTypeArr, @RequestParam(required = false) String mesg, HttpSession session) throws Exception { 
    	log.info("LOG: 상태 변경 정보 " + odvo);   	    	
    	
    	int success = 0;
    	
    	// 상태 변경 및 로그 입력
    	success = odService.updateState(odvo, logTypeArr, mesg, session);    		
    	
    	return success;
    }
    
	// 로그 입력
    @RequestMapping(value = "/insertProcessLog", method = RequestMethod.POST)
    @ResponseBody
    public int insertProcessLog(OrderVO odvo, @RequestParam String logTypeArr, @RequestParam(required = false) String mesg, @RequestParam(required=false) String delivery) throws Exception { 
    	log.info("LOG: 로그 입력 정보 " + odvo);
    	
    	int success = 0;
    	
    	// 로그 입력
    	success = odService.insertProcessLog(odvo, logTypeArr, mesg, delivery);    		
    	
    	return success;
    }
    
    // 마이 애드 요청 상세
    @RequestMapping(value = "/ad_order_detail")
    public String adRequestDetail(@RequestParam(required = false) String type, OrderVO odvo, HttpServletRequest request, HttpSession session, Model model) throws Exception { 
    	log.info("LOG: 마이 애드 요청 / 박스 구매 " + odvo);

    	if (!ObjectUtil.refererChk(request)) return null;
    	
    	int mIdx = ObjectUtil.getMember(session).getIdx();
    	
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
	    	lvo.setType("A");
	    	lvo.setoIdx(odvo.getIdx());
	    	List<LogVO> list = odService.selectProcessLog(lvo);
	    	
	    	for (LogVO log : list) {
				if(log.getAction() != null && log.getAction().equals("DI")) {
					MemberVO marketingInfo = odService.selectMarketingInfo(bvo.getWriter());
					model.addAttribute("mkInfo", marketingInfo);					
				}
			}
	    	
	    	// 보유중인 캐시 정보
	    	int cash = memberService.selectCash(mIdx);
	    	   		
	    	// 보유중인 쿠폰목록
	    	CouponVO cvo = new CouponVO();
	    	cvo.setUseFlag("N");
	    	cvo.setmIdx(mIdx);
	    	List<CouponVO> list2 = etcService.selectCouponList(cvo);
	    	
	    	// 상대가 보낸 메시지 정보
	    	HashMap<String, Object> param = new HashMap<>();
	    	
	    	param.put("receiver", mIdx);
	    	param.put("writer", bvo.getWriter());
	    	HashMap<String, Object> messageCnt = commonService.selectOrderMessageInfo(param);
    	
	    	model.addAttribute("myCpList", list2);
	    	model.addAttribute("box", bvo);
	    	model.addAttribute("ad", avo);
	    	model.addAttribute("messageCnt", messageCnt);
	    	model.addAttribute("myCash", cash);
	    	model.addAttribute("logList", list);	    	
    	}
    	
    	model.addAttribute("order", odvo);
    	    	
    	return "myad/request_detail";
    }
    
    // 마이 박스 판매 상세
    @RequestMapping(value = "/box_order_detail")
    public String boxOrderDetail(@RequestParam(required = false) String type, OrderVO odvo, HttpServletRequest request, HttpSession session, Model model) throws Exception { 
    	log.info("LOG: 마이 박스 판매 / 애드 신청 " + odvo);

    	if (!ObjectUtil.refererChk(request)) return null;
    	
    	int mIdx = ObjectUtil.getMember(session).getIdx();
    	
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
	    	int cash = memberService.selectCash(mIdx);	    	
	    	PriceVO price = codeService.selectTotalPrice(odvo);	    	
	    	price.setIncomeCash(cash + price.getIncome());
	    	
	    	// 광고 신청 건수
	    	int cnt = odService.adRequestCnt(odvo.getaIdx());
	    	
	    	// 상대가 보낸 메시지 정보
	    	HashMap<String, Object> param = new HashMap<>();
	    	
	    	param.put("receiver", mIdx);
	    	param.put("writer", bvo.getWriter());
	    	HashMap<String, Object> messageCnt = commonService.selectOrderMessageInfo(param);
	    	
    		model.addAttribute("box", bvo);
	    	model.addAttribute("ad", avo);	    	
	    	model.addAttribute("cashInfo", price);
	    	model.addAttribute("adCnt", cnt);
	    	model.addAttribute("messageCnt", messageCnt);
	    	model.addAttribute("logList", list);	    	
    	}
    	
    	model.addAttribute("order", odvo);
    	    	
    	return "mybox/sell_detail";
    }
    
//    // 인증사진 업로드
//    @RequestMapping(value = "/logFile", method = RequestMethod.POST)
//    @ResponseBody
//    public String boxOrderFile(OrderVO orderVO, @RequestParam String logTypeArr, @RequestParam String type, @RequestParam List<MultipartFile> uploadFile) throws Exception { 
//    	log.info("boxOrderFile시작");
//    	List<FileVO> fileVOList = new ArrayList<FileVO>();
//
//    	fileService.listSetting(orderVO.getIdx(), type, uploadFile, fileVOList, "process");
//    	fileService.insertFile(orderVO.getIdx(), fileVOList);
//    	
//    	return "/order/box_order_detail?type=B&idx=" + orderVO.getIdx();
//    }
    
    // 로그 파일 등록
 	@RequestMapping(value = "/file", method = RequestMethod.POST)
 	@ResponseBody
 	public String file(@RequestParam List<MultipartFile> uploadFile, @RequestParam HashMap<String, String> param, Model model) throws Exception{
 		log.info("file시작");
 		int success = 0;
 		
 		if(!uploadFile.isEmpty()) { 			
 			success = odService.insertFileNlog(param, uploadFile);	
 		}
 		
 		return "/order/box_order_detail?type=B&idx=" + param.get("idx");
 	}


    // 인증사진 업로드
    @RequestMapping(value = "/box_order_detail", method = RequestMethod.POST)
    @ResponseBody
    public String boxOrderFile(@ModelAttribute OrderVO orderVO, @RequestParam List<MultipartFile> uploadFile) throws Exception { 
    	log.info("boxOrderFile시작");
    	List<FileVO> fileVOList = new ArrayList<FileVO>();

    	fileService.listSetting(orderVO.getIdx(), "IV1", uploadFile, fileVOList, "confirm");
    	fileService.insertFile(orderVO.getIdx(), fileVOList);
    	
    	return "/order/box_order_detail?type=B&idx=" + orderVO.getIdx();
    }    
}
