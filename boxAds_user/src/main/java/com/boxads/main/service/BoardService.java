package com.boxads.main.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.boxads.main.mapper.BoardMapper;
import com.boxads.main.vo.BoardVO;
import com.boxads.main.vo.FileVO;

@Service
@Transactional
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
	
	public void deleteBoardList(BoardVO boardVO) throws Exception {
		boardMapper.deleteBoardList(boardVO);
		fileService.deleteFileList(0, boardVO.getIdx(), boardVO.getType());
	}
	
	public List<BoardVO> selectQnaList(BoardVO boardVO) throws Exception {
		return boardMapper.selectQnaList(boardVO);
	}
	
	public void insertQnaList(BoardVO boardVO, List<MultipartFile> uploadFile) throws Exception {
		boardMapper.insertQnaList(boardVO);
		
		if (uploadFile.size() > 0) {
    		insertFileList(boardVO.getIdx(), uploadFile);
    	}
	}
	
	public List<BoardVO> selectReplyList(BoardVO boardVO) throws Exception {
		return boardMapper.selectReplyList(boardVO);
	}
	
	public void deleteQnaList(BoardVO boardVO) throws Exception {
		boardMapper.deleteQnaList(boardVO);
		deleteReplyList(boardVO);
	}
	
	public void deleteReplyList(BoardVO boardVO) throws Exception {
		boardMapper.deleteReplyList(boardVO);
	}
	
	public Long selectBoardCnt(BoardVO boardVO) throws Exception {
		HashMap<String, Long> map = boardMapper.selectBoardCnt(boardVO);
		
		return map.get("boardCnt");
	}
	
	public BoardVO selectTerms(BoardVO boardVO) throws Exception {
		return boardMapper.selectTerms(boardVO);
	}
	
	public List<HashMap<String, Object>> selectCodeList() throws Exception {
		return boardMapper.selectCodeList();
	}
	
	public void insertFileList(int parent, List<MultipartFile> uploadFile) throws Exception {
		List<FileVO> fileVOList = new ArrayList<FileVO>();
		
		fileService.listSetting(parent, "Q", uploadFile, fileVOList, "qna");
		fileService.insertFile(parent, fileVOList);
	}
	
}

