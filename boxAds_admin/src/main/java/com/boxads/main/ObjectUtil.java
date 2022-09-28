package com.boxads.main;

import java.lang.reflect.Field;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Map;
import java.util.stream.Stream;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.boxads.main.vo.AdminVO;

public class ObjectUtil {
	private static final Logger log = LoggerFactory.getLogger(ObjectUtil.class);
	
	public static AdminVO getAdmin(HttpSession session) {
		AdminVO avo = (AdminVO)session.getAttribute("login");
		return avo;  		
  	}

	// 배열 타입 변경
	public static int[] StringArrayToIntArray(String[] stringArray) {
        return Stream.of(stringArray).mapToInt(Integer::parseInt).toArray();
    }
	
	// 날짜 간격 비교
	public static boolean checkBetweenDate(Calendar dateToCheck, String start, String end) throws ParseException {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		java.util.Date stdate =  sdf.parse(start);
		java.util.Date eddate =  sdf.parse(end);
		
		Calendar startDate = Calendar.getInstance();
		startDate.setTime(stdate);
		
		Calendar endDate = Calendar.getInstance();
		endDate.setTime(eddate);
		
		//System.out.println("dateToCheck.compareTo(startDate) >= 0 : " + (dateToCheck.compareTo(startDate) >= 0));
		//System.out.println("dateToCheck.compareTo(endDate) <= 0 : " + (dateToCheck.compareTo(endDate) <= 0));
		
	    return dateToCheck.compareTo(startDate) >= 0 && dateToCheck.compareTo(endDate) <= 0;
	}
	
	// 두 날 모두 지났다면
	public static boolean checkAfterDate(Calendar dateToCheck, String start, String end) throws ParseException {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		java.util.Date stdate =  sdf.parse(start);
		java.util.Date eddate =  sdf.parse(end);
		
		Calendar startDate = Calendar.getInstance();
		startDate.setTime(stdate);
		
		Calendar endDate = Calendar.getInstance();
		endDate.setTime(eddate);		
		
	    return dateToCheck.compareTo(startDate) >= 0 && dateToCheck.compareTo(endDate) >= 0;
	}
	
	// vo -> map
	public static Map convertObjectToMap(Object obj){
        Map map = new HashMap();
        Field[] fields = obj.getClass().getDeclaredFields();
        for(int i=0; i <fields.length; i++){
            fields[i].setAccessible(true);
            try{
                map.put(fields[i].getName(), fields[i].get(obj));
            }catch(Exception e){
                e.printStackTrace();
            }
        }        
        return map;
    }
	
	// 외부에서 요청 시 차단
	public static boolean refererChk(HttpServletRequest request) {
		String host = request.getRequestURL().toString().replace(request.getRequestURI(), "");
        String referer = request.getHeader("REFERER") == null ? "" : request.getHeader("REFERER");
        log.info("LOG: 경로 체크 " + referer);
        boolean result = false;
        if (referer.startsWith(host)) result = true;
		return result;
	}

}
