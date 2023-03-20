package com.itwillbs.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.PlaceOrderDTO;
import com.itwillbs.domain.WarehouseDTO;

@Repository
public class PlaceOrderDAOImpl implements PlaceOrderDAO{
	@Inject
	private SqlSession sqlSession;
	private WarehouseDTO warehouseDTO;
	private static final String namespace="com.itwillbs.mappers.placeOrderMapper";
	
	@Override
	public List<WarehouseDTO> getWarehouseList(PageDTO pageDTO) {
		System.out.println("PlaceOrderDAOImpl getWarehouseList()");
		pageDTO.setStartRow(pageDTO.getStartRow()-1);
		
		return sqlSession.selectList(namespace+".getWarehouseList", pageDTO);
	}

	@Override
	public int getStk_qnt() {
		
		return sqlSession.selectOne(namespace+".getStk_qnt", namespace);
	}
	
	
	
	
}
