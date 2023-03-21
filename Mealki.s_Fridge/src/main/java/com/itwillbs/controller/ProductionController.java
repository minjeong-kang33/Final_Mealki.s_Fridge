package com.itwillbs.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class ProductionController {
	
	@RequestMapping(value = "/mps/production/list", method = RequestMethod.GET)
	public String production() {
		return "mps/production/listForm";
	}
}
