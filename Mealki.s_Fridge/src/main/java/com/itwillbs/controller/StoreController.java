package com.itwillbs.controller;




import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.StoreDTO;
import com.itwillbs.service.StoreService;


@Controller
public class StoreController {

	@Inject
	private StoreService storeService;
	
	@RequestMapping(value = "/wms/store/insertStore", method = RequestMethod.GET)
	public String insertStore(HttpServletRequest request, Model model) throws Exception {
		System.out.println("storeController insertStore");
		
		String sto_num = request.getParameter("sto_num");
		String startDate = request.getParameter("startDate");
		String endDate = request.getParameter("endDate");
		String e_num = request.getParameter("emp_num");
		String item_name = request.getParameter("item_name");
		
		System.out.println("날짜"+startDate+endDate);
		if(e_num==""||e_num==null) {e_num="0";}
		
		int emp_num = Integer.parseInt(e_num);
		
		System.out.println("dd "+ emp_num);
		
		int pageSize=15;
		
		String pageNum=request.getParameter("pageNum");
		if(pageNum==null) {pageNum="1";}
		
		System.out.println("pageNum"+pageNum);
		
		int currentPage=Integer.parseInt(pageNum);
		
		PageDTO pageDTO = new PageDTO();
		pageDTO.setPageSize(pageSize);
		pageDTO.setPageNum(pageNum);
		pageDTO.setCurrentPage(currentPage);
		pageDTO.setEmp_num(emp_num);
		pageDTO.setSto_num(sto_num);
		pageDTO.setItem_name(item_name);
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		if(startDate != null && !startDate.equals("")) {
			java.util.Date date = sdf.parse(startDate);
			java.sql.Date order_date1 = new java.sql.Date(date.getTime());
			pageDTO.setStartDate(order_date1);
		}
		if(endDate != null && !endDate.equals("")) {
			java.util.Date date2 = sdf.parse(endDate);
			java.sql.Date due_date1 = new java.sql.Date(date2.getTime());  
			pageDTO.setEndDate(due_date1);
		}	
		
		
		List<Map<String, Object>> placeOrderListStore = storeService.getPlaceOrderListStore(pageDTO);
		model.addAttribute("PlaceOrderListStore", placeOrderListStore);
		
		int count = storeService.getStoreSearchListCount(pageDTO);
		
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
		
		model.addAttribute("sto_num",sto_num);
		model.addAttribute("item_name",item_name);
		model.addAttribute("emp_num",emp_num);
		model.addAttribute("startDate",startDate);
		model.addAttribute("endDate",endDate);
		model.addAttribute("pageDTO",pageDTO);
		
		return "wms/store/insertStore";
	}
	
	@RequestMapping(value = "/wms/store/findProduct", method = RequestMethod.GET)
	public String findProducts(HttpServletRequest request, Model model) {
		System.out.println("storeController findProduct()");
		
		List<Map<String, Object>> itemListMapStore = storeService.getItemListMapStore();
		model.addAttribute("itemListMapStore", itemListMapStore);
		
		return "wms/store/findProduct";
	}
	
	@ResponseBody
	@RequestMapping(value = "/wms/store/addStore", method = RequestMethod.GET)
	public String addStore(HttpServletRequest request, Model model) {
		System.out.println("storeController addStore()");
		 
		 System.out.println(request.getParameter("order_qty"));
		 

		StoreDTO storeDTO = new StoreDTO();
			
		storeDTO.setOrder_num(request.getParameter("order_num"));
		  //var item_name =tdArr[1]; //품명
		  storeDTO.setSto_qty(Integer.parseInt(request.getParameter("order_qty")));
		  //var stk_qnt = tdArr[3]; //창고재고수량
		  storeDTO.setSto_progress("입고완료");
		  storeDTO.setSto_empNum(Integer.parseInt(request.getParameter("sto_empNum")));
		  storeDTO.setSto_shelf(request.getParameter("sto_shelf"));
		  storeDTO.setSto_shelfDetail(Integer.parseInt(request.getParameter("sto_shelfDetail")));
		  storeDTO.setItem_name(request.getParameter("item_name"));

		  storeService.insertStore(storeDTO);
			 
		 return "wms/store/insertStore";		
	}
	
	@RequestMapping(value = "/wms/store/storeDetail", method = RequestMethod.GET)
	public String storeDetail(HttpServletRequest request, Model model) {
		System.out.println("storeController storeDetail()");
		
		String order_num = request.getParameter("order_num");
		String item_name = request.getParameter("item_name");
		System.out.println(order_num);
		List<Map<String, Object>> storeDetailList = storeService.getStoreDetailList(order_num,item_name);
		model.addAttribute("storeDetailList", storeDetailList);

		return "wms/store/storeDetail";
	}
	

}
