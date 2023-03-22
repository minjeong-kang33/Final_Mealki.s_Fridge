package com.itwillbs.controller;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.itwillbs.domain.EmployeeDTO;
import com.itwillbs.domain.ItemDTO;
import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.PlaceOrderDTO;
import com.itwillbs.domain.WarehouseDTO;
import com.itwillbs.service.PlaceOrderService;

@Controller
public class PlaceOrderController {
	@Inject
	private PlaceOrderService placeOrderService;

	@RequestMapping(value = "/wms/placeorder/insertOrder", method = RequestMethod.GET)
	public String insertOrder(Model model) {
		System.out.println("PlaceOrderController insertOrder");
		
		List<PlaceOrderDTO> orderList = placeOrderService.getOrderList();
		model.addAttribute("orderList", orderList);
		return "wms/placeorder/orderForm";
	}
	
	@RequestMapping(value = "/wms/placeorder/insertOrderPro", method = RequestMethod.POST)
	public String insertOrderPro(PlaceOrderDTO placeOrderDTO) {
		System.out.println("PlaceOrderController insertOrderPro");
		
		placeOrderService.insertOrder(placeOrderDTO);
		return "redirect:/wms/placeorder/insertOrder";
	}

	@RequestMapping(value = "/wms/placeorder/findWarehouse", method = RequestMethod.GET)
	public String findWarehouse(HttpServletRequest request, Model model) {
		System.out.println("PlaceOrderController findWarehouse()");

		List<WarehouseDTO> warehouseList = placeOrderService.getWarehouseList();
		model.addAttribute("warehouseList", warehouseList);

		return "wms/placeorder/findWarehouse";
	}
	
	@RequestMapping(value = "/wms/placeorder/findProducts", method = RequestMethod.GET)
	public String findProducts(HttpServletRequest request, Model model) {
		System.out.println("PlaceOrderController findProducts()");
		
		List<Map<String, Object>> itemListMap = placeOrderService.getItemListMap();
		model.addAttribute("itemListMap", itemListMap);
		
		return "wms/placeorder/findProducts";
	}
	
	@RequestMapping(value = "/wms/placeorder/findEmp_num", method = RequestMethod.GET)
	public String findEmp_num(HttpServletRequest request, Model model) {
		System.out.println("PlaceOrderController findEmp_num()");

		List<EmployeeDTO> employeeList = placeOrderService.getEmployeeList();
		model.addAttribute("employeeList", employeeList);

		return "wms/placeorder/findEmp_num";
	}
	

}
