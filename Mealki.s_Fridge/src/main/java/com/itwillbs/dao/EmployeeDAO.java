package com.itwillbs.dao;

import java.util.List;
import java.util.Map;

import com.itwillbs.domain.EmployeeDTO;

public interface EmployeeDAO {
	public EmployeeDTO userCheck(EmployeeDTO employeeDTO);
	
	public List<Map<String, Object>> getEmployeeListMap();
}
