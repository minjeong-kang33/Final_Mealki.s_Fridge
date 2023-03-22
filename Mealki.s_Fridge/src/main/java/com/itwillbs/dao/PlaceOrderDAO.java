package com.itwillbs.dao;

import java.util.List;
import java.util.Map;

import com.itwillbs.domain.EmployeeDTO;
import com.itwillbs.domain.ItemDTO;
import com.itwillbs.domain.PlaceOrderDTO;
import com.itwillbs.domain.WarehouseDTO;

public interface PlaceOrderDAO {
	public List<WarehouseDTO> getWarehouseList();

	public int getStk_qnt();

	public List<Map<String, Object>> getItemListMap();

	public List<EmployeeDTO> getEmployeeList();
	
	public void insertOrder(PlaceOrderDTO placeOrderDTO);
	
	public Integer getMaxOrderNum();

}
