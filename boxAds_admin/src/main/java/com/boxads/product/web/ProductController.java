package com.boxads.product.web;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.authentication.encoding.ShaPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.boxads.common.vo.PageVO;
import com.boxads.main.ObjectUtil;
import com.boxads.main.mapper.AdminMapper;
import com.boxads.main.service.BoardService;
import com.boxads.main.service.CommonService;
import com.boxads.main.service.FileService;
import com.boxads.setting.service.SettingService;
import com.boxads.setting.vo.CodeVO;
import com.boxads.setting.vo.FeesVO;
import com.boxads.setting.vo.UnitVO;
import com.boxads.main.vo.AdminVO;
import com.boxads.main.vo.BoardVO;
import com.boxads.main.vo.FileVO;
import com.boxads.product.mapper.ProductMapper;
import com.boxads.product.service.ProductService;
import com.boxads.product.vo.ProductVO;


@Controller
@RequestMapping(value = "/product")
public class ProductController {
	@Resource private ProductService productService;
	@Resource private FileService fileService;
	@Resource private SettingService settingService;
	@Resource private BoardService boardService;

	private static final Logger log = LoggerFactory.getLogger(ProductController.class);
	@Resource(name="ShaPasswordEncoder") private ShaPasswordEncoder spe;
	
	private static String fileType = "";

	// 상품관리 리스트 조회
	@RequestMapping(value = "/list")
    public String productInit(@ModelAttribute ProductVO product, PageVO pvo, Model model) throws Exception{
		
		product.setStart(pvo.getStart());
		product.setEnd(pvo.getEnd());
		
		List<ProductVO> productMap = productService.selectProductList(product);
		pvo.setTotalCnt(productService.selectProductCnt(product));
		
		model.addAttribute("productList", productMap);
		model.addAttribute("page", pvo);
        return "product/product_list";
    }
	
	// 상품관리 상세 페이지 이동
	@RequestMapping(value = "/detail")
	public String productDetail(@ModelAttribute ProductVO product, CodeVO cvo, Model model) throws Exception{
		
		if (product.getType() != null && product.getType().equals("A")) {
			model.addAttribute("reasonList", productService.selectReason(product.getIdx(), "A"));
			fileType = "A";
		} else {
			fileType = "B";
			model.addAttribute("reasonList", productService.selectReason(product.getIdx(), "B"));
		}
		
		List<ProductVO> productMap = productService.selectProductList(product);
		List<FileVO> fileList = fileService.selectFile(0, product.getIdx(), fileType);
		
		cvo.setIdx(0);
		cvo.setDepth(1);
		cvo.setType("C");
		cvo.setUseFlag("Y");
		List<CodeVO> codeList = settingService.selectCodeList(cvo);
		
		if (product.getIdx() != 0) {
			model.addAttribute("productList", productMap.get(0));
			model.addAttribute("fileList", fileList);
			model.addAttribute("codeList", codeList);
		}
		
	    return "product/product_detail";
	}
		
	// 상품관리 상품 업데이트
	@RequestMapping(value = "/detail", method = RequestMethod.POST)
	@ResponseBody
	public String productUpdate(@ModelAttribute ProductVO product, 
								@RequestParam(required = false) List<MultipartFile> uploadFile,
								@RequestParam(required = false) List<MultipartFile> repFile,
								@RequestParam(defaultValue = "0") int repIdx,
								@RequestParam(defaultValue = "0") int[] deleteIdx,
								Model model) throws Exception {	
		
		if (product.getType() == null) {
			productService.boxWrite(product, repIdx, repFile, uploadFile, deleteIdx);
			return "/product/detail?idx=" + product.getIdx();
		} else {
			productService.adWrite(product, repIdx, repFile, uploadFile, deleteIdx);
			return "/product/detail?idx=" + product.getIdx() + "&type=" + product.getType();
		}
		

	    
	}
	
	// 코드 조회
    @RequestMapping(value = "/select_code", method = RequestMethod.POST)
    @ResponseBody
    public HashMap<String, Object> selectCode(@ModelAttribute CodeVO cvo) throws Exception {
    	log.info("selectCode시작");
    	
    	List<CodeVO> codeList = settingService.selectCodeList(cvo);
    	
    	HashMap<String, Object> map = new HashMap<String, Object>();
    	map.put("codeList", codeList);
    	
    	return map;
    }
   
}
