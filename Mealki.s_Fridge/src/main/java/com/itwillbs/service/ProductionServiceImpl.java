package com.itwillbs.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.itwillbs.dao.ProductionDAO;
import com.itwillbs.domain.ProductionDTO;

@Service
public class ProductionServiceImpl implements ProductionService{
	
	@Inject
	private ProductionDAO productionDAO;
	
	@Override
	public List<Map<String, Object>> getProductionListMap(ProductionDTO productDTO) {
		System.out.println("ProductionServiceImpl ListMap()");
		
		return productionDAO.getProductionListMap(productDTO);
	}

	@Override
	public List<Map<String, Object>> getProductionWriteMap(ProductionDTO productDTO) {
		System.out.println("ProductionServiceImpl ListMap()");
		// TODO Auto-generated method stub
		return productionDAO.getProductionWriteMap(productDTO);
	}

	@Override
	public ProductionDTO getemp_Knamesession(int emp_num) {
		System.out.println("ProductionServiceImpl getemp_Knamesession()");
		
		return productionDAO.getemp_Knamesession(emp_num);
	}

}
