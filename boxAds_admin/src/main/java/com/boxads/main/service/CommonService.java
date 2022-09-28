package com.boxads.main.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.io.FileUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.boxads.main.dao.CommonDAO;
import com.boxads.main.mapper.BoardMapper;
import com.boxads.main.mapper.CommonMapper;
import com.boxads.setting.vo.CodeVO;


@Transactional
@Service
public class CommonService {
	@Resource
	private CommonMapper commonMapper;
	
	private static final Logger log = LoggerFactory.getLogger(CommonService.class);
	
	public List<?> selectTableList(Map<String, String> param) throws Exception {		
		return commonMapper.selectTableList(param);
	}
	
	public HashMap<String, Object> selectQRcode(int parent) throws Exception {		
		return commonMapper.selectQRcode(parent);
	}

	public HashMap<String, String> mainDashCnt() throws Exception {	
		return commonMapper.mainDashCnt();
	}
	  

}
