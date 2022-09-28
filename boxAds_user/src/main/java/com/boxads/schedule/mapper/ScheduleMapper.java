package com.boxads.schedule.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.boxads.common.vo.LogVO;
import com.boxads.common.vo.OrderVO;

@Mapper
public interface ScheduleMapper {

	List<OrderVO> selectOrderInfoForSchedule(OrderVO odvo) throws Exception;

	int insertScheduleLog(List<LogVO> logList) throws Exception;

	HashMap<String, Object> selectScheduleLogImgChk(HashMap<String, String> param) throws Exception;


	int updateOrderStateAtScheduler(List<OrderVO> odList) throws Exception;

	int insertCalCulList(List<HashMap<String, Object>> calCulList) throws Exception;
	
	
}
