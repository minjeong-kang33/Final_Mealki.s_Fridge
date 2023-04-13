package com.itwillbs.controller;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.itwillbs.domain.ContractDTO;
import com.itwillbs.domain.EmployeeDTO;
import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.QualityDTO;
import com.itwillbs.domain.ShippingDTO;
import com.itwillbs.domain.WorkorderDTO;
import com.itwillbs.service.ShippingService;

@Controller
public class ShippingController {

	@Inject
	private ShippingService shippingService;
	
	@RequestMapping(value="/business/shipping/shippingWrite", method = RequestMethod.GET) 
	public String shippingWrite() {
		
		
		return "business/shipping/shippingWrite";
	}
	
	@RequestMapping(value="/shipping/WriteSave" , method = RequestMethod.POST)
	public String shippingInsert(ShippingDTO shippingDTO) {
		System.out.println("shippingWriteSave()");
		shippingService.insertBoard(shippingDTO);
		return "redirect:/business/shipping/shippingList";
			
	}
	
	@RequestMapping(value = "business/shipping/shippingList", method=RequestMethod.GET)	
	public String shippingList(HttpServletRequest request, Model model, ShippingDTO shippingDTO) {
		System.out.println("shippingController shippingList()");
		
		//검색어 가져오기
		String search = request.getParameter("search");
		String search_option = request.getParameter("search_option");
		//총 데이터 개수
		int total = shippingService.selectShippingTotal(shippingDTO);
		int totalPage = (int)Math.ceil((double)total/10);
		
		//한 화면에 보여줄 글 개수 설정
		int pageSize=10;
		// 현 페이지 번호 가져오기
		String pageNum=request.getParameter("pageNum");
		if(pageNum==null) {
			//pageNum 없으면 1페이지 설정
			pageNum="1";
		}
		// 페이지번호를 => 정수형 변경
		int currentPage=Integer.parseInt(pageNum);
		
		PageDTO pageDTO = new PageDTO();
		pageDTO.setPageSize(pageSize);
		pageDTO.setPageNum(pageNum);
		pageDTO.setCurrentPage(currentPage);
		
		//검색어
		pageDTO.setSearch(search);
		pageDTO.setSearch_option(search_option);
		
		
		System.out.println(pageDTO.getSearch());
		System.out.println(pageDTO.getSearch_option());
		
		List<ShippingDTO> list = shippingService.getBoardList(pageDTO);
		
		//페이징 처리
		//검색어
		int count = shippingService.getShippingCount(pageDTO);
		int pageBlock=10;
		int startPage=(currentPage-1)/pageBlock*pageBlock+1;
		int endPage=startPage+pageBlock-1;
		int pageCount=count/pageSize+(count%pageSize==0?0:1);
		if(endPage > pageCount){
			endPage = pageCount;
		}
		
		pageDTO.setCount(count);
		pageDTO.setPageBlock(pageBlock);
		pageDTO.setStartPage(startPage);
		pageDTO.setEndPage(endPage);
		pageDTO.setPageCount(pageCount);
		
		model.addAttribute("resultList", list);
		model.addAttribute("pageDTO", pageDTO);
		model.addAttribute("total", total);
		model.addAttribute("totalPage", totalPage);
		
		
		return "business/shipping/shippingList";
		
	}
	
	
	@RequestMapping(value="/business/shipping/addShipping", method=RequestMethod.GET)
	public String updateShipping(ShippingDTO shippingDTO, Model model) {
		System.out.println("updateShipping()");
		
//		ShippingDTO shippingDTO = new ShippingDTO();
		System.out.println(shippingDTO.getShipping_num());
		
		shippingDTO.setOut_progress("출하완료");
		
		shippingService.updateShipping(shippingDTO);
		
		return "redirect:/business/shipping/shippingList";
	}
	
	@RequestMapping(value = "/business/shipping/findShipping", method = RequestMethod.GET)
	public String findProducts(HttpServletRequest request, Model model) {
		System.out.println("ShippingController findShipping()");

		List<Map<String, Object>> itemListMap = shippingService.getShippingListMap();
		model.addAttribute("itemListMap", itemListMap);
//		List<WorkorderDTO> shippingList = shippingService.getShippingList();
//		model.addAttribute("shippingList", shippingList);
		return "business/shipping/findShipping";
	}
	
	@RequestMapping(value = "/business/shipping/findEmp_num", method = RequestMethod.GET)
	public String findEmp_num(HttpServletRequest request, Model model) {
		System.out.println("ShippingController findEmp_num()");

		List<ContractDTO> employeeList = shippingService.getEmployeeList();
		model.addAttribute("employeeList", employeeList);

		return "business/shipping/findEmp_num";
	}
}
