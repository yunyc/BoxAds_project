package com.boxads.cash.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.boxads.cash.mapper.CashMapper;
import com.boxads.cash.vo.CashVO;



@Service
@Transactional
public class CashService {

    @Resource
    CashMapper cashMapper;
    
    public List<CashVO> selectCashLogList(CashVO cashVO) throws Exception {
        return cashMapper.selectCashLogList(cashVO);
    }
    
    public List<Map<String, Object>> selectChargePriceList() throws Exception {
        return cashMapper.selectChargePriceList();
    }
    
    public Map<String, Object> selectChargePrice(Map<String, Object> map) throws Exception {
        return cashMapper.selectChargePrice(map);
    }
    
    public Long selectCashLogCnt(CashVO cashVO) throws Exception {
    	HashMap<String, Long> map = cashMapper.selectCashLogCnt(cashVO);
        
    	return map.get("cashCnt");
    }
}
