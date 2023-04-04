package com.itwillbs.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.ProductionDTO;
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

	@Override
	public QualityDTO getQualityWrite(String wo_num) {
		
		return sqlSession.selectOne(namespace+".getQualityWrite", wo_num);
	}
	
	@Override
	public QualityDTO getemp_Knamesession(int emp_num) {
		System.out.println("ProductionDAOImpl getemp_Knamesession()");
		return sqlSession.selectOne(namespace+".getemp_Knamesession", emp_num);
	}

	@Override
	public QualityDTO getQualityCode(String wo_num) {
		
		return sqlSession.selectOne(namespace+".getQualityCode", wo_num);
	}

	@Override
	public void insertQuality(QualityDTO qualityDTO) {
		sqlSession.insert(namespace+".insertQuality", qualityDTO);
	}
	
	@Override
	public void updateQuality(QualityDTO qualityDTO) {
		sqlSession.insert(namespace+".updateQuality", qualityDTO);
	}

	@Override
	public List<Map<String, Object>> getQualityFailList(QualityDTO qualityDTO) {
		System.out.println("QualityDAOImpl getQualityFailList()");
		
		return sqlSession.selectList(namespace+".getQualityFailList", qualityDTO);
	}

	@Override
	public QualityDTO getFailWrite(String wo_num) {
		return sqlSession.selectOne(namespace+".getFailWrite", wo_num);
	}

	@Override
	public void insertFail(QualityDTO qualityDTO) {
		sqlSession.insert(namespace+".insertFail", qualityDTO);
		
	}

	@Override
	public void updateFail(QualityDTO qualityDTO) {
		sqlSession.insert(namespace+".updateFail", qualityDTO);
	}
	
	
}
