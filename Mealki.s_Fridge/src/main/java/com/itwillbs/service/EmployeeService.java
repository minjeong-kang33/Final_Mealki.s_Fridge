package com.itwillbs.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.itwillbs.domain.EmployeeDTO;

public interface EmployeeService {
	public EmployeeDTO userCheck(EmployeeDTO employeeDTO);
	
	public List<Map<String, Object>> getEmployeeListMap(Model model, HttpServletRequest request);
}
