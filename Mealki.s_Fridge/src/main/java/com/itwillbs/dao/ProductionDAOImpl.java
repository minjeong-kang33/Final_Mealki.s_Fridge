package com.itwillbs.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class ProductionDAOImpl implements ProductionDAO{
	
	@Inject
	private SqlSession sqlSession;
	//sql구문의 전체 이름
	private static final String namespace="com.itwillbs.mappers.productionMapper";

	@Override
	public List<Map<String, Object>> getProductionListMap() {
		System.out.println("MemberDAOImpl getProductionListMap()");
		
		return sqlSession.selectList(namespace+".getProductionListMap");
	}

}
