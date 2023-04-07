package com.itwillbs.controller;

import java.io.File;

import java.sql.Timestamp;
import java.util.List;


import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.itwillbs.domain.RecipeDTO;
import com.itwillbs.dao.RecipeDAO;
import com.itwillbs.domain.ItemDTO;
import com.itwillbs.domain.PageDTO;
import com.itwillbs.service.RecipeService;


@Controller
public class RecipeController {

	@Inject
	private RecipeService recipeService;
	private RecipeDAO recipeDAO;
	
	   // 소요량(레시피) 목록 조회
		@RequestMapping(value = "mdm/recipe/recipeList", method = RequestMethod.GET)
		public String recipelist(HttpServletRequest request, Model model, RecipeDTO dto ) {
			System.out.println("RecipeController recipeList()");

			String search = request.getParameter("search");
			String search_option =request.getParameter("search_option");
			
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
			
			pageDTO.setSearch(search);
			pageDTO.setSearch_option(search_option);
			
			List<RecipeDTO> recipeList = recipeService.getRecipeList(pageDTO);
			System.out.println(recipeList);
			
			// 페이징
			int count = recipeService.getRecipeCount();
			int pageBlock=10;
			int startPage=(currentPage-1)/pageBlock*pageBlock+1;
			int endPage=startPage+pageBlock-1;
			int pageCount= count / pageSize + (count%pageSize==0?0:1);
			if(endPage > pageCount){
				endPage = pageCount;
			}

			pageDTO.setCount(count);
			pageDTO.setPageBlock(pageBlock);
			pageDTO.setStartPage(startPage);
			pageDTO.setEndPage(endPage);
			pageDTO.setPageCount(pageCount);
			

			model.addAttribute("recipeList",recipeList);
			model.addAttribute("pageDTO", pageDTO);

			return "mdm/recipe/recipeList";
		}
		
		@RequestMapping(value = "mdm/recipe/update", method = RequestMethod.POST , consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
		public String update(HttpServletRequest request, Model model ) {

			RecipeDTO dto = new RecipeDTO();
			dto.setR_num(request.getParameter("r_num"));
			dto.setR_code(request.getParameter("r_code"));
			dto.setItem_num(request.getParameter("item_num"));
			dto.setR_name(request.getParameter("r_name"));
			dto.setItem_name(request.getParameter("item_name"));
			dto.setR_qty(Integer.parseInt(request.getParameter("r_qty")));
			dto.setR_date(new Timestamp(System.currentTimeMillis()));
			dto.setR_etc(request.getParameter("r_etc"));

			recipeService.save(dto);
			return "redirect:/mdm/recipe/recipeList";
		}

		@RequestMapping(value = "mdm/recipe/delete", method = RequestMethod.POST)
		public String delete(HttpServletRequest request, Model model ) {

			String[] deleteId = request.getParameterValues("selectId");
			for(String id : deleteId){
				recipeService.deleteRecipe(id);
			}
			return "redirect:/mdm/recipe/recipeList";
		}

		@RequestMapping(value = "mdm/recipe/save", method = RequestMethod.POST , consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
		public String save(HttpServletRequest request, Model model) {
			System.out.println("RecipeController save()");
			
			RecipeDTO dto = new RecipeDTO();
			
			String r_num=request.getParameter("r_num");
			if(StringUtils.isEmpty(r_num)) {
				
			
			String maxRNum= recipeService.getMaxRecipeNum();
		    
		    int newRNumValue;
		    if (maxRNum != null && !maxRNum.isEmpty()) {
		        try {
		            int currentRNum = Integer.parseInt(maxRNum.substring(1));
		            newRNumValue = currentRNum + 1;
		        } catch (NumberFormatException e) {
		            System.err.println("Invalid r_num format: " + maxRNum);
		            newRNumValue = 1;
		        }
		    } else {
		        newRNumValue = 1;
		    }
		    r_num = "R" + newRNumValue;
			}else { 
			}
			dto.setR_num(r_num);
//			dto.setR_num(newRNum);
//			dto.setR_num(request.getParameter("r_num"));
			dto.setR_code(request.getParameter("r_code"));
			dto.setItem_num(request.getParameter("item_num"));
			dto.setR_name(request.getParameter("r_name"));
			dto.setItem_name(request.getParameter("item_name"));
			dto.setR_qty(Integer.parseInt(request.getParameter("r_qty")));
			dto.setR_date(new Timestamp(System.currentTimeMillis()));
			
			String r_etc=request.getParameter("r_etc");
			if(r_etc != null && !r_etc.isEmpty()) {
			dto.setR_etc(r_etc);
			}
			
			recipeService.save(dto);

			return "redirect:/mdm/recipe/recipeList";
		}
	
	
		@RequestMapping(value = "mdm/recipe/getItemList", method = RequestMethod.GET)
		public ModelAndView getItemList(ModelAndView mav) {
		  List<ItemDTO> itemList = recipeService.getItemList();
		  mav.addObject("itemList", itemList);
		  mav.setViewName("mdm/recipe/itemListPopup");
		  return mav;
		}

	
	
}
