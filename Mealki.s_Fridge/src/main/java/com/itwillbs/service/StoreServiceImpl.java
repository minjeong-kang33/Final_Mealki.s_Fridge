package com.itwillbs.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.dao.StoreDAO;
import com.itwillbs.domain.ItemDTO;
import com.itwillbs.domain.PlaceOrderDTO;

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
	public List<Map<String, Object>> getPlaceOrderListStore() {
		System.out.println("StoreServiceImpl getPlaceOrderListStore");
		
		return storeDAO.getPlaceOrderListStore();
	}

	
	
}
