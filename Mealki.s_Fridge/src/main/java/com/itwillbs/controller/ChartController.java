package com.itwillbs.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.itwillbs.domain.BoardDTO;
import com.itwillbs.domain.ChartDTO;
import com.itwillbs.service.ChartService;

@Controller
public class ChartController {

	@Inject
	private ChartService chartservice;
	

	@RequestMapping(value = "/chart/contract", method = RequestMethod.GET)
	public ResponseEntity<List<ChartDTO>> contract(){
		System.out.println("ChartController contract");
		
		List<ChartDTO> contractList=chartservice.contract();
		
		ResponseEntity<List<ChartDTO>> contract=
				new ResponseEntity<List<ChartDTO>>(contractList,HttpStatus.OK);
		
		return contract;
	}
	
	@RequestMapping(value = "/chart/product", method = RequestMethod.GET)
	public ResponseEntity<List<ChartDTO>> proChart(){
		System.out.println("ChartController prochart");
		
		List<ChartDTO> ProductionList=chartservice.prochart();
		
		ResponseEntity<List<ChartDTO>> production=
				new ResponseEntity<List<ChartDTO>>(ProductionList,HttpStatus.OK);
		
		return production;
	}
}
