package com.boxads.ad.service;

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
import org.springframework.web.multipart.MultipartFile;

import com.boxads.ad.mapper.AdMapper;
import com.boxads.ad.vo.AdVO;
import com.boxads.box.mapper.BoxMapper;
import com.boxads.box.mapper.CodeMapper;
import com.boxads.box.vo.BoxVO;
import com.boxads.box.vo.CodeVO;

import com.boxads.common.mapper.OrderMapper;
import com.boxads.common.service.QRcodeService;

import com.boxads.common.service.SerialService;
import com.boxads.main.mapper.FileMapper;
import com.boxads.main.service.FileService;
import com.boxads.main.vo.FileVO;


@Transactional
@Service
public class AdService {

	@Resource 
	private OrderMapper odMapper;
	
	@Resource 
	private BoxMapper boxMapper;
	
	@Resource private AdMapper adMapper;
	@Resource private FileMapper fileMapper;
	@Resource private FileService fileService;
	@Resource private SerialService serialService;
	@Resource private QRcodeService qrcodeService;
	
	private static final Logger log = LoggerFactory.getLogger(AdService.class);
	private static final String path = "ad";

	public List<AdVO> selectAdList(AdVO adVO) throws Exception{
		return adMapper.selectAdList(adVO);
	}

	public int insertAdList(AdVO adVO) throws Exception{
		return adMapper.insertAdList(adVO);
	}

	public void deleteAdList(AdVO adVO) throws Exception{
		adMapper.deleteAdList(adVO);
		fileService.deleteFileList(0, adVO.getIdx(), null);
	}
	
	public void adWrite(AdVO adVO, int repIdx, List<MultipartFile> repFile, List<MultipartFile> uploadFile,
			int[] deleteIdx, int[] fileIdx) throws Exception {
		
		List<FileVO> fileVOList = new ArrayList<FileVO>();
		String serialNumber = serialService.createSerialNumber("A");
		adVO.setAdCode(serialNumber);
		
		if (adVO.getType().equals("copy")) {
			adVO.setIdx(0);
			insertAdList(adVO);
			copyAd(adVO, fileIdx, repIdx, deleteIdx);
			adVO.setqIdx(0);
		
		} else {
			fileService.setDeleteIdx(deleteIdx);
			insertAdList(adVO);
			fileService.updateAdState(repIdx, adVO.getIdx());
		}
		
		int qIdx = qrcodeService.createQRcode(adVO.getqIdx(), adVO.getIdx(), adVO.getUrl());
		adVO.setqIdx(qIdx);
		
		fileService.listSetting(adVO.getIdx(), "A", repFile, fileVOList, path);
		fileService.listSetting(adVO.getIdx(), "D", uploadFile, fileVOList, path);
		
		if (fileVOList.size() > 0) {
			fileService.insertFile(adVO.getIdx(), fileVOList);
		}
	}
	
	public Long selectAdCnt(AdVO adVO) throws Exception {
		HashMap<String, Long> map = adMapper.selectAdCnt(adVO);
		
		return map.get("adCnt");
	}
	
	public List<AdVO> selectAdListAjax(HashMap<String, Object> param) throws Exception {


		return adMapper.selectAdListAjax(param);
	}
	
	public void copyAd(AdVO adVO, int[] fileIdx, int repIdx, int[] deleteIdx) throws Exception {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		for (int idx : deleteIdx) {
			
			for (int i = 0; i < fileIdx.length; i++) {
				
				if (fileIdx[i] == idx) { 
					fileIdx[i] = 0;
				}
			}
			
		}
		
		map.put("fileIdx", fileIdx);
		map.put("parent", adVO.getIdx());
		map.put("repIdx", repIdx);
		map.put("repType", "A");
		map.put("imgType", "D");
		
		fileMapper.copyFile(map);		
	}

	public AdVO selecAdDetail(AdVO avo) throws Exception {
		return adMapper.selecAdDetail(avo);
	}

	public List<HashMap<String, Object>> selectAdOwnerList(HashMap<String, Object> param) throws Exception {
		return odMapper.selectAdOwnerList(param);
	}

	public int selectAdOwnerCnt(HashMap<String, Object> param) throws Exception {
		return odMapper.selectAdOwnerCnt(param);
	}

	public AdVO selecAdListVo(AdVO adVO) throws Exception {
		List<AdVO> list = adMapper.selectAdList(adVO);
		return !list.isEmpty() ? list.get(0) : null;
	}

	

}