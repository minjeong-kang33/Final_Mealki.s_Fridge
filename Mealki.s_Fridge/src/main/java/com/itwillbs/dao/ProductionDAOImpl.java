package com.itwillbs.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.itwillbs.domain.ProductionDTO;

@Repository
public class ProductionDAOImpl implements ProductionDAO{
	
	@Inject
	private SqlSession sqlSession;
	//sql구문의 전체 이름
	private static final String namespace="com.itwillbs.mappers.productionMapper";

	@Override
	public List<Map<String, Object>> getProductionListMap(ProductionDTO productDTO) {
		System.out.println("ProductionDAOImpl getProductionListMap()");
		return sqlSession.selectList(namespace+".getProductionListMap", productDTO);
	}

	@Override
	public List<Map<String, Object>> getProductionWriteMap(ProductionDTO productDTO) {
		System.out.println("ProductionDAOImpl getProductionWriteMap()");
		return sqlSession.selectList(namespace+".getProductionWriteMap", productDTO);
	}

	@Override
	public ProductionDTO getemp_Knamesession(int emp_num) {
		System.out.println("ProductionDAOImpl getemp_Knamesession()");
		return sqlSession.selectOne(namespace+".getemp_Knamesession", emp_num);
	}
	
}
