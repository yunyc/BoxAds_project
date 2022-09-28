package com.boxads.common.web;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.boxads.calcul.service.CalculService;
import com.boxads.cash.vo.CashVO;
import com.boxads.common.ExcelDown;
import com.boxads.common.vo.ExcelVO;
import com.boxads.main.service.BoardService;
import com.boxads.main.service.FileService;
import com.boxads.main.vo.BoardVO;
import com.boxads.member.service.MemberService;
import com.boxads.member.vo.MemberVO;
import com.boxads.order.service.OrderService;
import com.boxads.order.vo.OrderVO;
import com.boxads.product.service.ProductService;
import com.boxads.product.vo.ProductVO;


@Controller
@RequestMapping(value = "/excel")
public class ExcelController {
	
	/*
	 * 엑셀 컨트롤러의 접근 맵핑 인덱스 0 번 파일이 권한 체크용 category
	 * ex) calcul_bill_excel -> calcul 
	 */

	private static final Logger log = LoggerFactory.getLogger(ExcelController.class);

	@Resource private MemberService memberService;
	@Resource private FileService fileService;
	@Resource private BoardService boardService;
	@Resource private ProductService productService;
	@Resource private OrderService orderService;
	@Resource private CalculService calculService;

	@RequestMapping(value = "/member_excel", method = {RequestMethod.GET,RequestMethod.POST})
	public void boardExcel(@ModelAttribute MemberVO memberVO, ExcelVO excelVO, HttpServletResponse response,  HttpServletRequest request) throws Exception{

    	String title = "";
    	String cellWidth = "1,4,6,4,4,4,1";
    	String head = "번호,업체명,이메일,전화번호,가입일자,최근방문일,인증여부";
	    String body = "no,name,id,phone,insertDate,loginDate,confirmFlag";

	    memberVO.setExcel("EXCEL");

	    List<HashMap<String, String>> list = memberService.selectListExcel(memberVO);

    	switch (memberVO.getState()) {
    	case "Y" :
    		title = "활동회원_";
    		break;
    	case "H" :
    		title = "휴면회원_";
    		head = "번호,업체명,이메일,전화번호,가입일자,휴면처리일시,인증여부";
    		break;
    	case "N" :
    		title = "탈퇴회원_";
    		head = "번호,업체명,이메일,전화번호,가입일자,탈퇴처리일시,인증여부";
    		break;
    	}
    	
    	excelVO.setData(title, head, body, cellWidth, "리스트", list);

    	ExcelDown.buildExcelDocument(excelVO, request, response);

    }

	@RequestMapping(value = "/board_excel", method = {RequestMethod.GET,RequestMethod.POST})
	public void boardExcel(@ModelAttribute BoardVO boardVO, ExcelVO excelVO, HttpServletResponse response,  HttpServletRequest request) throws Exception{

    	String title = "";
    	String cellWidth = "";
    	String head = "";
	    String body = "";

	    boardVO.setExcel("EXCEL");
	    List<HashMap<String, String>> list = boardService.selectListExcel(boardVO);

    	switch (boardVO.getType()) {
    	case "N" :
    		title = "공지사항_";
    		cellWidth = "1,4,6,4,4,4,1";
        	head = "번호,구분,제목,등록자,등록일,조회수,노출상태";
    	    body = "no,adGroup,title,name,insertDate,viewCnt,state";
    		break;
    	case "F" :
    		title = "FAQ_";
    		cellWidth = "1,4,6,4,4,1";
        	head = "번호,구분,제목,등록일,조회수,노출상태";
    	    body = "no,categoryName,title,insertDate,viewCnt,state";
    		break;
    	case "Q" :
    		title = "QNA_";
    		cellWidth = "1,6,4,4,4,1";
        	head = "번호,제목,등록자,등록일,답변일,답변여부";
    	    body = "no,title,name,insertDate,replyDate,replyFlag";
    		break;
    	case "B" :
    		title = "배너_";
    		cellWidth = "1,6,4,4,6,1";
        	head = "번호,제목,등록자,등록일,노출기간,노출상태";
    	    body = "no,title,name,insertDate,startDate,state";
    		break;    
    	case "A" :
    		title = "알림_";
    		cellWidth = "1,6,4,4,6,1";
        	head = "번호,제목,등록자,등록일,노출기간,노출상태";
    	    body = "no,title,name,insertDate,startDate,state";
    		break;
    	}
    	
    	excelVO.setData(title, head, body, cellWidth, "리스트", list);

    	ExcelDown.buildExcelDocument(excelVO, request, response);

    }
	
	@RequestMapping(value = "/product_excel", method = {RequestMethod.GET,RequestMethod.POST})
	public void productExcel(@ModelAttribute ProductVO product, ExcelVO excelVO, HttpServletResponse response,  HttpServletRequest request) throws Exception{
		
		String title = "";
    	String cellWidth = "";
    	String head = "";
	    String body = "";
	    
    	product.setExcel("EXCEL");

	    List<HashMap<String, String>> list = productService.selectListExcel(product);
	    
	    if (product.getType() == null || !product.getType().equals("A")) {
	    	title = "박스_";
	    	cellWidth = "1,4,4,6,4,4,4,4,4,4,4,4";
        	head = "번호,등록일시,박스번호,박스,판매자,광고유형,판매월,광고비,조회수,찜수,판매수,상태";
    	    body = "no,insertDate,pNo,title,name,pCIdx,sellDate,adPrice,viewCnt,favCnt,odCnt,state";
	    } else {
	    	title = "애드_";
	    	cellWidth = "1,4,4,6,4,6,4,4,4,4";
        	head = "번호,등록일시,애드번호,애드,광고주,광고기간,조회수,찜수,판매수,상태";
    	    body = "no,insertDate,pNo,title,name,adStartDate,viewCnt,favCnt,odCnt,state";
	    }

    	excelVO.setData(title, head, body, cellWidth, "리스트", list);

    	ExcelDown.buildExcelDocument(excelVO, request, response);

    }
	
	@RequestMapping(value = "/order_excel", method = {RequestMethod.GET,RequestMethod.POST})
	public void orderExcel(@ModelAttribute OrderVO odVO, ExcelVO excelVO, HttpServletResponse response,  HttpServletRequest request) throws Exception{
		
		String title = "";
    	String cellWidth = "";
    	String head = "";
	    String body = "";
	    
	    odVO.setExcel("EXCEL");

	    List<HashMap<String, String>> list = orderService.selectOrderList(odVO);
	    
	    if (odVO.getState().equals("B")) {
	    	title = "박스_판매_";
	    	cellWidth = "1,4,4,6,4,4,4,4,4,4,4,4";
        	head = "번호,거래일시,거래번호,박스(BOX),판매자,애드(Ads),광고주,광고유형,판매월,총결제금액,진행상태,인쇄상태";
    	    body = "no,insertDate,orderCode,bTitle,bName,aTitle,aName,proType,sellDate,totalPrice,oState,rState";
	    } else {
	    	title = "애드_신청_";
	    	cellWidth = "1,4,4,6,4,6,4,4,4,4";
        	head = "번호,신청일시,신청번호,애드(Ads),광고주,박스(BOX),판매자,광고상태,신청상태";
    	    body = "no,insertDate,orderCode,aTitle,aName,bTitle,bName,aState,oState";
	    }

    	excelVO.setData(title, head, body, cellWidth, "리스트", list);

    	ExcelDown.buildExcelDocument(excelVO, request, response);

    }
	
	@RequestMapping(value = "/calcul_bill_excel", method = {RequestMethod.GET,RequestMethod.POST})
	public void billExcel(@RequestParam HashMap<String, Object> param, 
			@RequestParam(required = false) String[] state,			
			@RequestParam(required = false) String[] type,
			@RequestParam(required = false) String[] subject,
			ExcelVO excelVO, HttpServletResponse response, HttpServletRequest request) throws Exception{
		
		String title = "";
    	String cellWidth = "";
    	String head = "";
	    String body = "";
	    
	    param.put("state", state);
		param.put("type", type);
		param.put("subject", subject);
	    param.put("excel", "EXCEL");

	    List<HashMap<String, String>> list = calculService.selectBillList(param);
	    	    
    	title = "증빙자료관리_";
    	cellWidth = "1,4,4,4,4,4,4,4,4,4";
    	head = "번호,요청일자,업체명,	발행구분,증빙 유형,공급가액,세액,합계,처리 일자,상태";
	    body = "no,insertDate,name,subjectStr,typeStr,amount,fee,total,updateDateStr,stateStr";
	    
    	excelVO.setData(title, head, body, cellWidth, "리스트", list);

    	ExcelDown.buildExcelDocument(excelVO, request, response);

    }
	
	@RequestMapping(value = "/calcul_excel", method = {RequestMethod.GET,RequestMethod.POST})
	public void calculExcel(@RequestParam HashMap<String, Object> param, @RequestParam(required = false) String[] state, ExcelVO excelVO, HttpServletResponse response,  HttpServletRequest request) throws Exception{
		
		String title = "";
    	String cellWidth = "";
    	String head = "";
	    String body = "";
	    
	    param.put("state", state);
	    param.put("excel", "EXCEL");

	    List<HashMap<String, String>> list = calculService.selectCalculList(param);
	    	    
    	title = "정산관리_";
    	cellWidth = "1,6,4,4,4,4,4,4,6,4";
    	head = "번호,요청일시,결제번호,총 결제금액,광고주,광고비정산,판매자,쿠폰,판매수익,정산일시,정산상태";
	    body = "no,insertDate,ccCode,totalPrice,aName,amount,margin,cpPrice,margin,updateDate,stateStr";
	    
    	excelVO.setData(title, head, body, cellWidth, "리스트", list);

    	ExcelDown.buildExcelDocument(excelVO, request, response);

    }
	
	@RequestMapping(value = "/calcul_withdraw_excel", method = {RequestMethod.GET,RequestMethod.POST})
	public void withdrawExcel(@RequestParam HashMap<String, Object> param, @RequestParam(required = false) String[] state, ExcelVO excelVO, HttpServletResponse response,  HttpServletRequest request) throws Exception{
		
		String title = "";
    	String cellWidth = "";
    	String head = "";
	    String body = "";
	    
	    param.put("state", state);
	    param.put("excel", "EXCEL");

	    List<HashMap<String, String>> list = calculService.selectWithdrawList(param);
	    	    
    	title = "출금관리_";
    	cellWidth = "1,4,4,8,4,4,4,4,4,4";
    	head = "번호,아이디,업체명,계좌정보,출금 신청 캐시,세액,출금 합계액,출금 신청일,출금 처리일,상태";
	    body = "no,id,name,bank,amount,fee,total,insertDate,updateDate,state";
	    
    	excelVO.setData(title, head, body, cellWidth, "리스트", list);

    	ExcelDown.buildExcelDocument(excelVO, request, response);

    }
	
	@RequestMapping(value = "/calcul_payment_excel", method = {RequestMethod.GET,RequestMethod.POST})
	public void paymentExcel(CashVO cvo, ExcelVO excelVO, HttpServletResponse response,  HttpServletRequest request) throws Exception{
		
		String title = "";
    	String cellWidth = "";
    	String head = "";
	    String body = "";
	    
	    cvo.setExcel("EXCEL");

	    List<HashMap<String, String>> list = calculService.selectCashList(cvo);
	    	    
    	title = "결제(충전)관리_";
    	cellWidth = "1,8,8,4,4,4,4,2,4,4";
    	head = "번호,결제일시,결제승인번호,충전상품,결제금액,결제방식,결제결과,회원명";
	    body = "no,insertDate,cashCode,cash,amt,type,pStr,name";
	    
    	excelVO.setData(title, head, body, cellWidth, "리스트", list);

    	ExcelDown.buildExcelDocument(excelVO, request, response);

    }
	
}