package com.itwillbs.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.itwillbs.domain.ContractDTO;
import com.itwillbs.domain.PageDTO;
import com.itwillbs.service.ContractService;

@Controller
	public class ContractController{
		
	
		@Inject
		private ContractService contractService;
	
		@RequestMapping(value="business/contract/contractWrite", method = RequestMethod.GET) 
		public String contractWrite() {
			
			
			return "business/contract/contractWrite";
		}
		
		@RequestMapping(value="contract/WriteSave")
		@ResponseBody
		public String contractInsert(ContractDTO dto) throws Exception {
			System.out.println("contractWriteSave()");
			contractService.insertBoard(dto);
			return "redirect:business/contract/contractList";
			
			
//			public String result = contractService.insertBoard(dto);
//			String message = "";
//			if(result == null) {
//				message = "ok";  //null성공
//			}else {
//				message = "fail";
//			}
//			return message;
		}
		
		
		@RequestMapping(value = "business/contract/contractList", method=RequestMethod.GET)
		public String contractList(HttpServletRequest request, Model model, ContractDTO dto) {
			System.out.println("contractController contractList()");
			
			//총 데이터 개수
			int total = contractService.selectContractTotal(dto);
			
			// (double)12/10 ->  ceil(1.2) -> Integer(2.0) -> 2
			int totalPage = (int) Math.ceil((double)total/10);
			
			model.addAttribute("total", total);
			model.addAttribute("totalPage", totalPage);
			
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
			
			List<ContractDTO> list = contractService.getBoardList(pageDTO);
			
			//페이징 처리
			int count = contractService.getContractCount();
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
			
			return "business/contract/contractList";
		}
			
	}

