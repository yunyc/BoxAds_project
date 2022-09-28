package com.boxads.cash.mapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import com.boxads.cash.vo.CashVO;

@Mapper
public interface CashMapper {

	int increaseCash(CashVO csvo) throws Exception;	
	
	void updateEstiCash(HashMap<String, Integer> esti) throws Exception;

	List<CashVO> selectCashLogList(CashVO cashVO) throws Exception;
	
	List<Map<String, Object>> selectChargePriceList() throws Exception;
	
	Map<String, Object> selectChargePrice(Map<String, Object> map) throws Exception;
	
	HashMap<String, Long> selectCashLogCnt(CashVO cashVO) throws Exception;

	void updateWithdrawCash(HashMap<String, Object> wvo) throws Exception;

	List<HashMap<String, String>> selectCashList(CashVO param) throws Exception;

	int selectCashListCnt(CashVO param) throws Exception;
}