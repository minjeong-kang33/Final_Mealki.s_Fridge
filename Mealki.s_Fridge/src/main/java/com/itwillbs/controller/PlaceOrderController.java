package com.itwillbs.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.WarehouseDTO;
import com.itwillbs.service.PlaceOrderService;


@Controller
public class PlaceOrderController {
	@Inject
	private PlaceOrderService placeOrderService;
	 
	
	@RequestMapping(value = "/wms/placeorder/insertOrder", method = RequestMethod.GET)
	public String insertOrder() {
		System.out.println("PlaceOrderController insertOrder");
		return "wms/placeorder/orderForm";
	}
	
	@RequestMapping(value = "/wms/placeorder/findWarehouse", method = RequestMethod.GET)
	public String findWarehouse(HttpServletRequest request, Model model) {
		System.out.println("PlaceOrderController findWarehouse()");
		int pageSize=10;
		String pageNum=request.getParameter("pageNum");
		if(pageNum==null) {
			pageNum="1";
		}
		int currentPage=Integer.parseInt(pageNum);
		
		PageDTO pageDTO=new PageDTO();
		pageDTO.setPageSize(pageSize);
		pageDTO.setPageNum(pageNum);
		pageDTO.setCurrentPage(currentPage);
		
		List<WarehouseDTO> warehouseList=placeOrderService.getWarehouseList(pageDTO);
		
		model.addAttribute("warehouseList", warehouseList);
		model.addAttribute("pageDTO", pageDTO);
		
		return "wms/placeorder/findWarehouse";
	}
	
	/*
	 * @RequestMapping(value = "/wms/placeorder/findProducts", method =
	 * RequestMethod.GET) public String findProducts(HttpServletRequest request,
	 * Model model) { System.out.println("PlaceOrderController findProducts()"); int
	 * pageSize=10; String pageNum=request.getParameter("pageNum");
	 * if(pageNum==null) { pageNum="1"; } int currentPage=Integer.parseInt(pageNum);
	 * 
	 * PageDTO pageDTO=new PageDTO(); pageDTO.setPageSize(pageSize);
	 * pageDTO.setPageNum(pageNum); pageDTO.setCurrentPage(currentPage);
	 * 
	 * List<WarehouseDTO> warehouseList=placeOrderService.getWarehouseList(pageDTO);
	 * 
	 * model.addAttribute("warehouseList", warehouseList);
	 * model.addAttribute("pageDTO", pageDTO);
	 * 
	 * return "wms/placeorder/findProducts"; }
	 */
	
}
