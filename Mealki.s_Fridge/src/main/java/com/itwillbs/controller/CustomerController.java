package com.itwillbs.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.itwillbs.domain.CustomerDTO;
import com.itwillbs.domain.PageDTO;
import com.itwillbs.service.CustomerService;

@Controller
public class CustomerController {
	
	@Inject
	private CustomerService customerService;
	
	@RequestMapping(value = "/business/customer/customerList", method = RequestMethod.GET)
	public String customerList(HttpServletRequest request, Model model) {
		System.out.println("CustomerController customerList()");
		
		int pageSize=5;
		
		String pageNum=request.getParameter("pageNum");
		if(pageNum==null){
			pageNum="1";
		}
		int currentPage=Integer.parseInt(pageNum);
			
		PageDTO pageDTO=new PageDTO();
		pageDTO.setPageSize(pageSize);
		pageDTO.setPageNum(pageNum);
		pageDTO.setCurrentPage(currentPage);
		
		
		List<CustomerDTO> customerList=customerService.getCustomerList(pageDTO);
		
		// 페이징
		int count = customerService.getCustomerCount();
		int pageBlock=10;
		int startPage=(currentPage-1)/pageBlock*pageBlock+1;
		int endPage=startPage+pageBlock-1;
		int pageCount=count/pageSize+(count%pageSize==0?0:1);
		if(endPage > pageCount){
			endPage = pageCount;
		}
		
		pageDTO.setCount(count);
		pageDTO.setPageBlock(pageBlock);
		pageDTO.setStartPage(startPage);
		pageDTO.setEndPage(endPage);
		pageDTO.setPageCount(pageCount);
		
		model.addAttribute("customerList", customerList);
		model.addAttribute("pageDTO", pageDTO);
		
		
		
		return "business/customer/customerList";
	}
	
	@RequestMapping(value="/business/customer/delete", method=RequestMethod.POST)
	public String delete(HttpServletRequest request) {
		int num=Integer.parseInt(request.getParameter("cust_num"));
		
	return "redirect:business/customer/customerList";
}
	

}