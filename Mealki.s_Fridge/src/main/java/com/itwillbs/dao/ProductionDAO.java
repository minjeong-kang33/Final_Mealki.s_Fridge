package com.itwillbs.dao;

import java.util.List;
import java.util.Map;

import com.itwillbs.domain.ProductionDTO;

public interface ProductionDAO {
	
	public List<Map<String, Object>> getProductionListMap(ProductionDTO productDTO);
	
	public ProductionDTO getemp_Knamesession(int emp_num);
	
	public List<Map<String, Object>> getselectList(ProductionDTO productionList);
	
	public void insertProduct(ProductionDTO productDTO);
	
	public void startProduct(ProductionDTO productDTO);
	
	public ProductionDTO updateProduct(String manu_date);
	
}
