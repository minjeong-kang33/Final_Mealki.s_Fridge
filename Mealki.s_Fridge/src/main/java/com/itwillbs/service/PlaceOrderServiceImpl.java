package com.itwillbs.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.dao.ItemDAO;
import com.itwillbs.dao.PlaceOrderDAO;
import com.itwillbs.domain.CustomerDTO;
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
	public List<Map<String, Object>> getItemListMap(PageDTO pageDTO) {
		System.out.println("PlaceOrderServiceImpl getItemListMap()");
		
		int startRow=(pageDTO.getCurrentPage()-1)*pageDTO.getPageSize()+1;
		int endRow = startRow+pageDTO.getPageSize()-1;
		
		pageDTO.setStartRow(startRow);
		pageDTO.setEndRow(endRow);
		
		return placeOrderDAO.getItemListMap(pageDTO);
	}
	
	@Override
	public int getItemListCount(PageDTO pageDTO) {
		System.out.println("PlaceOrderServiceImpl getItemListCount()");
		
		return placeOrderDAO.getItemListCount(pageDTO);
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
	public List<PlaceOrderDTO> getOrderList(PageDTO pageDTO) {
		System.out.println("PlaceOrderServiceImpl getOrderList");
		
		int startRow=(pageDTO.getCurrentPage()-1)*pageDTO.getPageSize()+1;
		int endRow = startRow+pageDTO.getPageSize()-1;
		
		pageDTO.setStartRow(startRow);
		pageDTO.setEndRow(endRow);
		
		return placeOrderDAO.getOrderList(pageDTO);
	}

	@Override
	public int getOrderListCount(PageDTO pageDTO) {
		System.out.println("PlaceOrderServiceImpl getOrderListCount");
		
		return placeOrderDAO.getOrderListCount(pageDTO);
	}
	
	

}
