package com.itwillbs.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class WorkorderItemDAOImpl implements WorkorderItemDAO{

	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace="com.itwillbs.mappers.workorderItemMapper";


}
