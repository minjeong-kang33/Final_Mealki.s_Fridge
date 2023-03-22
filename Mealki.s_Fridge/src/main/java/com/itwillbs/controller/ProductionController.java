package com.itwillbs.controller;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
	public String listmap(Model model) {
	// 메서드 호출
	List<Map<String, Object>> productionListMap=productionService.getProductionListMap();
	
	// model 담아서 이동
	model.addAttribute("productionListMap", productionListMap);
	// 주소줄 변경없이 이동
	// /WEB-INF/views/member/main.jsp
	return "mps/production/listForm";
	
	}
}
