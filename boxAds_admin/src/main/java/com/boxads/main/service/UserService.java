package com.boxads.main.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.boxads.main.dao.MemberDAO;
import com.boxads.main.vo.AdminVO;

@Service
public class UserService {
	@Resource
    private MemberDAO dao;

	public AdminVO selectAdmin(AdminVO param) throws Exception {
		return dao.selectAdmin(param);
	}
	
	

}