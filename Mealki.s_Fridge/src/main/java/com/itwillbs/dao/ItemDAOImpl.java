package com.itwillbs.dao;

import java.util.HashMap;


import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.CustomerDTO;
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
	 public int getItemCount(PageDTO pageDTO) {
		 System.out.println("ItemDAOImpl getItemCount()");
		 
		 return sqlSession.selectOne(namespace+".getItemCount", pageDTO);
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

	@Override
	public String getMaxItemNum(String prefix) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+".getMaxItemNum",prefix);
	}

	@Override
	public List<CustomerDTO> getCustomerList() {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+".getCustomerList");
	}

//	@Override
//	public ItemDTO getItemByNum(String item_num) {
//		// TODO Auto-generated method stub
//		return sqlSession.selectOne(namespace+".getItemByNum", item_num);
//	}

	
	

}
