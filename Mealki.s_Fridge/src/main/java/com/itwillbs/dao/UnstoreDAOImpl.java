package com.itwillbs.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class UnstoreDAOImpl implements UnstoreDAO {
	
	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace = "com.itwillbs.mappers.unstoreMapper";

	@Override
	public List<Map<String, Object>> getUnstoreListUnreleased() {
		System.out.println("UnstoreDAOImpl getUnstoreListUnreleased");
		return sqlSession.selectList(namespace+".getUnstoreListUnreleased");
	}



}
