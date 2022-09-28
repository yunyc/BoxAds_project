package com.boxads.schedule.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import org.springframework.scheduling.annotation.Async;
import org.springframework.scheduling.annotation.Scheduled;

import com.boxads.common.service.OrderService;
import com.boxads.common.vo.LogVO;
import com.boxads.common.vo.OrderVO;
import com.boxads.schedule.service.ScheduleService;

public class ScheduleTestController {
		
	private static final Logger log = LoggerFactory.getLogger(ScheduleTestController.class);
	
	@Resource private OrderService odService;
	@Resource private ScheduleService scheduleService;
		
	//@Scheduled(cron="0 0 0 1 * *")
	//@Scheduled(fixedRate=60000)  //60초마다 실행
	@Async
	public void start() throws Exception {
		log.info("Current Thread : {}", Thread.currentThread().getName());
		log.info("LOG: 테스트 스케쥴러");

		List<LogVO> logList = new ArrayList<LogVO>();
		int success = 0;
		
		// 테스트용 프로시저 호출
		HashMap<String, Object> result = new HashMap<String, Object>();
		scheduleService.callTestPro(result);						
	
		if(Integer.parseInt(result.get("out").toString()) > 0) {
			
			// 광고 진행 상태 변경 및 이미지 등록 요청 프로세스 로그 등 입력
			OrderVO ordVo = new OrderVO("now", "B3");
			ordVo.setTemp("img1");
			List<OrderVO> odList = scheduleService.selectOrderInfoForScheduleTest(ordVo);
			
			if(odList != null && !odList.isEmpty()) {
				String logIdxArr = "B12-1,B12-2,B13";
				for (OrderVO o : odList) {
					for (String type : logIdxArr.split(",")) {
						LogVO lvo = new LogVO(type);
						lvo = odService.setLog(o, lvo);
						logList.add(lvo);			
					}
				}
				
				success = scheduleService.insertScheduleLog(logList);
				log.info("SCHEDULE TEST: 광고 진행 변경 및 진행 로그 반영 여부 -> " + success);
			}				
			
			logList.clear();	
			odList.clear();
						
			// 매 달 1일 박스 판매종료로 인한 박스 주문 취소 로그 발송
			OrderVO temp = new OrderVO();
			temp.setTemp("B%");
			temp.setState("boxEnd");
			
			odList = scheduleService.selectOrderInfoForScheduleTest(temp);
			
			if(odList != null && !odList.isEmpty()) {
				for (OrderVO o : odList) {
					LogVO lvo1 = new LogVO("B24");
					lvo1 = odService.setLog(o, lvo1);
					logList.add(lvo1);
				}
				
				success = scheduleService.insertScheduleLog(logList);
				log.info("SCHEDULE TEST: 판매종료 주문 정보 반영 여부 -> " + success);
			}
			
			logList.clear();	
			odList.clear();
			
			// 매 달 1일 박스 판매종료로 인한 광고 주문 취소 로그 발송
			temp = new OrderVO();
			temp.setTemp("A%");
			temp.setState("boxEnd");
			
			odList = scheduleService.selectOrderInfoForScheduleTest(temp);
			
			if(odList != null && !odList.isEmpty()) {
				for (OrderVO o : odList) {				
					LogVO lvo1 = new LogVO("A6");
					lvo1 = odService.setLog(o, lvo1);
					logList.add(lvo1);
				}
				
				success = scheduleService.insertScheduleLog(logList);
				log.info("SCHEDULE TEST: 판매종료 주문 정보 반영 여부 -> " + success);
			}
			
			logList.clear();	
			odList.clear();
			
			// 매 달 2일 광고 완료 상태 변경 후 익일 정산 입력
			temp = new OrderVO("now", "B6");
			temp.setTemp("calcul");
			odList = scheduleService.selectOrderInfoForScheduleTest(temp);
			
			if(odList != null && !odList.isEmpty()) {			
				success = scheduleService.insertCalCulList(odList);
				log.info("SCHEDULE TEST: 광고완료 정산 입력 -> " + success);
			}
			
			odList.clear();
			
			// 매 달 6일 프로세스 로그 이미지 체크 후 프로세스 로그 입력
			HashMap<String, String> param = new HashMap<>();
			
			param.put("type", "II1");
			param.put("state", "B3");
			param.put("insertDate", "now");
			param.put("temp", "img1Chk");
			
			result = scheduleService.selectScheduleLogImgChkTest(param);
			
			if(result != null && ((Long) result.get("chk")).intValue() == 0) {
				String logIdxArr = "B17-1,B17-2";			
				for (String s : result.get("oIdxArr").toString().split(",")) {		
					for (String type : logIdxArr.split(",")) {
						OrderVO o = new OrderVO(Integer.parseInt(s));
						LogVO lvo = new LogVO(type);
						lvo = odService.setLog(o, lvo);
						logList.add(lvo);			
					}
				}
				
				success = scheduleService.insertScheduleLog(logList);
				log.info("SCHEDULE TEST: 이미지 등록 체크 및 진행 로그 반영 여부 -> " + success);
			}	
			
			logList.clear();			
			
			// 매 달 25일 2차 인증 이미지 프로세스 로그 입력
			ordVo = new OrderVO("now", "B4");
			ordVo.setTemp("img2");
			odList = scheduleService.selectOrderInfoForScheduleTest(ordVo);
			
			if(odList != null && !odList.isEmpty()) {
				String type = "B18";
				for (OrderVO o : odList) {
					LogVO lvo = new LogVO(type);
					lvo = odService.setLog(o, lvo);
					logList.add(lvo);	
				}
				
				success = scheduleService.insertScheduleLog(logList);
				log.info("SCHEDULE TEST: 2차 인증 이미지 로그 반영 여부 -> " + success);
			}
			
			logList.clear();	
			odList.clear();
			
			// 매일 애드 종료로 인한 박스 주문 취소 로그 발송
			temp = new OrderVO();
			temp.setTemp("B%");
			temp.setState("adEnd");
			
			odList = scheduleService.selectOrderInfoForScheduleTest(temp);
			
			if(odList != null && !odList.isEmpty()) {
				for (OrderVO o : odList) {
					LogVO lvo1 = new LogVO("B24");
					lvo1 = odService.setLog(o, lvo1);
					logList.add(lvo1);
				}
				
				success = scheduleService.insertScheduleLog(logList);
				log.info("SCHEDULE TEST: 판매종료 주문 정보 반영 여부 -> " + success);
			}
			
			logList.clear();	
			odList.clear();
			
			// 매일 애드 종료로 인한 광고 주문 취소 로그 발송
			temp.setTemp("A%");
			temp.setState("adEnd");
			
			odList = scheduleService.selectOrderInfoForScheduleTest(temp);
			
			if(odList != null && !odList.isEmpty()) {
				for (OrderVO o : odList) {				
					LogVO lvo1 = new LogVO("A6");
					lvo1 = odService.setLog(o, lvo1);
					logList.add(lvo1);
				}
				
				success = scheduleService.insertScheduleLog(logList);
				log.info("SCHEDULE TEST: 판매종료 주문 정보 반영 여부 -> " + success);
			}
			
			logList.clear();	
			odList.clear();
			
			// 광고 완료 상태 변경 및 프로세스 로그 입력
			temp = new OrderVO("now", "B6");
			temp.setTemp("end");			
			odList = scheduleService.selectOrderInfoForScheduleTest(new OrderVO("now", "B6"));
			
			if(odList != null && !odList.isEmpty()) {
				for (OrderVO o : odList) {				
					LogVO lvo1 = new LogVO("B22-1");
					lvo1 = odService.setLog(o, lvo1);
					logList.add(lvo1);
					
					LogVO lvo2 = new LogVO("B22-2");
					lvo2 = odService.setLog(o, lvo2);
					logList.add(lvo2);				
				}
				
				success = scheduleService.insertScheduleLog(logList);
				log.info("SCHEDULE TEST: 광고 완료 변경 및 진행 로그 반영 여부 -> " + success);
			}
			
			logList.clear();	
			odList.clear();
			
			// 2차 인증 미등록 로그 입력
			param = new HashMap<>();
			
			param.put("type", "II2");
			param.put("state", "B4");
			param.put("insertDate", "now");
			param.put("temp", "img1Chk");
			
			result = scheduleService.selectScheduleLogImgChkTest(param);
			
			if(result != null && ((Long) result.get("chk")).intValue() == 0) {
				String logIdxArr = "B21-1,B21-2";
				for (String s : result.get("oIdxArr").toString().split(",")) {
					for (String type : logIdxArr.split(",")) {
						OrderVO o = new OrderVO(Integer.parseInt(s));
						LogVO lvo = new LogVO(type);
						lvo = odService.setLog(o, lvo);
						logList.add(lvo);			
					}
				}
				
				success = scheduleService.insertScheduleLog(logList);
				log.info("SCHEDULE TEST: 이미지 등록 체크 및 진행 로그 반영 여부 -> " + success);
			}
			
			logList.clear();	
			
			
		}
	}
}
