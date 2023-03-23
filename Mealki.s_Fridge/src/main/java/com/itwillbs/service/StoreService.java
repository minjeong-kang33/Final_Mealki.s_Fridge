package com.itwillbs.service;

import java.util.List;
import java.util.Map;

import com.itwillbs.domain.ItemDTO;
import com.itwillbs.domain.PlaceOrderDTO;

public interface StoreService {
	
	public List<Map<String, Object>> getItemListMapStore();
}
