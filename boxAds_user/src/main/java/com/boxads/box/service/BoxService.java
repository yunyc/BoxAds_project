package com.boxads.box.service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.support.TransactionSynchronizationManager;
import org.springframework.web.multipart.MultipartFile;

import com.boxads.box.mapper.BoxMapper;
import com.boxads.box.mapper.CodeMapper;
import com.boxads.box.vo.BoxVO;
import com.boxads.box.vo.CodeVO;
import com.boxads.common.mapper.OrderMapper;
import com.boxads.common.service.SerialService;
import com.boxads.main.mapper.FileMapper;
import com.boxads.main.service.FileService;
import com.boxads.main.vo.FileVO;


@Transactional
@Service
public class BoxService {
	@Resource
	private BoxMapper boxMapper;
	
	@Resource 
	private OrderMapper odMapper;
	
	@Resource
	private FileMapper fileMapper;
	
	@Resource
	private FileService fileService;
	
	@Resource
	private SerialService serialService;
	
	private static final Logger log = LoggerFactory.getLogger(BoxService.class);
	private static final String path = "box";

	public List<BoxVO> selectBoxList(BoxVO boxVO) throws Exception{
		return boxMapper.selectBoxList(boxVO);
	}

	public int insertBoxList(BoxVO boxVO) throws Exception{
		return boxMapper.insertBoxList(boxVO);
	}

	public int deleteBoxList(BoxVO boxVO) throws Exception{
		return boxMapper.deleteBoxList(boxVO);
	}
	
	public void boxWrite(BoxVO boxVO, int repIdx, List<MultipartFile> repFile, List<MultipartFile> uploadFile,
			int[] deleteIdx, int[] fileIdx) throws Exception {
		
		List<FileVO> fileVOList = new ArrayList<FileVO>();
		
		String serialNumber = serialService.createSerialNumber("B");
		boxVO.setBoxCode(serialNumber);
		
		if (boxVO.getType().equals("copy")) {
			boxVO.setIdx(0);
			insertBoxList(boxVO);
			copyBox(boxVO, fileIdx, repIdx, deleteIdx);
		
		} else {
			fileService.setDeleteIdx(deleteIdx);
			insertBoxList(boxVO);
			fileService.updateBoxState(repIdx, boxVO.getIdx());
		}
		
		System.out.println("Transaction active: " + TransactionSynchronizationManager.isActualTransactionActive());
		
		fileService.listSetting(boxVO.getIdx(), "E", repFile, fileVOList, path);
		fileService.listSetting(boxVO.getIdx(), "I", uploadFile, fileVOList, path);
		 
		if (fileVOList.size() > 0) {
			fileService.insertFile(boxVO.getIdx(), fileVOList);
		}
		
	}
	
	public Long selectBoxCnt(BoxVO boxVO) throws Exception {
		HashMap<String, Long> map = boxMapper.selectBoxCnt(boxVO);
		
		return map.get("boxCnt");
	}
	
	public void deleteBox(BoxVO boxVO) throws Exception {
		boxMapper.deleteBoxList(boxVO);
		fileService.deleteFileList(0, boxVO.getIdx(), null);
	}
	
	public void copyBox(BoxVO boxVO, int[] fileIdx, int repIdx, int[] deleteIdx) throws Exception {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		for (int idx : deleteIdx) {
			
			for (int i = 0; i < fileIdx.length; i++) {
				
				if (fileIdx[i] == idx) { 
					fileIdx[i] = 0;
				}
			}
			
		}
		map.put("fileIdx", fileIdx);
		map.put("parent", boxVO.getIdx());
		map.put("repIdx", repIdx);
		map.put("repType", "E");
		map.put("imgType", "I");
		
		fileMapper.copyFile(map);
		
	}
	
	public List<BoxVO> selectBoxListAjax(HashMap<String, Object> param) throws Exception {
		return boxMapper.selectBoxListAjax(param);
	}	

	public BoxVO selectBoxDetail(BoxVO bvo) throws Exception {
		return boxMapper.selectBoxDetail(bvo);
	}	

	public int selectBoxOwnerCnt(HashMap<String, Object> param) throws Exception {
		return odMapper.selectBoxOwnerCnt(param);
	}

	public List<HashMap<String, Object>> selectBoxOwnerList(HashMap<String, Object> param)  throws Exception {
		return odMapper.selectBoxOwnerList(param);
	}

	public BoxVO selectBoxListVo(BoxVO boxVO) throws Exception {
		List<BoxVO> list = boxMapper.selectBoxList(boxVO);
		return !list.isEmpty() ? list.get(0) : null;
	}

}