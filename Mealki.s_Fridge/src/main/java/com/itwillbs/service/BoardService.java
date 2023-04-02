package com.itwillbs.service;

import java.util.List;

import com.itwillbs.domain.BoardDTO;
import com.itwillbs.domain.PageDTO;

public interface BoardService {
	
	public void insertBoard(BoardDTO boardDTO);
	
	public List<BoardDTO> getNoticeList(PageDTO pageDTO);
	
	public int getBoardCount(PageDTO pageDTO);
	
	public BoardDTO getBoard(int bo_num);
	
	public void boCount(BoardDTO boardDTO);
	
	public void deleteBoard(int bo_num);
 
}
