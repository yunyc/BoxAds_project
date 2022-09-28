package com.boxads.schedule.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.boxads.common.vo.OrderVO;

@Mapper
public interface ScheduleTestMapper {

	void callTestPro(HashMap<String, Object> result);

	List<OrderVO> selectOrderInfoForScheduleTest(OrderVO orderVO);

	HashMap<String, Object> selectScheduleLogImgChkTest(HashMap<String, String> param);

	int insertCalCulListTest(List<OrderVO> odList);

	
}
