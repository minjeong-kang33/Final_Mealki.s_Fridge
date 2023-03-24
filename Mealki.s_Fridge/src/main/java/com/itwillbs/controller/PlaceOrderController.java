package com.itwillbs.controller;

import java.util.Date;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.xml.crypto.Data;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.itwillbs.domain.EmployeeDTO;
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

		return "wms/placeorder/orderForm";
	}

	@RequestMapping(value = "/wms/placeorder/ordersearch", method = RequestMethod.GET)
	public String ordersearch(Model model, HttpServletRequest request) throws Exception {
		System.out.println("PlaceOrderController ordersearch");
		
		String order_num = request.getParameter("order_num");
		String order_date = request.getParameter("order_date");
		String due_date = request.getParameter("due_date");
		String item_name = request.getParameter("item_name");
		
		System.out.println("받은 order_num: "+order_num);
		System.out.println("받은 order_date: "+order_date);
		System.out.println("받은 due_date: "+due_date);
		System.out.println("받은 item_name: "+item_name);
		
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
		pageDTO.setOrder_num(order_num);
		pageDTO.setItem_name(item_name);
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		if(!order_date.equals("")) {
			java.util.Date date = sdf.parse(order_date);
			java.sql.Date order_date1 = new java.sql.Date(date.getTime());
			pageDTO.setOrder_date(order_date1);
		}
		if(!due_date.equals("")) {
			java.util.Date date2 = sdf.parse(due_date);
			java.sql.Date due_date1 = new java.sql.Date(date2.getTime());  
			pageDTO.setDue_date(due_date1);
		}
		
		List<PlaceOrderDTO> orderList = placeOrderService.getOrderList(pageDTO);
		
		int count = placeOrderService.getOrderListCount(pageDTO);
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
		
		model.addAttribute("orderList", orderList);
		model.addAttribute("pageDTO", pageDTO);
		
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
