package com.boxads.coupon.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.boxads.coupon.mapper.CouponMapper;
import com.boxads.coupon.vo.CouponVO;
import com.boxads.main.vo.AdminVO;
import com.boxads.setting.mapper.SettingMapper;
import com.boxads.setting.vo.CodeVO;
import com.boxads.setting.vo.FeesVO;
import com.boxads.setting.vo.UnitVO;


@Transactional
@Service
public class CouponService {
	
	@Resource
	private CouponMapper couponMapper;
	
	public List<CouponVO> selectCouponList(CouponVO couponVO) throws Exception {
		return couponMapper.selectCouponList(couponVO);
	}
	
	public void insertCouponList(CouponVO couponVO) throws Exception {
		couponMapper.insertCouponList(couponVO);
		
	}

	public int selectCouponListCnt(CouponVO couponVO) throws Exception {
		return couponMapper.selectCouponListCnt(couponVO);
	}

	public int updateCouponState(CouponVO couponVO) throws Exception {
		return couponMapper.updateCouponState(couponVO);
	}
	
	public List<HashMap<String, Object>> selectCouponIssue(int mIdx, int start, int end) throws Exception {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("mIdx", mIdx);
		map.put("start", start);
		map.put("end", mIdx);
		
		return couponMapper.selectCouponIssue(map);
	}
	
	public Long selectCouponIssueCnt(int mIdx) throws Exception {
		HashMap<String, Long> map = new HashMap<String, Long>();
		map.put("mIdx", (long) mIdx);
		map = couponMapper.selectCouponIssueCnt(map);
		
		return map.get("issueCnt");
	}


}
