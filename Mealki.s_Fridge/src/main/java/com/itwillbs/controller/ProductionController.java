package com.itwillbs.controller;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.itwillbs.domain.EmployeeDTO;
import com.itwillbs.domain.ProductionDTO;
import com.itwillbs.service.EmployeeService;
import com.itwillbs.service.ProductionService;


@Controller
public class ProductionController {
	
	@Inject
	private ProductionService productionService;
	
//	@Inject
//	private EmployeeService employeeService;
	
//	@RequestMapping(value = "/mps/production/list", method = RequestMethod.GET)
//	public String productionList() {
//		System.out.println("ProductionController list()");
//		return "mps/production/listForm";
//	}
	
//	@RequestMapping(value = "/mps/production/write", method = RequestMethod.GET)
//	public String productionWrite(ProductionDTO productionDTO, HttpSession session) {
//		System.out.println(productionDTO.getEmp_Kname());
//		session.getAttribute("emp_num");
//		return "mps/production/writeForm";
//	}
	
	//가상주소 http://localhost:8080/myweb/member/info
	// 자동으로 가상주소 뽑아옴 /member/info
	@RequestMapping(value = "/mps/production/write", method = RequestMethod.GET)
	public String productionWrite(HttpSession session,Model model) {
		System.out.println("ProductionController ()");
		//세션값 가져오기
		int emp_num=(int)session.getAttribute("emp_num");
		System.out.println("세션 id : " + emp_num);
		
		ProductionDTO productionDTO=productionService.getemp_Knamesession(emp_num);
		
		// memberDTO 를 들고 member/info.jsp 로 이동
//		request.setAttribute("memberDTO",memberDTO);
		// request 대신에 스프링 제공 Model 담아서 이동
		model.addAttribute("productionDTO", productionDTO);
		
		// 주소변경 없이 이동
		// /WEB-INF/views/member/info.jsp
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
