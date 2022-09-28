package com.boxads.setting.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.boxads.main.vo.AdminVO;
import com.boxads.setting.mapper.SettingMapper;
import com.boxads.setting.vo.CodeVO;
import com.boxads.setting.vo.FeesVO;
import com.boxads.setting.vo.UnitVO;



@Service
@Transactional
public class SettingService {
	@Resource
	private SettingMapper settingMapper;
	
	private static final Logger log = LoggerFactory.getLogger(SettingService.class);

	public List<CodeVO> selectCodeList(CodeVO cvo) throws Exception{
		return settingMapper.selectCodeList(cvo);
	}

	public Map<String, String> selectCodeName(CodeVO cvo) throws Exception{
		return settingMapper.selectCodeName(cvo);
	}

	public int insertCode(CodeVO cvo) throws Exception{
		return settingMapper.insertCode(cvo);
	}

	public int insertCodeSort(List<HashMap<String, String>> list) throws Exception{
		return settingMapper.insertCodeSort(list);
	}
	
	public List<HashMap<String, Object>> selectForUnit(CodeVO cvo) throws Exception{
		return settingMapper.selectForUnit(cvo);
	}
	
	public List<UnitVO> selectUnit(int idx) throws Exception{
		return settingMapper.selectUnit(idx);
	}

	public int insertUnit(List<UnitVO> list, List<Integer> delList) throws Exception{
		if(delList != null && !delList.isEmpty()) {
			settingMapper.deleteUnitList(delList);			
		}
		return settingMapper.insertUnit(list);
	}

	public List<FeesVO> selectFeesList(FeesVO fvo) throws Exception{
		return settingMapper.selectFeesList(fvo);
	}

	public int insertFees(List<FeesVO> list) throws Exception{
		return settingMapper.insertFees(list);
	}
	
	public List<AdminVO> selectAdminList(AdminVO avo) throws Exception{
		return settingMapper.selectAdminList(avo);
	}

	public int insertAdmin(AdminVO avo) throws Exception{
		int success = 0;
		success = settingMapper.insertAdmin(avo);
		success = settingMapper.insertAdminAuth(avo);
		
		return success;
	}
	
	public int updateAdminList(AdminVO avo) throws Exception {
		int success = 0;		
		success = settingMapper.updateAdminList(avo);
		success = settingMapper.updateAdminAuth(avo);
		
		return success;
	}

	public Long selectAdminCnt(AdminVO avo) throws Exception {
		HashMap<String, Long> map = settingMapper.selectAdminCnt(avo);
		return map.get("adminCnt");
	}

	public int adminIdChk(AdminVO avo) throws Exception {		
		return settingMapper.adminIdChk(avo);
	}


}
