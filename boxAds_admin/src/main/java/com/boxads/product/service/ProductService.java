package com.boxads.product.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.beanutils.BeanUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.boxads.main.service.FileService;
import com.boxads.main.vo.AdminVO;
import com.boxads.main.vo.FileVO;
import com.boxads.member.vo.MemberVO;
import com.boxads.product.mapper.ProductMapper;
import com.boxads.product.vo.ProductVO;
import com.boxads.setting.mapper.SettingMapper;
import com.boxads.setting.vo.CodeVO;
import com.boxads.setting.vo.FeesVO;
import com.boxads.setting.vo.UnitVO;


@Transactional
@Service
public class ProductService {
	@Resource
	private ProductMapper productMapper;
	
	@Resource
	private FileService fileService;
	
	
	public List<ProductVO> selectProductList(ProductVO pvo) throws Exception {
		return productMapper.selectProductList(pvo);
	}
	public int updateProductList(ProductVO pvo) throws Exception {
		return productMapper.updateProductList(pvo);
	}
	public int deleteProductList(ProductVO pvo) throws Exception {
		return productMapper.deleteProductList(pvo);
	}
	
	public Long selectProductCnt(ProductVO pvo) throws Exception {
		
		HashMap<String, Long> map = productMapper.selectProductCnt(pvo);
		return map.get("productCnt");
	}
	
	public void boxWrite(ProductVO pvo, int repIdx, List<MultipartFile> repFile, List<MultipartFile> uploadFile, int[] deleteIdx) throws Exception {
		
		List<FileVO> fileVOList = new ArrayList<FileVO>();
		
		fileService.setDeleteIdx(deleteIdx);
		fileService.updateBoxState(repIdx, pvo.getIdx());
		updateProductList(pvo);
	
		fileService.listSetting(0, pvo.getIdx(), "E", "/box", repFile, fileVOList);
		fileService.listSetting(0, pvo.getIdx(), "I", "/box", uploadFile, fileVOList);
		
		if (fileVOList.size() > 0) {
			fileService.insertFile(pvo.getIdx(), fileVOList);
		}

	}
	
	public void adWrite(ProductVO pvo, int repIdx, List<MultipartFile> repFile, List<MultipartFile> uploadFile, int[] deleteIdx) throws Exception {
		
		List<FileVO> fileVOList = new ArrayList<FileVO>();
		
		fileService.setDeleteIdx(deleteIdx);
		fileService.updateAdState(repIdx, pvo.getIdx());
		updateProductList(pvo);
	
		fileService.listSetting(0, pvo.getIdx(), "A", "/ad", repFile, fileVOList);
		fileService.listSetting(0, pvo.getIdx(), "D", "/ad", uploadFile, fileVOList);
		
		if (fileVOList.size() > 0) {
			fileService.insertFile(pvo.getIdx(), fileVOList);
		}

	}
	
	public List<HashMap<String, String>> selectListExcel(ProductVO product) throws Exception {
		List<HashMap<String, String>> datalist = new ArrayList<HashMap<String, String>>();
		List<ProductVO> list = productMapper.selectProductList(product);
		
		for (ProductVO m : list) {
			HashMap<String, String> data = (HashMap<String, String>) BeanUtils.describe(m);
			datalist.add(data);
		}
		
		return datalist;
	}
	
	public void insertReason(HashMap<String, Object> param) throws Exception {
		productMapper.insertReason(param);
	}
	
	public List<HashMap<String, Object>> selectReason(int parent, String type) throws Exception {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("parent", parent);
		map.put("type", type);
		
		return productMapper.selectReason(map);
	}


}
