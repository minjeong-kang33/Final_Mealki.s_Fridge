package com.itwillbs.service;

import java.util.List;
import java.util.Map;

import com.itwillbs.domain.CustomerDTO;
import com.itwillbs.domain.PageDTO;


public interface CustomerService {
	
	public List<CustomerDTO> getCustomerList(PageDTO pageDTO);
	
	public int getCustomerCount();
	
	public CustomerDTO getCustomer(int num);
	
	public void insertCustomer(CustomerDTO customerDTO);
	
//	public List<Map<String, Object>> getCustomerListMap(SearchPageDTO searchPageDTO);

}
