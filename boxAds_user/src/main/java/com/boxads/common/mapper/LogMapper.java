package com.boxads.common.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.boxads.common.vo.LogVO;


@Mapper
public interface LogMapper {

	int insertProcessLog(LogVO log) throws Exception;

	List<LogVO> selectProcessLog(LogVO lvo) throws Exception;

	int insertPrintLog(LogVO lvo) throws Exception;

	int selectPrintLogChk(int idx) throws Exception;

	
	
	
}