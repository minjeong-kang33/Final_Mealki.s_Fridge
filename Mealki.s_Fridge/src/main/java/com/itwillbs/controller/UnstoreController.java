package com.itwillbs.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class UnstoreController {
	
	@RequestMapping(value = "/wms/unstore/insertUnstore", method = RequestMethod.GET)
	public String insertUnStore(HttpServletRequest request, Model model) {
		System.out.println("UnstoreController insertUnstore");
		
		
		return "wms/unstore/insertUnstore";
	}

}
