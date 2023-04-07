package com.itwillbs.dao;

import java.util.List;

import com.itwillbs.domain.BoardDTO;
import com.itwillbs.domain.PageDTO;

public interface BoardDAO {
	
	public void insertBoard(BoardDTO boardDTO);
	
	public Integer getMaxBo_num();
	
	public List<BoardDTO> getNoticeList(PageDTO pageDTO);
	
	public int getBoardCount(PageDTO pageDTO);
	
	public BoardDTO getBoard(int bo_num);
	
	public void boCount(BoardDTO boardDTO);
	
	public void deleteBoard(int bo_num);
	
	public void updateBoard(BoardDTO boardDTO);
	
	public List<BoardDTO> getNoticeList2(PageDTO pageDTO);
	
	public BoardDTO getBoardByBoNum(int bo_num);
}
