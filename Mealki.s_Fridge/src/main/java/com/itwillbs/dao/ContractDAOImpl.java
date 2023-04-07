package com.itwillbs.dao;


import java.util.List;
import java.util.Map;

import javax.inject.Inject;


import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.ContractDTO;
import com.itwillbs.domain.EmployeeDTO;
import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.PlaceOrderDTO;

@Repository
public class ContractDAOImpl implements ContractDAO{
	
	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace="com.itwillbs.mappers.contractMapper";
	
	@Override
	public void contractInsertBoard(ContractDTO dto) {
		System.out.println("ContractDAOImpl contractInsertBoard()");
		
		  sqlSession.insert(namespace+".contractInsertBoard", dto);
	}

	@Override
	public List<ContractDTO> getBoardList(PageDTO pageDTO) {
		System.out.println("ContractDAOImpl selectBoardList()");
		
		pageDTO.setStartRow(pageDTO.getStartRow()-1);
		return sqlSession.selectList(namespace+".getBoardList", pageDTO);
	}

	@Override
	public int getContractCount(PageDTO pageDTO) {
		System.out.println(pageDTO.getSearch());
		return sqlSession.selectOne(namespace+".getContractCount", pageDTO);
	}

	@Override
	public int selectContractTotal(ContractDTO dto) {
		
		return sqlSession.selectOne(namespace+".selectContractTotal",dto);
	}

	@Override
	public List<Map<String, Object>> getContractListMap() {
		
		return sqlSession.selectList(namespace+".getContractListMap");
	}

	@Override
	public ContractDTO getBoard(int business_num) {
		
		return sqlSession.selectOne(namespace+".getBoard",business_num);
	}

	@Override
	public void updateBoard(ContractDTO dto) {

		sqlSession.update(namespace+".updateBoard", dto);
	}

	@Override
	public void deleteBoard(int business_num) {
		sqlSession.delete(namespace+".deleteBoard", business_num);
		
	}

	@Override
	public List<PlaceOrderDTO> getProductList() {
		return sqlSession.selectList(namespace + ".getProductList");
	}

	@Override
	public List<ContractDTO> getNameList() {
		
		return sqlSession.selectList(namespace + ".getNameList");
	}

	@Override
	public List<EmployeeDTO> getNameList2() {
		return sqlSession.selectList(namespace + ".getNameList2");
	}

	

	

}
