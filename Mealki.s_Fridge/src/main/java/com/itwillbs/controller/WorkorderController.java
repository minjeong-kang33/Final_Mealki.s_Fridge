package com.itwillbs.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.itwillbs.domain.WorkorderDTO;
import com.itwillbs.service.WorkorderService;


@Controller
public class WorkorderController {
	
	@RequestMapping(value = "mps/workorder/blank", method = RequestMethod.GET)
	public String workorderInsert() {
		System.out.println("workorderInsert");
		return "mps/workorder/blank";
	}
}