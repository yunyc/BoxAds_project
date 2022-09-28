package com.boxads.main.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.boxads.main.vo.BoardVO;
import com.boxads.main.vo.FileVO;
import com.boxads.main.vo.MemberVO;

@Mapper
public interface MemberMapper {
	
	MemberVO selectMemberList(MemberVO memberVO) throws Exception;
	
	void insertMemberList(MemberVO memberVO) throws Exception;
	
	void updateMemberList(MemberVO memberVO) throws Exception;
	 
	void deleteMemberList(MemberVO memberVO) throws Exception;
	
	void updateLoginCnt(MemberVO memberVO) throws Exception;

	int updateAuthConfirm(MemberVO mvo) throws Exception;
	
	void updateSessionId(MemberVO memberVO) throws Exception;

	int selectCash(int idx) throws Exception;

	HashMap<String, Integer> selectCashAndEsti(int idx) throws Exception;

	HashMap<String, String> selectPrImg(int idx) throws Exception;

	int idChk(MemberVO memberVO) throws Exception;

	int selectChkQuit(int mIdx) throws Exception;

}
