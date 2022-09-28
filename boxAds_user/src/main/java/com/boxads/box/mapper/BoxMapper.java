package com.boxads.box.mapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.boxads.box.vo.BoxVO;
import com.boxads.box.vo.CodeVO;

@Mapper
public interface BoxMapper {
	List<BoxVO> selectBoxList(BoxVO boxVO) throws Exception;
	int insertBoxList(BoxVO boxVO) throws Exception;
	int updateBoxList(BoxVO boxVO) throws Exception;
	int deleteBoxList(BoxVO boxVO) throws Exception;
	
	HashMap<String, Long> selectBoxCnt(BoxVO boxVO) throws Exception;
	
	List<BoxVO> selectBoxListAjax(HashMap<String, Object> param) throws Exception;
	BoxVO selectBoxDetail(BoxVO bvo) throws Exception;
}