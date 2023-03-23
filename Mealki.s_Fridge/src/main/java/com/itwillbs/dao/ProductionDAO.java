package com.itwillbs.dao;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

public interface ProductionDAO {
	
	public List<Map<String, Object>> getProductionListMap(ModelAndView modelAndView, HttpServletRequest request);

}
