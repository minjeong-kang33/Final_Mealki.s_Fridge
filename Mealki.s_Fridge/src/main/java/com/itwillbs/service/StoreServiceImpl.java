package com.itwillbs.service;

import java.sql.Timestamp;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.dao.StoreDAO;
import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.StoreDTO;

@Service
public class StoreServiceImpl implements StoreService{

	@Inject
	private StoreDAO storeDAO;

	@Override
	public List<Map<String, Object>> getItemListMapStore() {
		System.out.println("StoreServiceImpl getItemListMapStore");
		return storeDAO.getItemListMapStore();
	}

	@Override
	public List<Map<String, Object>> getPlaceOrderListStore(PageDTO pageDTO) {
		System.out.println("StoreServiceImpl getPlaceOrderListStore");
		
		
		int startRow=(pageDTO.getCurrentPage()-1)*pageDTO.getPageSize()+1;
		int endRow = startRow+pageDTO.getPageSize()-1;
		
		pageDTO.setStartRow(startRow);
		pageDTO.setEndRow(endRow);
		
		return storeDAO.getPlaceOrderListStore(pageDTO);
	}

	@Override
	public void insertStore(StoreDTO storeDTO) {
		System.out.println("StoreServiceImpl insertStore");
		storeDTO.setSto_date(new Timestamp(System.currentTimeMillis()));
		storeDAO.insertStore(storeDTO);
	}


	@Override
	public int getStoreSearchListCount(PageDTO pageDTO) {
		System.out.println("StoreServiceImpl getStoreSearchListCount");
		return storeDAO.getStoreSearchListCount(pageDTO);
	}

	@Override
	public List<Map<String, Object>> getStoreDetailList(String order_num, String item_name) {
		System.out.println("StoreServiceImpl getStoreDetailList");
		return storeDAO.getStoreDetailList(order_num, item_name);
	}


	
	
}
