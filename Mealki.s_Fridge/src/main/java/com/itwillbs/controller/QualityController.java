package com.itwillbs.controller;

//import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

//import com.itwillbs.service.QualityService;

@Controller
public class QualityController {
//	@Inject
//	private QualityService qualityService;
	
	@RequestMapping(value = "/mps/quality/list", method = RequestMethod.GET)
	public String listmap(){
	
	return "mps/quality/listForm";
	}
}
