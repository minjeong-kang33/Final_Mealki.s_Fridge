package com.itwillbs.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.dao.ItemDAO;
import com.itwillbs.dao.PlaceOrderDAO;
import com.itwillbs.domain.EmployeeDTO;
import com.itwillbs.domain.ItemDTO;
import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.PlaceOrderDTO;
import com.itwillbs.domain.WarehouseDTO;

@Service
public class PlaceOrderServiceImpl implements PlaceOrderService {
	@Inject
	private PlaceOrderDAO placeOrderDAO;

	@Override
	public List<WarehouseDTO> getWarehouseList() {
		System.out.println("PlaceOrderServiceImpl getWarehouseList");

		return placeOrderDAO.getWarehouseList();
	}

	@Override
	public int getStk_qnt() {
		System.out.println("PlaceOrderServiceImpl getStk_qnt");
		return placeOrderDAO.getStk_qnt();
	}

	@Override
	public List<Map<String, Object>> getItemListMap() {
		System.out.println("PlaceOrderServiceImpl getItemListMap()");
		return placeOrderDAO.getItemListMap();
	}

	@Override
	public List<EmployeeDTO> getEmployeeList() {
		System.out.println("PlaceOrderServiceImpl getEmployeeList()");
		return placeOrderDAO.getEmployeeList();
	}

	@Override
	public void insertOrder(PlaceOrderDTO placeOrderDTO) {
		System.out.println("PlaceOrderServiceImpl placeOrderDTO()");
		
		placeOrderDAO.insertOrder(placeOrderDTO);
	}

	@Override
	public List<PlaceOrderDTO> getOrderList(PlaceOrderDTO placeOrderDTO) {
		System.out.println("PlaceOrderServiceImpl getOrderList");

		return placeOrderDAO.getOrderList(placeOrderDTO);
	}

//	@Override
//	public int getBoardCount() {
//		System.out.println("PlaceOrderServiceImpl getBoardCount()");
//		
//		return placeOrderDAO.getBoardCount();
//	}
	
	
	

}
