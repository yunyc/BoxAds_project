package com.boxads.main.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.commons.beanutils.BeanUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import org.springframework.web.multipart.MultipartFile;

import com.boxads.common.service.MailService;
import com.boxads.etc.mapper.CouponMapper;
import com.boxads.etc.vo.CouponVO;
import com.boxads.main.ObjectUtil;
import com.boxads.main.mapper.BoardMapper;
import com.boxads.main.mapper.MemberMapper;
import com.boxads.main.vo.FileVO;
import com.boxads.main.vo.MemberVO;

@Transactional
@Service
public class MemberService{
	
	@Resource
	private MemberMapper memberMapper;
	@Resource
	private BoardMapper boardMapper;
	@Resource
	private CouponMapper couponMapper;
	@Resource
	private FileService fileService;
	@Resource
	private MailService mailService;
	
	public MemberVO selectMemberList(MemberVO memberVO) throws Exception {
		return memberMapper.selectMemberList(memberVO);
		
	}
	
	public void insertMemberList(MemberVO memberVO) throws Exception {
		memberMapper.insertMemberList(memberVO);
		
		// 회원가입 시 발행되는 쿠폰이 있다면 등록하고 쿠폰 발급 정보 업데이트
		List<HashMap<String, Integer>> list = new ArrayList<>();
		List<CouponVO> cpList = couponMapper.selectCoupon(new CouponVO("B"));
		if(cpList != null && !cpList.isEmpty()) {			
			for (CouponVO couponVO : cpList) {
				HashMap<String, Integer> mvo = new HashMap<>();
				mvo.put("m_idx", memberVO.getIdx());
				mvo.put("c_idx", couponVO.getIdx());				
				list.add(mvo);
			}
			couponMapper.insertCouponIssue(list);
			couponMapper.updateCouponCnt(list);
		}
	}
	
	public void updateMemberList(HttpSession session, MemberVO memberVO) throws Exception {
		memberMapper.updateMemberList(memberVO);
		MemberVO member = new MemberVO();
		
		if (session.getAttribute("login") != null) {
			MemberVO login = (MemberVO) session.getAttribute("login");
			member.setId(login.getId());
			member.setPw(login.getPw());
			session.setAttribute("login", selectMemberList(member));
		
		} else if (session.getAttribute("change") != null) {
			session.setAttribute("change", null);
		}

	}
	
	public void updateLoginState(MemberVO memberVO) throws Exception {
		memberVO.setLoginCnt(memberVO.getLoginCnt() + 1);
		memberMapper.updateMemberList(memberVO);
	}
	
	public void deleteMemberList(MemberVO memberVO) throws Exception {
		memberMapper.deleteMemberList(memberVO);
	}
	
	public void updateLoginCnt(MemberVO memberVO) throws Exception {
		memberMapper.updateLoginCnt(memberVO);
	}

	public int updateAuthConfirm(MemberVO mvo) throws Exception {
		return memberMapper.updateAuthConfirm(mvo);
	}
	
	public void joinMember(MemberVO memberVO, List<MultipartFile> companyFile) throws Exception {
		
		List<FileVO> fileVOList = new ArrayList<FileVO>();
		
		insertMemberList(memberVO);
		fileService.listSetting(memberVO.getIdx(), "C", companyFile, fileVOList, "business");
    	fileService.insertFile(memberVO.getIdx(), fileVOList);
    	
    	// 인증 메일 발송
    	Map<String, String> data = BeanUtils.describe(memberVO);
    	mailService.sendMail(data, "mail_certify");
	}
	
	public void updateInfo(MemberVO memberVO, HttpSession session, 
		List<MultipartFile> uploadImage, List<MultipartFile> uploadFile, int[] fileIdx, int[] deteleIdx) throws Exception {
		fileService.setDeleteIdx(deteleIdx);
		
		List<FileVO> fileVOList = new ArrayList<FileVO>();
		updateMemberList(session, memberVO);
		
		if (uploadImage.get(0).getSize() > 0) {
			FileVO file = fileService.listSet(memberVO.getIdx(), "P", uploadImage, "profile");
			file.setIdx(fileIdx[0]);
			fileVOList.add(file);
		}
		
		if (uploadFile.get(0).getSize() > 0) {
			FileVO fileVO = fileService.listSet(memberVO.getIdx(), "C", uploadFile, "business");
			fileVO.setIdx(fileIdx[1]);
			fileVOList.add(fileVO);
		}
		
		if (fileVOList.size() > 0) {
			fileService.insertFile(memberVO.getIdx(), fileVOList);
		}
	}
	
	public void updateSessionId(MemberVO memberVO) throws Exception {
		memberMapper.updateSessionId(memberVO);
	}

	public int selectCash(int idx) throws Exception {
		return memberMapper.selectCash(idx);
	}
	
	public int getMemberId(HttpSession session) {
		
		MemberVO memberVO = (MemberVO) session.getAttribute("login");
		
		if (memberVO != null) {
			return memberVO.getIdx();
		} else {
			return 0;
		}
		
		
	}

	public HashMap<String, Integer> selectCashAndEsti(int idx) throws Exception {
		return memberMapper.selectCashAndEsti(idx);
	}

	public HashMap<String, String> selectPrImg(MemberVO member) throws Exception {
		return memberMapper.selectPrImg(member.getIdx());
	}

	public int idChk(MemberVO memberVO) throws Exception {
		return memberMapper.idChk(memberVO);
	}

	public int selectChkQuit(int mIdx) throws Exception {
		return memberMapper.selectChkQuit(mIdx);
	}

}
