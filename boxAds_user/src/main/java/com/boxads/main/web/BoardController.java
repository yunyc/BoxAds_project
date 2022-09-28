package com.boxads.main.web;

import java.util.ArrayList;
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

import com.boxads.box.vo.BoxVO;
import com.boxads.main.ObjectUtil;
import com.boxads.main.service.BoardService;
import com.boxads.main.service.CommonService;
import com.boxads.main.service.FileService;
import com.boxads.main.service.MemberService;
import com.boxads.main.vo.BoardVO;
import com.boxads.main.vo.FileVO;
import com.boxads.main.vo.MemberVO;


@Controller
@RequestMapping("/board")
public class BoardController {

	private static final Logger log = LoggerFactory.getLogger(BoardController.class);
	@Resource(name="ShaPasswordEncoder") private ShaPasswordEncoder spe;
	@Resource private BoardService boardService;
	@Resource private FileService fileService;
	@Resource private CommonService commonService;
	
	// 공지사항, FAQ,  리스트 조회
    @RequestMapping(value = "/list")
    public String noticeInit(@ModelAttribute BoardVO boardVO, HttpSession session, Model model) throws Exception {
    	log.info("noticeInit메서드 시작");
    	String returnUrl = "";
    	
    	if (boardVO.getType().equals("Q")) {
    		returnUrl = "board/question_list";
    		
    	} else if (boardVO.getType().equals("F")) {
    		List<HashMap<String, Object>> map = boardService.selectCodeList();
    		model.addAttribute("setList", map);
    		model.addAttribute("setListCnt", map.size());
    		returnUrl = "board/faq";
    		
    	} else {
    		returnUrl = "board/notice_list";
    	}
    	
    	boardVO.setState("Y");
    	Long boardCnt = boardService.selectBoardCnt(boardVO);
    	model.addAttribute("boardCnt", boardCnt);
    	
    	return returnUrl;
    }
    
    //1:1 문의사항
    @RequestMapping(value = "/qna")
    public String qnaInit(@ModelAttribute BoardVO boardVO, HttpSession session, Model model) throws Exception {
    	log.info("qnaInit메서드 시작");
    	MemberVO member = (MemberVO) session.getAttribute("login");
    	boardVO.setState("Y");
    	
    	boardVO.setWriter(member.getIdx());
    	model.addAttribute("boardList", boardService.selectQnaList(boardVO));
    	
    	Long boardCnt = boardService.selectBoardCnt(boardVO);
    	model.addAttribute("boardCnt", boardCnt);
    	
    	return "board/question_list";
    	
    }
    
    
    
    // 공지사항, 1:1 문의사항 상세보기
    @RequestMapping(value = "/detail")
    public String detailInit(@ModelAttribute BoardVO boardVO, Model model) throws Exception {
    	log.info("detailInit메서드 시작");
    	boardVO.setState("Y");
    	
    	if (boardVO.getType().equals("Q")) {
    		commonService.updateViewCnt(boardVO.getIdx(), "board_qna");
    		model.addAttribute("boardList", boardService.selectQnaList(boardVO));
    		model.addAttribute("fileList", fileService.selectFileList(0, boardVO.getIdx(), boardVO.getType()));
    		model.addAttribute("qnaList", boardService.selectReplyList(boardVO));
    		model.addAttribute("qnaFileList", fileService.selectQnaFileList(boardVO.getIdx(), "R"));
    		return "board/question_view";
    	
    	} else {
    		commonService.updateViewCnt(boardVO.getIdx(), "board");
    		model.addAttribute("boardList", boardService.selectBoardList(boardVO));
        	model.addAttribute("fileList", fileService.selectFileList(0, boardVO.getIdx(), boardVO.getType()));
        	return "board/notice_view";
    	}
    	
    }
    
    
    // 1:1문의사항 작성 페이지 이동
    @RequestMapping(value = "/qna_write")
    public String qnaWriteInit() throws Exception {
    	log.info("qnaWriteInit메서드 시작");
    	return "board/question_write";
    }
    
    // 1:1문의사항 작성
    @RequestMapping(value = "/qna_write", method = RequestMethod.POST)
    @ResponseBody
    public String qnaWrite(@ModelAttribute BoardVO boardVO, 
    					   @RequestParam(required=false) List<MultipartFile> uploadFile) throws Exception {
    	log.info("qnaWrite메서드 시작");
    	boardVO.setState("Y");
    	boardService.insertQnaList(boardVO, uploadFile);
    	
    	return "/board/qna?type=Q";
    }
    
    // 1:1문의사항 삭제
    @RequestMapping(value = "/qna_delete")
    public String qnaDelete(@ModelAttribute BoardVO boardVO, Model model) throws Exception {
    	log.info("qnaDelete메서드 시작");
    	boardService.deleteQnaList(boardVO);
    	
    	model.addAttribute("alertMsg", "삭제되었습니다.");
    	model.addAttribute("redirectUrl", "/board/qna?type=Q");
    	return "common/alert";
    }
    
    // 공통 게시글 리스트
    @RequestMapping(value = "/boardAjaxList", method = RequestMethod.POST)
    public String bxAjaxList(@ModelAttribute BoardVO boardVO, HttpSession session, Model model) throws Exception { 
    	log.info("LOG: 박스 정보 " + boardVO);
    	
    	MemberVO member = (MemberVO) session.getAttribute("login");
    	
    	if (boardVO.getType().equals("Q")) {
    		boardVO.setWriter(member.getIdx());
    		model.addAttribute("boardList", boardService.selectQnaList(boardVO));
    		model.addAttribute("type", boardVO.getType());
    		return "list/board_list";
    		
    	} else if (boardVO.getType().equals("F")) {
    		
    	} 
    		
    	boardVO.setState("Y");
    	model.addAttribute("boardList", boardService.selectBoardList(boardVO));
    	model.addAttribute("type", boardVO.getType());
    	model.addAttribute("start", boardVO.getStart());
    	model.addAttribute("total", boardService.selectBoardCnt(boardVO));
    	
    	return "list/board_list";
    }
    
    // 이용약관
    @RequestMapping(value = "/terms")
    public String termInit(@ModelAttribute BoardVO boardVO, Model model) throws Exception {
    	log.info("termInit메서드 시작");
    	model.addAttribute("boardVO", boardService.selectTerms(boardVO));
    	
    	if (boardVO.getType().equals("S")) {
    		return "board/terms";
    	
    	} else {
    		return "board/policy";
    	}
    }
    
    // 마케팅
    @RequestMapping(value = "/marketing")
    public String marketing(Model model) throws Exception {
    	log.info("termInit메서드 시작");
    	
    	return "board/marketing";
    }

}
