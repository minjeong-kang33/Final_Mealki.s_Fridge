package com.itwillbs.dao;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.itwillbs.domain.EmployeeDTO;
import com.itwillbs.domain.SearchDTO;

public interface EmployeeDAO {
	public EmployeeDTO userCheck(EmployeeDTO employeeDTO);
	
	public List<Map<String, Object>> getEmployeeListMap(SearchDTO searchDTO);
}
