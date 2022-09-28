package com.boxads.ad.web;

import java.util.HashMap;
import java.util.List;

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

import com.boxads.ad.service.AdService;
import com.boxads.ad.vo.AdVO;
import com.boxads.box.service.BoxService;
import com.boxads.box.service.CodeService;
import com.boxads.box.vo.BoxVO;
import com.boxads.box.vo.CodeVO;
import com.boxads.common.service.QRcodeService;
import com.boxads.main.ObjectUtil;
import com.boxads.main.service.CommonService;
import com.boxads.main.service.FileService;
import com.boxads.main.service.MemberService;
import com.boxads.main.vo.FileVO;
import com.boxads.main.vo.MemberVO;


@Controller
@RequestMapping("/ad")
public class AdController {
	
	private static final Logger log = LoggerFactory.getLogger(AdController.class);

	@Resource(name="ShaPasswordEncoder") private ShaPasswordEncoder spe;
	@Resource private CodeService codeService;
	@Resource private AdService adService;
	@Resource private FileService fileService;
	@Resource private MemberService memberService;
	@Resource private CommonService commonService;
	@Resource private BoxService boxService;
	@Resource private QRcodeService qrcodeService;
	
	// 박스 대표 이미지 타입
	private static final String repType = "A";
	// 박스 이미지 타입
	private static final String imgType = "D";
	private static final String profileType = "P";
	
	// 마이 애드 관리 조회
	@RequestMapping(value = "/list")
    public String adInit(@ModelAttribute AdVO adVO, HttpSession session, Model model) throws Exception {
		log.info("adInit시작");
		
		MemberVO memberVO = (MemberVO) session.getAttribute("login");
		adVO.setWriter(memberVO.getIdx());
		
		int myCash = memberService.selectCash(memberVO.getIdx());
		
		List<AdVO> adList = adService.selectAdList(adVO);
		Long adCnt = adService.selectAdCnt(adVO);
		
		model.addAttribute("adList", adList);
		model.addAttribute("cnt", adCnt);
		model.addAttribute("type", "ad");
		model.addAttribute("myCash", myCash);

    	return "boxad/boxad_list";
    }
	
	// 마이 애드 상세 페이지
	@RequestMapping(value = "/detail")
    public String adDetail(@ModelAttribute AdVO adVO, Model model, HttpSession session) throws Exception {
		log.info("adDetail시작");

		commonService.updateViewCnt(adVO.getIdx(), "ad_product");
		List<FileVO> fileList = fileService.selectFileList(0, adVO.getIdx(), repType);
				
		// 상세
		adVO.setmIdx(memberService.getMemberId(session));
		AdVO avo = adService.selecAdListVo(adVO);
		model.addAttribute("adList", avo);
		
		// 판매자의 다른
		adVO.setWriter(avo.getWriter());
		adVO.setIdx(0);
		adVO.setState("Y");
		
		List<AdVO> adList = adService.selectAdList(adVO);
		Long adCnt = adService.selectAdCnt(adVO);
		
		model.addAttribute("fileList", fileList);		
		model.addAttribute("ads", adList);
		model.addAttribute("adCnt", adCnt - 1);
    	
    	return "boxad/ad_detail";
    }
	
	// 마이 애드 등록, 수정 페이지 이동
    @RequestMapping(value = {"/write", "/copy"})
    public String adWriteInit(@ModelAttribute AdVO adVO, Model model) throws Exception {
    	log.info("adWriteInit시작");
    	
    	List<CodeVO> codeList = codeService.settingSelect();
    	List<HashMap<String, Object>> reasonList = commonService.selectReason(adVO.getIdx(), "A");
    	
    	if (adVO.getIdx() != 0) {
    		
    		AdVO ad = adService.selectAdList(adVO).get(0);    		    		
    		if(adVO.getType() != null && adVO.getType().equals("copy")) { ad.setState("N"); }
    		model.addAttribute("adList", ad);
    		model.addAttribute("fileList", fileService.selectFileList(0, adVO.getIdx(), repType));
    		model.addAttribute("qrcode", qrcodeService.selectQRcode(adVO));
    	}
    	
    	model.addAttribute("codeList", codeList);
    	model.addAttribute("reasonList", reasonList);

    	return "boxad/ad_write";
    }
    
    // 마이 애드 등록 처리, 수정
    @RequestMapping(value = {"/write", "/copy"}, method = RequestMethod.POST)
    @ResponseBody
    public String adWrite(@ModelAttribute AdVO adVO,
    					   @RequestParam(required = false) List<MultipartFile> uploadFile,
    					   @RequestParam(required = false) List<MultipartFile> repFile,
    					   @RequestParam(defaultValue = "0") int repIdx,
    					   @RequestParam(defaultValue = "0") int[] deleteIdx,
    					   @RequestParam(defaultValue = "0") int[] fileIdx,
    					   @RequestParam int imgCnt,
    					   HttpSession session) throws Exception {
    	log.info("adWrite시작");
    	
    	adVO.setWriter(ObjectUtil.getMember(session).getIdx());
    	
    	if (adVO.getState() == null) {
    		adVO.setState("N");
    	}
    	
    	if (adVO.getImgCnt() % 2 == 0) {
    		adVO.setSide("T"); // 양면
    	} else {
    		adVO.setSide("O"); // 단면
    	}
    	
    	adService.adWrite(adVO, repIdx, repFile, uploadFile, deleteIdx, fileIdx);
    	
    	return "/ad/list";
    }
    
    // 마이 애드 삭제
    @RequestMapping(value = "/delete")
    public String adWrite(@ModelAttribute AdVO adVO, Model model) throws Exception {
    	log.info("adWrite시작");
    	
    	adService.deleteAdList(adVO);
    	
    	model.addAttribute("alertMsg", "삭제되었습니다.");
    	model.addAttribute("redirectUrl", "/ad/list");
    	
    	return "/common/alert";
    }
    
    // 등록한 박스 목록 ajax로 가져오기
    @RequestMapping(value = "/select_box", method = RequestMethod.POST)
    @ResponseBody
    public HashMap<String, Object> selectBox(@ModelAttribute BoxVO boxVO,
    					   HttpSession session) throws Exception {
    	log.info("adWrite시작");
    	
    	HashMap<String, Object> map = new HashMap<String, Object>();
    	List<BoxVO> boxList = boxService.selectBoxList(boxVO);
    	
    	map.put("boxList", boxList);
    	
    	return map;
    }
    
    
    // 사유 등록
    @RequestMapping(value = "/reason", method = RequestMethod.POST)
    @ResponseBody
    public void msg(@RequestParam HashMap<String, Object> param) throws Exception {
    	commonService.insertReason(param);
    }
    
    // 마이 애드 리스트
    @RequestMapping(value = "/adMyList", method = RequestMethod.POST)
    public String bxMyList(@ModelAttribute AdVO adVO, HttpSession session, Model model) throws Exception { 

    	log.info("LOG: 박스 정보 " + adVO);
    	
    	MemberVO mvo = ObjectUtil.getMember(session);
    	adVO.setWriter(mvo.getIdx());

    	List<AdVO> list = adService.selectAdList(adVO);
    	model.addAttribute("list", list);
    	model.addAttribute("type", "my");

    	return "list/ad_list";
    }
    
    // 공통 광고, 찜목록 리스트
    @RequestMapping(value = "/adAjaxList", method = RequestMethod.POST)
    public String adAjaxList(@RequestParam HashMap<String, Object> param,
    						 @RequestParam(defaultValue = "N") String favFlag, HttpSession session, Model model) throws Exception {
    	
    	if (favFlag.equals("N")) {
    		param.put("state", "Y");
    	}
    	
    	param.put("favFlag", favFlag);
    	log.info("LOG: 애드 정보 " + param);

    	MemberVO mvo = ObjectUtil.getMember(session);
    	
    	param.put("start", Integer.parseInt(param.get("start").toString()));
    	param.put("end", Integer.parseInt(param.get("end").toString()));
    	if(mvo != null) { param.put("mIdx", mvo.getIdx()); }

    	List<AdVO> list = adService.selectAdListAjax(param);
    	model.addAttribute("list", list);

    	return "list/ad_list";
    }
    
    // 마이 애드 요청 리스트
    @RequestMapping(value = "/adRequestAjaxList")
    public String adRequestAjaxList(@RequestParam HashMap<String, Object> param, HttpSession session, Model model) throws Exception { 
    	log.info("LOG: 마이 애드 요청 " + param);

    	param.put("writer", ObjectUtil.getMember(session).getIdx());    	
    	param.put("start", Integer.parseInt(param.get("start").toString()));
    	param.put("end", Integer.parseInt(param.get("end").toString()));
    	param.put("type", "A%");
    	
    	List<HashMap<String, Object>> list = adService.selectAdOwnerList(param);
    	model.addAttribute("list", list);
    	model.addAttribute("type", "A");

    	return "list/ad_owner_list";
    }
    
    // 마이 애드 요청 
    @RequestMapping(value = "/ad_request")
    public String adRequest(@RequestParam HashMap<String, Object> param, HttpSession session, Model model) throws Exception { 
    	log.info("LOG: 마이 애드 요청 " + param);

    	int mIdx = ObjectUtil.getMember(session).getIdx();
    	
    	//  보유캐시
    	int myCash = memberService.selectCash(mIdx);
    	
    	// total
    	param.put("writer", mIdx);
    	param.put("type", "A%");
    	int total = adService.selectAdOwnerCnt(param);

    	model.addAttribute("total", total);
    	model.addAttribute("myCash", myCash);
    	
    	return "myad/request_list";
    }
    
    // 애드 신청
    @RequestMapping(value = "/ad_apply")
    public String adApply(@RequestParam HashMap<String, Object> param, HttpSession session, Model model) throws Exception { 
    	log.info("LOG: 애드 신청 " + param);

    	int mIdx = ObjectUtil.getMember(session).getIdx();
    	
    	//  보유캐시
    	int myCash = memberService.selectCash(mIdx);
    	
    	// total
    	param.put("writer", mIdx);
    	param.put("type", "A%");
    	int total = boxService.selectBoxOwnerCnt(param);

    	model.addAttribute("total", total);
    	model.addAttribute("myCash", myCash);
    	
    	return "myad/apply_list";
    }
    
    // 애드 신청 리스트
    @RequestMapping(value = "/adApplyAjaxList")
    public String adApplyAjaxList(@RequestParam HashMap<String, Object> param, HttpSession session, Model model) throws Exception { 
    	log.info("LOG: 애드 신청 " + param);

    	param.put("writer", ObjectUtil.getMember(session).getIdx());    	
    	param.put("start", Integer.parseInt(param.get("start").toString()));
    	param.put("end", Integer.parseInt(param.get("end").toString()));
    	param.put("type", "A%");
    	
    	List<HashMap<String, Object>> list = boxService.selectBoxOwnerList(param);
    	model.addAttribute("list", list);
    	model.addAttribute("type", "A");

    	return "list/box_owner_list";
    }
    
    
    
	
    
}
