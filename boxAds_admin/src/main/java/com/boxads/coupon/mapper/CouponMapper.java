package com.boxads.coupon.mapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.boxads.coupon.vo.CouponVO;
import com.boxads.main.vo.AdminVO;
import com.boxads.setting.vo.CodeVO;
import com.boxads.setting.vo.FeesVO;
import com.boxads.setting.vo.UnitVO;

@Mapper
public interface CouponMapper {
	
	List<CouponVO> selectCouponList(CouponVO couponVO) throws Exception;
	void insertCouponList(CouponVO couponVO) throws Exception;
	int selectCouponListCnt(CouponVO couponVO) throws Exception;
	int updateCouponState(CouponVO couponVO) throws Exception;
	
	List<HashMap<String, Object>> selectCouponIssue(HashMap<String, Object> map) throws Exception;
	
	HashMap<String, Long> selectCouponIssueCnt(HashMap<String, Long> map) throws Exception;
}
