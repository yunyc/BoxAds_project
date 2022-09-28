package com.boxads.print.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.boxads.main.service.FileService;
import com.boxads.main.vo.FileVO;
import com.boxads.order.mapper.LogMapper;
import com.boxads.order.service.OrderService;
import com.boxads.order.vo.LogVO;
import com.boxads.order.vo.OrderVO;
import com.boxads.print.mapper.PrintMapper;
import com.boxads.print.vo.PrintVO;

@Transactional
@Service
public class PrintService {
	
	@Resource private PrintMapper printMapper;
	@Resource private FileService fileService;
	@Resource private OrderService orderService;
	@Resource private LogMapper logMapper;

	public List<HashMap<String, Object>> selectPrintList(HashMap<String, Object> param) throws Exception {		
		return printMapper.selectPrintList(param);
	}

	public int selectPrintCnt(HashMap<String, Object> param) throws Exception {
		return printMapper.selectPrintCnt(param);
	}

	public HashMap<String, Object> selectPrintDetail(HashMap<String, Object> param) throws Exception {
		return printMapper.selectPrintDetail(param);
	}

	public List<PrintVO> selectPrintLog(HashMap<String, Object> param) throws Exception {
		return printMapper.selectPrintLog(param);
	}

	public HashMap<String, Object> selectPrintDashCnt() throws Exception {
		return printMapper.selectPrintDashCnt();
	}
}
