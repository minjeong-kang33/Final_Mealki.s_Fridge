package com.itwillbs.dao;

import java.util.List;
import java.util.Map;

import com.itwillbs.domain.ItemDTO;
import com.itwillbs.domain.WarehouseDTO;

public interface PlaceOrderDAO {
	public List<WarehouseDTO> getWarehouseList();
	public int getStk_qnt();
	public List<Map<String, Object>> getItemListMap();
	
}
