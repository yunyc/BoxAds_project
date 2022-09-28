package com.boxads.main.web;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.authentication.encoding.ShaPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.boxads.ad.service.AdService;
import com.boxads.ad.vo.AdVO;
import com.boxads.box.service.BoxService;
import com.boxads.box.vo.BoxVO;
import com.boxads.main.ObjectUtil;
import com.boxads.main.service.CommonService;
import com.boxads.main.service.FileService;
import com.boxads.main.vo.FileVO;
import com.boxads.main.vo.MemberVO;
import com.boxads.ad.service.AdService;
import com.boxads.ad.vo.AdVO;
import com.boxads.box.service.BoxService;
import com.boxads.box.vo.BoxVO;

@Controller
@RequestMapping(value = "/")
public class MainController {

	private static final Logger log = LoggerFactory.getLogger(MainController.class);
	@Resource(name="ShaPasswordEncoder") private ShaPasswordEncoder spe;
	@Resource private BoxService boxService;
	@Resource private AdService adService;
	@Resource private CommonService commonService;
	@Resource private FileService fileService;
	
	@RequestMapping(value = "/")
    public String init() {
    	return "redirect:main";
    } 
	
	@RequestMapping(value = "/main")
	public String main(BoxVO bvo, AdVO advo, Model model, HttpSession session) throws Exception {
    	log.info("main메서드 시작");
    	System.out.println(commonService.selectTest());
    	log.info("main메서드 시작ㅇㅇㅇㅇ");
    	log.info("main메서드 시작ㄹㄹㄹㄹㄹㅇ");
    	/*
    	List<HashMap<String, Object>> bannerList = commonService.selectBannerAndAlarm("B");
    	
    	// 박스 total
    	bvo.setState("Y");
    	Long cnt = boxService.selectBoxCnt(bvo);
    	model.addAttribute("bxTotal", cnt);

    	// 애드 total
    	advo.setState("Y");
    	cnt = adService.selectAdCnt(advo);
    	model.addAttribute("adTotal", cnt);
    	
    	// dash info
    	HashMap<String, String> dash = new HashMap<String, String>();
    	MemberVO mem = ObjectUtil.getMember(session);
    	if(mem != null) {  
    		dash = commonService.mainDashLoginCnt(mem);
    	} else {
    		dash = commonService.mainDashCnt();    		
    	}
    	
    	model.addAttribute("dash", dash);    	
    	model.addAttribute("bannerList", bannerList);
    	*/
    	
    	return "main/main";
    }
	
	// 알림 (띠 배너)
	@RequestMapping(value = "/alimBanner")
	@ResponseBody
	public List<HashMap<String, Object>> alim(Model model) throws Exception {

    	List<HashMap<String, Object>> list = commonService.selectBannerAndAlarm("A");    	    	
    	model.addAttribute("list", list);
    	
    	return list;
    }
	
	// 검색 페이지
	@RequestMapping(value = "/search_list")
	public String search(@RequestParam(required = false) String searchKeyword, BoxVO bvo, AdVO advo, Model model) throws Exception {
		log.info("LOG: 메인 검색 " +  advo.getSearchKeyword());
		    	
    	// 박스 total
    	bvo.setState("Y");
    	Long cnt = boxService.selectBoxCnt(bvo);
    	model.addAttribute("bxTotal", cnt);

    	// 애드 total
    	advo.setState("Y");
    	cnt = adService.selectAdCnt(advo);
    	model.addAttribute("adTotal", cnt);
    	
    	model.addAttribute("searchKeyword", searchKeyword);
     	
    	return "main/search_list";
    }
	
	// 카테고리 페이지
	@RequestMapping(value = "/cate_list")
	public String categoryPage(@RequestParam String cate, BoxVO bvo, AdVO advo, Model model) throws Exception {
		bvo.setcCIdx(Integer.parseInt(cate));
		advo.setcCIdx(cate);
		
		log.info("LOG: 카테고리별 리스트 " +  bvo);
		log.info("LOG: 카테고리별 리스트 " +  advo);
		
    	// 박스 total
    	bvo.setState("Y");
    	Long cnt = boxService.selectBoxCnt(bvo);
    	model.addAttribute("bxTotal", cnt);

    	// 애드 total
    	advo.setState("Y");
    	cnt = adService.selectAdCnt(advo);
    	model.addAttribute("adTotal", cnt);
    	     	
    	return "main/cate_list";
    }
	
}
