package com.itwillbs.controller;

import java.util.List;



import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.itwillbs.domain.ItemDTO;
import com.itwillbs.domain.PageDTO;
import com.itwillbs.service.ItemService;

@Controller
public class ItemController {
   
	@Inject
	private ItemService itemService;

    // 상품 목록 조회
    @RequestMapping(value = "mdm/item/itemlist", method = RequestMethod.GET)
    public String itemlist(HttpServletRequest request, Model model ) {
    	System.out.println("ItemController itemlist()");
    	
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
    	
        List<ItemDTO> itemlist = itemService.getItemList(pageDTO);
        
     // 페이징
     		int count = itemService.getItemCount();
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
        
        model.addAttribute("itemlist",itemlist);
        model.addAttribute("pageDTO", pageDTO);
        
        return "mdm/item/itemlist";
    }

   
}
