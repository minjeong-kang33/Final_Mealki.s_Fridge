package com.itwillbs.controller;

import java.io.File;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.itwillbs.domain.BoardDTO;
import com.itwillbs.domain.PageDTO;
import com.itwillbs.service.BoardService;

@Controller
public class BoardController {
	
	@Inject
	private BoardService boardService;
	
	@Resource(name="boardUploadPath")
	private String boardUploadPath;
	
	@RequestMapping(value = "/groupware/board/boardWrite", method = RequestMethod.GET)
	public String boardWrite() {
//		주소줄 변경없이 이동
		return "groupware/board/boardWrite";
	}
	

	@RequestMapping(value = "/groupware/board/boardWritePro", method = RequestMethod.POST)
	public String boardWritePro(HttpServletRequest request, MultipartFile file) throws Exception{
		System.out.println("BoardController writePro()");
	
		BoardDTO boardDTO=new BoardDTO();
		boardDTO.setBo_name(request.getParameter("bo_name"));
		boardDTO.setBo_title(request.getParameter("bo_title"));
		boardDTO.setBo_content(request.getParameter("bo_content"));
		
		UUID uuid=UUID.randomUUID();
		String filename=uuid.toString()+"_"+file.getOriginalFilename();
		FileCopyUtils.copy(file.getBytes(), new File(boardUploadPath,filename));
		
		boardDTO.setFile(filename);
		
		boardService.insertBoard(boardDTO);
//		주소줄 변경하면서 이동
		return "redirect:/groupware/board/noticeList";
	}
	
	@RequestMapping(value = "/groupware/board/noticeList", method = RequestMethod.GET)
	public String noticeList(HttpServletRequest request, Model model) {
		System.out.println("BoardController noticeList()");
		
		String search_option = request.getParameter("search_option");
		String keyword = request.getParameter("keyword");
		
		System.out.println(search_option);
		System.out.println(keyword);
		
		int pageSize=17;
		
		String pageNum=request.getParameter("pageNum");
		if(pageNum==null){
			pageNum="1";
		}
		int currentPage=Integer.parseInt(pageNum);
			
		PageDTO pageDTO=new PageDTO();
		pageDTO.setPageSize(pageSize);
		pageDTO.setPageNum(pageNum);
		pageDTO.setCurrentPage(currentPage);
		pageDTO.setSearch_option(search_option);
		pageDTO.setKeyword(keyword);
		
		
		List<BoardDTO> noticeList=boardService.getNoticeList(pageDTO);
		
		// 페이징
		int count = boardService.getBoardCount(pageDTO);
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
		pageDTO.setSearch_option(search_option);
		pageDTO.setKeyword(keyword);
		
		model.addAttribute("noticeList", noticeList);
		model.addAttribute("pageDTO", pageDTO);
		
		return "groupware/board/noticeList";
	}
	
	@RequestMapping(value = "/groupware/board/boardContent", method = RequestMethod.GET)
	public String boardContent(HttpServletRequest request, Model model) {
		System.out.println("BoardController boardContent()");
		int bo_num=Integer.parseInt(request.getParameter("bo_num"));
		
		BoardDTO boardDTO=boardService.getBoard(bo_num);
		
		boardService.boCount(boardDTO);
		
		model.addAttribute("boardDTO", boardDTO);
		
		return "groupware/board/boardContent";
	}
	
	@RequestMapping(value = "/groupware/board/boardDelete", method = RequestMethod.GET)
	public String boardDelete(HttpServletRequest request, Model model) {
		System.out.println("BoardController boardDelete()");
		int bo_num=Integer.parseInt(request.getParameter("bo_num"));
		
		boardService.deleteBoard(bo_num);
		
//		주소줄 변경하면서 이동
		return "redirect:/groupware/board/noticeList";
	}
	
	@RequestMapping(value = "/groupware/board/boardUpdate", method = RequestMethod.GET)
	public String boardUpdate(HttpServletRequest request, Model model) {
		System.out.println("BoardController boardUpdate()");
		int bo_num=Integer.parseInt(request.getParameter("bo_num"));
		
		BoardDTO boardDTO=boardService.getBoard(bo_num);
		
		model.addAttribute("boardDTO", boardDTO);
//		주소줄 변경없이 이동
		return "groupware/board/boardUpdate";
	}

}
