package com.itwillbs.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.apache.taglibs.standard.extra.spath.SPathFilter;
import org.springframework.stereotype.Repository;

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
	public List<Map<String, Object>> getPlaceOrderListStore() {
		System.out.println("StoreDAOImpl getPlaceOrderListStore");
		return sqlSession.selectList(namespace + ".getPlaceOrderListStore");
	}

//	@Override
//	public void insertStore(StoreDTO storeDTO) {
//		System.out.println("StoreDAOImpl insertStore");
//		
//		System.out.println(storeDTO.getSto_num());
//		System.out.println(storeDTO.getOrder_num());
//		System.out.println(storeDTO.getSto_date());
//		System.out.println(storeDTO.getSto_progress());
//		System.out.println(storeDTO.getSto_qty());
//		System.out.println(storeDTO.getSto_shelf());
//		System.out.println(storeDTO.getSto_shelfDetail());
//		System.out.println(storeDTO.getSto_empNum());
//		System.out.println(storeDTO.getSto_remaining());
//		System.out.println(storeDTO.getOrder_qty());
//		  
//		sqlSession.insert(namespace + "insertStore", storeDTO);
//
//	}

}
