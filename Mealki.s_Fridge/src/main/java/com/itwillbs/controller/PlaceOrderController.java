package com.itwillbs.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class PlaceOrderController {
	/*
	 * @Inject private PlaceOrderService placeOrderService;
	 */
	
	@RequestMapping(value = "/wms/placeorder/insertOrder", method = RequestMethod.GET)
	public String insertOrder() {
		System.out.println("PlaceOrderController insertOrder");
		return "wms/placeorder/orderForm";
	}
}
