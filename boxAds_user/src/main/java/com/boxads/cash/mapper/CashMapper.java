package com.boxads.cash.mapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.boxads.cash.vo.CashVO;
import com.boxads.etc.vo.CouponVO;


@Mapper
public interface CashMapper {

	int increaseCash(CashVO csvo) throws Exception;
	
	// 캐시 충전 목록 조회
	List<CashVO> selectCashLogList(CashVO cashVO) throws Exception;
	
	// 캐시 충전금액 목록 조회
	List<Map<String, Object>> selectChargePriceList() throws Exception;
	
	// 캐시 충전금액 조회
	Map<String, Object> selectChargePrice(Map<String, Object> map) throws Exception;

	void updateEstiCash(HashMap<String, Integer> esti) throws Exception;
	
	// 캐시 충전 결제 전 디비 처리
	void insertCash(CashVO cashVO);
	
	// 캐시 충전 결제 전 결제번호 저장
	void insertCashCode(CashVO cashVO);
	
	// 캐시 충전 결제완료 후 처리
	void updateCash(CashVO cashVO);
	
	// 결제 정보 조회
	CashVO selectCash(CashVO cashVO);
	
	// 쿠폰 목록 조회
	List<CouponVO> selectCouponList(CouponVO couponVO);

	int insertWithdrawal(CashVO cashVO) throws Exception;

	int selectCashListCnt(CashVO csvo) throws Exception;

	List<CashVO> selectCashList(CashVO csvo) throws Exception;

	void insertBillByCharge() throws Exception;

	int selectCashLogCnt(CashVO cashVO) throws Exception;
}