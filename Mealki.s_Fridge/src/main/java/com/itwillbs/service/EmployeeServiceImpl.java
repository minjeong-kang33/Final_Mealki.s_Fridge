package com.itwillbs.service;

import java.sql.Timestamp;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.itwillbs.dao.EmployeeDAO;
import com.itwillbs.domain.EmployeeDTO;
import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.SearchDTO;

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
	public List<Map<String, Object>> getEmployeeListMap(SearchDTO searchDTO) {
		System.out.println("EmployeeServiceImpl getEmployeeList");
		return employeeDAO.getEmployeeListMap(searchDTO);
	}

	@Override
	public void insertEmployee(EmployeeDTO employeeDTO) {
		System.out.println("EmployeeServiceImpl insertEmployee");
		
		employeeDTO.setEmp_joinDate(new Timestamp(System.currentTimeMillis()));
		
		employeeDAO.insertEmployee(employeeDTO);
		
	}

	@Override
	public List<Map<String, Object>> getEmployeeDetail(int emp_num) {
		System.out.println("EmployeeServiceImpl getEmployeeDetail");
		return employeeDAO.getEmployeeDetail(emp_num);
	}

	@Override
	public void updateEmployee(EmployeeDTO employeeDTO) {
		System.out.println("EmployeeServiceImpl updateEmployee");
		employeeDAO.updateEmployee(employeeDTO);
	}

	@Override
	public void absenceEmployee(int emp_num) {
		System.out.println("EmployeeServiceImpl absenceEmployee");
		employeeDAO.absenceEmployee(emp_num);
	}

	@Override
	public void leaveEmployee(int emp_num) {
		System.out.println("EmployeeServiceImpl absenceEmployee");
		employeeDAO.leaveEmployee(emp_num);		
	}

	@Override
	public void rehabilitationEmployee(int emp_num) {
		System.out.println("EmployeeServiceImpl rehabilitationEmployee");
		employeeDAO.rehabilitationEmployee(emp_num);			
	}

	@Override
	public List<Map<String, Object>> yellowPage(PageDTO pageDTO) {
		System.out.println("EmployeeServiceImpl yellowPage");
		int startRow=(pageDTO.getCurrentPage()-1)*pageDTO.getPageSize()+1;
		int endRow = startRow+pageDTO.getPageSize()-1;
		
		pageDTO.setStartRow(startRow);
		pageDTO.setEndRow(endRow);
		return employeeDAO.yellowPage(pageDTO);
	}

	@Override
	public int yellowPageCount(PageDTO pageDTO) {
		System.out.println("EmployeeServiceImpl yellowPageCount ");
		return employeeDAO.yellowPageCount(pageDTO);
	}

	
}
