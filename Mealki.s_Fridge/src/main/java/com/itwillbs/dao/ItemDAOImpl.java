package com.itwillbs.dao;

import java.util.HashMap;


import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.ItemDTO;
import com.itwillbs.domain.PageDTO;

@Repository
public class ItemDAOImpl implements ItemDAO {
	
	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace="com.itwillbs.mappers.itemMapper";
	
	 @Override
	    public List<ItemDTO> getItemList(PageDTO pageDTO) {
		 System.out.println("ItemDAOImpl getItemList()");
		 
		 	pageDTO.setStartRow(pageDTO.getStartRow()-1);
		 
	        return sqlSession.selectList(namespace+".getItemList", pageDTO);
	    }
	 
	 @Override
	 public int getItemCount() {
		 System.out.println("ItemDAOImpl getItemCount()");
		 
		 return sqlSession.selectOne(namespace+".getItemCount");
	 }

	@Override
	public void saveItemImage(String itemNum, String imageName) {
		 sqlSession.insert("itemMapper.saveItemImage", Map.of("itemNum", itemNum, "imageName", imageName));
		
	}

	@Override
	public String getItemImage(String itemNum) {
		return sqlSession.selectOne("itemMapper.getItemImage", itemNum);

	}
	@Override
	public void insertItem(ItemDTO item) {
			sqlSession.insert(namespace+".insertItem", item);
	}

	@Override
	public void updateItem(ItemDTO item) {
			sqlSession.update(namespace+".updateItem", item);
	}

	@Override
	public void deleteItem(String itemNum) {
			sqlSession.delete(namespace+".deleteItem", itemNum);
	}

	@Override
	public ItemDTO selectItem(String itemNum) {
		Map<String, String> map = new HashMap<>();
		map.put("itemNum", itemNum);
		return sqlSession.selectOne(namespace+".selectItem", map);
	}

	
	

}
