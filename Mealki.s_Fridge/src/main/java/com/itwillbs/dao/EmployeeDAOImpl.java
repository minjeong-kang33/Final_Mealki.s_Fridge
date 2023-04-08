package com.itwillbs.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.javassist.scopedpool.ScopedClassPool;
import org.apache.ibatis.session.SqlSession;
import org.apache.taglibs.standard.extra.spath.SPathFilter;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;

import com.itwillbs.domain.EmployeeDTO;
import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.SearchDTO;


@Repository
public class EmployeeDAOImpl implements EmployeeDAO{

	@Inject
	private SqlSession sqlSession;
	private static final String namespace="com.itwillbs.mappers.employeeMapper";
	
	@Override
	public EmployeeDTO userCheck(EmployeeDTO employeeDTO) {
		System.out.println("EmployeeDAOImpl userCheck()");
		
		return sqlSession.selectOne(namespace+".userCheck", employeeDTO);
	}

	@Override
	public List<Map<String, Object>> getEmployeeListMap(SearchDTO searchDTO) {
		System.out.println("EmployeeDAOImpl getEmployeeListMap");
		
		//searchDTO.setKeyword("%"+searchDTO.getKeyword()+"%");
		return sqlSession.selectList(namespace+".getEmployeeListMap",searchDTO);
	}

	@Override
	public void insertEmployee(EmployeeDTO employeeDTO) {
		System.out.println("EmployeeDAOImpl insertEmployee");
		
		sqlSession.insert(namespace+".insertEmployee",employeeDTO);
		
	}

	@Override
	public List<Map<String, Object>> getEmployeeDetail(int emp_num) {
		System.out.println("EmployeeDAOImpl getEmployeeDetail");
		return sqlSession.selectList(namespace+".getEmployeeDetail",emp_num);
	}

	@Override
	public void updateEmployee(EmployeeDTO employeeDTO) {
		System.out.println("EmployeeDAOImpl updateEmployee");
	
		sqlSession.update(namespace+".updateEmployee",employeeDTO);
	}

	@Override
	public void absenceEmployee(int emp_num) {
		System.out.println("EmployeeDAOImpl absenceEmployee");
		sqlSession.update(namespace+".absenceEmployee",emp_num);
	}

	@Override
	public void leaveEmployee(int emp_num) {
		System.out.println("EmployeeDAOImpl leaveEmployee");
		sqlSession.update(namespace+".leaveEmployee",emp_num);		
	}

	@Override
	public void rehabilitationEmployee(int emp_num) {
		System.out.println("EmployeeDAOImpl rehabilitationEmployee");
		sqlSession.update(namespace+".rehabilitationEmployee",emp_num);			
	}

	@Override
	public List<Map<String, Object>>  yellowPage(PageDTO pageDTO) {
		System.out.println("EmployeeDAOImpl yellowPage");
		pageDTO.setStartRow(pageDTO.getStartRow()-1);
		return sqlSession.selectList(namespace+".yellowPage",pageDTO);
	}

	@Override
	public int yellowPageCount(PageDTO pageDTO) {
		System.out.println("EmployeeDAOImpl yellowPageCount");
		return sqlSession.selectOne(namespace+".yellowPageCount",pageDTO);
	};
	
}
