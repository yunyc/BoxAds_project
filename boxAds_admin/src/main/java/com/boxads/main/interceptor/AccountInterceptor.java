package com.boxads.main.interceptor;

import java.io.PrintWriter;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.boxads.main.service.AdminService;
import com.boxads.main.vo.AdminVO;

public class AccountInterceptor extends HandlerInterceptorAdapter{
	private static final Logger log = LoggerFactory.getLogger(AccountInterceptor.class);
	@Resource private AdminService aservice;
	
	 // preHandle() : 컨트롤러보다 먼저 수행되는 메서드
	 @Override
	 public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		 boolean rt = true;
	     HttpSession session = request.getSession();
	     AdminVO avo = (AdminVO) session.getAttribute("login");	      
	     
	     response.setCharacterEncoding("UTF-8"); 
	     response.setContentType("text/html; charset=UTF-8");
	     
	     log.info("LOG: 계정정보 " + avo);
	     
	     if ( avo == null ){
	    	 PrintWriter out = response.getWriter();
	         out.println("<script>alert('로그인 후 이용해주세요.'); location.href='../' </script>");
			 out.flush();
			 out.close();

	         return false; 
	         
	     } else {
	    	 // 접근 권한 체크
	    	 String[] urlArr = request.getRequestURI().toString().split("/");
	    	 
	    	 String cate = urlArr[urlArr.length-2];
	    	 
	    	 if(urlArr != null && urlArr.length > 0) {
	    		 if(cate.equals("excel")) { cate = urlArr[urlArr.length-1].toString().split("_")[0]; }	    	 
	    		 int chk = aservice.checkAuthAdmin(avo, urlArr[urlArr.length-2]);
	    		 if(chk == 0) {
	    			 PrintWriter out = response.getWriter();
	    			 rt = false;
	    			 out.println("<script>alert('접근권한이 없습니다.'); history.back(); </script>");		 
	    			 out.flush();
	    			 out.close();
	    		 }
	    	 }
	     }
	     
	     return rt;
	 }

	 // 컨트롤러가 수행되고 화면이 보여지기 직전에 수행되는 메서드
	 @Override
	 public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
	         ModelAndView modelAndView) throws Exception {
	     super.postHandle(request, response, handler, modelAndView);
	 }
	  
	}
