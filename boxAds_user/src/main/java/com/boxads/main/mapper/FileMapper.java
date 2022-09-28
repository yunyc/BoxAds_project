package com.boxads.main.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.boxads.box.vo.BoxVO;
import com.boxads.main.vo.BoardVO;
import com.boxads.main.vo.FileVO;

@Mapper
public interface FileMapper {
	
	List<FileVO> selectFileList(FileVO fileVO) throws Exception;
	
	void insertFileList(FileVO fileVO) throws Exception;
	
	void insertFile(HashMap<String, Object> map) throws Exception;
	
	void updateFileList(FileVO fileVO) throws Exception;
		
	void deleteFileList(FileVO fileVO) throws Exception;
	
	List<HashMap<String, Object>> selectQnaFileList(FileVO fileVO) throws Exception;
	
	void updateBoxState(FileVO fileVO) throws Exception;
	
	void updateAdState(FileVO fileVO) throws Exception; 
	
	void delete(HashMap<String, Object> map) throws Exception;
	
	int copyFile(HashMap<String, Object> map) throws Exception;
	
}