package com.itwillbs.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.itwillbs.domain.BoardDTO;
import com.itwillbs.domain.CustomerDTO;
import com.itwillbs.domain.PageDTO;
import com.itwillbs.service.BoardService;

@Controller
public class BoardController {
	
	private BoardService boardService;
	
	@RequestMapping(value = "/groupware/board/boardWrite", method = RequestMethod.GET)
	public String boardWrite() {
//		주소줄 변경없이 이동
		return "groupware/board/boardWrite";
	}
	

	@RequestMapping(value = "/groupware/board/boardWritePro", method = RequestMethod.POST)
	public String boardWritePro(BoardDTO boardDTO) {
		System.out.println("BoardController writePro()");
	
		boardService.insertBoard(boardDTO);
			
//		주소줄 변경하면서 이동
		return "redirect:groupware/board/noticelist";
	}
	
//	@RequestMapping(value = "/business/customer/noticeList", method = RequestMethod.GET)
//	public String noticeList(HttpServletRequest request, Model model) {
//		System.out.println("BoardController noticeList()");
//		
//		String search_option = request.getParameter("search_option");
//		String keyword = request.getParameter("keyword");
//		
//		System.out.println(search_option);
//		System.out.println(keyword);
//		
//		int pageSize=10;
//		
//		String pageNum=request.getParameter("pageNum");
//		if(pageNum==null){
//			pageNum="1";
//		}
//		int currentPage=Integer.parseInt(pageNum);
//			
//		PageDTO pageDTO=new PageDTO();
//		pageDTO.setPageSize(pageSize);
//		pageDTO.setPageNum(pageNum);
//		pageDTO.setCurrentPage(currentPage);
//		pageDTO.setSearch_option(search_option);
//		pageDTO.setKeyword(keyword);
//		
//		
//		List<CustomerDTO> noticeList=boardService.getNoticeList(pageDTO);
//		
//		// 페이징
//		int count = boardService.getBoardCount(pageDTO);
//		int pageBlock=10;
//		int startPage=(currentPage-1)/pageBlock*pageBlock+1;
//		int endPage=startPage+pageBlock-1;
//		int pageCount=count/pageSize+(count%pageSize==0?0:1);
//		if(endPage > pageCount){
//			endPage = pageCount;
//		}
//		
//		pageDTO.setCount(count);
//		pageDTO.setPageBlock(pageBlock);
//		pageDTO.setStartPage(startPage);
//		pageDTO.setEndPage(endPage);
//		pageDTO.setPageCount(pageCount);
//		pageDTO.setSearch_option(search_option);
//		pageDTO.setKeyword(keyword);
//	
//		model.addAttribute("noticeList", noticeList);
//		model.addAttribute("pageDTO", pageDTO);
//		
//		return "business/customer/noticeList";
//	}

}
