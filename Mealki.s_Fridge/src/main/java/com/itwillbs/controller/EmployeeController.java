package com.itwillbs.controller;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.swing.plaf.IconUIResource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.itwillbs.domain.EmployeeDTO;
import com.itwillbs.service.EmployeeService;


@Controller
public class EmployeeController {
	@Inject
	private EmployeeService employeeService;
	
	@RequestMapping(value = "/main/login", method = RequestMethod.GET)
	public String login() {
		return "main/login";
	}
	
	@RequestMapping(value = "/main/loginPro", method = RequestMethod.POST)
	public String loginPro(EmployeeDTO employeeDTO, HttpSession session) {
		System.out.println("EmployeeController loginPro()");
		EmployeeDTO employeeDTO2=employeeService.userCheck(employeeDTO);
		
		if(employeeDTO2 != null) {
			session.setAttribute("emp_num", employeeDTO.getEmp_num());
			return "redirect:/main/main";
		}else {
			return "main/loginErrorMsg";
		}
	}
	
	@RequestMapping(value = "/main/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		System.out.println("MemberController logout()");
		session.invalidate();
		return "redirect:/main/main";
	}
	
	@RequestMapping(value = "/main/main", method = RequestMethod.GET)
	public String main() {
		return "main/main";
	}
	
	
	@RequestMapping(value = "/employee/empManage", method = RequestMethod.GET)
	public String empManage(Model model) {
		System.out.println("MemberController empManage");
		
			
		return "/employee/empManage";
	}
	
	@RequestMapping(value = "/employee/employeeList", method = RequestMethod.GET)
	public String employeeList(Model model, HttpServletRequest request) {
		System.out.println("MemberController employeeList");
		
		String search_option = request.getParameter("search_option");
		String keyword = request.getParameter("keyword");
		
		System.out.println(search_option);
		System.err.println(keyword);
		
		List<Map<String, Object>> employeeListMap = employeeService.getEmployeeListMap(model, request);
		model.addAttribute("employeeListMap",employeeListMap);
		model.addAttribute("search_option",search_option);
		model.addAttribute("keyword",keyword);
		
		return "/employee/empManage";
	}
	
}
