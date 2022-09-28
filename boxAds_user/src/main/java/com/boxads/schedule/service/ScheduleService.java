package com.boxads.schedule.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.boxads.common.mapper.SerialMapper;
import com.boxads.common.service.SerialService;
import com.boxads.common.vo.LogVO;
import com.boxads.common.vo.OrderVO;
import com.boxads.schedule.mapper.ScheduleMapper;
import com.boxads.schedule.mapper.ScheduleTestMapper;

@Service
@Transactional
public class ScheduleService{
	
	@Resource private ScheduleMapper scheduleMapper;
	@Resource private ScheduleTestMapper scheduleTestMapper;
	@Resource private SerialMapper serialMapper;

	public List<OrderVO> selectOrderInfoForSchedule(OrderVO odvo) throws Exception {
		return scheduleMapper.selectOrderInfoForSchedule(odvo);
	}

	public int insertScheduleLog(List<LogVO> logList) throws Exception {
		return scheduleMapper.insertScheduleLog(logList);
	}

	public HashMap<String, Object> selectScheduleLogImgChk(HashMap<String, String> param) throws Exception {
		return scheduleMapper.selectScheduleLogImgChk(param);
	}

	public int updateOrderStateAtScheduler(List<OrderVO> odList) throws Exception {
		return scheduleMapper.updateOrderStateAtScheduler(odList);
	}

	public int insertCalCulList(List<OrderVO> odList) throws Exception {
		List<HashMap<String, Object>> calCulList = new ArrayList<HashMap<String, Object>>(); 
		SimpleDateFormat fmt = new SimpleDateFormat("yyyyMMdd");
		
		HashMap<String, Object> serialMap = serialMapper.selectSerialNumber("C");
		
		String date = "";
		String serial = "";
		int num = 0;
		
		if (serialMap == null) { serialMapper.insertSerialNumber("C"); }
		
		date = serialMap != null ? (String) serialMap.get("date") : fmt.format(new Date());
		num = serialMap != null ? (Integer) serialMap.get("serialNumber") + 1 : 1 ;
		
		for (OrderVO o : odList) {
			HashMap<String, Object> param = new HashMap<>();			
			
			serial = "CL" + date.substring(2, 6) + String.format("-%05d", num);
			
			param.put("oIdx", o.getIdx());
			param.put("code", serial);			
			
			calCulList.add(param);			
			num += 1;
		}
		
		HashMap<String, Object> param = new HashMap<>();
		
		param.put("num", num);
		param.put("type", "C");
		serialMapper.updateSerialNumberForList(param);
		
		return scheduleMapper.insertCalCulList(calCulList);
	}

	
	/* 테스트용 쿼리 */
	
	public List<OrderVO> selectOrderInfoForScheduleTest(OrderVO orderVO) {
		return scheduleTestMapper.selectOrderInfoForScheduleTest(orderVO);
	}

	public HashMap<String, Object> selectScheduleLogImgChkTest(HashMap<String, String> param) {
		return scheduleTestMapper.selectScheduleLogImgChkTest(param);
	}

	public int insertCalCulListTest(List<OrderVO> odList) {
		return scheduleTestMapper.insertCalCulListTest(odList);
	}

	public void callTestPro(HashMap<String, Object> result) {
		scheduleTestMapper.callTestPro(result);		
	}
	
	
}

