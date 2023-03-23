package com.itwillbs.service;

import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.mail.HtmlEmail;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.itwillbs.dao.EmployeeDAO;
import com.itwillbs.domain.EmployeeDTO;

@Service
public class EmployeeServiceImpl implements EmployeeService {
	@Inject
	private EmployeeDAO employeeDAO;

	@Override
	public EmployeeDTO userCheck(EmployeeDTO employeeDTO) {
		System.out.println("EmployeeServiceImpl userCheck()");

		return employeeDAO.userCheck(employeeDTO);
	}

	@Override
	public List<Map<String, Object>> getEmployeeListMap(Model model, HttpServletRequest request) {
		System.out.println("EmployeeServiceImpl getEmployeeList");
		return employeeDAO.getEmployeeListMap(model, request);
	}


}
