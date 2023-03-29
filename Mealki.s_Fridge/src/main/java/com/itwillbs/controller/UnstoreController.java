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
			String wo_num = unstoreListUnreleased.get(i).get("wo_num").toString(); //추출된표에서 wo_num을 추출 
			
			WorkorderItemDTO workorderItemDTO = new WorkorderItemDTO();
			workorderItemDTO.setWo_num(wo_num);
			workorderItemService.getItemList(wo_num); //작업지시번호로 생산을 위해 필요한 품목과 총수량을 가져옴
			
			List<WorkorderItemDTO> itemList = workorderItemService.getItemList(wo_num);
			
			for (WorkorderItemDTO item : itemList) {
			    System.out.print(item.getItem_name()+" ");
			} // 품목이 잘 가져와지는지 확인
			
			
		}
		return "wms/unstore/insertUnstore";
	}
}
