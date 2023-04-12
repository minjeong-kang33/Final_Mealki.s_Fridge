package com.itwillbs.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.ContractDTO;
import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.QualityDTO;
import com.itwillbs.domain.ShippingDTO;
import com.itwillbs.domain.WorkorderDTO;

@Repository
public class ShippingDAOImpl implements ShippingDAO{

	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace="com.itwillbs.mappers.shippingMapper";

	@Override
	public void shippingInsertBoard(ShippingDTO shippingDTO) {
		System.out.println("ShippingDAOImpl shippingInsertBoard()");
		
		sqlSession.insert(namespace+".shippingInsertBoard", shippingDTO);
	}

	@Override
	public List<ShippingDTO> getBoardList(PageDTO pageDTO) {
		System.out.println("ShippingDAOImpl getBoardList()");
		
		pageDTO.setStartRow(pageDTO.getStartRow()-1);
		
		return sqlSession.selectList(namespace+".getBoardList", pageDTO);
	}

	@Override
	public int getShippingCount(PageDTO pageDTO) {
		
		return sqlSession.selectOne(namespace+".getShippingCount", pageDTO);
	}

	@Override
	public int selectShippingTotal(ShippingDTO shippingDTO) {
		
		return sqlSession.selectOne(namespace+".selectShippingTotal",shippingDTO);
	}

	@Override
	public void insertShipping(ShippingDTO shippingDTO) {
		
		sqlSession.insert(namespace+".insertShipping", shippingDTO);
	}

	@Override
	public List<Map<String, Object>> getShippingListMap() {
		
		return sqlSession.selectList(namespace+".getShippingListMap");
	}

	@Override
	public List<ContractDTO> getEmployeeList() {
		
		return sqlSession.selectList(namespace+".getEmployeeList");
	}

	@Override
	public void updateShipping(ShippingDTO shippingDTO) {
		
		sqlSession.update(namespace+".updateShipping",shippingDTO);
	}

	@Override
	public List<WorkorderDTO> getShippingList() {
		return sqlSession.selectList(namespace+".getShippingList");
	}

	
	

	
}
