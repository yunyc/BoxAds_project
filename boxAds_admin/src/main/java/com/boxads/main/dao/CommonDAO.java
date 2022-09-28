package com.boxads.main.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.boxads.main.vo.BoardVO;

@Repository
public class CommonDAO {
    @Autowired
    private SqlSession sqlSession;
    /*
    void insertBoardList(BoardVO boardVO) throws Exception {
		return sqlSession.selectOne("com.baxads.member.insertBoardList", boardVO);
	}
	*/
       
}
