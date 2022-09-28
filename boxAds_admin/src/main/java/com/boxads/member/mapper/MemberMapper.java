package com.boxads.member.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.boxads.member.vo.MemberVO;

@Mapper
public interface MemberMapper {
	
	List<MemberVO> selectMemberList(MemberVO memberVO) throws Exception;
	
	void insertMemberList(MemberVO memberVO) throws Exception;
	
	void updateMemberList(MemberVO memberVO) throws Exception;
	 
	void deleteMemberList(MemberVO memberVO) throws Exception;
	
	void updateLoginCnt() throws Exception;
	
	HashMap<String, Long> selectMemberCnt(MemberVO memberVO) throws Exception;
	
	List<MemberVO> selectHumunList(String type) throws Exception;
	
	List<HashMap<String, Object>> selectConfirmList(MemberVO memberVO) throws Exception;
	
	void insertConfirmList(MemberVO memberVO) throws Exception;
	
	int selectCash(int idx) throws Exception;

	List<HashMap<String, String>> selectMessageList(HashMap<String, Object> param) throws Exception;

	int selectMessageListCnt(HashMap<String, Object> param) throws Exception;

	HashMap<String, String> selectBankInfo(int idx) throws Exception;
}
