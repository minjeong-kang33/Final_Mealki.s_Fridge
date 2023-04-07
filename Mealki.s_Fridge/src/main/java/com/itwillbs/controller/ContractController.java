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
import com.itwillbs.domain.PlaceOrderDTO;
import com.itwillbs.service.ContractService;

@Controller
	public class ContractController{
		
	
		@Inject
		private ContractService contractService;
	
		@RequestMapping(value="business/contract/contractWrite", method = RequestMethod.GET) 
		public String contractWrite() {
			
			
			return "business/contract/contractWrite";
		}
		
		@RequestMapping(value="/contract/WriteSave" , method = RequestMethod.POST)
		public String contractInsert(ContractDTO dto) {
			System.out.println("contractWriteSave()");
			contractService.insertBoard(dto);
			return "redirect:/business/contract/contractList";
				
		}
		
		
		@RequestMapping(value = "business/contract/contractList", method=RequestMethod.GET)
		public String contractList(HttpServletRequest request, Model model, ContractDTO dto) {
			System.out.println("contractController contractList()");
			
			//검색어 가져오기
			String search = request.getParameter("search");
			String search_option =request.getParameter("search_option");
			//총 데이터 개수
			int total = contractService.selectContractTotal(dto);
			
			// (double)12/10 ->  ceil(1.2) -> Integer(2.0) -> 2
			int totalPage = (int) Math.ceil((double)total/10);
			
			
			
			// 한 화면에 보여줄 글 개수 설정
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
			List<ContractDTO> list = contractService.getBoardList(pageDTO);
			
			//페이징 처리
			//검색어
			int count = contractService.getContractCount(pageDTO);
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
			
			return "business/contract/contractList";
		}
			@RequestMapping(value = "/business/contract/findContract", method = RequestMethod.GET)
			public String findContract(HttpServletRequest request, Model model) {
				System.out.println("ContractController findContract()");
	
				List<Map<String, Object>> contractListMap = contractService.getContractListMap();
				model.addAttribute("contractListMap", contractListMap);
	
				return "business/contract/findContract";
		}
			
			@RequestMapping(value = "/business/contract/findProduct", method = RequestMethod.GET)
			public String findProduct(HttpServletRequest request, Model model) {
				System.out.println("ContractController findContract()");
	
				List<PlaceOrderDTO> productList = contractService.getProductList();
				model.addAttribute("productList", productList);
	
				return "business/contract/findProduct";
		}
			@RequestMapping(value = "/business/contract/findName", method = RequestMethod.GET)
			public String findName(HttpServletRequest request, Model model) {
				System.out.println("ContractController findName()");
	
				List<ContractDTO> NameList = contractService.getNameList();
				model.addAttribute("NameList", NameList);
	
				return "business/contract/findName";
		}
			@RequestMapping(value = "/business/contract/findName2", method = RequestMethod.GET)
			public String findName2(HttpServletRequest request, Model model) {
				System.out.println("ContractController find2Name()");
	
				List<EmployeeDTO> NameList2 = contractService.getNameList2();
				model.addAttribute("NameList2", NameList2);
	
				return "business/contract/findName2";
		}
			
			@RequestMapping(value="/business/contract/content" , method = RequestMethod.GET)
				public String content(HttpServletRequest request, Model model) throws Exception {
				System.out.println("contractController content()");
				
				int business_num=Integer.parseInt(request.getParameter("business_num"));
				
				ContractDTO contractDTO=contractService.getBoard(business_num);
				
				model.addAttribute("contractDTO", contractDTO);
				System.out.println("===========");
				return "/business/contract/content";
					
	}
			@RequestMapping(value="/business/contract/update" , method = RequestMethod.GET)
			public String update(HttpServletRequest request, Model model) throws Exception {
			System.out.println("contractController update()");
			
			int business_num=Integer.parseInt(request.getParameter("business_num"));
			
			ContractDTO contractDTO=contractService.getBoard(business_num);
			
			model.addAttribute("contractDTO", contractDTO);
			
			return "/business/contract/update";
				
			}
			
			@RequestMapping(value="/contract/updatePro" , method = RequestMethod.POST)
			public String updatePro(ContractDTO dto) throws Exception {
				System.out.println("updatePro()");
				contractService.updateBoard(dto);
				return "redirect:/business/contract/contractList";
					
			}
			
			@RequestMapping(value="/business/contract/delete" , method = RequestMethod.GET)
			public String delete(HttpServletRequest request, Model model) throws Exception {
			System.out.println("contractController delete()");
			
			int business_num=Integer.parseInt(request.getParameter("business_num"));
			
			contractService.deleteBoard(business_num);
			
			return "redirect:/business/contract/contractList";
				
			}
}

