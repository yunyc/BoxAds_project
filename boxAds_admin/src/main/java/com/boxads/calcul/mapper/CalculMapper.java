package com.boxads.calcul.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.boxads.common.vo.PageVO;


@Mapper
public interface CalculMapper {

	List<HashMap<String, String>> selectCalculList(HashMap<String, Object> param) throws Exception;

	int selectCalculListCnt(HashMap<String, Object> param) throws Exception;

	int updateState(HashMap<String, Object> param) throws Exception;

	List<HashMap<String, Object>> selectCalculInfo(List<String> list) throws Exception;

	List<HashMap<String, String>> selectWithdrawList(HashMap<String, Object> param) throws Exception;
	
	int selectWithdrawListCnt(HashMap<String, Object> param) throws Exception;

	List<HashMap<String, String>> selectBillList(HashMap<String, Object> param) throws Exception;

	int selectBillListCnt(HashMap<String, Object> param) throws Exception;

	int updateStateWithdraw(HashMap<String, Object> param) throws Exception;

	List<HashMap<String, Object>> selectWithdraw(List<String> list) throws Exception;

	HashMap<String, String> selectMemberInfo(HashMap<String, Object> param) throws Exception;

	int updateBillState(HashMap<String, Object> param) throws Exception;

	
}
