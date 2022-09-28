package com.boxads.common.web;


import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.boxads.main.ObjectUtil;
import com.boxads.main.service.CommonService;
import com.boxads.main.service.FileService;
import com.boxads.main.vo.FileVO;

@Controller
public class DownloadController  {
	
	@Resource private CommonService commonService;
	@Resource private FileService fileService;
	@Resource private String uploadPath;
	
	@RequestMapping(value = "/download")
	public void fileDownload(@ModelAttribute FileVO fileVO, HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		if (!ObjectUtil.refererChk(request)) {
			response.setCharacterEncoding("UTF-8"); 
   	    	response.setContentType("text/html; charset=UTF-8");      	    	
   	       	response.getWriter().println("<script>alert('잘못된 접근입니다.'); history.back(); </script>");       	       		       	        
		}
		
		int fileIdx = fileVO.getIdx();
		int parent = fileVO.getParent();
		
		String folderPath = uploadPath.substring(uploadPath.lastIndexOf("/"), uploadPath.length());
		String filePath = "";
		String realPath = "";
		String filename = "";
		
		List<FileVO> fileList = new ArrayList<FileVO>(); 
		
			fileList = fileService.selectFileList(fileIdx, parent, null);
			filePath = fileList.get(0).getUrl();
			filePath = filePath.substring(folderPath.length(), filePath.length());
			filename = fileList.get(0).getRealName();
			
		    // 실제 파일 경로
		    realPath = uploadPath  + filePath;
		        
		    InputStream in = null;
		    OutputStream os = null;
		    File file = null;
		    boolean fileChk = true;
	        
	        try {
	        	
	        	// 파일 스트림
	        	try {
	        		file = new File(realPath);
	        		in = new FileInputStream(file);
	        	} catch (FileNotFoundException fe){
	        		fileChk = false;
	        	}        	
	            
	        	//파일 인코딩 
	        	try {
	        		String browser = request.getHeader("User-Agent");
	        		
	        		if (browser.contains("MSIE") || browser.contains("Trident") || browser.contains("Chrome")) {
	        			filename = URLEncoder.encode(filename, "UTF-8").replaceAll("\\+","%20");
	        		} else {
	        			filename = new String(filename.getBytes("UTF-8"), "ISO-8859-1");
	        		}
	        		
	        	} catch (UnsupportedEncodingException ex) {
	        		fileChk = false;            		
	        	}
	        	
	            if(fileChk){
		            	
	            	// 파일 헤더 지정        
	            	response.setContentType("application/octer-stream");
	            	response.setHeader("Content-Length", ""+file.length() );
	            	response.setHeader("Content-Transfer-Encoding", "binary;");
	            	response.setHeader("Content-Disposition", "attachment; filename=\"" + filename + "\"");
	            	
	            	os = response.getOutputStream();
	            	
	            	int ncount = 0;
		            byte[] bytes = new byte[512];
		 
		            while ((ncount = in.read(bytes)) != -1 ) {
		                os.write(bytes, 0, ncount);
		            }
	            	
		            in.close();
		            os.close();	            	            
	            	         	
	            } else {            	
	            	response.setCharacterEncoding("UTF-8"); 
	       	    	response.setContentType("text/html; charset=UTF-8");      	    	
	       	       	response.getWriter().println("<script>alert('파일이 존재하지 않습니다.'); history.back(); </script>");       	       		       	        
	            }
	            
	        } catch (Exception e) {
	        	response.setCharacterEncoding("UTF-8"); 
	   	    	response.setContentType("text/html; charset=UTF-8");      	    	
	   	       	response.getWriter().println("<script>alert('파일이 존재하지 않습니다.'); history.back(); </script>");  
	        }
	}
}
