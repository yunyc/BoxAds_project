package com.boxads.main.web;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.encoding.ShaPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.boxads.ad.vo.AdVO;
import com.boxads.box.vo.CodeVO;
import com.boxads.common.service.QRcodeService;
import com.boxads.common.vo.MessageVO;
import com.boxads.main.service.CommonService;
import com.boxads.main.vo.MemberVO;

import javax.servlet.http.HttpSession;
import com.boxads.main.ObjectUtil;
@Controller
@RequestMapping(value = "/common")
public class CommonController {

	private static final Logger log = LoggerFactory.getLogger(CommonController.class);
	@Resource(name="ShaPasswordEncoder") private ShaPasswordEncoder spe;
	@Resource QRcodeService qrcodeService;
	
	@Autowired
	CommonService cservice;
	
    // 찜하기
	@RequestMapping(value = "/wishInsert")
    @ResponseBody
    public String wishInsert(@RequestParam Map<String, Object> param, HttpSession session) throws Exception {
    	log.info("찜하기 등록 : " + param);
    	
    	int success = 0;

    	if(ObjectUtil.getMember(session) != null) {
    		param.put("mIdx", ObjectUtil.getMember(session).getIdx());
    		success = cservice.insertWish(param);    		
    	} else {
    		success = -1;
    	}
    	
    	return String.valueOf(success);
    }
	
	// 찜삭제
    @RequestMapping(value = "/wishDelete")
    @ResponseBody
    public String wishDelete(@RequestParam Map<String, Object> param, HttpSession session) throws Exception {
    	log.info("찜하기 삭제 : " + param);
    	int success = 0;

    	if(ObjectUtil.getMember(session) != null) {
    		param.put("mIdx", ObjectUtil.getMember(session).getIdx());
    		success = cservice.deleteWish(param);
    	} else {
    		success = -1;
    	}  

    	return String.valueOf(success);
    }
    
    // 대분류 카테고리 inc
    @RequestMapping(value = "/category", method = RequestMethod.POST)
    @ResponseBody
    public List<CodeVO> category(CodeVO cvo, Model model) throws Exception {    	
    	log.info("대분류 코드 가져오기 : " + cvo);
    	
    	cvo.setUseFlag("Y");
    	List<CodeVO> list = cservice.selectCategory(cvo);
    	
    	return list;
    }
    
    // qr코드 경로 체크
    @RequestMapping(value = "/qrcode")
    public String qrcode(@ModelAttribute AdVO adVO) throws Exception {    	
    	log.info("qrcode시작");   	
    	
    	adVO.setqIdx(adVO.getIdx());
    	
    	// 방문횟수 카운트 + 1
    	qrcodeService.updateCnt(adVO);
    	
    	HashMap<String, Object> map = qrcodeService.selectQRcode(adVO);
    	String siteUrl = (String) map.get("siteUrl");
    	
    	// url이 http로 시작하지 않을 경우 내부 path로 잡히기 때문에 판별 후 붙여줌    	
    	if(!siteUrl.startsWith("http")) { siteUrl = "http://" + siteUrl; }
    	return "redirect:" + siteUrl;
    }
    
    // 알림 리스트
    @RequestMapping(value = "/alarm", method = RequestMethod.POST)
    public String alarmInit(@RequestParam int end, HttpSession session, Model model) throws Exception {    	
    	log.info("alarmInit시작");
    	
    	MemberVO member = (MemberVO) session.getAttribute("login");
    	
    	List<String> alarmDate = new ArrayList<String>();
    	List<HashMap<String, Object>> alarmList = cservice.selectAlarmLog(member.getIdx(), end);
    	
    	int chk = 0;
    	for (HashMap<String, Object> map : alarmList) {
    		if(map.get("newFlag").equals("Y")) { chk = 1; }
    		if (!alarmDate.contains((String) map.get("insertDate"))) {
    			alarmDate.add((String) map.get("insertDate"));
    		}
    	}
    	
    	model.addAttribute("alarmList", alarmList);
    	model.addAttribute("alarmDate", alarmDate);
    	model.addAttribute("newFlag", chk);
    	
    	return "list/alarm_list";
    }
    
    // 메세지 리스트
    @RequestMapping(value = "/message", method = RequestMethod.POST)
    public String messageInit(MessageVO mvo, HttpSession session, Model model) throws Exception {    	
    	log.info("메세지 : " + mvo);
    	
    	List<String> messageDate = new ArrayList<String>();
    	mvo.setWriter(ObjectUtil.getMember(session).getIdx());
    	List<MessageVO> messageList = cservice.selectInitMessage(mvo);
    	
    	int chk = 0;
    	for (MessageVO temp : messageList) {
    		if(temp.getNewFlag().equals("Y")) { chk = 1; }    		 
    		if (!messageDate.contains(temp.getInsertDate())) { messageDate.add(temp.getInsertDate()); }
    	}
    	
    	model.addAttribute("messageList", messageList);
    	model.addAttribute("messageDate", messageDate);
    	model.addAttribute("newFlag", chk);
    	
    	return "list/message_init_list";
    }
    
    // 메세지 삭제
    @RequestMapping(value = "/messageDelete", method = RequestMethod.POST)
    @ResponseBody
    public String messageDelete(@RequestParam String delIdx, HttpSession session, Model model) throws Exception {    	
    	log.info("메세지 삭제 : " + delIdx);
    	
    	int success = 0;
    	MemberVO mvo = ObjectUtil.getMember(session);
    	
    	if(mvo != null) {
    		
    		HashMap<String, Object> param = new HashMap<>();    		
    		param.put("list", Arrays.asList(delIdx.split(",")));
    		param.put("mIdx", mvo.getIdx());
    		
    		success = cservice.deleteMessage(param);
    	}    	
    	
    	return String.valueOf(success);
    }
}
