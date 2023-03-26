package com.itwillbs.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class StockController {
	@RequestMapping(value = "/wms/stock/stockList", method = RequestMethod.GET)
	public String stockList(Model model) {
		System.out.println("StockController stockList");

		return "wms/stock/stockList";
	}
}
