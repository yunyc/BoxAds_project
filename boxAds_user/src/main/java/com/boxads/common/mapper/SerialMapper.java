package com.boxads.common.mapper;

import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;


@Mapper
public interface SerialMapper {
	
	HashMap<String, Object> selectSerialNumber(String type) throws Exception;
	
	void insertSerialNumber(String type) throws Exception;
	
	void updateSerialNumber(String type) throws Exception;

	void updateSerialNumberForList(HashMap<String, Object> param) throws Exception;
}
