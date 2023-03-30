package com.itwillbs.service;

import java.util.List;
import java.util.Map;

import com.itwillbs.domain.UnstoreDTO;

public interface UnstoreService {

	public List<Map<String, Object>> getUnstoreListUnreleased();
	
	public void insertUnstore(UnstoreDTO unstoreDTO);
	
	public List<Map<String, Object>> getUnstoreListSuccess();
	
	public List<Map<String, Object>> getUnstoreList();
}
