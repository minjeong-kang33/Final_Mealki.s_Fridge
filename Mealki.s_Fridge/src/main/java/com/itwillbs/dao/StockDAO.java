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
	
	public void updateStockqnt(StockDTO stockDTO);
	
	public void insertStock(StockDTO stockDTO);
	
	public StockDTO selectItem(String itemNum);
	public void updateStock(StockDTO stockDTO);
	
	public void deleteStock(String itemNum);
}
