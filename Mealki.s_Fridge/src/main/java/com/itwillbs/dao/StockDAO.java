package com.itwillbs.dao;

import java.util.List;

import com.itwillbs.domain.ItemDTO;
import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.PlaceOrderDTO;
import com.itwillbs.domain.StockDTO;
import com.itwillbs.domain.WarehouseDTO;

public interface StockDAO {
	public List<WarehouseDTO> getWarehouseList();

	public List<ItemDTO> getItem_typeList();

	public List<StockDTO> getStockList(PageDTO pageDTO);

	public int getStockListCount(PageDTO pageDTO);
	
	public void updateStock(StockDTO stockDTO);
}
