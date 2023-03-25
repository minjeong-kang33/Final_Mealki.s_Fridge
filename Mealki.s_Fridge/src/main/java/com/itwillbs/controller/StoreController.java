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
	public String addStore(HttpServletRequest request, Model model,StoreDTO storeDTO) {
		System.out.println("storeController addStore()");
		
		String[] tdArr = request.getParameterValues("tdArr");
		for(int i=0; i<tdArr.length;i++) {
			System.out.println(tdArr[i]);
		}
		
		storeDTO.setOrder_num(tdArr[0]); //발주 관리번호 
		storeDTO.setOrder_qty(Integer.parseInt(tdArr[2])); //발주 개수 
		storeDTO.setSto_qty(Integer.parseInt(tdArr[3])); //입고수량
		storeDTO.setSto_remaining(Integer.parseInt(tdArr[4])-storeDTO.getSto_qty());//잔여발주량 
		
		if(storeDTO.getSto_remaining()+storeDTO.getSto_qty()==storeDTO.getOrder_qty()) {
			storeDTO.setSto_progress("입고완료");
		} else {
			storeDTO.setSto_progress("입고진행");
		}
		//발주개수보다 잔여발주량이 작으면 입고진행중
		//발주 개수랑 잔여수량이 같으면 입고완료
		
		storeDTO.setSto_empNum(Integer.parseInt(tdArr[7]));//처리 작업자 사번
		storeDTO.setSto_shelf(tdArr[8]);//선반위치
		storeDTO.setSto_shelfDetail(Integer.parseInt(tdArr[9]));//선반 층
		
		/*
		 * System.out.println("발주관리번호"+storeDTO.getOrder_num());
		 * System.out.println("발주 개수"+storeDTO.getOrder_qty());
		 * System.out.println("입고수량"+storeDTO.getSto_qty());
		 * System.out.println("잔여발주량"+storeDTO.getSto_remaining());
		 * System.out.println("진행상황"+storeDTO.getSto_progress());
		 * System.out.println("작업자사번호"+storeDTO.getSto_empNum());
		 */
		
		storeService.insertStore(storeDTO);
		
		return "redirect:/wms/store/insertStore";
	}

}
