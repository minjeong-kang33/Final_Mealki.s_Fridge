package com.itwillbs.service;

import java.sql.Timestamp;

import com.itwillbs.dao.BoardDAO;
import com.itwillbs.domain.BoardDTO;

public class BoardServiceImpl implements BoardService{
	
	private BoardDAO boardDAO;

	@Override
	public void insertBoard(BoardDTO boardDTO) {
//		// 폼에서 가져온 값 name subject content
//		// num,readcount,date,file => 설정
//		// num => 구하기 max(num)+1
//		if(boardDAO.getMaxNum() == null) {
//		//게시판 글 없음 => 1 설정
//		boardDTO.setNum(1);
//		}else {
//		//게시판 글 있음 => max(num)+1
//		boardDTO.setNum(boardDAO.getMaxNum()+1);
//		}
//				
//		boardDTO.setReadcount(0);
//		boardDTO.setDate(new Timestamp(System.currentTimeMillis()));
//				
//		boardDAO.insertBoard(boardDTO);	
	}

}
