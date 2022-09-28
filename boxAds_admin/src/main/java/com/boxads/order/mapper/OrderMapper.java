package com.boxads.order.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.boxads.order.vo.OrderVO;


@Mapper
public interface OrderMapper {

	List<HashMap<String, String>> selectOrderList(OrderVO odvo) throws Exception;
	
	void updateState(HashMap<String, Object> map) throws Exception;
	
	HashMap<String, Object> selectQRcode(OrderVO odvo) throws Exception;

	List<HashMap<String, Object>> selectMemoList(OrderVO odvo) throws Exception;
	
	void insertMemoList(HashMap<String, Object> map) throws Exception;

	List<HashMap<String, Object>> selectReason(HashMap<String, Object> map) throws Exception;
	
	void insertReason(HashMap<String, Object> map) throws Exception;
	
	HashMap<String, Long> selectOrderCnt(OrderVO odVO) throws Exception;
	
	HashMap<String, String> selectOrderName(OrderVO odvo) throws Exception;

	int updateOrder(OrderVO odvo) throws Exception;
	
}