package com.itwillbs.dao;

import java.util.List;
import java.util.Map;

import com.itwillbs.domain.EmployeeDTO;
import com.itwillbs.domain.ItemDTO;
import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.PlaceOrderDTO;
import com.itwillbs.domain.WarehouseDTO;

public interface PlaceOrderDAO {
	public List<WarehouseDTO> getWarehouseList();

	public int getStk_qnt();

	public List<Map<String, Object>> getItemListMap(PageDTO pageDTO);
	
	public int getItemListCount(PageDTO pageDTO);

	public List<EmployeeDTO> getEmployeeList();
	
	public void insertOrder(PlaceOrderDTO placeOrderDTO);
	
	public List<PlaceOrderDTO> getOrderList(PageDTO pageDTO);
	
	public int getOrderListCount(PageDTO pageDTO);
}
