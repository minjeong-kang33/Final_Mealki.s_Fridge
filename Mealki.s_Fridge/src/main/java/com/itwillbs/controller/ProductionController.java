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
	public ModelAndView listmap(ModelAndView modelAndView, HttpServletRequest request) throws Exception{
	// 메서드 호출
	ModelAndView mv= new ModelAndView();
	String wo_num = request.getParameter("wo_num");
	String manu_name = request.getParameter("manu_name");
	String item_name = request.getParameter("item_name");
	String manu_sdate = request.getParameter("manu_sdate");
	String manu_date = request.getParameter("manu_date");
	String emp_Kname = request.getParameter("emp_Kname");

	List<Map<String, Object>> productionListMap=productionService.getProductionListMap(modelAndView, request);
	
	// model 담아서 이동
	
	if(wo_num != null && wo_num !="") {
		mv.addObject("wo_num", wo_num);
	}else if(manu_name != null && manu_name !="") {
		mv.addObject("manu_name", manu_name);
	}else if(item_name != null && item_name !="") {
		mv.addObject("item_name", item_name);
	}else if(manu_sdate != null && manu_sdate !="") {
		mv.addObject("manu_sdate", manu_sdate);
	}else if(manu_date != null && manu_date !="") {
		mv.addObject("manu_date", manu_date);
	}else if(emp_Kname != null && emp_Kname !="") {
		mv.addObject("emp_Kname", emp_Kname);
	}else {
	mv.addObject("productionListMap", productionListMap);
	}
	mv.setViewName("mps/production/list");
	
	System.out.println("작업지시번호"+wo_num);
	System.out.println("라인명"+manu_name);
	System.out.println("품명"+item_name);
	System.out.println("시작시간"+manu_sdate);
	System.out.println("마감시간"+manu_date);
	System.out.println("작업자"+emp_Kname);
	System.out.println(":"+productionListMap);
	
	System.out.println(mv.addObject("productionListMap", productionListMap));
	// 주소줄 변경없이 이동
	// /WEB-INF/views/member/main.jsp
	return mv;
	
	}
}
