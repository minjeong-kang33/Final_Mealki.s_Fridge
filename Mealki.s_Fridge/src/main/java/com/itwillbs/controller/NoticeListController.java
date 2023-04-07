package com.itwillbs.controller;



import java.util.List;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;


import com.itwillbs.domain.BoardDTO;
import com.itwillbs.domain.ChartDTO;
import com.itwillbs.domain.PageDTO;
import com.itwillbs.service.BoardService;

@Controller
public class NoticeListController {

    @Inject
    private BoardService boardService;

    @RequestMapping(value = "/board/getNotices", method = RequestMethod.GET)
   public ResponseEntity<List<BoardDTO>> getNoticeList2(){
    	
    	PageDTO pageDTO=new PageDTO();
    	pageDTO.setPageSize(10);
    	pageDTO.setPageNum("1");
    	pageDTO.setCurrentPage(1);
    	  pageDTO.calculateOffset(); // 페이지 시작 인덱스를 계산
    	
        List<BoardDTO> boardList = boardService.getNoticeList2(pageDTO);
        
        ResponseEntity<List<BoardDTO>> getNoticeList2=
				new ResponseEntity<List<BoardDTO>>(boardList,HttpStatus.OK);
        
        return getNoticeList2;
    }
    
    @RequestMapping(value = "/board/boardContent", method = RequestMethod.GET)
    public String boardContent(@RequestParam("bo_num") int bo_num, Model model) {
        BoardDTO boardDTO = boardService.getBoardByBoNum(bo_num);
        model.addAttribute("boardDTO", boardDTO);
        return "board/boardContent";
    }

}
	


