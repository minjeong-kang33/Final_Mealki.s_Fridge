package com.itwillbs.controller;

import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.itwillbs.domain.StockDTO;
import com.itwillbs.domain.StoreDTO;
import com.itwillbs.domain.UnstoreDTO;
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
				String item_name = item.getItem_name(); //오더에 따른 소요량 테이블
				
				/*
				 * StockDTO stockDTO = new StockDTO(); stockDTO.setItem_name(item_name);
				 * stockService.getItemList_unstore(item_name);
				 * 
				 * 
				 * int sqt = stockService.getItemList_unstore(item_name);
				 * System.out.println(sqt);
				 */
					
				  
			} // 품목이 잘 가져와지는지 확인 
			
			
		}
		return "wms/unstore/insertUnstore";
	}
	
	
	@ResponseBody
	@RequestMapping(value = "/wms/unstore/addUntore", method = RequestMethod.GET)
	public String addStore(HttpServletRequest request, Model model) {
		System.out.println("UnstoreController addUntore()");
		 
		 System.out.println(request.getParameter("item_num")); //데이터 잘 들고오는지 확인
		
		 UnstoreDTO unstoreDTO = new UnstoreDTO();
		 unstoreDTO.setWo_num(request.getParameter("wo_num"));//작업지시번호
		 unstoreDTO.setItem_name(request.getParameter("item_name"));//납품처명
		 unstoreDTO.setUnsto_qty(Integer.parseInt(request.getParameter("wo_qty")));//입고수량
		 unstoreDTO.setUnsto_progress("입고완료");
		 unstoreDTO.setEmp_num(Integer.parseInt(request.getParameter("emp_num")));//처리사원
		 unstoreDTO.setItem_num(request.getParameter("item_num"));
		 
		 unstoreService.insertUnstore(unstoreDTO);
		
		 return "/wms/unstore/insertUnstore";		
	}
}
