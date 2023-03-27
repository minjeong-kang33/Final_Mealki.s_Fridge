package com.itwillbs.service;

import java.util.List;
import java.util.Map;

import com.itwillbs.domain.StoreDTO;

public interface StoreService {
	
	public List<Map<String, Object>> getItemListMapStore();
	
	public List<Map<String, Object>> getPlaceOrderListStore();
	
//	public void insertStore(StoreDTO storeDTO);
}
