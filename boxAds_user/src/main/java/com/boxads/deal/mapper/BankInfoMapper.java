package com.boxads.deal.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.boxads.deal.vo.BankInfoVO;

@Mapper
public interface BankInfoMapper {

	BankInfoVO selectBankInfo(BankInfoVO bivo);

	int insertBankInfo(BankInfoVO bivo);
	
	Map<String, Object> selectBankInfoWithFile(Map<String, Object> paramMap);
}