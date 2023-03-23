package com.itwillbs.dao;

import java.util.List;
import java.util.Map;

public interface StoreDAO {

	public List<Map<String, Object>> getItemListMapStore();
	
	public List<Map<String, Object>> getPlaceOrderListStore();
	
}
