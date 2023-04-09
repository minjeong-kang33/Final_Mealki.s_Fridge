package com.itwillbs.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.ItemDTO;
import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.StockDTO;
import com.itwillbs.domain.WarehouseDTO;

@Repository
public class StockDAOImpl implements StockDAO {
	@Inject
	private SqlSession sqlSession;
	private static final String namespace = "com.itwillbs.mappers.stockMapper";

	@Override
	public List<WarehouseDTO> getWarehouseList() {
		System.out.println("StockDAOImpl getWarehouseList()");

		return sqlSession.selectList(namespace + ".getWarehouseList");
	}

	@Override
	public List<ItemDTO> getItem_typeList() {
		System.out.println("StockDAOImpl getItem_typeList()");
		return sqlSession.selectList(namespace + ".getItem_typeList");
	}

	@Override
	public List<StockDTO> getStockList(PageDTO pageDTO) {
		System.out.println("StockDAOImpl getStockList()");
		
		pageDTO.setStartRow(pageDTO.getStartRow()-1);

		return sqlSession.selectList(namespace+".getStockList", pageDTO);
	}

	@Override
	public int getStockListCount(PageDTO pageDTO) {
		System.out.println("StockDAOImpl getStockListCount()");
		
		return sqlSession.selectOne(namespace+".getStockListCount", pageDTO);
	}

	@Override
	public void updateStockqnt(StockDTO stockDTO) {
		System.out.println("StockDAOImpl updateStock()");
		
		sqlSession.update(namespace+".updateStock_qnt", stockDTO);
	}

	@Override
	public void insertStock(StockDTO stockDTO) {
		System.out.println("StockDAOImpl insertStock()");
		
		sqlSession.insert(namespace+".insertStock", stockDTO);
	}

	@Override
	public void updateStock(StockDTO stockDTO) {
		System.out.println("StockDAOImpl updateStock()");
		
		sqlSession.update(namespace+".updateStock", stockDTO);
	}
	
	
	@Override
	public StockDTO selectItem(String itemNum) {
		System.out.println("StockDAOImpl selectItem()");
		Map<String, String> map = new HashMap<>();
		map.put("itemNum", itemNum);
		return sqlSession.selectOne(namespace+".selectItem", map);
	}

	@Override
	public void deleteStock(String itemNum) {
		System.out.println("StockDAOImpl deleteStock()");
		
		sqlSession.delete(namespace+".deleteStock", itemNum);
		
	}
	
	
	
	
	

}
