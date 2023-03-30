package com.itwillbs.dao;


import java.util.List;

import com.itwillbs.domain.CustomerDTO;
import com.itwillbs.domain.PageDTO;


public interface CustomerDAO {
	
	public List<CustomerDTO> getCustomerList(PageDTO pageDTO);
	
	public int getCustomerCount(PageDTO pageDTO);
	
	public CustomerDTO getCustomer(String business_num);
	
	public void insertCustomer(CustomerDTO customerDTO);
	
	public void deleteCustomer(String business_num);

}
