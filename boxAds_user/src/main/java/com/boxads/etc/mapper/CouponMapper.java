package com.boxads.etc.mapper;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.boxads.etc.vo.CouponVO;
import com.boxads.main.vo.MemberVO;

@Mapper
public interface CouponMapper {
	
	MemberVO selectMemberList(MemberVO memberVO) throws Exception;
	List<CouponVO> selectCoupon(CouponVO couponVO) throws Exception;
	void insertCouponIssue(List<HashMap<String, Integer>> list) throws Exception;
	void updateCouponCnt(List<HashMap<String, Integer>> list) throws Exception;
	List<CouponVO> selectCouponList(CouponVO cvo) throws Exception;
	int issueChkCoupon(CouponVO cpvo) throws Exception;


}
