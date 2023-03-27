package com.itwillbs.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.CustomerDTO;
import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.SearchDTO;


@Repository
public class CustomerDAOImpl implements CustomerDAO{
	
	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace="com.itwillbs.mappers.customerMapper";

	@Override
	public List<CustomerDTO> getCustomerList(PageDTO pageDTO) {
		System.out.println("CustomerDAOImpl getCustomerList()");
		
		pageDTO.setStartRow(pageDTO.getStartRow()-1);
		
		return sqlSession.selectList(namespace+".getCustomerList", pageDTO);
	}

	@Override
	public int getCustomerCount(PageDTO pageDTO) {
		System.out.println("CustomerDAOImpl getCustomerCount()");
		
		return sqlSession.selectOne(namespace+".getCustomerCount", pageDTO);
	}

	@Override
	public CustomerDTO getCustomer(String business_num) {
		System.out.println("CustomerDAOImpl getCustomer()");
		
		return sqlSession.selectOne(namespace+".getCustomer", business_num);
	}

	@Override
	public void insertCustomer(CustomerDTO customerDTO) {
		System.out.println("CustomerDAOImpl insertCustomer()");
		//메서드 호출
		sqlSession.insert(namespace+".insertCustomer", customerDTO);
	}

}
