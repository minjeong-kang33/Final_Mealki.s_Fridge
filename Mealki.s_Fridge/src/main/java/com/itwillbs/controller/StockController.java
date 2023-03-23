package com.itwillbs.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class StockController {
	
	@RequestMapping(value = "/wms/stock/stocklist", method = RequestMethod.GET)
	public String stocklist() {
		return "wms/stock/stocklist";
	}
	
}
