package com.boxads.main.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.boxads.main.mapper.AdminMapper;
import com.boxads.main.vo.AdminVO;

@Service
public class AdminService {	
	@Resource
	private AdminMapper adminMapper;

	public AdminVO selectAdmin(AdminVO param) throws Exception {
		return adminMapper.selectAdmin(param);
	}

	public int updateLoginCnt(AdminVO avo) throws Exception {
		return adminMapper.updateLoginCnt(avo);		
	}

	public int checkAuthAdmin(AdminVO avo, String cate) throws Exception {
		int chk = 0;				
		// 수정 이후가 반영되지 않기에 세션의 값을 그대로 사용하지 않음
		avo = adminMapper.selectAdmin(avo);
		
		switch(cate) {
			case "product":
				chk = avo.getPdt().equals("Y") ? 1 : 0;
				break;
			case "order":
				chk = avo.getOdr().equals("Y") ? 1 : 0;
				break;
			case "calcul":
				chk = avo.getCal().equals("Y") ? 1 : 0;
				break;
			case "coupon":
				chk = avo.getEtc().equals("Y") ? 1 : 0;
				break;
			case "member":
				chk = avo.getMember().equals("Y") ? 1 : 0;
				break;
			case "board":
				chk = avo.getSite().equals("Y") ? 1 : 0;
				break;
			case "setting":
				chk = avo.getSetting().equals("Y") ? 1 : 0;
				break;	
			case "stat":
				chk = avo.getStat().equals("Y") ? 1 : 0;
				break;
			case "print":
				chk = avo.getPrint().equals("Y") ? 1 : 0;
				break;				
				default : 
					chk = 1;
		}
		
		return chk;
	}
	
	

}
