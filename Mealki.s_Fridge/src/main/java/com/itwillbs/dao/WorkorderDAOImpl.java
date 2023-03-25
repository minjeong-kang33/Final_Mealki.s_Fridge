package com.itwillbs.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.WorkorderDTO;

@Repository
public class WorkorderDAOImpl implements WorkorderDAO{

	@Inject
	private SqlSession sqlSession;

	private static final String namespace="com.itwillbs.mappers.workorderMapper";

	@Override
	public int getWorkorderCount() {
		System.out.println("WorkorderDAOImpl getWorkorderCount()");
		
		return sqlSession.selectOne(namespace+".getWorkorderCount");
	}

	@Override
	public List<WorkorderDTO> getWorkorderList(PageDTO pageDTO) {
		System.out.println("WorkorderDAOImpl getWorkorderList()");
		pageDTO.setStartRow(pageDTO.getStartRow()-1);
		
		return sqlSession.selectList(namespace+".getWorkorderList", pageDTO);
	}
	
	@Override
	public int getContractCount() {
		System.out.println("WorkorderDAOImpl getConstractCount()");
		
		return sqlSession.selectOne(namespace+".getContractCount");
	}
	
	@Override
	public List<WorkorderDTO> getcontractList(PageDTO pageDTO) {
		System.out.println("WorkorderDAOImpl getcontractList()");
		pageDTO.setStartRow(pageDTO.getStartRow()-1);
		
		return sqlSession.selectList(namespace+".getcontractList", pageDTO);
	}

	@Override
	public WorkorderDTO ContractSearch(String keyword) {
		System.out.println("WorkorderDAOImpl ContractSearch()");
		System.out.println(keyword);
		
		
		return sqlSession.selectOne(namespace+".ContractSearch", keyword);
	}

	@Override
	public List<WorkorderDTO> WoInsert(String num) {
		System.out.println("WorkorderDAOImpl WoInsert()");
		System.out.println(num);
		
		return sqlSession.selectList(namespace+".WoInsert", num);
	}

	@Override
	public void insertWorkorder(WorkorderDTO workorderDTO) {
		System.out.println("WorkorderDAOImpl insertWorkorder()");
		
		sqlSession.insert(namespace+".insertWorkorder", workorderDTO);
		sqlSession.insert(namespace+".insertWorkorder_item", workorderDTO);
	}

	@Override
	public List<WorkorderDTO> WoUpdateForm(String num) {
		System.out.println("WorkorderDAOImpl WoUpdateForm()");
		
		return sqlSession.selectList(namespace+".WoUpdateForm", num);
	}

	@Override
	public void updateWorkorder(WorkorderDTO workorderDTO) {
		System.out.println("WorkorderDAOImpl updateWorkorder()");
		
		sqlSession.update(namespace+".updateWorkorder", workorderDTO);		
	}

	
	
	
	
	
}