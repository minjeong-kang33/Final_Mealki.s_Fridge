package com.itwillbs.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.dao.ProductionDAO;

@Service
public class ProductionServiceImpl implements ProductionService{
	
	@Inject
	private ProductionDAO productionDAO;
	
	@Override
	public List<Map<String, Object>> getProductionListMap() {
		System.out.println("MemberServiceImpl updateMember()");
		
		return productionDAO.getProductionListMap();
	}

}
