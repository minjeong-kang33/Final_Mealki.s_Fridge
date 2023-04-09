package com.itwillbs.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.io.BufferedReader;
import java.net.URLDecoder;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.xml.crypto.Data;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.ObjectMapper;
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
	public String ordersearch(Model model, HttpServletRequest request) throws Exception {
		System.out.println("PlaceOrderController ordersearch");
		
		String order_num = request.getParameter("order_num");
		String order_date = request.getParameter("order_date");
		String due_date = request.getParameter("due_date");
		String item_name = request.getParameter("item_name");
		
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
		
		if(order_date == "") {
			order_date=null;
		}
		if(due_date == "") {
			due_date=null;
		}
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		if(order_date!= null) {
			java.util.Date date = sdf.parse(order_date);
			java.sql.Date order_date1 = new java.sql.Date(date.getTime());
			pageDTO.setOrder_date(order_date1);
		}
		if(due_date!= null) {
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
		model.addAttribute("order_num",order_num);
		model.addAttribute("item_name",item_name);
		model.addAttribute("order_date",order_date);
		model.addAttribute("due_date",due_date);
		model.addAttribute("pageDTO", pageDTO);
		
		return "wms/placeorder/orderForm";
	}

	@ResponseBody
	@RequestMapping(value = "/wms/placeorder/insertOrderPro", method = RequestMethod.POST)
	public String insertOrderPro(@RequestBody PlaceOrderDTO placeOrderDTO) throws Exception{
	    System.out.println("PlaceOrderController insertOrderPro");
	    
	   // 주문 추가
	   placeOrderService.insertOrder(placeOrderDTO);

	   return "orderNum";
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
		
		
		List<Map<String, Object>> itemListMap = placeOrderService.getItemListMap(pageDTO);
		
		int count = placeOrderService.getItemListCount(pageDTO);
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
		
		model.addAttribute("itemListMap", itemListMap);
		model.addAttribute("pageDTO", pageDTO);
		
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
