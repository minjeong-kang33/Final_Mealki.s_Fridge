package com.itwillbs.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.ChartDTO;

@Repository
public class ChartDAOImpl implements ChartDAO{
	@Inject
	private SqlSession sqlSession;

	private static final String namespace="com.itwillbs.mappers.chartMapper";

	@Override
	public List<ChartDTO> contract() {
		System.out.println("ChartDAOImpl contract()");
		
		
		return sqlSession.selectList(namespace+".contract");
	}

	@Override
	public List<ChartDTO> prochart() {
		
		return sqlSession.selectList(namespace+".prochart");
	}
}
