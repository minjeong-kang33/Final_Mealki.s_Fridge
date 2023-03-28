package com.itwillbs.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.itwillbs.domain.ProductionDTO;

public interface ProductionService {
	public List<Map<String, Object>> getProductionListMap(ProductionDTO productDTO);
	
	public List<Map<String, Object>> getProductionWriteMap(ProductionDTO productDTO);
	
	public ProductionDTO getemp_Knamesession(int emp_num);
}
