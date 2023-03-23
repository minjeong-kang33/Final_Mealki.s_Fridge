package com.itwillbs.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.itwillbs.dao.ProductionDAO;

@Service
public class ProductionServiceImpl implements ProductionService{
	
	@Inject
	private ProductionDAO productionDAO;
	
	@Override
	public List<Map<String, Object>> getProductionListMap(ModelAndView modelAndView, HttpServletRequest request) {
		System.out.println("MemberServiceImpl updateMember()");
		
		return productionDAO.getProductionListMap(modelAndView, request);
	}

}
