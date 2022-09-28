package com.boxads.main.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.poi.ss.formula.ptg.MemErrPtg;
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
import org.springframework.web.util.WebUtils;

import com.boxads.common.service.MailService;
import com.boxads.common.service.QRcodeService;
import com.boxads.main.service.BoardService;
import com.boxads.main.service.FileService;
import com.boxads.main.service.MemberService;
import com.boxads.main.vo.FileVO;
import com.boxads.main.vo.MemberVO;


@Controller
@RequestMapping(value="/login")
public class LoginController {

	private static final Logger log = LoggerFactory.getLogger(LoginController.class);
	@Resource(name="ShaPasswordEncoder") private ShaPasswordEncoder spe;
	@Resource private MemberService memberService;
	@Resource private MailService mailService;
	@Resource private FileService fileService;
	
	// 로그인 페이지 이동
    @RequestMapping(value = "")
    public String loginInit() throws Exception {
    	log.info("loginInit메서드 시작");
    	return "member/login";
    }
    
    // 로그인 처리
    @RequestMapping(value = "", method = RequestMethod.POST)
    public String login(@ModelAttribute MemberVO memberVO, 
    					@RequestParam(defaultValue = "false") boolean remember, 
    					HttpSession session, Model model, HttpServletResponse response) throws Exception {
    	log.info("login메서드 시작");
    	String returnUrl = "";
    	memberVO.setPw(spe.encodePassword(memberVO.getPw(), null));
    	memberVO.setAuthFlag("Y");
    	MemberVO member = memberService.selectMemberList(memberVO);
    	
    	if (member != null && !member.getState().equals("N")) {
    		session.setAttribute("login", member);
    		    		
    		if (remember){
                // 쿠키 사용한다는게 체크되어 있으면...
                // 쿠키를 생성하고 현재 로그인되어 있을 때 생성되었던 세션의 id를 쿠키에 저장한다.
                Cookie cookie = new Cookie("loginCookie", session.getId());
                cookie.setPath("/");
                cookie.setMaxAge(60*60*24*7);
                response.addCookie(cookie);
                
                memberVO.setSessionId(session.getId());
                memberService.updateSessionId(memberVO);
            }

    		returnUrl = "redirect:/main";
    		
    		if (member.getState().equals("H")) {
    			model.addAttribute("state", member.getState());
    			member.setState("Y");
        		memberService.updateMemberList(session, member);
        		
        		returnUrl = "member/profile";
    		
    		} else if (member.getState().equals("P")) {
    			model.addAttribute("state", member.getState());
    			return "member/login";
    		}
    		
    		memberService.updateLoginCnt(member);
    		
    		// 프로필 이미지 세션 저장
    		HashMap<String, String> img = memberService.selectPrImg(member);
    		session.setAttribute("prImg", img);
    		
    	} else {
    		model.addAttribute("alertMsg","일치하는 정보가 없습니다. 확인후 다시 입력해주세요.");
	      	model.addAttribute("redirectUrl","/login");    	
	      	returnUrl = "common/alert";
    	}
    	
    	return returnUrl;
    }
    
    // 로그아웃 처리
    @RequestMapping(value = "/logout")
    public String logout(HttpServletRequest request, HttpServletResponse response) {
    	log.info("logout메서드 시작");
    	
    	Cookie[] cookies = request.getCookies();
		
    	if (cookies != null) {
			
    		for(Cookie cookie : cookies) {
				
    			if(cookie.getName().equals("loginCookie")) {
    				cookie.setPath("/");
					cookie.setMaxAge(0);
					response.addCookie(cookie);
				}
    		}
    	}
    	
    	HttpSession session = request.getSession();
    	session.invalidate();
    	return "redirect:/login";
    }
    
    // 회원가입 페이지 이동
    @RequestMapping(value = "/join")
    public String joinInit() {
    	log.info("joinInit메서드 시작");
    	return "member/join";
    }
    
    // 회원가입 처리
    @RequestMapping(value = "/join", method = RequestMethod.POST)
    public String join(@ModelAttribute MemberVO memberVO,
    				   @RequestParam(required = false) List<MultipartFile> companyFile,
    				   Model model) throws Exception {
    	log.info("join메서드 시작");
    	memberVO.setPw(spe.encodePassword(memberVO.getPw(), null));
    	memberVO.setAuthkey(UUID.randomUUID().toString().replace("-", ""));    	
    	
    	if (memberService.idChk(memberVO) > 0) {
    		model.addAttribute("alertMsg", "중복된 이메일이 있습니다. 이메일을 다시 입력해주세요." );        	
    	} else {
    		memberService.joinMember(memberVO, companyFile);
    		model.addAttribute("alertMsg", "입력하신 이메일로 인증 메일이 발송되었습니다.");
    	}

    	return "common/alert";

    }
    
    // 메일 인증
    @RequestMapping(value = "/auth_confirm")
    public String authConfirm(MemberVO mvo, Model model) throws Exception {
    	log.info("authConfirm메서드 시작");
    	String rtUrl = "/login/confirm?authkey=" + mvo.getAuthkey();
    	int success = memberService.updateAuthConfirm(mvo);
    	
    	if(success <= 0) {
    		model.addAttribute("alertMsg","일치하는 정보가 없습니다.");
    		rtUrl = "/login";
    	}
    	
    	model.addAttribute("redirectUrl", rtUrl);
    	return "common/alert";
    }
    
    // 비밀번호 재설정 페이지 이동
    @RequestMapping(value = "/reset")
    public String resetInit() throws Exception {
    	log.info("resetInit메서드 시작");
    	return "member/pw_set";
    }
    
    // 비밀번호 재설정 처리
    @RequestMapping(value = "/reset", method = RequestMethod.POST)
    public String reset(@ModelAttribute MemberVO memberVO, HttpSession session, Model model) throws Exception {
    	log.info("reset메서드 시작");
    		
    	if (memberVO.getAuthkey() != null) {
        		
    		memberVO.setPw(spe.encodePassword(memberVO.getPw(), null));
            memberService.updateMemberList(session, memberVO);
            	
            model.addAttribute("alertMsg", "비밀번호가 정상적으로 변경되었습니다.");
            model.addAttribute("redirectUrl", "/login");
            	
        } else {
        	model.addAttribute("alertMsg", "잘못된 접근입니다.");
        }
    	
    	return "common/alert";
    }
    
    // 비밀번호 찾기 페이지 이동
    @RequestMapping(value = "/search")
    public String searchInit() {
    	log.info("searchInit메서드 시작");
    	return "member/search";
    }
    
    // 비밀번호 찾기
    @RequestMapping(value = "/search", method = RequestMethod.POST)
    public String search(@ModelAttribute MemberVO memberVO, HttpSession session, Model model) throws Exception {
    	log.info("search메서드 시작");
    	memberVO = memberService.selectMemberList(memberVO);
    	
    	if (memberVO == null) {
    		model.addAttribute("alertMsg", "일치하는 정보가 없습니다.");
    		return "common/alert";
    	} else {
    		Map<String, String> data = BeanUtils.describe(memberVO);
        	mailService.sendMail(data, "mail_reset");
    	}
    	
    	return "member/pw_info";
    }
    
    // 비밀번호 찾기 확인
    @RequestMapping(value = "/confirm")
    public String confirmInit(@ModelAttribute MemberVO mvo, Model model) throws Exception {
    	log.info("confirmInit메서드 시작");
    	mvo = memberService.selectMemberList(mvo);
    	
    	model.addAttribute("memberVO", mvo);
    	return "member/confirm";
    }
    
    
	
}
