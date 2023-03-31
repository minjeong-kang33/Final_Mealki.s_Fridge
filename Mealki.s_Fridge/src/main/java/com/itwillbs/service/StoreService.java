package com.itwillbs.service;

import java.util.List;
import java.util.Map;

import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.StoreDTO;

public interface StoreService {
	
	public List<Map<String, Object>> getItemListMapStore();
	
	public List<Map<String, Object>> getPlaceOrderListStore(PageDTO pageDTO);
	
	public List<Map<String, Object>> getPlaceOrderListStorecomplete(PageDTO pageDTO);
	
	public List<Map<String, Object>> getPlaceOrderListStoreAll(PageDTO pageDTO);
	
	public void insertStore(StoreDTO storeDTO);
	
	public int getStoreSearchListCount (PageDTO pageDTO);
}
