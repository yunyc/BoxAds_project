package com.boxads.main;

import java.lang.reflect.Field;
import java.util.HashMap;
import java.util.Map;
import java.util.stream.Stream;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.boxads.cash.web.WalletController;
import com.boxads.main.vo.MemberVO;

public class ObjectUtil {
	private static final Logger log = LoggerFactory.getLogger(ObjectUtil.class);

	public static MemberVO getMember(HttpSession session) {
		MemberVO mvo = (MemberVO)session.getAttribute("login");
		return mvo;  		
  	}
	
	// 배열 타입 변경
	public static int[] stringArrayToIntArray(String[] stringArray) {
        return Stream.of(stringArray).mapToInt(Integer::parseInt).toArray();
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
        log.info("LOG: 경로 체크" + referer);
        boolean result = false;
        if (referer.startsWith(host)) result = true;
		return result;
	}

}
