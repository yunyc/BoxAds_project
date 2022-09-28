package com.boxads.box.web;

import java.util.HashMap;
import java.util.List;
import java.util.Locale.Category;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.poi.ss.formula.ptg.MemErrPtg;
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
import com.boxads.box.service.BoxService;
import com.boxads.box.service.CodeService;
import com.boxads.box.vo.BoxVO;
import com.boxads.box.vo.CodeVO;
import com.boxads.main.ObjectUtil;
import com.boxads.main.service.BoardService;
import com.boxads.main.service.CommonService;
import com.boxads.main.service.FileService;
import com.boxads.main.service.MemberService;
import com.boxads.main.vo.AdminVO;
import com.boxads.main.vo.BoardVO;
import com.boxads.main.vo.FileVO;
import com.boxads.main.vo.MemberVO;
import com.boxads.main.web.BoardController;


@Controller
@RequestMapping("/box")
public class BoxController {
	
	private static final Logger log = LoggerFactory.getLogger(BoxController.class);

	@Resource(name="ShaPasswordEncoder") private ShaPasswordEncoder spe;
	@Resource private CodeService codeService;
	@Resource private BoxService boxService;
	@Resource private FileService fileService;
	@Resource private MemberService memberService;
	@Resource private BoardService boardService;
	@Resource private AdService adService;
	@Resource private CommonService commonService;
	
	// 박스 대표 이미지 타입
	private static final String repType = "E";
	// 박스 이미지 타입
	private static final String imgType = "I";
	private static final String profileType = "P";
	
	// 마이 박스 관리 조회
	@RequestMapping(value = "/list")
    public String boxInit(@ModelAttribute BoxVO boxVO, HttpSession session, Model model) throws Exception {
    	log.info("boxInit시작");
		MemberVO memberVO = (MemberVO) session.getAttribute("login");
		
		int myCash = memberService.selectCash(memberVO.getIdx());
		
		boxVO.setWriter(memberVO.getIdx());
    	List<BoxVO> boxList = boxService.selectBoxList(boxVO);
    	Long boxCnt = boxService.selectBoxCnt(boxVO);
    	
    	model.addAttribute("boxList", boxList);
    	model.addAttribute("cnt", boxCnt);
    	model.addAttribute("myCash", myCash);
    	model.addAttribute("type", "box");

    	return "boxad/boxad_list";
    }
	
	// 박스 상세 페이지 조회
	@RequestMapping(value = "/detail")
    public String boxDetail(@ModelAttribute BoxVO boxVO, Model model, BoardVO boardVO, HttpSession session) throws Exception {
		log.info("boxDetail시작");
		
		commonService.updateViewCnt(boxVO.getIdx(), "box_product");
		List<FileVO> fileList = fileService.selectFileList(0, boxVO.getIdx(), repType);
				
		// 상세
		boxVO.setmIdx(memberService.getMemberId(session));
		BoxVO bvo = boxService.selectBoxListVo(boxVO);
		model.addAttribute("boxList", bvo);
		
		// 판매자의 다른	
		boxVO.setWriter(bvo.getWriter());
		boxVO.setIdx(0);
		boxVO.setState("Y");
		
		List<BoxVO> boxList = boxService.selectBoxList(boxVO);
		Long boxCnt = boxService.selectBoxCnt(boxVO);
		
		if (boxList != null) {			
			switch(boxList.get(0).getSecPro()) {			
			case "전단지" : case "스티커" :
				boardVO.setType("CP");
				break;
			case "샘플" :
				boardVO.setType("CS");
				break;
			}				
		}
		
		model.addAttribute("boxes", boxList);
		model.addAttribute("boxCnt", boxCnt - 1);
		model.addAttribute("fileList", fileList);
		model.addAttribute("terms", boardService.selectTerms(boardVO));
    	
    	return "boxad/box_detail";
    }
	
	// 마이 박스 등록 페이지 이동, 수정
    @RequestMapping(value = {"/write", "/copy"})
    public String boxWriteInit(@ModelAttribute BoxVO boxVO, Model model) throws Exception {
    	log.info("boxWriteInit시작");
    	List<CodeVO> codeList = codeService.settingSelect();
    	
    	if (boxVO.getIdx() != 0) {
    		
    		BoxVO box = boxService.selectBoxList(boxVO).get(0);
    		if(boxVO.getType() != null && boxVO.getType().equals("copy")) { box.setState("N"); } 
    		model.addAttribute("boxList", box);
    		model.addAttribute("fileList", fileService.selectFileList(0, boxVO.getIdx(), repType));
    		model.addAttribute("reasonList", commonService.selectReason(boxVO.getIdx(), "B"));
    	}
    	
    	model.addAttribute("codeList", codeList);
    	return "boxad/box_write";
    }
    
    // 마이 박스 등록 처리, 수정
    @RequestMapping(value = {"/write", "copy"}, method = RequestMethod.POST)
    @ResponseBody
    public String boxWrite(@ModelAttribute BoxVO boxVO,
    					   @RequestParam(required = false) List<MultipartFile> uploadFile,
    					   @RequestParam(required = false) List<MultipartFile> repFile,
    					   @RequestParam(defaultValue = "0") int repIdx,
    					   @RequestParam(defaultValue = "0") int[] deleteIdx,
    					   @RequestParam(defaultValue = "0") int[] fileIdx,
    					   HttpSession session) throws Exception {
    	log.info("boxWrite시작");
    	boxVO.setWriter(ObjectUtil.getMember(session).getIdx());
    	
    	if (boxVO.getState() == null) {
    		boxVO.setState("N");
    	}

    	boxService.boxWrite(boxVO, repIdx, repFile, uploadFile, deleteIdx, fileIdx);
    	
    	return "/box/list";
    }
    
    // 마이 박스 삭제
    @RequestMapping(value = "/delete")
    public String boxWrite(@ModelAttribute BoxVO boxVO, Model model) throws Exception {
    	log.info("boxWrite시작");
    	boxService.deleteBox(boxVO);
    	
    	model.addAttribute("alertMsg", "삭제되었습니다.");
    	model.addAttribute("redirectUrl", "/box/list");
    	
    	return "/common/alert";
    }
    
    // 코드 조회
    @RequestMapping(value = "/select_code", method = RequestMethod.POST)
    @ResponseBody
    public HashMap<String, Object> selectCode(@ModelAttribute CodeVO cvo) throws Exception {
    	log.info("selectCode시작");
    	
    	List<CodeVO> codeList = codeService.selectCodeList(cvo);
    	
    	HashMap<String, Object> map = new HashMap<String, Object>();
    	map.put("codeList", codeList);
    	
    	return map;
    }
    
    // 마이 박스 리스트
    @RequestMapping(value = "/boxMyList", method = RequestMethod.POST)
    public String bxMyList(@ModelAttribute BoxVO boxVO, HttpSession session, Model model) throws Exception { 

    	log.info("LOG: 박스 정보 " + boxVO);
    	
    	MemberVO mvo = ObjectUtil.getMember(session);
    	boxVO.setWriter(mvo.getIdx());

    	List<BoxVO> list = boxService.selectBoxList(boxVO);
    	model.addAttribute("list", list);
    	model.addAttribute("type", "my");

    	return "list/box_list";
    }
    
    // 공통 박스 리스트
    @RequestMapping(value = "/bxAjaxList", method = RequestMethod.POST)
    public String bxAjaxList(@RequestParam HashMap<String, Object> param, 
    						 @RequestParam(defaultValue = "N") String favFlag, HttpSession session, Model model) throws Exception { 

    	param.put("state", "Y");
    	
    	if (favFlag.equals("Y")) {
    		param.put("favFlag", favFlag);
    		param.put("state", "");
    	}
    	
    	log.info("LOG: 박스 정보 " + param);
    	
    	MemberVO mvo = ObjectUtil.getMember(session);

    	param.put("start", Integer.parseInt(param.get("start").toString()));
    	param.put("end", Integer.parseInt(param.get("end").toString()));
    	if(mvo != null) { param.put("mIdx", mvo.getIdx()); }
    	
    	List<BoxVO> list = boxService.selectBoxListAjax(param);
    	model.addAttribute("list", list);

    	return "list/box_list";
    }
    
    // 박스 구매 리스트
    @RequestMapping(value = "/boxBuyAjaxList")
    public String boxBuyAjaxList(@RequestParam HashMap<String, Object> param, HttpSession session, Model model) throws Exception { 
    	log.info("LOG: 박스 구매 리스트 " + param);

    	param.put("writer", ObjectUtil.getMember(session).getIdx());    	
    	param.put("start", Integer.parseInt(param.get("start").toString()));
    	param.put("end", Integer.parseInt(param.get("end").toString()));
    	param.put("type", "B%");

    	List<HashMap<String, Object>> list = adService.selectAdOwnerList(param);
    	model.addAttribute("list", list);
    	model.addAttribute("type", "B");

    	return "list/ad_owner_list";
    }
    
    // 박스 구매 
    @RequestMapping(value = "/box_buy")
    public String boxBuy(@RequestParam HashMap<String, Object> param, HttpSession session, Model model) throws Exception { 
    	log.info("LOG: 박스 구매 리스트 " + param);

    	int mIdx = ObjectUtil.getMember(session).getIdx();
    	
    	//  보유캐시
    	int myCash = memberService.selectCash(mIdx);
    	
    	// total
    	param.put("writer", mIdx);
    	param.put("type", "B%");
    	int total = adService.selectAdOwnerCnt(param);

    	model.addAttribute("total", total);
    	model.addAttribute("myCash", myCash);
    	
    	return "mybox/buy_list";
    }
    
    // 마이 박스 판매
    @RequestMapping(value = "/boxSellAjaxList")
    public String boxSellAjaxList(@RequestParam HashMap<String, Object> param, HttpSession session, Model model) throws Exception { 
    	log.info("LOG: 마이 박스 판매 리스트 " + param);

    	param.put("writer", ObjectUtil.getMember(session).getIdx());    	
    	param.put("start", Integer.parseInt(param.get("start").toString()));
    	param.put("end", Integer.parseInt(param.get("end").toString()));
    	param.put("type", "B%");

    	List<HashMap<String, Object>> list = boxService.selectBoxOwnerList(param);
    	model.addAttribute("list", list);
    	model.addAttribute("type", "B");

    	return "list/box_owner_list";
    }
    
    // 마이 박스 판매 리스트
    @RequestMapping(value = "/box_sell")
    public String boxSell(@RequestParam HashMap<String, Object> param, HttpSession session, Model model) throws Exception { 
    	log.info("LOG: 마이 박스 판매 리스트 " + param);

    	int mIdx = ObjectUtil.getMember(session).getIdx();
    	
    	//  보유캐시
    	int myCash = memberService.selectCash(mIdx);
    	
    	// total
    	param.put("writer", mIdx);
    	param.put("type", "B%");
    	int total = boxService.selectBoxOwnerCnt(param);

    	model.addAttribute("total", total);
    	model.addAttribute("myCash", myCash);
    	
    	return "mybox/sell_list";
    }
}
