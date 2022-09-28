package com.boxads.main.dao;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.boxads.main.vo.AdminVO;

@Repository
public class MemberDAO {
	@Resource private SqlSession sqlSession;

	public AdminVO selectAdmin(AdminVO param) {
		return sqlSession.selectOne("com.baxads.member.selectAdmin", param);
	}
	
	
}
