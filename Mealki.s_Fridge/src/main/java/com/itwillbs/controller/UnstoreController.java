package com.itwillbs.controller;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.itwillbs.dao.RecipeDAO;
import com.itwillbs.service.UnstoreService;

@Controller
public class UnstoreController {
	
	
	@Inject
	private UnstoreService unstoreService;
	
	@RequestMapping(value = "/wms/unstore/insertUnstore", method = RequestMethod.GET)
	public String insertUnstore(HttpServletRequest request, Model model) {
		System.out.println("UnstoreController insertUnstore");
		
		//미출고 리스트
		List<Map<String, Object>> unstoreListUnreleased = unstoreService.getUnstoreListUnreleased();
		model.addAttribute("unstoreListUnreleased", unstoreListUnreleased);
		
		return "wms/unstore/insertUnstore";
	}

}
