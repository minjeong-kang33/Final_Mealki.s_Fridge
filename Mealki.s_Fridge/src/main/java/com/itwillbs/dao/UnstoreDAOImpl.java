package com.itwillbs.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.UnstoreDTO;

@Repository
public class UnstoreDAOImpl implements UnstoreDAO {
	
	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace = "com.itwillbs.mappers.unstoreMapper";


	@Override
	public void insertUnstore(UnstoreDTO unstoreDTO) {
		System.out.println("UnstoreDAOImpl insertUnstore");
		System.out.println(unstoreDTO.getEmp_num());
		sqlSession.insert(namespace+".insertUnstore",unstoreDTO);
		sqlSession.update(namespace+".updateStock_unstore",unstoreDTO);
	}

	@Override
	public List<Map<String, Object>> getUnstoreList(PageDTO pageDTO) {
		System.out.println("UnstoreDAOImpl getUnstoreList");
		
		pageDTO.setStartRow(pageDTO.getStartRow()-1);
		
		return sqlSession.selectList(namespace+".getUnstoreList",pageDTO);
	}

	@Override
	public int getUnstoreListCount(PageDTO pageDTO) {
		System.out.println("UnstoreDAOImpl getUnstoreListCount");
		return sqlSession.selectOne(namespace+".getUnstoreListCount", pageDTO);
	}

	@Override
	public List<Map<String, Object>> getUnstoreDetailList(String wo_num) {
		System.out.println("UnstoreDAOImpl getUnstoreDetailList");
		return sqlSession.selectList(namespace+".getUnstoreDetailList",wo_num);
	}

	@Override
	public List<Map<String, Object>> getunstoreStatus(String wo_num) {
		System.out.println("UnstoreDAOImpl getunstoreStatus");
		return sqlSession.selectList(namespace+".getunstoreStatus",wo_num);
	}



}
