package com.itwillbs.controller;



import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class StoreController {

	
	@RequestMapping(value = "/wms/store/insertStore", method = RequestMethod.GET)
	public String insertStore() {
		System.out.println("storeController insertStore");
		return "wms/store/insertStore";
	}
	

}
