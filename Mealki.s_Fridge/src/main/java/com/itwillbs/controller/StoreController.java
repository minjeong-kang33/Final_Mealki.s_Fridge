package com.itwillbs.controller;




import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.itwillbs.domain.StoreDTO;
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
	
	@RequestMapping(value = "/wms/store/addStore", method = RequestMethod.POST)
	public String addStore(HttpServletRequest request, Model model,StoreDTO StoreDTO) {
		System.out.println("storeController addStore()");
		
		String[] tdArr = request.getParameterValues("tdArr");
		for(int i=0; i<tdArr.length;i++) {
			System.out.println(tdArr[i]);
		}
		
		StoreDTO.setOrder_num(tdArr[0]); //발주 관리번호 
		StoreDTO.setSto_qty(Integer.parseInt(tdArr[3])); //입고수량
		StoreDTO.setSto_empNum(Integer.parseInt(tdArr[7]));//처리 작업자 사번
		StoreDTO.setSto_shelf(tdArr[8]);
		StoreDTO.setSto_shelfDetail(Integer.parseInt(tdArr[9]));
		
		return "/wms/store/insertStore";
	}

}
