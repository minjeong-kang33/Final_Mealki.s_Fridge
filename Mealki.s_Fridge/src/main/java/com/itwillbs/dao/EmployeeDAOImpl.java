package com.itwillbs.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;

import com.itwillbs.domain.EmployeeDTO;
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
	
}
