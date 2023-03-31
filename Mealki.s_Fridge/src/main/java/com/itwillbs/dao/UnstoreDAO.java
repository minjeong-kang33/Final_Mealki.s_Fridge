package com.itwillbs.dao;

import java.util.List;
import java.util.Map;

import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.UnstoreDTO;

public interface UnstoreDAO {
	
	public void insertUnstore(UnstoreDTO unstoreDTO);
	
	public List<Map<String, Object>> getUnstoreList(PageDTO pageDTO);
	
	public int getUnstoreListCount (PageDTO pageDTO);

}
