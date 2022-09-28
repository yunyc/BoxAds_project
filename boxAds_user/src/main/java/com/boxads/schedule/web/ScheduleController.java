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
import com.boxads.main.vo.FileVO;
import com.boxads.schedule.service.ScheduleService;

public class ScheduleController {
		
	private static final Logger log = LoggerFactory.getLogger(ScheduleController.class);
	
	@Resource private OrderService odService;
	@Resource private ScheduleService scheduleService;
	
	
	@Scheduled(cron="30 0 0 1 * *") // 매 달 1일에 실행
	//@Scheduled(fixedRate=600000)  //600초마다 실행
	@Async
	public void checkMonthly0() throws Exception {
		log.info("Current Thread : {}", Thread.currentThread().getName());
		log.info("LOG: 매 월 1일 0시 30초 스케쥴러");
		
		int success = 0;
		List<LogVO> logList = new ArrayList<LogVO>();
		
		/* 상태 변경은 db event로 실행 */
		
		// 매 달 1일 광고 진행 상태 변경 및 프로세스 로그 입력
		List<OrderVO> odList = scheduleService.selectOrderInfoForSchedule(new OrderVO("now", "B3"));
		
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
			log.info("SCHEDULE: 광고 진행 변경 및 진행 로그 반영 여부 -> " + success);
		}
				
		logList.clear();
		odList.clear();
		
		// 매 달 1일 광고 완료 상태 변경 및 프로세스 로그 입력
		odList = scheduleService.selectOrderInfoForSchedule(new OrderVO("prev", null));

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
			log.info("SCHEDULE: 광고 완료 변경 및 진행 로그 반영 여부 -> " + success);
		}
		
		logList.clear();
		odList.clear();
				
		// 매 달 1일 2차 인증 미등록 로그 입력
		HashMap<String, String> param = new HashMap<>();
		
		param.put("type", "II2");
		param.put("insertDate", "prev");
		
		HashMap<String, Object> result = scheduleService.selectScheduleLogImgChk(param);
		
		if(((Long) result.get("chk")).intValue() == 0) {
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
			log.info("SCHEDULE: 이미지 등록 체크 및 진행 로그 반영 여부 -> " + success);
		}
		
		logList.clear();
		odList.clear();
		
		// 매 달 1일 박스 판매종료로 인한 박스 주문 취소 로그 발송
		OrderVO temp = new OrderVO();
		temp.setTemp("B%");
		temp.setState("boxEnd");
		
		odList = scheduleService.selectOrderInfoForSchedule(temp);
		
		if(odList != null && !odList.isEmpty()) {
			for (OrderVO o : odList) {
				LogVO lvo1 = new LogVO("B24");
				lvo1 = odService.setLog(o, lvo1);
				logList.add(lvo1);
			}
			
			success = scheduleService.insertScheduleLog(logList);
			log.info("SCHEDULE: 판매종료 주문 정보 반영 여부 -> " + success);
		}
		
		// 매 달 1일 박스 판매종료로 인한 광고 주문 취소 로그 발송		
		temp.setTemp("A%");
		temp.setState("boxEnd");
		
		odList = scheduleService.selectOrderInfoForSchedule(temp);
		
		if(odList != null && !odList.isEmpty()) {
			for (OrderVO o : odList) {				
				LogVO lvo1 = new LogVO("A6");
				lvo1 = odService.setLog(o, lvo1);
				logList.add(lvo1);
			}
			
			success = scheduleService.insertScheduleLog(logList);
			log.info("SCHEDULE: 판매종료 주문 정보 반영 여부 -> " + success);
		}
	}
	
	@Scheduled(cron="30 0 0 2 * ?") // 매 달 2일에 실행
	//@Scheduled(fixedRate=600000)  //600초마다 실행
	@Async
	public void checkMonthly2() throws Exception {
		log.info("Current Thread : {}", Thread.currentThread().getName());
		log.info("LOG: 매 월 2일 0시 30초 스케쥴러");
		
		int success = 0;
		
		// 매 달 2일 광고 완료 상태 변경 후 익일 정산 입력
		List<OrderVO> odList = scheduleService.selectOrderInfoForSchedule(new OrderVO("prev", "B6"));

		if(odList != null && !odList.isEmpty()) {
			
			success = scheduleService.insertCalCulList(odList);
			log.info("SCHEDULE: 광고완료 정산 입력 -> " + success);
		}
	}
			
	@Scheduled(cron="30 0 0 6 * ?") // 매 달 6일에 실행
	//@Scheduled(fixedRate=600000)  //600초마다 실행
	@Async
	public void checkMonthly1() throws Exception {
		log.info("Current Thread : {}", Thread.currentThread().getName());
		log.info("LOG: 매 월 6일 0시 30초 스케쥴러");
		
		int success = 0;
		List<LogVO> logList = new ArrayList<LogVO>();
		
		// 매 달 6일 프로세스 로그 이미지 체크 후 프로세스 로그 입력
		HashMap<String, String> param = new HashMap<>();
		
		param.put("type", "II1");
		param.put("state", "B3");
		param.put("insertDate", "now");
		
		HashMap<String, Object> result = scheduleService.selectScheduleLogImgChk(param);
		
		if(((Long) result.get("chk")).intValue() == 0) {
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
			log.info("SCHEDULE: 이미지 등록 체크 및 진행 로그 반영 여부 -> " + success);
		}	
				
		logList.clear();	
		
	}
	
	@Scheduled(cron="30 0 0 25 * *") // 매 달 25일에 실행
	//@Scheduled(fixedRate=600000)  //600초마다 실행
	@Async
	public void checkMonthly25() throws Exception {
		log.info("Current Thread : {}", Thread.currentThread().getName());
		log.info("LOG: 매 월 25일 0시 30초 스케쥴러");
		
		int success = 0;
		List<LogVO> logList = new ArrayList<LogVO>();
		
		// 매 달 25일 2차 인증 이미지 프로세스 로그 입력
		List<OrderVO> odList = scheduleService.selectOrderInfoForSchedule(new OrderVO("now", "B4"));
		
		if(odList != null && !odList.isEmpty()) {
			String type = "B18";
			for (OrderVO o : odList) {
				LogVO lvo = new LogVO(type);
				lvo = odService.setLog(o, lvo);
				logList.add(lvo);	
			}
			
			success = scheduleService.insertScheduleLog(logList);
			log.info("SCHEDULE: 2차 인증 이미지 로그 반영 여부 -> " + success);
		}
				
		logList.clear();	
		odList.clear();
		
	}
	
	@Scheduled(cron="30 0 0 * * *") // 매일 정각에 실행
	//@Scheduled(fixedRate=600000)  //600초마다 실행
	@Async
	public void checkDaily() throws Exception {
		log.info("Current Thread : {}", Thread.currentThread().getName());
		log.info("LOG: 매일 0시 30초 스케쥴러");
		
		int success = 0;
		List<LogVO> logList = new ArrayList<LogVO>();
		
		// 매일 애드 종료로 인한 박스 주문 취소 로그 발송
		OrderVO temp = new OrderVO();
		temp.setTemp("B%");
		temp.setState("adEnd");
		
		List<OrderVO> odList = scheduleService.selectOrderInfoForSchedule(temp);
		
		if(odList != null && !odList.isEmpty()) {
			for (OrderVO o : odList) {
				LogVO lvo1 = new LogVO("B24");
				lvo1 = odService.setLog(o, lvo1);
				logList.add(lvo1);
			}
			
			success = scheduleService.insertScheduleLog(logList);
			log.info("SCHEDULE: 판매종료 주문 정보 반영 여부 -> " + success);
		}

		// 매일 애드 종료로 인한 광고 주문 취소 로그 발송
		temp.setTemp("A%");
		temp.setState("adEnd");
		
		odList = scheduleService.selectOrderInfoForSchedule(temp);
		
		if(odList != null && !odList.isEmpty()) {
			for (OrderVO o : odList) {				
				LogVO lvo1 = new LogVO("A6");
				lvo1 = odService.setLog(o, lvo1);
				logList.add(lvo1);
			}
			
			success = scheduleService.insertScheduleLog(logList);
			log.info("SCHEDULE: 판매종료 주문 정보 반영 여부 -> " + success);
		}
				
		logList.clear();	
		odList.clear();
		
		
		
	}
}
