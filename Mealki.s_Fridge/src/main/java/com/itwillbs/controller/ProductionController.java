package com.itwillbs.controller;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.itwillbs.domain.ProductionDTO;
import com.itwillbs.service.ProductionService;


@Controller
public class ProductionController {
	
	@Inject
	private ProductionService productionService;
	
//	@RequestMapping(value = "/mps/production/list", method = RequestMethod.GET)
//	public String productionList() {
//		System.out.println("ProductionController list()");
//		return "mps/production/listForm";
//	}
	
	@RequestMapping(value = "/mps/production/write", method = RequestMethod.GET)
	public String productionWrite() {
		return "mps/production/writeForm";
	}
	
	@RequestMapping(value = "/mps/production/writePro", method = RequestMethod.GET)
	public String productionWritePro() {
		System.out.println("ProductionController writePro()");
		return "mps/production/writeForm";
	}
	
	@RequestMapping(value = "/mps/production/list", method = RequestMethod.GET)
	public String listmap(ProductionDTO productDTO, HttpServletRequest request, Model model){
	// 메서드 호출
	String wo_num = request.getParameter("wo_num");
	String manu_name = request.getParameter("manu_name");
	String item_name = request.getParameter("item_name");
	String manu_sdate = request.getParameter("manu_sdate");
	String manu_date = request.getParameter("manu_date");
	String emp_Kname = request.getParameter("emp_Kname");
	System.out.println(productDTO.getWo_num());
	List<Map<String, Object>> productionListMap=productionService.getProductionListMap(productDTO);
	// model 담아서 이동
	model.addAttribute("productionListMap", productionListMap);
	System.out.println("작업지시번호"+wo_num);
	System.out.println("라인명"+manu_name);
	System.out.println("품명"+item_name);
	System.out.println("시작시간"+manu_sdate);
	System.out.println("마감시간"+manu_date);
	System.out.println("작업자"+emp_Kname);
	
	return "mps/production/listForm";
	
	}
}
