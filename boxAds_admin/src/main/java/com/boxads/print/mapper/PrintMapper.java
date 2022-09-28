package com.boxads.print.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.boxads.print.vo.PrintVO;

@Mapper
public interface PrintMapper {

	List<HashMap<String, Object>> selectPrintList(HashMap<String, Object> param) throws Exception;

	int selectPrintCnt(HashMap<String, Object> param) throws Exception;

	HashMap<String, Object> selectPrintDetail(HashMap<String, Object> param) throws Exception;

	List<PrintVO> selectPrintLog(HashMap<String, Object> param) throws Exception;

	HashMap<String, Object> selectPrintDashCnt() throws Exception;
	

}