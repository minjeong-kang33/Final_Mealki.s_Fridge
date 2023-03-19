package com.itwillbs.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.WorkorderDTO;

@Repository
public class WorkorderDAOImpl implements WorkorderDAO{

	@Inject
	private SqlSession sqlSession;

	private static final String namespace="com.itwillbs.mappers.workorderMapper";

	@Override
	public int getWorkorderCount() {
		System.out.println("WorkorderDAOImpl getWorkorderCount()");
		
		return sqlSession.selectOne(namespace+".getWorkorderCount");
	}

	@Override
	public List<WorkorderDTO> getWorkorderList(PageDTO pageDTO) {
		System.out.println("WorkorderDAOImpl getWorkorderList()");
		pageDTO.setStartRow(pageDTO.getStartRow()-1);
		
		return sqlSession.selectList(namespace+".getWorkorderList", pageDTO);
	}
	
	
	
}