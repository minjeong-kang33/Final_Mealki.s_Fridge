package com.itwillbs.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.BoardDTO;
import com.itwillbs.domain.PageDTO;

@Repository
public class BoardDAOImpl implements BoardDAO{
	
	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace="com.itwillbs.mappers.boardMapper";

	@Override
	public void insertBoard(BoardDTO boardDTO) {
		System.out.println("BoardDAOImpl insertBoard()");
		
		sqlSession.insert(namespace+".insertBoard", boardDTO);
	}
	
	@Override
	public Integer getMaxBo_num() {
		System.out.println("BoardDAOImpl getMaxBo_num()");
		
		return sqlSession.selectOne(namespace+".getMaxBo_num");
	}
	
	@Override
	public List<BoardDTO> getNoticeList(PageDTO pageDTO) {
		System.out.println("BoardDAOImpl getNoticeList()");
		
		pageDTO.setStartRow(pageDTO.getStartRow()-1);
		
		return sqlSession.selectList(namespace+".getNoticeList", pageDTO);
	}

	@Override
	public int getBoardCount(PageDTO pageDTO) {
		System.out.println("BoardDAOImpl getBoardCount()");
		
		return sqlSession.selectOne(namespace+".getBoardCount", pageDTO);
	}

	@Override
	public BoardDTO getBoard(int bo_num) {
		System.out.println("BoardDAOImpl getBoard()");
		
		return sqlSession.selectOne(namespace+".getBoard", bo_num);
	}

	@Override
	public void boCount(BoardDTO boardDTO) {
		System.out.println("BoardDAOImpl boCount()");
		
		sqlSession.update(namespace+".boCount", boardDTO);
		
	}

	@Override
	public void deleteBoard(int bo_num) {
		System.out.println("BoardDAOImpl deleteBoard()");
		
		sqlSession.update(namespace+".deleteBoard", bo_num);
	}



	

}
