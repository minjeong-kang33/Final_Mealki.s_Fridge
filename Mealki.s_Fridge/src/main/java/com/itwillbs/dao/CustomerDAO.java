package com.itwillbs.dao;


import java.util.List;
import java.util.Map;

import com.itwillbs.domain.CustomerDTO;
import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.SearchDTO;


public interface CustomerDAO {
	
	public List<CustomerDTO> getCustomerList(PageDTO pageDTO);
	
	public int getCustomerCount();
	
	public CustomerDTO getCustomer(int num);
	
	public void insertCustomer(CustomerDTO customerDTO);
	
	public List<Map<String, Object>> getCustomerListMap(SearchDTO searchDTO);

}
