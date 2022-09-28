package com.boxads.schedule.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.beanutils.BeanUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import org.springframework.scheduling.annotation.Async;
import org.springframework.scheduling.annotation.Scheduled;

import com.boxads.common.service.MailService;
import com.boxads.member.service.MemberService;
import com.boxads.member.vo.MemberVO;

public class ScheduleController {
		
	private static final Logger log = LoggerFactory.getLogger(ScheduleController.class);
	
	@Resource
	private MemberService memberService;
	
	@Resource
	private MailService mailService;

	//@Scheduled(fixedRate=30000)  //30초마다 실행	
	@Scheduled(cron="30 0 0 * * ? ")  //자정에 실행
	@Async
	public void checkDaily() throws Exception {
		log.info("Current Thread : {}", Thread.currentThread().getName());
		log.info("LOG: 매일 0시 30초 스케쥴러");
		
		List<MemberVO> confirmList = memberService.selectHumunList("confirm");
		List<MemberVO> HumunList = memberService.selectHumunList(null);
		
		for (MemberVO member : confirmList) {
			Map<String, String> data = BeanUtils.describe(member);
			mailService.sendMail(data, "change");
		}
		
		log.info("SCHEDULE: 휴면 예정 메일 발송 -> " + confirmList.size());
		
		for (MemberVO member : HumunList) {
			Map<String, String> data = BeanUtils.describe(member);
			mailService.sendMail(data, "change_finish");
		}
		
		log.info("SCHEDULE: 휴면 메일 발송 -> " + HumunList.size());
		
	}
	

}
