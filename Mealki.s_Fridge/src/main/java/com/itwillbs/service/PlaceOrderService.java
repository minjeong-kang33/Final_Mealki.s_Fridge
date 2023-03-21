package com.itwillbs.service;

import java.util.List;
import java.util.Map;

import com.itwillbs.domain.WarehouseDTO;

public interface PlaceOrderService{
	public List<WarehouseDTO> getWarehouseList();
	public int getStk_qnt();
	public List<Map<String, Object>> getItemListMap();
}
