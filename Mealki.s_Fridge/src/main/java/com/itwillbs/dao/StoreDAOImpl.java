package com.itwillbs.dao;


import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.PlaceOrderDTO;

@Repository
public class StoreDAOImpl implements StoreDAO{

	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace = "com.itwillbs.mappers.storeMapper";

	@Override
	public List<Map<String, Object>> getItemListMapStore() {
		System.out.println("StoreDAOImpl getItemListMap");
		return sqlSession.selectList(namespace + ".getItemListMapStore");
	}

	@Override
	public List<Map<String, Object>> getPlaceOrderListStore() {
		System.out.println("StoreDAOImpl getPlaceOrderListStore");
		return sqlSession.selectList(namespace+".getPlaceOrderListStore");
	}


	


}
