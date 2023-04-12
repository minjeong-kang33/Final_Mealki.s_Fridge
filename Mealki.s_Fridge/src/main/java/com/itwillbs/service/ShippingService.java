package com.itwillbs.service;

import java.util.List;
import java.util.Map;

import com.itwillbs.domain.ContractDTO;
import com.itwillbs.domain.EmployeeDTO;
import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.QualityDTO;
import com.itwillbs.domain.ShippingDTO;
import com.itwillbs.domain.WorkorderDTO;

public interface ShippingService {

	void insertBoard(ShippingDTO shippingDTO);

	List<ShippingDTO> getBoardList(PageDTO pageDTO);

	int getShippingCount(PageDTO pageDTO);

	int selectShippingTotal(ShippingDTO shippingDTO);

	void insertShipping(ShippingDTO shippingDTO);

	List<Map<String, Object>> getShippingListMap();

	List<ContractDTO> getEmployeeList();

	void updateShipping(ShippingDTO shippingDTO);

	
	
	
	List<WorkorderDTO> getShippingList();

	

	


}
