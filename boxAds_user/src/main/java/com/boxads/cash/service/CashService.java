package com.boxads.cash.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.boxads.cash.mapper.CashMapper;
import com.boxads.cash.vo.CashVO;
import com.boxads.deal.mapper.BillMapper;
import com.boxads.etc.vo.CouponVO;

@Service
@Transactional
public class CashService {

    @Resource CashMapper cashMapper;
    @Resource BillMapper billMapper;
    
    // 캐시 충전 목록 조회
    public List<CashVO> selectCashLogList(CashVO cashVO) throws Exception {
        return cashMapper.selectCashLogList(cashVO);
    }
    
    // 캐시 충전금액 목록 조회
    public List<Map<String, Object>> selectChargePriceList() throws Exception {
        return cashMapper.selectChargePriceList();
    }
    
    // 캐시 충전금액 조회
    public Map<String, Object> selectChargePrice(Map<String, Object> map) throws Exception {
        return cashMapper.selectChargePrice(map);
    }
    
    // 캐시 충전 결제 전 디비 처리
    public void insertCash(CashVO cashVO) throws Exception {
        cashMapper.insertCash(cashVO);
        if(cashVO.getTaxBill().equals("Y")) { cashMapper.insertBillByCharge(); }
        cashMapper.insertCashCode(cashVO);
    }
    
    // 캐시 충전 결제완료 후 디비 처리
    public void updateCash(CashVO cashVO) throws Exception {
        cashMapper.updateCash(cashVO);
        cashVO = cashMapper.selectCash(cashVO);
        // 금액 변조가 발생하지 않은 경우만 캐시 충전됨
        int cash = cashVO.getCash();
        String pAmt = cashVO.getpAmt();
        if (String.valueOf(Math.round(cash * 1.1)).equals(pAmt)) {
            cashVO.setCategory("P");
            cashVO.setType("I");
            cashVO.setContent(cashVO.getpGoods());
            cashVO.setCashIncrease(cashVO.getCash());
            cashMapper.increaseCash(cashVO);
        }
    }
    
    // 결제 정보 조회
    public CashVO selectCash(CashVO cashVO) {
        return cashMapper.selectCash(cashVO);
    }
    
    // 쿠폰 목록 조회
    public List<CouponVO> selectCouponList(CouponVO couponVO) {
        return cashMapper.selectCouponList(couponVO);
    }
        
	public int requestWithdraw(CashVO cashVO) throws Exception {	
		return cashMapper.insertWithdrawal(cashVO);
	}

	public int selectCashListCnt(CashVO csvo) throws Exception {
		return cashMapper.selectCashListCnt(csvo);
	}

	public List<CashVO> selectCashList(CashVO csvo) throws Exception {
		return cashMapper.selectCashList(csvo);
	}

	public int selectCashLogCnt(CashVO cashVO) throws Exception {
		return cashMapper.selectCashLogCnt(cashVO);
	}
}
