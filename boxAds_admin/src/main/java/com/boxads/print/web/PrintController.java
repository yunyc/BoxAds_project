package com.boxads.print.web;


import java.util.ArrayList;
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
import org.springframework.web.multipart.MultipartFile;

import com.boxads.common.vo.PageVO;
import com.boxads.main.service.FileService;
import com.boxads.main.vo.FileVO;
import com.boxads.order.service.OrderService;
import com.boxads.order.vo.OrderVO;
import com.boxads.print.service.PrintService;
import com.boxads.print.vo.PrintVO;

@Controller
@RequestMapping(value = "/print")
public class PrintController {
	@Resource private FileService fileService;
	@Resource private PrintService printService;
	@Resource private OrderService orderService;
	
	private static final Logger log = LoggerFactory.getLogger(PrintController.class);
	@Resource(name="ShaPasswordEncoder") private ShaPasswordEncoder spe;
	
	// 인쇄관리 리스트
	@RequestMapping(value = "/print_list")
	public String print(@RequestParam HashMap<String, Object> param, PageVO pvo, Model model) throws Exception {
		
		// dash info
		HashMap<String, Object> dash = printService.selectPrintDashCnt();
		
		// list
		param.put("start", pvo.getStart());
		param.put("end", pvo.getEnd());
		
		List<HashMap<String, Object>> list = printService.selectPrintList(param);
		pvo.setTotalCnt((long) printService.selectPrintCnt(param));
		
		model.addAttribute("list", list);
		model.addAttribute("page", pvo);
		model.addAttribute("dash", dash);
		
		return "print/print_list";
	}
	
	// 인쇄관리 상세
	@RequestMapping(value = "/print_detail")
	public String printDetail(@RequestParam HashMap<String, Object> param, Model model) throws Exception {
		
		// 상세
		HashMap<String, Object> vo = printService.selectPrintDetail(param);
		
		// 이미지
		HashMap<String, Object> qr = orderService.selectQRcode(param);
		List<FileVO> imgList = fileService.selectFile(0, Integer.parseInt(vo.get("aIdx").toString()), "A");
				
		// 인쇄 로그
		List<PrintVO> logList = printService.selectPrintLog(param);
		
		model.addAttribute("vo", vo);
		model.addAttribute("qr", qr);
		model.addAttribute("logList", logList);
		model.addAttribute("imgList", imgList);
		
		return "print/print_detail";
	}
	
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
			model.addAttribute("redirectUrl", "/print/print_detail?idx="+param.get("idx"));
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
