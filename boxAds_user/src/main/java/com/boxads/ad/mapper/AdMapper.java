package com.boxads.ad.mapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.boxads.ad.vo.AdVO;
import com.boxads.box.vo.BoxVO;
import com.boxads.box.vo.CodeVO;

@Mapper
public interface AdMapper {
	List<AdVO> selectAdList(AdVO adVO) throws Exception;
	int insertAdList(AdVO adVO) throws Exception;
	int updateAdList(AdVO adVO) throws Exception;
	int deleteAdList(AdVO adVO) throws Exception;
	
	HashMap<String, Long> selectAdCnt(AdVO adVO) throws Exception;
	List<AdVO> selectAdListAjax(HashMap<String, Object> param) throws Exception;
	AdVO selecAdDetail(AdVO avo) throws Exception;
}