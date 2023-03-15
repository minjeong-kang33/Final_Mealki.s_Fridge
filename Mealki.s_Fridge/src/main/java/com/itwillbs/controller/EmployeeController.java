package com.itwillbs.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.itwillbs.domain.EmployeeDTO;
import com.itwillbs.service.EmployeeService;


@Controller
public class EmployeeController {
	@Inject
	private EmployeeService employeeService;
	
	@RequestMapping(value = "/employee/login", method = RequestMethod.GET)
	public String login() {
		return "employee/loginForm";
	}
	
	@RequestMapping(value = "/employee/loginPro", method = RequestMethod.POST)
	public String loginPro(EmployeeDTO employeeDTO, HttpSession session) {
		System.out.println("EmployeeController loginPro()");
		EmployeeDTO employeeDTO2=employeeService.userCheck(employeeDTO);
		
		if(employeeDTO2 != null) {
			System.out.println("로그인 성공");
			session.setAttribute("emp_num", employeeDTO.getEmp_num());
			return "redirect:/main/main";
		}else {
			System.out.println("로그인 실패");
			return "employee/msg";
		}
		
	}
	
	@RequestMapping(value = "/main/main", method = RequestMethod.GET)
	public String main() {
		return "main/main";
	}
}
