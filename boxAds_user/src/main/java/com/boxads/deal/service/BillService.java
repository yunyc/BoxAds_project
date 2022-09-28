package com.boxads.deal.service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.boxads.deal.mapper.BillMapper;
import com.boxads.deal.vo.BillVO;


@Transactional
@Service
public class BillService {
	
	@Resource private BillMapper billMapper;
	
	private static final Logger log = LoggerFactory.getLogger(BillService.class);
	private static final String path = "deal";
	
	public BillVO selectBill(BillVO bvo) throws Exception {
		return billMapper.selectBill(bvo);
	}

	public int insertBill(BillVO bvo) {
		return billMapper.insertBill(bvo);
	}

	public int selectBillIssueCnt(HashMap<String, Object> param) throws Exception {
		return billMapper.selectBillIssueCnt(param);
	}

	public List<HashMap<String, Object>> selectBillIssue(HashMap<String, Object> param) throws Exception {
		return billMapper.selectBillIssue(param);
	}

	public String selectBillName(int idx) throws Exception {
		return billMapper.selectBillName(idx);
	}
	

}