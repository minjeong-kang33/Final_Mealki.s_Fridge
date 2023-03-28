package com.itwillbs.controller;




import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.itwillbs.domain.StoreDTO;
import com.itwillbs.service.StoreService;


@Controller
public class StoreController {

	@Inject
	private StoreService storeService;
	
	@RequestMapping(value = "/wms/store/insertStore", method = RequestMethod.GET)
	public String insertStore(HttpServletRequest request, Model model) {
		System.out.println("storeController insertStore");
		
		//미입고 리스트
		List<Map<String, Object>> placeOrderListStore = storeService.getPlaceOrderListStore();
		model.addAttribute("PlaceOrderListStore", placeOrderListStore);
		
		//입고리스트
		List<Map<String, Object>> placeOrderListStorecomplete = storeService.getPlaceOrderListStorecomplete();
		model.addAttribute("PlaceOrderListStorecomplete", placeOrderListStorecomplete);
		
		//전체 리스트
		List<Map<String, Object>> placeOrderListStoreAll = storeService.getPlaceOrderListStoreAll();
		model.addAttribute("PlaceOrderListStoreAll", placeOrderListStoreAll);		
		
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

		  storeService.insertStore(storeDTO);
			 
		 return "wms/store/insertStore";		

		
	}

}
