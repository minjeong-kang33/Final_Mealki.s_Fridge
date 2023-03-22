package com.itwillbs.service;

import java.sql.Timestamp;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.dao.CustomerDAO;
import com.itwillbs.domain.CustomerDTO;
import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.PageDTO2;

@Service
public class CustomerServiceImpl implements CustomerService{
	
	@Inject
	private CustomerDAO customerDAO;

	@Override
	public List<CustomerDTO> getCustomerList(PageDTO pageDTO) {
		System.out.println("CustomerDAOImpl getCustomerList()");
		
		int startRow=(pageDTO.getCurrentPage()-1)*pageDTO.getPageSize()+1;
		int endRow = startRow+pageDTO.getPageSize()-1;
		
		pageDTO.setStartRow(startRow);
		pageDTO.setEndRow(endRow);
		
		return customerDAO.getCustomerList(pageDTO);
	}

	@Override
	public int getCustomerCount() {
		System.out.println("CustomerDAOImpl getCustomerCount()");
		
		return customerDAO.getCustomerCount();
	}

	@Override
	public CustomerDTO getCustomer(int num) {
		System.out.println("CustomerDAOImpl getCustomer()");
		
		return customerDAO.getCustomer(num);
	}

	@Override
	public void insertCustomer(CustomerDTO customerDTO) {
		System.out.println("CustomerServiceImpl insertCustomer()");

		customerDAO.insertCustomer(customerDTO);	
	}
	
	

}
