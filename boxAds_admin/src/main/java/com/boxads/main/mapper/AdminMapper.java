package com.boxads.main.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.boxads.main.vo.AdminVO;


@Mapper
public interface AdminMapper {	
	AdminVO selectAdmin(AdminVO param) throws Exception ;
	int updateLoginCnt(AdminVO avo) throws Exception ;
	
	
}
