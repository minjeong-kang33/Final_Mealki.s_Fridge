package com.itwillbs.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.itwillbs.domain.ProductionDTO;

public interface ProductionService {
	public List<Map<String, Object>> getProductionListMap(ProductionDTO productDTO);
}
