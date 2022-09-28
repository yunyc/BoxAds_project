package com.boxads.deal.mapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import com.boxads.deal.vo.BillVO;

@Mapper
public interface BillMapper {

	BillVO selectBill(BillVO bvo) throws Exception;

	int insertBill(BillVO bvo);

	int selectBillIssueCnt(HashMap<String, Object> param) throws Exception;

	List<HashMap<String, Object>> selectBillIssue(HashMap<String, Object> param) throws Exception;

	String selectBillName(int idx) throws Exception;
}