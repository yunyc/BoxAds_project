package com.boxads.main.interceptor;

import java.io.PrintWriter;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.util.WebUtils;

import com.boxads.main.service.MemberService;
import com.boxads.main.vo.MemberVO;

public class CookieInterceptor extends HandlerInterceptorAdapter{
	private static final Logger log = LoggerFactory.getLogger(CookieInterceptor.class);
	
	@Resource
	private MemberService memberService;

	 // preHandle() : 컨트롤러보다 먼저 수행되는 메서드
	 @Override
	 public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
	         throws Exception {
		 
		 log.info("인터셉터");
		 
	     HttpSession session = request.getSession();
	     MemberVO mvo = (MemberVO) session.getAttribute("login");
	     
	     if ( mvo == null ){
	    	 mvo = new MemberVO();
	    	 Cookie loginCookie = WebUtils.getCookie(request, "loginCookie");
	    	 
	    	 if (loginCookie != null) {
	    		 mvo.setSessionId(loginCookie.getValue());
	    		 MemberVO memberVO = memberService.selectMemberList(mvo);
	    		 
	    		 if (memberVO != null) {
	    			 session.setAttribute("login", memberVO);
	    		 }
	    	 }
	    	 
	     } 
	     
	     return true;
	 }

	 // 컨트롤러가 수행되고 화면이 보여지기 직전에 수행되는 메서드
	 @Override
	 public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
	         ModelAndView modelAndView) throws Exception {
	     super.postHandle(request, response, handler, modelAndView);
	 }

	}