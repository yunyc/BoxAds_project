package com.boxads.etc.service;

import java.util.List;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.boxads.box.mapper.BoxMapper;
import com.boxads.etc.mapper.CouponMapper;
import com.boxads.etc.vo.CouponVO;

@Transactional
@Service
public class EtcService {
	@Resource
	private CouponMapper cpMapper;

	public List<CouponVO> selectCouponList(CouponVO cvo) throws Exception {
		return cpMapper.selectCouponList(cvo);
	}		
}