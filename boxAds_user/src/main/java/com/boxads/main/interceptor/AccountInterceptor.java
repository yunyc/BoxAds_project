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

public class AccountInterceptor extends HandlerInterceptorAdapter{
	private static final Logger log = LoggerFactory.getLogger(AccountInterceptor.class);
	
	@Resource
	private MemberService memberService;
	
	 // preHandle() : 컨트롤러보다 먼저 수행되는 메서드
	 @Override
	 public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
	         throws Exception {
	     HttpSession session = request.getSession();
	     MemberVO mvo = (MemberVO) session.getAttribute("login");

	     String[] urlArr = request.getRequestURI().toString().split("/");    	 
	     String cate = urlArr[urlArr.length-1];
	     
	     log.info("LOG: 계정정보 " + mvo);
	     log.info("LOG: 접속경로 " + urlArr[urlArr.length-2] +"/"+ urlArr[urlArr.length-1]);
    	 
	     if ( mvo == null ){
	    	 
	    	 mvo = new MemberVO();
	    	 Cookie loginCookie = WebUtils.getCookie(request, "loginCookie");
	    	 
	    	 if (loginCookie != null) {
	    		 mvo.setSessionId(loginCookie.getValue());
	    		 MemberVO memberVO = memberService.selectMemberList(mvo);
	    		 
	    		 if (memberVO != null) {
	    			 session.setAttribute("login", memberVO);
	    		 }
	    	 
	    	 } else {
	    		 response.setCharacterEncoding("UTF-8"); 
		    	 response.setContentType("text/html; charset=UTF-8");

		         PrintWriter out = response.getWriter();
		         out.println("<script>alert('로그인 후 이용해주세요.'); location.href='../login' </script>");
		         out.flush();
		         out.close();

		         return false;
	    	 }
	    	 
	    	  
	     } else if (mvo.getAuthFlag().equals("N")) {
	    	 response.setCharacterEncoding("UTF-8"); 
	    	 response.setContentType("text/html; charset=UTF-8");

	         PrintWriter out = response.getWriter();
	         out.println("<script>alert('인증되지 않은 사용자입니다.'); location.href='../login' </script>");
	         out.flush();
	         out.close();

	         return false;
	    	 
	     } else if (mvo.getConfirmFlag().equals("N") && !cate.equals("profile")) {
	    	 response.setCharacterEncoding("UTF-8"); 
	    	 response.setContentType("text/html; charset=UTF-8");

	         PrintWriter out = response.getWriter();
	         out.println("<script>alert('사업자 인증이 되지 않은 사용자입니다.'); location.href='../main' </script>");
	         out.flush();
	         out.close();

	         return false;
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