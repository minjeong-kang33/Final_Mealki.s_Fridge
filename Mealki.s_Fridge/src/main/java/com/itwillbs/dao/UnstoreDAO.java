package com.itwillbs.dao;

import java.util.List;
import java.util.Map;

import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.UnstoreDTO;

public interface UnstoreDAO {
	
	public void insertUnstore(UnstoreDTO unstoreDTO);
	
	public List<Map<String, Object>> getUnstoreList(PageDTO pageDTO);
	
	public List<Map<String, Object>> getUnstoreList2();	
	public int getUnstoreListCount (PageDTO pageDTO);
	
	public List<Map<String, Object>> getUnstoreDetailList(String wo_num);	
	
	public List<Map<String, Object>> getunstoreStatus(String wo_num);

}
