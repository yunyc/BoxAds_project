package com.boxads.calcul.service;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.boxads.calcul.mapper.CalculMapper;
import com.boxads.cash.mapper.CashMapper;
import com.boxads.cash.vo.CashVO;

@Transactional
@Service
public class CalculService {
	
	@Resource private CalculMapper calculMapper;
	@Resource private CashMapper cashMapper;

	public List<HashMap<String, String>> selectCalculList(HashMap<String, Object> param) throws Exception {
		return calculMapper.selectCalculList(param);
	}

	public int selectCalculListCnt(HashMap<String, Object> param) throws Exception {
		return calculMapper.selectCalculListCnt(param);
	}

	// 정산 상태 변경
	public int updateState(HashMap<String, Object> param) throws Exception {
		int success = 0;
		
		String idxArr = (String) param.get("idx");		
		String state = (String) param.get("state");		
		
		List<HashMap<String, Object>> amountList = calculMapper.selectCalculInfo(Arrays.asList(idxArr.split(",")));

		param.put("list", amountList);
		success = calculMapper.updateState(param);
		
		switch (state) {
		case "Y":
			// 처리 시 판매자에게 광고 수수료를 제하고 정산						
			for (HashMap<String, Object> amount : amountList) {

				// 캐시 이력에 로그 셋팅
				CashVO csvo = new CashVO(Integer.parseInt(amount.get("bmIdx").toString()), Integer.parseInt(amount.get("o_idx").toString()), "P", "S", "정산으로 인한 수입", Integer.parseInt(amount.get("amount").toString()), null);				
				// 캐시 입출력 프로시저
				cashMapper.increaseCash(csvo); 					
			}
			
			break;				
		case "C":
			// 부분 취소 시 광고주에게 광고비 100% 환불 / 사유입력			
			for (HashMap<String, Object> amount : amountList) {

				// 캐시 이력에 로그 셋팅
				CashVO csvo = new CashVO(Integer.parseInt(amount.get("amIdx").toString()), Integer.parseInt(amount.get("o_idx").toString()), "P", "C", "광고 부분 취소로 인한 광고비 환불", Integer.parseInt(amount.get("adPrice").toString()), null);				
				// 캐시 입출력 프로시저
				cashMapper.increaseCash(csvo); 					
			}
			break;
		default:
			break;
		}	
		
		return success;
	}

	public List<HashMap<String, String>> selectWithdrawList(HashMap<String, Object> param) throws Exception {
		return calculMapper.selectWithdrawList(param);
	}

	public int selectWithdrawListCnt(HashMap<String, Object> param) throws Exception {
		return calculMapper.selectWithdrawListCnt(param);
	}

	public List<HashMap<String, String>> selectBillList(HashMap<String, Object> param) throws Exception {
		return calculMapper.selectBillList(param);
	}

	public int selectBillListCnt(HashMap<String, Object> param) throws Exception {
		return calculMapper.selectBillListCnt(param);
	}

	public int updateStateWithdraw(HashMap<String, Object> param) throws Exception {
				
		String idxArr = (String) param.get("idx");		
		String state = (String) param.get("state");		
		
		List<HashMap<String, Object>> withdrawList = calculMapper.selectWithdraw(Arrays.asList(idxArr.split(",")));

		param.put("list", withdrawList);				
		int success = calculMapper.updateStateWithdraw(param);
		
		if(success > 0 && state.equals("Y") && !withdrawList.isEmpty()) {
			for (HashMap<String, Object> wvo : withdrawList) {
				
				// 캐시 이력에 로그 셋팅
				CashVO csvo = new CashVO((int)wvo.get("mIdx"), 0, "M", "O", "출금 처리", -(int)wvo.get("amount"), null);
				
				// 캐시 입출력 프로시저
				cashMapper.increaseCash(csvo);
				
				// 출금예정 금액 수정
				cashMapper.updateWithdrawCash(wvo);
			}
		}
		
		return success;
	}

	public HashMap<String, String> selectBillIssue(HashMap<String, Object> param) throws Exception {
		List<HashMap<String, String>> list = calculMapper.selectBillList(param);
		return !list.isEmpty() ? list.get(0) : null;
	}

	public HashMap<String, String> selectMemberInfo(HashMap<String, Object> param) throws Exception {
		return calculMapper.selectMemberInfo(param);
	}

	public int updateBillState(HashMap<String, Object> param) throws Exception {
		return calculMapper.updateBillState(param);
	}

	public List<HashMap<String, String>> selectCashList(CashVO param) throws Exception {
		return cashMapper.selectCashList(param);
	}

	public int selectCashListCnt(CashVO param) throws Exception {
		return cashMapper.selectCashListCnt(param);
	}	
}
