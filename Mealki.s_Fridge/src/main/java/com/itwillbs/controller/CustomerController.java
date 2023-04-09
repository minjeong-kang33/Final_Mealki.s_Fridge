package com.itwillbs.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
		
		String search_option = request.getParameter("search_option");
		String keyword = request.getParameter("keyword");
		
		System.out.println(search_option);
		System.out.println(keyword);
		
		int pageSize=15;
		
		String pageNum=request.getParameter("pageNum");
		if(pageNum==null){
			pageNum="1";
		}
		int currentPage=Integer.parseInt(pageNum);
			
		PageDTO pageDTO=new PageDTO();
		pageDTO.setPageSize(pageSize);
		pageDTO.setPageNum(pageNum);
		pageDTO.setCurrentPage(currentPage);
		// 검색어
		pageDTO.setSearch_option(search_option);
		pageDTO.setKeyword(keyword);
		
		List<CustomerDTO> customerList=customerService.getCustomerList(pageDTO);
		
		// 페이징
		int count = customerService.getCustomerCount(pageDTO);
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
		pageDTO.setSearch_option(search_option);
		pageDTO.setKeyword(keyword);
	
		model.addAttribute("customerList", customerList);
		model.addAttribute("pageDTO", pageDTO);
		
		return "business/customer/customerList";
	}
	
	@RequestMapping(value = "/business/customer/customerDetail", method = RequestMethod.GET)
	public String customerDetail(HttpServletRequest request, Model model) {
		System.out.println("CustomerController customerDetail()");
		String business_num = request.getParameter("business_num");
	
		CustomerDTO customerDTO=customerService.getCustomer(business_num);

		model.addAttribute("customerDTO", customerDTO);
		
		return "business/customer/customerDetail";
	}
	
	@RequestMapping(value="/business/customer/deleteCustList", method=RequestMethod.POST)
	public String deleteCustList(HttpServletRequest request, Model model) {
		 System.out.println("CustomerController deleteCustList()");
		 
		 String[] deleteId = request.getParameterValues("selectId");
		 for(String id : deleteId){
				customerService.deleteCustomer(id);
			}
         return "redirect:/business/customer/customerList";
	}
	
	@RequestMapping(value="/business/customer/deleteCustomer", method=RequestMethod.GET)
	public String deleteCustomer(HttpServletRequest request, Model model) {
		 System.out.println("CustomerController deleteCustomer()");
		 String business_num = request.getParameter("business_num");
		 
		 customerService.deleteCustomer(business_num);
		 
         return "business/customer/dmsg";
	}
	
	@RequestMapping(value = "/business/customer/insertCustomer", method = RequestMethod.GET)
	public String insertCustomer() {
		System.out.println("CustomerController insertCustomer()");
	
		return "business/customer/insertCustomer";
	}
	@RequestMapping(value = "/business/customer/insertCustomerPro", method = RequestMethod.POST)
	public String insertCustomerPro(CustomerDTO customerDTO) {
		System.out.println("CustomerController insertCustomerPro()");

		customerService.insertCustomer(customerDTO);
		
		return "business/customer/imsg";
	}
	@RequestMapping(value = "/business/customer/updateCustomer", method = RequestMethod.GET)
	public String updateCustomer(HttpServletRequest request, Model model) {
		System.out.println("CustomerController updateCustomer()");
		String business_num = request.getParameter("business_num");
		
		CustomerDTO customerDTO=customerService.getCustomer(business_num);
		
		model.addAttribute("customerDTO", customerDTO);
		
//		주소줄 변경없이 이동
//		/WEB-INF/views/파일이름.jsp
//		/WEB-INF/views/center/update.jsp
		return "business/customer/updateCustomer";
	}
	@RequestMapping(value = "/business/customer/updateCustomerPro", method = RequestMethod.POST)
	public String updateCustomerPro(CustomerDTO customerDTO, RedirectAttributes redirectAttributes) {
		System.out.println("CustomerController updateCustomerPro()");
		
		customerService.updateCustomer(customerDTO);
		redirectAttributes.addAttribute("business_num", customerDTO.getBusiness_num());

		return "redirect:/business/customer/customerDetail";
	}


}
