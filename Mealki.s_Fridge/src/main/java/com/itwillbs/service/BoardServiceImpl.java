package com.itwillbs.service;

import java.sql.Timestamp;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.dao.BoardDAO;
import com.itwillbs.domain.BoardDTO;
import com.itwillbs.domain.PageDTO;

@Service
public class BoardServiceImpl implements BoardService{
	
	@Inject
	private BoardDAO boardDAO;

	@Override
	public void insertBoard(BoardDTO boardDTO) {
		System.out.println("BoardServiceImpl insertBoard()");
		// 폼에서 가져온 값 name subject content
		// bo_num,bo_count,date,file => 설정
		// bo_num => 구하기 max(bo_num)+1
		if(boardDAO.getMaxBo_num() == null) {
		//게시판 글 없음 => 1 설정
		boardDTO.setBo_num(1);
		}else {
		//게시판 글 있음 => max(bo_num)+1
		boardDTO.setBo_num(boardDAO.getMaxBo_num()+1);
		}
				
		boardDTO.setBo_count(0);
		boardDTO.setBo_date(new Timestamp(System.currentTimeMillis()));
				
		boardDAO.insertBoard(boardDTO);	
	}

	@Override
	public List<BoardDTO> getNoticeList(PageDTO pageDTO) {
		System.out.println("BoardServiceImpl getNoticeList()");
		
		int startRow=(pageDTO.getCurrentPage()-1)*pageDTO.getPageSize()+1;
		int endRow = startRow+pageDTO.getPageSize()-1;
		
		pageDTO.setStartRow(startRow);
		pageDTO.setEndRow(endRow);
		
		return boardDAO.getNoticeList(pageDTO);
	}

	@Override
	public int getBoardCount(PageDTO pageDTO) {
		System.out.println("BoardServiceImpl getBoardCount()");
		
		return boardDAO.getBoardCount(pageDTO);
	}

	@Override
	public BoardDTO getBoard(int bo_num) {
		System.out.println("BoardServiceImpl getBoard()");
		
		return boardDAO.getBoard(bo_num);
	}

	@Override
	public void boCount(BoardDTO boardDTO) {
		System.out.println("BoardServiceImpl boCount()");
		
		boardDAO.boCount(boardDTO);
	}

	@Override
	public void deleteBoard(int bo_num) {
		System.out.println("BoardServiceImpl deleteBoard()");
		
		boardDAO.deleteBoard(bo_num);
	}

}
