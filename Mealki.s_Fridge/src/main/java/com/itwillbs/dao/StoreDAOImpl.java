package com.itwillbs.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.management.NotificationEmitter;

import org.apache.ibatis.session.SqlSession;
import org.apache.taglibs.standard.extra.spath.SPathFilter;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.StoreDTO;

@Repository
public class StoreDAOImpl implements StoreDAO {

	@Inject
	private SqlSession sqlSession;

	private static final String namespace = "com.itwillbs.mappers.storeMapper";

	@Override
	public List<Map<String, Object>> getItemListMapStore() {
		System.out.println("StoreDAOImpl getItemListMap");
		return sqlSession.selectList(namespace + ".getItemListMapStore");
	}

	@Override
	public List<Map<String, Object>> getPlaceOrderListStore(PageDTO pageDTO) {
		System.out.println("StoreDAOImpl getPlaceOrderListStore");
		
		pageDTO.setStartRow(pageDTO.getStartRow()-1);
		
		return sqlSession.selectList(namespace + ".getPlaceOrderListStore",pageDTO);
	}
	
	@Override
	public void insertStore(StoreDTO storeDTO) {
		System.out.println("StoreDAOImpl insertStore");
		  
		sqlSession.insert(namespace + ".insertStore", storeDTO);
		sqlSession.update(namespace + ".updateStock", storeDTO);

	}


	@Override
	public int getStoreSearchListCount(PageDTO pageDTO) {
		System.out.println("StoreDAOImpl getStoreSearchListCount");
		return sqlSession.selectOne(namespace+".getStoreSearchListCount", pageDTO);
	}

	@Override
	public List<Map<String, Object>> getStoreDetailList(String order_num, String item_name) {
		System.out.println("StoreDAOImpl getStoreDetailList");
		
		Map<String, Object> params = new HashMap<String, Object>();
	    params.put("order_num", order_num);
	    params.put("item_name", item_name);
	    return sqlSession.selectList(namespace + ".getStoreDetailList", params);
		
		//return sqlSession.selectList(namespace+".getStoreDetailList",order_num);
	}

	@Override
	public List<Map<String, Object>> getPlaceOrderListStore2() {
		System.out.println("StoreDAOImpl getPlaceOrderListStore2");
		return sqlSession.selectList(namespace + ".getPlaceOrderListStore2");
	}

}
