package com.boxads.main.web;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.encoding.ShaPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.boxads.main.service.AdminService;
import com.boxads.main.service.BoardService;
import com.boxads.main.service.CommonService;
import com.boxads.main.service.FileService;
import com.boxads.main.service.UserService;
import com.boxads.main.vo.AdminVO;
import com.boxads.main.vo.BoardVO;
import com.boxads.main.vo.FileVO;
import com.mysql.cj.Session;


@Controller
public class MainController {

	@Resource(name="ShaPasswordEncoder") private ShaPasswordEncoder spe;
	@Resource private AdminService mservice;
	@Resource private BoardService boardService;
	@Resource private CommonService commonService;
	
	private static final Logger log = LoggerFactory.getLogger(MainController.class);
	
	// 로그인 화면
	@RequestMapping(value = "/")
    public String main() throws Exception{
		log.info("main메서드 시작");
        return "login/login";
    }
	
	// 로그인 처리
	@RequestMapping(value = "/login", method = RequestMethod.POST)
    public String login(AdminVO param, HttpSession session, Model model) throws Exception{
		log.info("login메서드 시작" + param);
		String returnURL = "";
		
		param.setPw(spe.encodePassword(param.getPw(), null));		
		
		AdminVO avo = mservice.selectAdmin(param);
		
		if(avo != null) {
			mservice.updateLoginCnt(avo);
			
			session.setAttribute("login", avo);
			returnURL = "redirect:/main/home";
		} else {
			model.addAttribute("alertMsg","로그인에 실패했습니다.");
        	model.addAttribute("redirectUrl","/");    	
        	returnURL = "common/alert";
		}
        return returnURL;
    }
	
	// 로그 아웃 처리
    @RequestMapping(value = "/logout")
    public String logout(HttpSession session, Model model) {
    	log.info("logout메서드 시작");
    	session.invalidate();  
    	
    	model.addAttribute("alertMsg","로그아웃 되었습니다.");
    	model.addAttribute("redirectUrl","/");    	
    	
    	return "common/alert";
    }
    
    // 메인 대시보드
 	@RequestMapping(value = "/main/home")
    public String dashboardInit(BoardVO boardVO, HttpSession session, Model model) throws Exception{
 		log.info("dashboardInit메서드 시작");
 		
 		boardVO.setType("N");
 		boardVO.setEnd(5);
 		
 		AdminVO admin = (AdminVO) session.getAttribute("login");
 		List<BoardVO> boardList = boardService.selectBoardList(boardVO);
 		
 		// dash Cnt
 		HashMap<String, String> dash = commonService.mainDashCnt();
 		
 		model.addAttribute("boardList", boardList);
 		model.addAttribute("adminVO", admin);
 		model.addAttribute("dash", dash);
 		
 		return "main/main";
     }
    
    
    
    
}