package com.boxads.main.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.boxads.common.ExcelDown;
import com.boxads.common.vo.ExcelVO;
import com.boxads.common.vo.PageVO;
import com.boxads.main.service.BoardService;
import com.boxads.main.service.FileService;
import com.boxads.main.vo.AdminVO;
import com.boxads.main.vo.BoardVO;
import com.boxads.main.vo.FileVO;
import com.boxads.member.vo.MemberVO;
import com.boxads.setting.service.SettingService;
import com.boxads.setting.vo.CodeVO;
	

@Controller
@RequestMapping(value = "/board")
public class BoardController {
	
	@Resource private BoardService boardService;
	@Resource private FileService fileService;
	@Resource private SettingService settingService;
	
	private static final Logger log = LoggerFactory.getLogger(BoardController.class);
	
	public int getAdminIdx(HttpSession session) {
		AdminVO admin = (AdminVO) session.getAttribute("login");
		return admin.getIdx();
	}
	    
	// 공지사항, FAQ, 문의사항 게시판 조회
    @RequestMapping(value = "/list")
    public String boardInit(@ModelAttribute BoardVO boardVO, PageVO pvo, CodeVO cvo,
    				   Model model) throws Exception {
    	log.info("boardInit메서드 시작");
    	
    	List<BoardVO> boardList;
    	List<CodeVO> setList;
    	
    	boardVO.setStart(pvo.getStart());
    	boardVO.setEnd(pvo.getEnd());
    	
    	if (!boardVO.getType().equals("Q")) {
    		boardList = boardService.selectBoardList(boardVO);
    		setList = settingService.selectCodeList(cvo);
    		
    		model.addAttribute("setList", setList);
    		
    		pvo.setTotalCnt(boardService.selectBoardCnt(boardVO));
    	
    	} else {
    		boardList = boardService.selectQnaList(boardVO);
    		pvo.setTotalCnt(boardService.selectQnaCnt(boardVO));
    	}
    	
    	model.addAttribute("boardList", boardList);
    	model.addAttribute("page", pvo);
   
    	return "sub/notice_list";
    }
    
    // 공지사항, FAQ, 문의사항 상세보기 이동
    @RequestMapping(value = "/detail")
    public String boardDetail(@ModelAttribute BoardVO boardVO, Model model) throws Exception {
    	log.info("boardDetail메서드 시작");
    	
    	List<BoardVO> boardList;
    	List<BoardVO> replyList;
    	List<FileVO> fileList = fileService.selectFileList(boardVO);
    	
    	if (!boardVO.getType().equals("Q")) {
    		boardList = boardService.selectBoardList(boardVO);
        
    	} else {
    		boardVO.setParent(boardVO.getIdx());
    		boardList = boardService.selectQnaList(boardVO);
    		replyList = boardService.selectReplyList(boardVO);
    		
    		if(!replyList.isEmpty()) {
    			for (BoardVO b : replyList) {
    				b.setType("R");
    				List<FileVO> replyFileList = fileService.selectFileList(b);
    				b.setFileList(replyFileList);
				}
    		}
    		
        	model.addAttribute("qnaList", replyList);
        }
    	
    	model.addAttribute("boardList", boardList);
    	model.addAttribute("fileList", fileList);
    	
    	return "sub/notice_view";
    }
    
    // 공지사항, FAQ 등록/수정 페이지 이동
    @RequestMapping(value = "/register")
    public String registerInit(@ModelAttribute BoardVO boardVO, CodeVO cvo, Model model) throws Exception {
    	log.info("registerInit메서드 시작");
    	
    	List<FileVO> fileList = fileService.selectFileList(boardVO);
    	List<BoardVO> boardList = new ArrayList<>();
    	List<CodeVO> setList;
    	boardList.add(new BoardVO());
    	
    	// 수정 페이지 이동시
    	if (boardVO.getIdx() != 0) {    	
    		boardList = boardService.selectBoardList(boardVO);    				       
	    }
    	
    	if (boardVO.getType().equals("F")) {
    		cvo.setIdx(0);
    		setList = settingService.selectCodeList(cvo);
    		
    		model.addAttribute("setList", setList);
    	}
    	
    	model.addAttribute("boardList", boardList);
    	
    	if (fileList.size() > 0) {
    		model.addAttribute("fileList", fileList);
    	}
    	return "sub/notice_write";
    }
    
    // 게시판 등록/수정 처리
    @RequestMapping(value = "/register", method = RequestMethod.POST)
    @ResponseBody
    public String register(@ModelAttribute BoardVO boardVO, 
    					   @RequestParam(required = false) List<MultipartFile> uploadFile,
    					   @RequestParam(defaultValue = "0") int[] deleteIdx,
    					   HttpSession session) throws Exception {
    	log.info("register메서드 시작");
    	
    	String returnUrl = "";
    	
    	boardVO.setWriter(getAdminIdx(session));
    	
    	// 등록
    	if (boardVO.getIdx() == 0) {
    		returnUrl = "/board/list?type=" + boardVO.getType();	    				        
    	
    	// 수정
    	} else {
    		returnUrl = "/board/detail?type=" + boardVO.getType() + "&idx=" + boardVO.getIdx();    
    	}
    	
    	boardService.insertBoard(boardVO, uploadFile, deleteIdx);
    	
    	return returnUrl;
    	
    }
    
    // 답변 달기 기능
    @RequestMapping(value = "/detail", method = RequestMethod.POST)
    @ResponseBody
    public String reply(@ModelAttribute BoardVO boardVO, 
    				   @RequestParam(required = false) List<MultipartFile> uploadFile,
    				   HttpSession session) throws Exception {
    	log.info("reply메서드 시작");
    	
    	int idx = boardVO.getIdx();
    	
    	boardVO.setWriter(getAdminIdx(session));
    	boardVO.setParent(boardVO.getIdx());
    	
    	boardService.insertReplyList(boardVO, uploadFile);
    	
    	return "/board/detail?type=Q&idx=" + idx;
    }
    
    // 게시판 삭제 처리
    @RequestMapping(value = "/delete")
    public String delete(@ModelAttribute BoardVO boardVO, Model model) throws Exception {		
    	log.info("delete메서드 시작");
    	
		boardService.deleteBoardList(boardVO);
	    
	    model.addAttribute("alertMsg", "삭제했습니다.");
	    model.addAttribute("redirectUrl", "/board/list?type=" + boardVO.getType());
    		
    	return "common/alert";
    }  
    
    
    
    
    // 배너, 알림 게시판 조회
    @RequestMapping(value = "/banner")
    public String bannerInit(@ModelAttribute BoardVO boardVO, PageVO pvo, Model model) throws Exception {
    	log.info("bannerInit메서드 시작");
    	
    	boardVO.setStart(pvo.getStart());
    	boardVO.setEnd(pvo.getEnd());
    	
    	List<BoardVO> boardList = boardService.selectBannerList(boardVO);
    	pvo.setTotalCnt(boardService.selectBannerCnt(boardVO));
    	
    	model.addAttribute("boardList", boardList);
    	model.addAttribute("page", pvo);
    	
    	return "sub/notice_list";
    }

    // 배너, 알림 상세 페이지 조회
    @RequestMapping(value = "/banner_detail")
    public String bannerDetail(@ModelAttribute BoardVO boardVO, Model model) throws Exception {
    	log.info("bannerDetail메서드 시작");
    	
    	List<BoardVO> boardList = boardService.selectBannerList(boardVO);
    	List<FileVO> fileList = fileService.selectFile(0, boardVO.getIdx(), "banner");
    	
    	model.addAttribute("boardList", boardList);
    	model.addAttribute("fileList", fileList);
    	return "sub/notice_view";
    }
    
    // 배너, 알림 게시판 등록/수정 페이지 이동
    @RequestMapping(value = "/banner_register")
    public String bannerRegisterInit(@ModelAttribute BoardVO boardVO, Model model) throws Exception {
    	log.info("bannerRegisterInit메서드 시작");
    	
    	List<BoardVO> boardList = new ArrayList<>();
    	List<FileVO> fileList = fileService.selectFile(0, boardVO.getIdx(), "banner");
    	boardList.add(new BoardVO());
    	
    	// 수정 페이지 이동시
    	if (boardVO.getIdx() != 0) {    		
    		boardList = boardService.selectBannerList(boardVO);
    	}
    	
    	if (fileList.size() > 0) {
    		model.addAttribute("fileList", fileList);
    	}
    	
    	model.addAttribute("boardList", boardList);
    
    	return "sub/notice_write";
    }
    
    // 배너, 알림 게시판 등록/수정 처리
    @RequestMapping(value = "/banner_register", method = RequestMethod.POST)
    public String bannerRegister(@ModelAttribute BoardVO boardVO,
    							 @RequestParam(required = false) List<MultipartFile> pcFile,
    							 @RequestParam(required = false) List<MultipartFile> mobileFile,
    							 HttpServletRequest req,
    							 HttpSession session, Model model) throws Exception {
    	log.info("detail메서드 시작");
    	
    	boardVO.setWriter(getAdminIdx(session));
    	
    	if (boardVO.getIdx() == 0) {
	    	model.addAttribute("redirectUrl", "/board/banner?type=" + boardVO.getType());
	    	model.addAttribute("alertMsg", "등록되었습니다.");
	    
	    // 수정 페이지
    	} else {
	        model.addAttribute("redirectUrl", "/board/banner_detail?type=" + boardVO.getType() + "&idx=" + boardVO.getIdx());
	        model.addAttribute("alertMsg", "수정되었습니다.");
    	}
    	
    	boardService.insertBanner(boardVO, pcFile, mobileFile, req);
    	
    	
    	
    	
    	return "common/alert";
    }

    
    // 배너, 알림 게시판 삭제 처리
    @RequestMapping(value = "/banner_delete")
    public String bannerDelete(@ModelAttribute BoardVO boardVO, Model model) throws Exception {
    	log.info("bannerDelete메서드 시작");
    	
		boardService.deleteBannerList(boardVO);
	   
	    model.addAttribute("alertMsg", "삭제했습니다.");
	    model.addAttribute("redirectUrl", "/board/banner?type=" + boardVO.getType());

    	return "common/alert";
    }
    
    // 약관 type = S / P / C
    @RequestMapping(value = "/terms")
    public String selectTerms(BoardVO boardVO, Model model) throws Exception {    	
    	log.info("selectTerms메서드 시작");
    	
    	BoardVO vo = boardService.selectTerms(boardVO);
    	model.addAttribute("term", vo);
		return "manage/term_write";
    }
    
    @RequestMapping(value = "/insertTerms")
    public String insertTerms(@RequestParam HashMap<String, Object> param, Model model) throws Exception {
    	log.info("insertTerms메서드 시작");
    	
    	int success = boardService.insertTerms(param);
    	
		if(success == 0) {
    		model.addAttribute("alertMsg","등록을 실패했습니다.");
		}else {
			model.addAttribute("alertMsg","등록 되었습니다.");		
			model.addAttribute("redirectUrl","/board/terms?type="+param.get("type"));
		}
		
		return "common/alert";
    }
    
}