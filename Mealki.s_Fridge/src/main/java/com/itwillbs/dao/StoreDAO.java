package com.itwillbs.dao;

import java.util.List;
import java.util.Map;

import com.itwillbs.domain.StoreDTO;

public interface StoreDAO {

	public List<Map<String, Object>> getItemListMapStore();
	
	public List<Map<String, Object>> getPlaceOrderListStore();
	
	public List<Map<String, Object>> getPlaceOrderListStorecomplete();
	
	public List<Map<String, Object>> getPlaceOrderListStoreAll();
	
	public void insertStore(StoreDTO storeDTO);
	
}
