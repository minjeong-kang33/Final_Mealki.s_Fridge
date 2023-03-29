package com.itwillbs.dao;

import java.util.List;

import com.itwillbs.domain.BoardDTO;
import com.itwillbs.domain.PageDTO;

public interface BoardDAO {
	
	public void insertBoard(BoardDTO boardDTO);
	
	public Integer getMaxBO_num();
	
	public List<BoardDTO> getNoticeList(PageDTO pageDTO);
	
	public int getBoardCount(PageDTO pageDTO);
	
	public BoardDTO getBoard(int bo_num);

}
