package com.boxads.order.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
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
import org.springframework.web.multipart.MultipartFile;

import com.boxads.common.vo.PageVO;
import com.boxads.main.ObjectUtil;
import com.boxads.main.service.BoardService;
import com.boxads.main.service.CommonService;
import com.boxads.main.service.FileService;
import com.boxads.setting.service.SettingService;
import com.boxads.setting.vo.CodeVO;
import com.boxads.main.vo.AdminVO;
import com.boxads.main.vo.FileVO;
import com.boxads.order.service.OrderService;
import com.boxads.order.vo.LogVO;
import com.boxads.order.vo.OrderVO;
import com.boxads.print.service.PrintService;
import com.boxads.print.vo.PrintVO;
import com.boxads.product.service.ProductService;
import com.boxads.product.vo.ProductVO;


@Controller
@RequestMapping(value = "/order")
public class OrderController {

	private static final Logger log = LoggerFactory.getLogger(OrderController.class);
	@Resource(name="ShaPasswordEncoder") private ShaPasswordEncoder spe;
	@Resource private OrderService orderService;
	@Resource private FileService fileService;
	@Resource private CommonService commonService;
	@Resource private ProductService productService;
	@Resource private PrintService printService;
	
	// 주문관리 리스트 조회
	@RequestMapping(value = "/list")
    public String orderInit(@ModelAttribute OrderVO odVO, PageVO pvo, Model model) throws Exception{
		
		odVO.setStart(pvo.getStart());
		odVO.setEnd(pvo.getEnd());
		
		List<HashMap<String, String>> orderList = orderService.selectOrderList(odVO);
		pvo.setTotalCnt(orderService.selectOrderCnt(odVO));
		
		model.addAttribute("orderList", orderList);
		model.addAttribute("page", pvo);
		
        return "order/order_list";
    }
	
	// 주문관리 상세 페이지 이동
	@RequestMapping(value = "/detail")
	public String orderDetail(@ModelAttribute OrderVO odVO, Model model, HttpServletRequest request) throws Exception{
		log.info("orderDetail시작");
		
		if (!ObjectUtil.refererChk(request)) return null;
		
		List<HashMap<String, String>> firstList = new ArrayList<HashMap<String, String>>();
		List<HashMap<String, String>> secondList = new ArrayList<HashMap<String, String>>();
		
		List<HashMap<String, String>> order = orderService.selectOrderList(odVO);
		Object aIdx = order.get(0).get("aIdx");		
		odVO.setaIdx((int) aIdx);
		
		List<FileVO> fileList = fileService.selectFile(0, odVO.getaIdx(), "A");
		List<HashMap<String, Object>> memoList = orderService.selectMemoList(odVO);
		List<HashMap<String,Object>> reasonList = productService.selectReason(odVO.getIdx(), "F");
		
		List<HashMap<String, String>> logFileList = fileService.selectLogFile(odVO);
		
		for (HashMap<String, String> f : logFileList) {
			
			switch (f.get("action")) {
			case "IV1":
				firstList.add(f);
				break;
			case "IV2":
				secondList.add(f);
				break;
			}
		}
		
		// 인쇄 로그
		HashMap<String, Object> param = (HashMap<String, Object>) ObjectUtil.convertObjectToMap(odVO); 
		List<PrintVO> logList = printService.selectPrintLog(param);
				
		model.addAttribute("order", order.get(0));
		model.addAttribute("fileList", fileList);
		model.addAttribute("memoList", memoList);
		model.addAttribute("reasonList", reasonList);
		model.addAttribute("logList", logList);
		
		// 로그 이미지 파일
		model.addAttribute("firstList", firstList);
		model.addAttribute("secondList", secondList);
		
	    return "order/order_detail";
	}
	
	// 팝업
	@RequestMapping(value = "/popup")
	public String boxPopup(@ModelAttribute LogVO lvo, PageVO pvo, Model model) throws Exception{
		log.info("boxPopup시작");
		
		lvo.setStart(pvo.getStart());
		lvo.setEnd(pvo.getEnd());
		
		List<LogVO> logList =  orderService.selectProcessLog(lvo);
		pvo.setTotalCnt(orderService.selectLogCnt(lvo));
		
		model.addAttribute("logList", logList);
		model.addAttribute("page", pvo);
		model.addAttribute("state", lvo.getType());
		model.addAttribute("oIdx", lvo.getoIdx());
		return "order/popup";		
	}
	
	// 팝업 로그 리스트 조회
	@RequestMapping(value = "/popupAjax")
	public String popupAjax(@ModelAttribute LogVO lvo, PageVO pvo, Model model) throws Exception{
		log.info("popupAjax시작");
			
		lvo.setStart(pvo.getStart());
		lvo.setEnd(pvo.getEnd());
			
		List<LogVO> logList =  orderService.selectProcessLog(lvo);
		pvo.setTotalCnt(orderService.selectLogCnt(lvo));
			
		model.addAttribute("logList", logList);
		model.addAttribute("page", pvo);
		model.addAttribute("state", lvo.getType());
		model.addAttribute("oIdx", lvo.getoIdx());
		return "order/log_list";		
		}
	
	// 거래 메모 작성
	@RequestMapping(value = "/memo", method = RequestMethod.POST)
	@ResponseBody
	public void orderMemo(@RequestParam HashMap<String, Object> param, HttpSession session) throws Exception{
		log.info("orderMemo시작");
		
		AdminVO admin = (AdminVO) session.getAttribute("login");
		param.put("writer", admin.getIdx());
		orderService.insertMemoList(param);
			
	}
	
//	// 반려사유 작성
//	@RequestMapping(value = "/false", method = RequestMethod.POST)
//	@ResponseBody
//	public void adFalse(@RequestParam HashMap<String, Object> param, HttpSession session) throws Exception{
//		log.info("adFalse시작");
//		
//		AdminVO admin = (AdminVO) session.getAttribute("login");
//		param.put("writer", admin.getIdx());
//		param.put("type", "F");
//		
//		productService.insertReason(param);
//				
//	}
//	
//	// 광고 인증 상태 변경
//	@RequestMapping(value = "/confirm", method = RequestMethod.POST)
//	@ResponseBody
//	public void adConfirm(@RequestParam HashMap<String, Object> param, HttpSession session) throws Exception{
//		log.info("adConfirm시작");
//			
//		AdminVO admin = (AdminVO) session.getAttribute("login");
//		param.put("writer", admin.getIdx());
//			
//		orderService.updateState(param);
//					
//	}
	
//	// 파일 등록
//	@RequestMapping(value = "/file", method = RequestMethod.POST)
//	public String file(@RequestParam HashMap<String, String> param, @RequestParam List<MultipartFile> uploadFile, Model model) throws Exception{
//		log.info("file시작");
//		
//		List<FileVO> fileVOList = new ArrayList<FileVO>();
//		String type = "";
//				
//		fileService.listSetting(0, odVO.getIdx(), type, "/order", uploadFile, fileVOList);
//		fileService.insertFile(odVO.getIdx(), fileVOList);
//		
//		model.addAttribute("alertMsg", "저장되었습니다.");
//		model.addAttribute("redirectUrl", "/order/detail?idx=" + odVO.getIdx() + "&state=B");
//		
//		return "common/alert";
//	}
	
	// 로그 파일 등록
	@RequestMapping(value = "/file", method = RequestMethod.POST)
	public String file(@RequestParam List<MultipartFile> uploadFile, @RequestParam HashMap<String, String> param, Model model) throws Exception{
		log.info("file시작");
		int success = 0;
		
		if(!uploadFile.isEmpty()) {
			success = orderService.insertFileNlog(param, uploadFile);	
		}
		
		if(success > 0) {
			model.addAttribute("alertMsg", "저장되었습니다.");			
			model.addAttribute("redirectUrl", "/order/detail?state=B&idx="+param.get("idx"));
		} else {
			model.addAttribute("alertMsg", "실패했습니다.");
		}
		
		return "common/alert";
	}
		
    // 상태 변경
    @RequestMapping(value = "/updateState", method = RequestMethod.POST)
    @ResponseBody
    public int updateState(OrderVO odvo, @RequestParam String logTypeArr, @RequestParam(required = false) String mesg) throws Exception { 
    	log.info("LOG: 상태 변경 정보 " + odvo);   	    	
    	
    	int success = 0;
    	
    	// 상태 변경 및 로그 입력
    	success = orderService.updateState(odvo, logTypeArr, mesg);    		
    	
    	return success;
    }    
   
	// 로그 입력
    @RequestMapping(value = "/insertProcessLog", method = RequestMethod.POST)
    @ResponseBody
    public int insertProcessLog(OrderVO odvo, @RequestParam String logTypeArr, @RequestParam(required = false) String mesg, @RequestParam(required=false) String delivery) throws Exception { 
    	log.info("LOG: 로그 입력 정보 " + odvo);
    	
    	int success = 0;
    	
    	// 로그 입력
    	success = orderService.insertProcessLog(odvo, logTypeArr, mesg, delivery);    		
    	
    	return success;
    }
}
