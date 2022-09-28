package com.boxads.main.mapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.boxads.main.vo.BoardVO;

@Mapper
public interface BoardMapper {
	
	List<BoardVO> selectBoardList(BoardVO boardVO) throws Exception;
	
	void insertBoardList(BoardVO boardVO) throws Exception;
	
	void updateBoardList(BoardVO boardVO) throws Exception;
	
	void deleteBoardList(BoardVO boardVO) throws Exception;	
	
	
	List<BoardVO> selectQnaList(BoardVO boardVO) throws Exception;
	
	void updateReplyFlag(BoardVO boardVO) throws Exception;
	
	List<BoardVO> selectReplyList(BoardVO boardVO) throws Exception;
	
	void insertReplyList(BoardVO boardVO) throws Exception;
	
	void deleteQnaList(BoardVO boardVO) throws Exception;
	
	
	List<BoardVO> selectBannerList(BoardVO boardVO) throws Exception;
	
	void insertBannerList(BoardVO boardVO) throws Exception;
	
	void updateBannerList(BoardVO boardVO) throws Exception;
	
	void deleteBannerList(BoardVO boardVO) throws Exception;
	
	
	HashMap<String, Long> selectBoardCnt(BoardVO boardVO) throws Exception;
	
	HashMap<String, Long> selectQnaCnt(BoardVO boardVO) throws Exception;
	
	HashMap<String, Long> selectBannerCnt(BoardVO boardVO) throws Exception;

	BoardVO selectTerms(BoardVO boardVO) throws Exception;

	int insertTerms(Map param) throws Exception;
}
