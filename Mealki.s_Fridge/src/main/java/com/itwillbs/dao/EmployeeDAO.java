package com.itwillbs.dao;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.itwillbs.domain.EmployeeDTO;
import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.SearchDTO;


public interface EmployeeDAO {
	public EmployeeDTO userCheck(EmployeeDTO employeeDTO);
	
	public List<Map<String, Object>> getEmployeeListMap(SearchDTO searchDTO);
	
	public void insertEmployee(EmployeeDTO employeeDTO);
	
	public List<Map<String, Object>> getEmployeeDetail(int emp_num);
	
	public void updateEmployee(EmployeeDTO employeeDTO);
	
	public void absenceEmployee(int emp_num);
	
	public void leaveEmployee(int emp_num);
	
	public void rehabilitationEmployee(int emp_num);
	
	public List<Map<String, Object>> yellowPage(PageDTO pageDTO);
	
	public int yellowPageCount(PageDTO pageDTO);
}
