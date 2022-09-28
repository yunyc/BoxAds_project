package com.boxads.member.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.beanutils.BeanUtils;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.boxads.main.mapper.BoardMapper;
import com.boxads.main.vo.BoardVO;
import com.boxads.main.vo.FileVO;
import com.boxads.member.mapper.MemberMapper;
import com.boxads.member.vo.MemberVO;

@Service
public class MemberService{
	
	@Resource
	private MemberMapper memberMapper;
	
	public List<MemberVO> selectMemberList(MemberVO memberVO) throws Exception {
		return memberMapper.selectMemberList(memberVO);
	}
	
	public void insertMemberList(MemberVO memberVO) throws Exception {
		memberMapper.insertMemberList(memberVO);
	}
	
	public void updateMemberList(MemberVO memberVO) throws Exception {
		memberMapper.updateMemberList(memberVO);
		
	}
	
	public void updateLoginState(MemberVO memberVO) throws Exception {
		memberVO.setLoginCnt(memberVO.getLoginCnt() + 1);
		memberMapper.updateMemberList(memberVO);
	}
	
	public void deleteMemberList(MemberVO memberVO) throws Exception {
		memberMapper.deleteMemberList(memberVO);
	}
	
	public void updateLoginCnt() throws Exception {
		memberMapper.updateLoginCnt();
	}
	
	public Long selectMemberCnt(MemberVO memberVO) throws Exception {
		HashMap<String, Long> map = memberMapper.selectMemberCnt(memberVO);
		return map.get("memberCnt");
	}

	public List<HashMap<String, String>> selectListExcel(MemberVO mvo) throws Exception {
		List<HashMap<String, String>> datalist = new ArrayList<HashMap<String, String>>();
		List<MemberVO> list = memberMapper.selectMemberList(mvo);
		
		for (MemberVO m : list) {
			HashMap<String, String> data = (HashMap<String, String>) BeanUtils.describe(m);
			datalist.add(data);
		}
		
		return datalist;
	}
	
	public List<MemberVO> selectHumunList(String type) throws Exception {
		return memberMapper.selectHumunList(type);
	}
	
	public List<HashMap<String, Object>> selectConfirmList(MemberVO mvo) throws Exception {
		return memberMapper.selectConfirmList(mvo);
	}
	
	public void insertConfirmList(MemberVO mvo) throws Exception {
		memberMapper.insertConfirmList(mvo);
	}
	
	public int selectCash(int idx) throws Exception {
		return memberMapper.selectCash(idx);
	}

	public List<HashMap<String, String>> selectMessageList(HashMap<String, Object> param) throws Exception {
		return memberMapper.selectMessageList(param);
	}

	public int selectMessageListCnt(HashMap<String, Object> param) throws Exception {
		return memberMapper.selectMessageListCnt(param);
	}

	public HashMap<String, String> selectBankInfo(int idx) throws Exception {
		return memberMapper.selectBankInfo(idx);
	}

}
