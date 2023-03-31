package com.itwillbs.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.itwillbs.domain.QualityDTO;
import com.itwillbs.service.QualityService;

//import com.itwillbs.service.QualityService;

@Controller
public class QualityController {
	
	@Inject
	private QualityService qualityService;
	
	@RequestMapping(value = "/mps/quality/list", method = RequestMethod.GET)
	public String listmap(QualityDTO qualityDTO, Model model){
	
	// 메서드 호출
//	검색어 받아오는 값
//	String wo_num = request.getParameter("wo_num");
//	String manu_name = request.getParameter("manu_name");
//	String item_name = request.getParameter("item_name");
//	String manu_sdate = request.getParameter("manu_sdate");
//	String manu_date = request.getParameter("manu_date");
//	String emp_Kname = request.getParameter("emp_Kname");
//	System.out.println(qualityDTO.getWo_num());
	List<Map<String, Object>> qualityListMap=qualityService.getQualityListMap(qualityDTO);
	
	// model 담아서 이동
	model.addAttribute("qualityListMap", qualityListMap);
	
//	System.out.println("작업지시번호"+wo_num);
//	System.out.println("라인명"+manu_name);
//	System.out.println("품명"+item_name);
//	System.out.println("시작시간"+manu_sdate);
//	System.out.println("마감시간"+manu_date);
//	System.out.println("작업자"+emp_Kname);
	
	return "mps/quality/listForm";
	}
	
	@RequestMapping(value = "/quality/writeForm", method = RequestMethod.GET)
	public String qualityWrite(HttpServletRequest request, Model model) {
		System.out.println("QualityController writeForm()");
		
		String wo_num=request.getParameter("wo_num");
		
		QualityDTO qualityDTO=qualityService.getQualityWrite(wo_num);
		
		model.addAttribute("qualityDTO", qualityDTO);
		
		System.out.println(qualityDTO);
		return "mps/quality/writeForm";
	}
	
//	@RequestMapping(value = "/mps/workorder/WoInsertPro", method = RequestMethod.POST)
//	public String WoInsertPro(HttpServletRequest request,HttpSession session) {
//		System.out.println("WorkorderController WoInsertPro()");
//		System.out.println(session.getAttribute("emp_num"));
//		System.out.println(request.getParameter("contract_qty"));
//		System.out.println(request.getParameter("business_num"));
//		System.out.println(request.getParameter("item_name"));
//		System.out.println(request.getParameter("manu_name"));
//		
//		int wo_emp=(int) session.getAttribute("emp_num");
//		String contract_qty=request.getParameter("contract_qty");
//		String b=request.getParameter("business_num");
//		String item_name=request.getParameter("item_name");
//		String manu_name=request.getParameter("manu_name");
//		
//		int business_num=Integer.parseInt(b);
//		
//		WorkorderDTO workorderDTO=new WorkorderDTO();
//		workorderDTO.setWo_emp(wo_emp);
//		workorderDTO.setContract_qty(contract_qty);
//		workorderDTO.setBusiness_num(business_num);
//		workorderDTO.setItem_name(item_name);
//		workorderDTO.setManu_name(manu_name);
//		
////		WorkorderDTO workorderDTO
//		workorderService.insertWorkorder(workorderDTO);
//		
//		return "mps/workorder/imsg";
//	}
}
