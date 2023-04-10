package com.itwillbs.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.dao.ItemDAO;
import com.itwillbs.dao.StockDAO;
import com.itwillbs.domain.ItemDTO;
import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.StockDTO;
import com.itwillbs.domain.WarehouseDTO;

@Service
public class StockServiceImpl implements StockService {
	@Inject
	private StockDAO stockDAO;
	
	@Inject
	private ItemDAO itemDAO;

	@Override
	public List<WarehouseDTO> getWarehouseList() {
		System.out.println("StockServiceImpl getWarehouseList");

		return stockDAO.getWarehouseList();
	}

	@Override
	public List<ItemDTO> getItem_typeList() {
		System.out.println("StockServiceImpl getItem_typeList");
		
		return stockDAO.getItem_typeList();
	}

	@Override
	public List<StockDTO> getStockList(PageDTO pageDTO) {
		System.out.println("StockServiceImpl getStockList");
		
		int startRow=(pageDTO.getCurrentPage()-1)*pageDTO.getPageSize()+1;
		int endRow = startRow+pageDTO.getPageSize()-1;
		
		pageDTO.setStartRow(startRow);
		pageDTO.setEndRow(endRow);
		
		return stockDAO.getStockList(pageDTO);
	}

	@Override
	public int getStockListCount(PageDTO pageDTO) {
		System.out.println("StockServiceImpl getStockListCount");
		
		return stockDAO.getStockListCount(pageDTO);
	}

	@Override
	public void updateStockqnt(StockDTO stockDTO) {
		System.out.println("StockServiceImpl updateStock");
		
		stockDAO.updateStockqnt(stockDTO);
	}

	@Override
	public void insertStock(StockDTO stockDTO) {
		System.out.println("StockServiceImpl insertStock");
		if(stockDAO.selectItem(stockDTO.getItem_num()) == null){
			stockDAO.insertStock(stockDTO);
		}else{
			stockDAO.updateStock(stockDTO);
		}	
	}

	@Override
	public void deleteStock(String itemNum) {
		System.out.println("StockServiceImpl deleteStock");
		
		stockDAO.deleteStock(itemNum);
	}
	
	
	
	
	
	

}
