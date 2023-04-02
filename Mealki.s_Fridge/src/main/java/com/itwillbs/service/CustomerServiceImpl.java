package com.itwillbs.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.dao.CustomerDAO;
import com.itwillbs.domain.CustomerDTO;
import com.itwillbs.domain.PageDTO;


@Service
public class CustomerServiceImpl implements CustomerService{
	
	@Inject
	private CustomerDAO customerDAO;

	@Override
	public List<CustomerDTO> getCustomerList(PageDTO pageDTO) {
		System.out.println("CustomerServiceImpl getCustomerList()");
		
		int startRow=(pageDTO.getCurrentPage()-1)*pageDTO.getPageSize()+1;
		int endRow = startRow+pageDTO.getPageSize()-1;
		
		pageDTO.setStartRow(startRow);
		pageDTO.setEndRow(endRow);
		
		return customerDAO.getCustomerList(pageDTO);
	}

	@Override
	public int getCustomerCount(PageDTO pageDTO) {
		System.out.println("CustomerServiceImpl getCustomerCount()");
		
		return customerDAO.getCustomerCount(pageDTO);
	}

	@Override
	public CustomerDTO getCustomer(String business_num) {
		System.out.println("CustomerServiceImpl getCustomer()");
		
		return customerDAO.getCustomer(business_num);
	}

	@Override
	public void insertCustomer(CustomerDTO customerDTO) {
		System.out.println("CustomerServiceImpl insertCustomer()");

		customerDAO.insertCustomer(customerDTO);	
	}

	@Override
	public void deleteCustomer(String business_num) {
		System.out.println("CustomerServiceImpl deleteCustomer()");
		
		customerDAO.deleteCustomer(business_num);
	}

	@Override
	public void updateCustomer(CustomerDTO customerDTO) {
		System.out.println("CustomerServiceImpl updateCustomer()");

		customerDAO.updateCustomer(customerDTO);	
	}
	
	

}
