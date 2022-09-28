package com.boxads.common.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.boxads.common.vo.OrderVO;
import com.boxads.main.vo.MemberVO;

@Mapper
public interface OrderMapper {

	int insertOrder(OrderVO odvo) throws Exception;

	OrderVO selectOrderDetail(OrderVO odvo) throws Exception;

	int selectAdOwnerCnt(HashMap<String, Object> param) throws Exception;

	List<HashMap<String, Object>> selectAdOwnerList(HashMap<String, Object> param) throws Exception;

	HashMap<String, String> selectOrderName(OrderVO odvo) throws Exception;

	int updateOrder(OrderVO odvo) throws Exception;

	int selectBoxOwnerCnt(HashMap<String, Object> param) throws Exception;

	List<HashMap<String, Object>> selectBoxOwnerList(HashMap<String, Object> param) throws Exception;

	int adRequestCnt(int aIdx) throws Exception;

	MemberVO selectMarketingInfo(int writer) throws Exception;

	
	
}