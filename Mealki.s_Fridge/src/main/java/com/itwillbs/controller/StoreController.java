package com.itwillbs.controller;



import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.itwillbs.service.StoreService;


@Controller
public class StoreController {

	@Inject
	private StoreService storeService;
	
	@RequestMapping(value = "/wms/store/insertStore", method = RequestMethod.GET)
	public String insertStore(HttpServletRequest request, Model model) {
		System.out.println("storeController insertStore");
		
		List<Map<String, Object>> placeOrderListStore = storeService.getPlaceOrderListStore();
		model.addAttribute("PlaceOrderListStore", placeOrderListStore);
		
		return "wms/store/insertStore";
	}
	
	@RequestMapping(value = "/wms/store/findProduct", method = RequestMethod.GET)
	public String findProducts(HttpServletRequest request, Model model) {
		System.out.println("storeController findProduct()");
		
		List<Map<String, Object>> itemListMapStore = storeService.getItemListMapStore();
		model.addAttribute("itemListMapStore", itemListMapStore);
		
		return "wms/store/findProduct";
	}

}
