package com.itwillbs.service;

import java.util.List;
import java.util.Map;

import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.UnstoreDTO;

public interface UnstoreService {

	public void insertUnstore(UnstoreDTO unstoreDTO);
	
	public List<Map<String, Object>> getUnstoreList(PageDTO pageDTO);
	
	public int getUnstoreListCount (PageDTO pageDTO);
	
	public List<Map<String, Object>> getUnstoreDetailList(String wo_num);
}
