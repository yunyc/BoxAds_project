package com.boxads.main.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.boxads.main.vo.AdminVO;
import com.boxads.main.vo.BoardVO;
import com.boxads.main.vo.FileVO;
import com.boxads.order.vo.OrderVO;

@Mapper
public interface FileMapper {
	
	List<FileVO> selectFileList(BoardVO boardVO) throws Exception;
	// 향후 교체할 메서드
	List<FileVO> selectFile(FileVO fileVO) throws Exception;
	
	void insertFileList(FileVO fileVO) throws Exception;
	// 향후 교체할 메서드
	void insertFile(HashMap<String, Object> map) throws Exception;
	
	void updateFileList(FileVO fileVO) throws Exception;
		
	void deleteFileList(BoardVO boardVO) throws Exception;
	
	void updateBoxState(FileVO fileVO) throws Exception; 
	
	void updateAdState(FileVO fileVO) throws Exception; 
	
	void delete(HashMap<String, Object> map) throws Exception;
	
	List<HashMap<String, String>> selectLogFile(OrderVO odVO) throws Exception;
}
