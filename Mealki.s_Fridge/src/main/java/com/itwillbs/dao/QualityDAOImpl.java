package com.itwillbs.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.QualityDTO;

@Repository
public class QualityDAOImpl implements QualityDAO{
	
	@Inject
	private SqlSession sqlSession;
	//sql구문의 전체 이름
	private static final String namespace="com.itwillbs.mappers.qualityMapper";
	
	@Override
	public List<Map<String, Object>> getQualityListMap(QualityDTO qualityDTO) {
		System.out.println("QualityDAOImpl getQualityListMap()");
		
		return sqlSession.selectList(namespace+".getQualityListMap", qualityDTO);
	}
}
