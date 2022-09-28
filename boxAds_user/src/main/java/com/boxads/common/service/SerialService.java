package com.boxads.common.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.beanutils.BeanUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.boxads.common.mapper.SerialMapper;
import com.boxads.main.mapper.BoardMapper;
import com.boxads.main.vo.BoardVO;
import com.boxads.main.vo.FileVO;


@Transactional
@Service
public class SerialService {
	
	@Resource
	private SerialMapper serialMapper;
	
	public String createSerialNumber(String type) throws Exception {
		HashMap<String, Object> serialMap = serialMapper.selectSerialNumber(type);
		
		String date = "";
		String number = "";
		String serial = "";
		
		if (serialMap != null) {
			serialMapper.updateSerialNumber(type);
			
			date = (String) serialMap.get("date");
			number = String.format("-%05d", (Integer) serialMap.get("serialNumber") + 1) ;
			serial = date.substring(2, 6) + number;
			
		} else {
			serialMapper.insertSerialNumber(type);
			SimpleDateFormat fmt = new SimpleDateFormat("yyyyMMdd");
			date = fmt.format(new Date());
			serial = date.substring(2, 6) + "-00001";
		}
		
		switch (type) {
		case "B":
			serial = "BX" + serial;
			break;
		case "A":
			serial = "AD" + serial;
			break;
		case "O":
			serial = "OD" + serial;
			break;
		case "C":
			serial = "CL" + serial;
			break;
		default:
			serial = "";
			break;
		}
		
		return serial;
	}
	
}
