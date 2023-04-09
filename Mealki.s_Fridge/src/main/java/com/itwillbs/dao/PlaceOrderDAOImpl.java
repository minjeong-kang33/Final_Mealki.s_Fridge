package com.itwillbs.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.EmployeeDTO;
import com.itwillbs.domain.ItemDTO;
import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.PlaceOrderDTO;
import com.itwillbs.domain.WarehouseDTO;

@Repository
public class PlaceOrderDAOImpl implements PlaceOrderDAO {
	@Inject
	private SqlSession sqlSession;
	private static final String namespace = "com.itwillbs.mappers.placeOrderMapper";

	@Override
	public List<WarehouseDTO> getWarehouseList() {
		System.out.println("PlaceOrderDAOImpl getWarehouseList()");

		return sqlSession.selectList(namespace + ".getWarehouseList");
	}

	@Override
	public int getStk_qnt() {
		System.out.println("PlaceOrderDAOImpl getStk_qnt()");
		return sqlSession.selectOne(namespace + ".getStk_qnt", namespace);
	}

	@Override
	public List<Map<String, Object>> getItemListMap(PageDTO pageDTO) {
		System.out.println("PlaceOrderDAOImpl getItemListMap()");
		
		pageDTO.setStartRow(pageDTO.getStartRow()-1);
		
		return sqlSession.selectList(namespace + ".getItemListMap", pageDTO);
	}
	
	

	@Override
	public int getItemListCount(PageDTO pageDTO) {
		System.out.println("PlaceOrderDAOImpl getItemListCount()");
		
		return sqlSession.selectOne(namespace+".getItemListCount", pageDTO);
	}

	@Override
	public List<EmployeeDTO> getEmployeeList() {
		System.out.println("PlaceOrderDAOImpl getEmployeeList()");
		return sqlSession.selectList(namespace + ".getEmployeeList");
	}

	@Override
	public void insertOrder(PlaceOrderDTO placeOrderDTO) {
		System.out.println("PlaceOrderDAOImpl insertOrder()");
		sqlSession.insert(namespace + ".insertOrder", placeOrderDTO);
	}

	@Override
	public List<PlaceOrderDTO> getOrderList(PageDTO pageDTO) {
		System.out.println("PlaceOrderDAOImpl getOrderList()");
		
		pageDTO.setStartRow(pageDTO.getStartRow()-1);
		
		return sqlSession.selectList(namespace+".getOrderList", pageDTO);
	}

	@Override
	public int getOrderListCount(PageDTO pageDTO) {
		System.out.println("PlaceOrderDAOImpl getOrderListCount()");
		
		return sqlSession.selectOne(namespace+".getOrderListCount", pageDTO);
	}
	
	
	
}
