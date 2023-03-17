package com.itwillbs.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.WorkorderDTO;

@Repository
public class WorkorderDAOImpl implements WorkorderDAO{

	@Inject
	private SqlSession sqlSession;
	
	
	
}