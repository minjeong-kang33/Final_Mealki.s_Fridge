package com.itwillbs.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.WorkorderDTO;
import com.itwillbs.service.WorkorderService;


@Controller
public class WorkorderController {
	
	@Inject
	private WorkorderService workorderService;
	
	@RequestMapping(value = "mps/workorder/list", method = RequestMethod.GET)
	public String workorderlist(HttpServletRequest request, Model model) {
		System.out.println("WorkorderController workorderlist()");
				// 한 화면에 보여줄 글 개수 설정
				int pageSize=10;
				// 현페이지 번호 가져오기
				String pageNum=request.getParameter("pageNum");
				if(pageNum==null) {
					//pageNum 없으면 1페이지 설정
					pageNum="1";
				}
				// 페이지번호를 => 정수형 변경
				int currentPage=Integer.parseInt(pageNum);
				
				PageDTO pageDTO=new PageDTO();
				pageDTO.setPageSize(pageSize);
				pageDTO.setPageNum(pageNum);
				pageDTO.setCurrentPage(currentPage);
				
				List<WorkorderDTO> workorderList=workorderService.getworkorderList(pageDTO);
				
				// 페이징 처리
				int count = workorderService.getWorkorderCount();
				int pageBlock =10;
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
				
				
				
				
				model.addAttribute("workorderList", workorderList);
				model.addAttribute("pageDTO", pageDTO);
				
				return "mps/workorder/list";
	}
	
	@RequestMapping(value = "/workorder/InsertForm", method = RequestMethod.GET)
	public String workorderinsert(HttpServletRequest request, Model model) {
		System.out.println("WorkorderController workorderinsert()");
		// 한 화면에 보여줄 글 개수 설정
		int pageSize=10;
		// 현페이지 번호 가져오기
		String pageNum=request.getParameter("pageNum");
		if(pageNum==null) {
			//pageNum 없으면 1페이지 설정
			pageNum="1";
		}
		// 페이지번호를 => 정수형 변경
		int currentPage=Integer.parseInt(pageNum);
		
		PageDTO pageDTO=new PageDTO();
		pageDTO.setPageSize(pageSize);
		pageDTO.setPageNum(pageNum);
		pageDTO.setCurrentPage(currentPage);
		
		List<WorkorderDTO> contractList=workorderService.getcontractList(pageDTO);
		
		// 페이징 처리
		int count = workorderService.getContractCount();
		int pageBlock =10;
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
		
		
		
		
		model.addAttribute("contractList", contractList);
		model.addAttribute("pageDTO", pageDTO);
		
		return "mps/workorder/InsertForm";
	}
	
	@RequestMapping(value = "/workorder/SujuSearch", method = RequestMethod.GET)
	public String SujuSearch() {
		System.out.println("WorkorderController SujuSearch()");
		return "mps/workorder/SujuSearch";
	}
	
	
}