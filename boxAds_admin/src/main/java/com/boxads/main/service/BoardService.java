package com.boxads.main.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.beanutils.BeanUtils;
import org.springframework.stereotype.Service;

import com.boxads.main.mapper.BoardMapper;
import com.boxads.main.vo.BoardVO;
import com.boxads.main.vo.FileVO;
import com.boxads.member.vo.MemberVO;

import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

@Transactional
@Service
public class BoardService{
	
	@Resource
	private BoardMapper boardMapper;
	
	@Resource
	private FileService fileService;
	
	@Resource
	private String uploadPath;
	
	public List<BoardVO> selectBoardList(BoardVO boardVO) throws Exception {
		return boardMapper.selectBoardList(boardVO); 
		
	}
	
	// 공지사항, FAQ 게시글 등록
	public void insertBoard(BoardVO boardVO, List<MultipartFile> uploadFile, int[] deleteIdx) throws Exception {
		
		List<FileVO> fileVOList = new ArrayList<FileVO>();
		
		boardMapper.insertBoardList(boardVO);
		
		fileService.setDeleteIdx(deleteIdx);
		fileService.listSetting(0, boardVO.getIdx(), boardVO.getType(), "/board", uploadFile, fileVOList);
		
		if (uploadFile.size() != 0) {
    	    fileService.insertFile(boardVO.getIdx(), fileVOList);
    	}
	}
	
	// 배너, 알림 게시글 등록
	public void insertBanner(BoardVO boardVO, List<MultipartFile> pcFile, List<MultipartFile> mobileFile,
			HttpServletRequest req) throws Exception {
		
		List<FileVO> fileVOList = new ArrayList<FileVO>();
		String type = "";
		String mobileType = "";
		FileVO pc = new FileVO();
		FileVO mobile = new FileVO();
		int pcIdx = 0;
		int mobileIdx = 0;
		
		if (req.getParameter("pcIdx") != null) {
			pcIdx = Integer.parseInt(req.getParameter("pcIdx"));
		}
		
		if (req.getParameter("mobileIdx") != null) {
			mobileIdx = Integer.parseInt(req.getParameter("mobileIdx"));
		}
		
		if (boardVO.getType().equals("B")) {
			type = "B";
			mobileType = "MB";
			
		} else if (boardVO.getType().equals("A")) {
			type = "AL";
			mobileType = "MAL";
		}
		
		boardMapper.insertBannerList(boardVO);
		
		if (pcFile.size() > 0) {
			pc = fileService.listSet(boardVO.getIdx(), type, pcFile, "/board");
			pc.setIdx(pcIdx);
			
			if (pc.getSize() != 0) {
				fileVOList.add(pc);
			}
			
		
		} 
		
		if (mobileFile.size() > 0) {
			mobile = fileService.listSet(boardVO.getIdx(), mobileType, mobileFile, "/board");
			mobile.setIdx(mobileIdx);
			
			if (mobile.getSize() != 0) {
				fileVOList.add(mobile);
			}
		}
		
		if (fileVOList.size() != 0) {
    	    fileService.insertFile(boardVO.getIdx(), fileVOList);
    	}
	}
	
	public void deleteBoardList(BoardVO boardVO) throws Exception {
		boardMapper.deleteBoardList(boardVO);
		
		boardVO.setParent(boardVO.getIdx());
		fileService.deleteFileList(boardVO);
	}
	
	public List<BoardVO> selectQnaList(BoardVO boardVO) throws Exception {
		return boardMapper.selectQnaList(boardVO);
	}
	
	public void updateReplyFlag(BoardVO boardVO) throws Exception {
		boardMapper.updateReplyFlag(boardVO);
	}
	
	public List<BoardVO> selectReplyList(BoardVO boardVO) throws Exception {
		return boardMapper.selectReplyList(boardVO);
	}
	
	public void insertReplyList(BoardVO boardVO, List<MultipartFile> uploadFile) throws Exception {
		List<FileVO> fileListVO = new ArrayList<FileVO>();
		
		updateReplyFlag(boardVO);
		boardMapper.insertReplyList(boardVO);
		
		fileService.listSetting(0, boardVO.getIdx(), "R", "/qna", uploadFile, fileListVO);
		
		if (uploadFile.size() != 0) {
    		fileService.insertFile(boardVO.getIdx(), fileListVO);
    	}
	}
	
	public void deleteQnaList(BoardVO boardVO) throws Exception {
		boardMapper.deleteQnaList(boardVO);
	}
	
	public List<BoardVO> selectBannerList(BoardVO boardVO) throws Exception {
		return boardMapper.selectBannerList(boardVO);
	}
	
	public void insertBannerList(BoardVO boardVO) throws Exception {
		boardMapper.insertBannerList(boardVO);
	}
	
	public void updateBannerList(BoardVO boardVO) throws Exception {
		boardMapper.updateBannerList(boardVO);
	}
	
	public void deleteBannerList(BoardVO boardVO) throws Exception {
		boardMapper.deleteBannerList(boardVO);
		
		boardVO.setParent(boardVO.getIdx());
		fileService.deleteFileList(boardVO);
	}
	
	public Long selectBoardCnt(BoardVO boardVO) throws Exception {
		HashMap<String, Long> map = boardMapper.selectBoardCnt(boardVO);
		
		return map.get("boardCnt");
	}
	
	public Long selectQnaCnt(BoardVO boardVO) throws Exception {
		HashMap<String, Long> map = boardMapper.selectQnaCnt(boardVO);
		
		return map.get("boardCnt");
	}
	
	public Long selectBannerCnt(BoardVO boardVO) throws Exception {
		HashMap<String, Long> map = boardMapper.selectBannerCnt(boardVO);
		
		return map.get("boardCnt");
	}
	
	public BoardVO selectTerms(BoardVO boardVO) throws Exception {		
		return boardMapper.selectTerms(boardVO);
	}

	public int insertTerms(Map param) throws Exception {		
		return boardMapper.insertTerms(param);
	}

	public List<HashMap<String, String>> selectListExcel(BoardVO boardVO) throws Exception {
		List<HashMap<String, String>> datalist = new ArrayList<HashMap<String, String>>();
		List<BoardVO> list = new ArrayList<BoardVO>();
		
		switch (boardVO.getType()) {
    	case "N" : case "F" :
    		list = boardMapper.selectBoardList(boardVO);
    		break;
    	case "Q" :
    		list = boardMapper.selectQnaList(boardVO);
    		break;
    	case "B" : case "A" :
    		list = boardMapper.selectBannerList(boardVO);
    		break;
    	}
		
		for (BoardVO m : list) {
			HashMap<String, String> data = (HashMap<String, String>) BeanUtils.describe(m);
			datalist.add(data);
		}
		
		return datalist; 
	}

}
		