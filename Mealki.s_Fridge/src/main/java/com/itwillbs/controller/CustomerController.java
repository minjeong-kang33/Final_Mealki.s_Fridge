package com.itwillbs.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.itwillbs.service.CustomerService;

@Controller
public class CustomerController {
	
	@Inject
	private CustomerService customerService;
	
	@RequestMapping(value = "/business/customer/blank", method = RequestMethod.GET)
	public String customerList() {
		System.out.println("CustomerController customerList");
		
		return "business/customer/blank";
	}
	

}
