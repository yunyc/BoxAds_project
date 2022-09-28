package com.boxads.main.service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.boxads.box.vo.BoxVO;
import com.boxads.main.mapper.BoardMapper;
import com.boxads.main.mapper.FileMapper;
import com.boxads.main.vo.BoardVO;
import com.boxads.main.vo.FileVO;

@Service
@Transactional
public class FileService{
	
	@Resource
	private FileMapper fileMapper;
	
	@Resource
	private String uploadPath;
	
	public List<FileVO> selectFileList(int idx, int parent, String type) throws Exception {
		
		FileVO fileVO = new FileVO();
		fileVO.setIdx(idx);
		fileVO.setParent(parent);
		fileVO.setType(type);
		return fileMapper.selectFileList(fileVO);
	}
	
	public void insertFile (int idx, List<FileVO> fileVOList) throws Exception {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("fileList", fileVOList);
		fileMapper.insertFile(map);
	}
	
	public void deleteFileList(int idx, int parent, String type) throws Exception {
		
		FileVO fileVO = new FileVO();
		fileVO.setIdx(idx);
		fileVO.setParent(parent);
		fileVO.setType(type);
		fileMapper.deleteFileList(fileVO);
	}
	
	public List<HashMap<String, Object>> selectQnaFileList(int idx, String type) throws Exception {
		FileVO fileVO = new FileVO();
		fileVO.setIdx(idx);
		fileVO.setType(type);
		return fileMapper.selectQnaFileList(fileVO);
	}
	
	public void updateBoxState(int idx, int parent) throws Exception {
		FileVO fileVO = new FileVO();
		
		fileVO.setIdx(idx);
		fileVO.setParent(parent);
		fileMapper.updateBoxState(fileVO);
	}
	
	public void updateAdState(int idx, int parent) throws Exception {
		FileVO fileVO = new FileVO();
		
		fileVO.setIdx(idx);
		fileVO.setParent(parent);
		fileMapper.updateAdState(fileVO);
	}
	
	public void fileSetting(int idx, String type, FileVO fileVO, MultipartFile uploadFile, String path) throws IllegalStateException, IOException {
		
		if (uploadFile.getSize() != 0) {
			String tempName = UUID.randomUUID().toString().replace("-", "").substring(0, 8) + "-" + uploadFile.getOriginalFilename();
			
			fileVO.setParent(idx);
			fileVO.setType(type);
			//fileVO.setRealName(uploadFile.hashCode() + "-" + uploadFile.getOriginalFilename());
			fileVO.setRealName(uploadFile.getOriginalFilename());
			fileVO.setTempName(tempName);
	    	fileVO.settingFileType(uploadFile.getOriginalFilename());
			fileVO.setSize(uploadFile.getSize());
			fileVO.setUrl(fileVO.getUrl() + "/" + path + "/" + tempName);
			fileVO.setUploadPath(uploadPath + "/" + path);
			
			fileVO.transferFile(uploadFile);
		}
		
	}
	
	public void listSetting(int idx, String type, List<MultipartFile> uploadList , List<FileVO> fileVOList, String path) throws IllegalStateException, IOException {
		
		if (uploadList.size() > 0) {
			
			for (MultipartFile file : uploadList) {
				FileVO fileVO = new FileVO();
				fileSetting(idx, type, fileVO, file, path);
				fileVOList.add(fileVO);
			}
		}
	}
	
	public FileVO listSet(int idx, String type, List<MultipartFile> uploadList, String path) throws IllegalStateException, IOException {
		
		FileVO fileVO = new FileVO();
		
		if (uploadList.size() > 0) {
			
			for (MultipartFile file : uploadList) {
				fileSetting(idx, type, fileVO, file, path);
				
			}
		}
		return fileVO;
	}
	
	public void setDeleteIdx(int[] deleteIdx) throws Exception {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("deleteIdx", deleteIdx);
		
		fileMapper.delete(map);
	}
	
}