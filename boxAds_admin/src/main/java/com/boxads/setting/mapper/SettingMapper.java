package com.boxads.setting.mapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.boxads.coupon.vo.CouponVO;
import com.boxads.main.vo.AdminVO;
import com.boxads.setting.vo.CodeVO;
import com.boxads.setting.vo.FeesVO;
import com.boxads.setting.vo.UnitVO;

@Mapper
public interface SettingMapper {
	List<CodeVO> selectCodeList(CodeVO cvo) throws Exception;
	Map<String, String> selectCodeName(CodeVO cvo) throws Exception;
	int insertCode(CodeVO cvo) throws Exception;
	int insertCodeSort(List<HashMap<String, String>> list) throws Exception;
	
	List<HashMap<String, Object>> selectForUnit(CodeVO cvo) throws Exception;
	List<UnitVO> selectUnit(int idx) throws Exception;
	int insertUnit(List<UnitVO> list) throws Exception;
	
	List<FeesVO> selectFeesList(FeesVO fvo) throws Exception;
	int insertFees(List<FeesVO> list) throws Exception;
	List<AdminVO> selectAdminList(AdminVO avo) throws Exception;
	int insertAdmin(AdminVO avo) throws Exception;
	int insertAdminAuth(AdminVO avo) throws Exception;
	int updateAdminList(AdminVO avo) throws Exception;
	int updateAdminAuth(AdminVO avo) throws Exception;
	HashMap<String, Long> selectAdminCnt(AdminVO avo) throws Exception;
	
	List<UnitVO> selectUnitList(UnitVO unitVO) throws Exception;
	void insertUnitList(UnitVO unitVO) throws Exception;
	void deleteUnitList(List<Integer> list) throws Exception;
	int adminIdChk(AdminVO avo) throws Exception;

	
}
