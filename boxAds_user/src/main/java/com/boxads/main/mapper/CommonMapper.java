package com.boxads.main.mapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.boxads.ad.vo.AdVO;
import com.boxads.main.vo.MemberVO;


@Mapper
public interface CommonMapper {

	int insertWish(Map<String, Object> param) throws Exception;

	int deleteWish(Map<String, Object> param) throws Exception;
	
	void updateViewCnt(Map<String, Object> map) throws Exception;
	
	void insertReason(HashMap<String, Object> param) throws Exception;
	
	List<HashMap<String, Object>> selectReason(HashMap<String, Object> param) throws Exception;

	HashMap<String, String> mainDashCnt() throws Exception;
	
	HashMap<String, Object> selectQRcode(HashMap<String, Object> map) throws Exception;
	
	void insertQRcode(HashMap<String, Object> map) throws Exception;
	
	void updateCnt(AdVO adVO) throws Exception;
	
	List<HashMap<String, Object>> selectBannerAndAlarm(String type) throws Exception;
	
	List<HashMap<String, Object>> selectAlarmLog(HashMap<String, Object> map) throws Exception;

	HashMap<String, String> mainDashLoginCnt(MemberVO mem) throws Exception;
	
	HashMap<String, String> selectTest() throws Exception;

	
	
	
}