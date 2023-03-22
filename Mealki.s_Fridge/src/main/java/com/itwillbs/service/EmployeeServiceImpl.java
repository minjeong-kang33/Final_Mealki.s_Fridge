package com.itwillbs.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.dao.EmployeeDAO;
import com.itwillbs.domain.EmployeeDTO;
import com.itwillbs.domain.PageDTO;

@Service
public class EmployeeServiceImpl implements EmployeeService{
	@Inject
	private EmployeeDAO employeeDAO;

	@Override
	public EmployeeDTO userCheck(EmployeeDTO employeeDTO) {
		System.out.println("EmployeeServiceImpl userCheck()");
		
		return employeeDAO.userCheck(employeeDTO);
	}

	@Override
	public List<Map<String, Object>> getEmployeeListMap() {
		System.out.println("EmployeeServiceImpl getEmployeeList");
		return employeeDAO.getEmployeeListMap();
	}

	
}
