package com.boxads.box.service;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.boxads.box.mapper.CodeMapper;
import com.boxads.box.vo.CodeVO;
import com.boxads.common.vo.OrderVO;
import com.boxads.common.vo.PriceVO;
import com.boxads.main.vo.AdminVO;


@Transactional
@Service
public class CodeService {
	@Resource
	private CodeMapper codeMapper;
	
	private static final Logger log = LoggerFactory.getLogger(CodeService.class);

	public List<CodeVO> selectCodeList(CodeVO cvo) throws Exception{
		return codeMapper.selectCodeList(cvo);
	}

	public Map<String, String> selectCodeName(CodeVO cvo) throws Exception{
		return codeMapper.selectCodeName(cvo);
	}

	public int insertCode(CodeVO cvo) throws Exception{
		return codeMapper.insertCode(cvo);
	}

	public int insertCodeSort(List<HashMap<String, String>> list) throws Exception{
		return codeMapper.insertCodeSort(list);
	}

	public List<HashMap<String, Object>> selectForUnit(CodeVO cvo) throws Exception{
		return codeMapper.selectForUnit(cvo);
	}
	
	public List<CodeVO> settingSelect() throws Exception {
		return codeMapper.settingSelect();
	}

	public HashMap<String, Object> selectUnitInfo(HashMap<String, String> param) throws Exception{
		return codeMapper.selectUnitInfo(param);
	}

	public PriceVO selectTotalPrice(OrderVO odvo) throws Exception{
		return codeMapper.selectTotalPrice(odvo);
	}

}