package com.itwillbs.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.itwillbs.domain.CustomerDTO;
import com.itwillbs.service.CustomerService;

@RestController
public class AjaxController {
	
	@Inject
	private CustomerService customerService;
	
	// 가상주소 http://localhost:8080/SFunWeb/member/idCheck
		@RequestMapping(value = "/business/customer/businessNumcheck", method = RequestMethod.GET)
		public ResponseEntity<String> idCheck(HttpServletRequest request) {
			String result="";
			
			String business_num=request.getParameter("business_num");
			
			CustomerDTO customerDTO=customerService.getCustomer(business_num);
			if(customerDTO!=null) {
				//사업자번호 있음 => 사업자번호 중복
				result="iddup";
			}else {
				//사업자번호 없음 => 사업자번호 사용가능
				result="idok";
			}
			//출력 결과 ResponseEntity 저장 => 되돌아감
			ResponseEntity<String> entity=
					new ResponseEntity<String>(result,HttpStatus.OK);
			return entity;
		}

}
