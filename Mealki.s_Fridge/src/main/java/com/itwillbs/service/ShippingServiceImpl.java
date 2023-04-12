package com.itwillbs.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.dao.ShippingDAO;
import com.itwillbs.domain.ContractDTO;
import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.QualityDTO;
import com.itwillbs.domain.ShippingDTO;
import com.itwillbs.domain.WorkorderDTO;
@Service
public class ShippingServiceImpl implements ShippingService{
	
	@Inject
	private ShippingDAO shippingDAO;

	@Override
	public void insertBoard(ShippingDTO shippingDTO) {
		System.out.println("ShippingServiceImpl insertBoard()");
		
		shippingDAO.shippingInsertBoard(shippingDTO);
	}

	@Override
	public List<ShippingDTO> getBoardList(PageDTO pageDTO) {
		
		System.out.println("ShippingServiceImpl selectBoardList()");
		//시작하는 행번호 구하기
		int startRow=(pageDTO.getCurrentPage()-1)*pageDTO.getPageSize()+1;
		int endRow = startRow+pageDTO.getPageSize()-1;
		
		pageDTO.setStartRow(startRow);
		pageDTO.setEndRow(endRow);
	
		return shippingDAO.getBoardList(pageDTO);
	}

	@Override
	public int getShippingCount(PageDTO pageDTO) {
		System.out.println("ShippingServiceImpl getShippingCount()");
		return shippingDAO.getShippingCount(pageDTO);
	}

	@Override
	public int selectShippingTotal(ShippingDTO shippingDTO) {
		
		return shippingDAO.selectShippingTotal(shippingDTO);
	}

	@Override
	public void insertShipping(ShippingDTO shippingDTO) {
		
		 shippingDAO.insertShipping(shippingDTO);
		
	}

	@Override
	public List<Map<String, Object>> getShippingListMap() {
		
		return shippingDAO.getShippingListMap();
	}

	@Override
	public List<ContractDTO> getEmployeeList() {
		
		return shippingDAO.getEmployeeList();
	}

	@Override
	public void updateShipping(ShippingDTO shippingDTO) {
		shippingDAO.updateShipping(shippingDTO);
	}

	
	
	@Override
	public List<WorkorderDTO> getShippingList() {
		return shippingDAO.getShippingList();
	}

	

	
	
	

}
