package com.itwillbs.dao;

//import java.util.HashMap;

import java.util.List;
//import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.ItemDTO;

@Repository
public class ItemDAOImpl implements ItemDAO {
	
	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace="com.itwillbs.mappers.itemMapper";
	
	 @Override
	    public List<ItemDTO> getItemList() {
	        return sqlSession.selectList(namespace+".getItemList");
	    }
//
//	    @Override
//	    public void insertItem(ItemDTO item) {
//	        sqlSession.insert(namespace+".insertItem", item);
//	    }
//
//	    @Override
//	    public void updateItem(ItemDTO item) {
//	        sqlSession.update(namespace+".updateItem", item);
//	    }
//
//	    @Override
//	    public void deleteItem(String itemNum) {
//	        sqlSession.delete(namespace+".deleteItem", itemNum);
//	    }
//
//	    @Override
//	    public List<ItemDTO> searchItem(String itemName, String itemType) {
//	        Map<String, String> map = new HashMap<String, String>();
//	        map.put("itemName", itemName);
//	        map.put("itemType", itemType);
//	        return sqlSession.selectList(namespace+".searchItem", map);
//	    }
	}
