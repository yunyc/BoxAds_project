package com.boxads.box.mapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.boxads.box.vo.CodeVO;
import com.boxads.common.vo.OrderVO;
import com.boxads.common.vo.PriceVO;

@Mapper
public interface CodeMapper {
	List<CodeVO> selectCodeList(CodeVO cvo) throws Exception;
	Map<String, String> selectCodeName(CodeVO cvo) throws Exception;
	int insertCode(CodeVO cvo) throws Exception;
	int insertCodeSort(List<HashMap<String, String>> list) throws Exception;
	List<HashMap<String, Object>> selectForUnit(CodeVO cvo) throws Exception;
	
	List<CodeVO> settingSelect() throws Exception;
	HashMap<String, Object> selectUnitInfo(HashMap<String, String> param) throws Exception;
	PriceVO selectTotalPrice(OrderVO odvo) throws Exception;
	PriceVO selectTotalPriceBefore(OrderVO odvo) throws Exception;
	
}