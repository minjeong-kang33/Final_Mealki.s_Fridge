package com.itwillbs.dao;

import java.util.List;
import java.util.Map;

import com.itwillbs.domain.UnstoreDTO;

public interface UnstoreDAO {
	
	public List<Map<String, Object>> getUnstoreListUnreleased();
	
	public void insertUnstore(UnstoreDTO unstoreDTO);

}
