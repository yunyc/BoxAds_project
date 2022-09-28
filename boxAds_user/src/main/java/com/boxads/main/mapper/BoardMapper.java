package com.boxads.main.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.boxads.main.vo.BoardVO;
import com.boxads.main.vo.FileVO;

@Mapper
public interface BoardMapper {
	
	List<BoardVO> selectBoardList(BoardVO boardVO) throws Exception;
	
	void insertBoardList(BoardVO boardVO) throws Exception;
	
	void updateBoardList(BoardVO boardVO) throws Exception;
	
	void deleteBoardList(BoardVO boardVO) throws Exception;		

	
	List<BoardVO> selectQnaList(BoardVO boardVO) throws Exception;
	
	void insertQnaList(BoardVO boardVO) throws Exception;
	
	List<BoardVO> selectReplyList(BoardVO boardVO) throws Exception;
	
	void deleteQnaList(BoardVO boardVO) throws Exception;
	
	void deleteReplyList(BoardVO boardVO) throws Exception;
	
	BoardVO selectTerms(BoardVO boardVO) throws Exception;
	
	
	HashMap<String, Long> selectBoardCnt(BoardVO boardVO) throws Exception;
	
	List<HashMap<String, Object>> selectCodeList() throws Exception;

}
