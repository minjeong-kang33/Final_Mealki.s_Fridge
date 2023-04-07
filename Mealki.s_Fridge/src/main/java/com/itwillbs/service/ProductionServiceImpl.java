package com.itwillbs.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

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
	public ProductionDTO getemp_Knamesession(int emp_num) {
		System.out.println("ProductionServiceImpl getemp_Knamesession()");
		
		return productionDAO.getemp_Knamesession(emp_num);
	}

	@Override
	public List<Map<String, Object>> getselectList(ProductionDTO productionList) {
		System.out.println("ProductionServiceImpl getselectList()");
		
		return productionDAO.getselectList(productionList);
	}

	@Override
	public void insertProduct(ProductionDTO productDTO) {
		System.out.println("ProductionServiceImpl insertProduct()");
		
		productionDAO.insertProduct(productDTO);
	}

	@Override
	public void startProduct(ProductionDTO productDTO) {
		System.out.println("ProductionServiceImpl startProduct()");
		
		productionDAO.startProduct(productDTO);
		
	}

	@Override
	public ProductionDTO updateProduct(String manu_date) {
		System.out.println("ProductionServiceImpl updateProduct()");
		
		return productionDAO.updateProduct(manu_date);
	}
	
}
