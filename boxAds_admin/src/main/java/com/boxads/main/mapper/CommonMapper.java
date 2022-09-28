package com.boxads.main.mapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;


@Mapper
public interface CommonMapper {
	List<?> selectTableList(Map<String, String> param) throws Exception;
	
	HashMap<String, Object> selectQRcode(int parent) throws Exception;

	HashMap<String, String> mainDashCnt() throws Exception;
}
