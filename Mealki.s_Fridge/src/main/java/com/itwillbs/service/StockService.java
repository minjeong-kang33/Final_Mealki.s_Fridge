package com.itwillbs.service;

import java.util.List;
import java.util.Map;

import com.itwillbs.domain.ItemDTO;
import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.StockDTO;
import com.itwillbs.domain.StoreDTO;
import com.itwillbs.domain.WarehouseDTO;

public interface StockService {
	public List<WarehouseDTO> getWarehouseList();

	public List<ItemDTO> getItem_typeList();

	public List<StockDTO> getStockList(PageDTO pageDTO);

	public int getStockListCount(PageDTO pageDTO);
	
	public void updateStockqnt(StockDTO stockDTO);
	
	public void insertStock(StockDTO stockDTO);
	
	//public void updateStock(StockDTO stockDTO);
	
	public void deleteStock(String itemNum);
}
