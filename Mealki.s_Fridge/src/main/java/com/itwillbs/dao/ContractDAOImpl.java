package com.itwillbs.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;


import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.ContractDTO;
import com.itwillbs.domain.PageDTO;

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

	

}
