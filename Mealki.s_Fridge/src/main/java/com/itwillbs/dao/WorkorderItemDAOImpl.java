package com.itwillbs.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.WorkorderItemDTO;

@Repository
public class WorkorderItemDAOImpl implements WorkorderItemDAO{

	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace="com.itwillbs.mappers.workorderItemMapper";

	@Override
	public List<WorkorderItemDTO> getItemList(String wo_num) {
		System.out.println("WorkorderItemDAOImpl getItemList");
		
		return sqlSession.selectList(namespace+".getItemList",wo_num);
	}


}
