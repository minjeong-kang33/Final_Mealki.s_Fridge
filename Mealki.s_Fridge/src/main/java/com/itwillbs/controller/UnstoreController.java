package com.itwillbs.controller;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.itwillbs.domain.WorkorderItemDTO;
import com.itwillbs.service.StockService;
import com.itwillbs.service.UnstoreService;
import com.itwillbs.service.WorkorderItemService;

@Controller
public class UnstoreController {
	
	
	@Inject
	private UnstoreService unstoreService;
	
	@Inject
	private WorkorderItemService workorderItemService;
	
	@Inject StockService stockService;
	

	@RequestMapping(value = "/wms/unstore/insertUnstore", method = RequestMethod.GET)
	public String insertUnstore(HttpServletRequest request, Model model) {
		System.out.println("UnstoreController insertUnstore");
		
		//미출고 리스트
		List<Map<String, Object>> unstoreListUnreleased = unstoreService.getUnstoreListUnreleased();
		model.addAttribute("unstoreListUnreleased", unstoreListUnreleased);
		
		for(int i=0; i<unstoreListUnreleased.size();i++) {
			String wo_num = unstoreListUnreleased.get(i).get("wo_num").toString();
			System.out.println(wo_num);
			
			WorkorderItemDTO workorderItemDTO = new WorkorderItemDTO();
			workorderItemDTO.setWo_num(wo_num);
			workorderItemService.getItemList(wo_num);
		}
		return "wms/unstore/insertUnstore";
	}
}
