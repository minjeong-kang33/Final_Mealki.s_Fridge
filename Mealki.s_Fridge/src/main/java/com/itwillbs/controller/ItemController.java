package com.itwillbs.controller;





import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;


import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.itwillbs.domain.ItemDTO;
import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.StockDTO;
import com.itwillbs.service.ItemService;
import com.itwillbs.service.StockService;

@Controller
public class ItemController {
   
	@Inject
	private ItemService itemService;
	
	@Inject
	private StockService stockService;

	//xml 업로드 경로이름("uploadPath")자동으로 불러오기
	@Resource(name="itemUploadPath")
	private String itemUploadPath;

    // 상품 목록 조회
	@RequestMapping(value = "mdm/item/itemlist", method = RequestMethod.GET)
	public String itemlist(HttpServletRequest request, Model model, ItemDTO dto ) {
		System.out.println("ItemController itemlist()");

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
		
		List<ItemDTO> itemlist = itemService.getItemList(pageDTO);
		System.out.println(itemlist);
		
		// 페이징
		int count = itemService.getItemCount();
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
		
	
		model.addAttribute("itemlist",itemlist);
		model.addAttribute("pageDTO", pageDTO);

		return "mdm/item/itemlist";
	}

	
	
	@RequestMapping(value = "mdm/item/update", method = RequestMethod.POST , consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
	public String update(HttpServletRequest request, Model model, @RequestParam("item_image") MultipartFile file ) throws Exception {

//		String item_num=request.getParameter("item_num");
//		ItemDTO existingItem = itemService.getItemByNum(item_num);
		
		ItemDTO dto = new ItemDTO();
//		StockDTO stockDTO = new StockDTO();
		
//		dto.setItem_num(existingItem.getItem_num());
//		dto.setItem_num(request.getParameter("item_num"));
		dto.setItem_type(request.getParameter("item_type"));
		dto.setItem_name(request.getParameter("item_name"));
		dto.setWeight(Integer.parseInt(request.getParameter("weight")));
		dto.setsupplier(request.getParameter("supplier"));
		dto.setSupply_price(Integer.parseInt(request.getParameter("supply_price")));
		dto.setSales_price(Integer.parseInt(request.getParameter("sales_price")));
		
		if(file.isEmpty()) {
			dto.setItem_image(request.getParameter("oldfile"));
		}else {
			UUID uuid=UUID.randomUUID();
			String filename=uuid.toString()+"_"+file.getOriginalFilename();
			
			FileCopyUtils.copy(file.getBytes(), new File(itemUploadPath, filename));
			
			dto.setItem_image(filename);
		}

		itemService.save(dto);
		//재고테이블에도 반영
//		stockDTO.setItem_name(request.getParameter("item_name"));
//		stockDTO.setItem_type(request.getParameter("item_type"));
//		stockService.updateStock(stockDTO);
		
		return "redirect:/mdm/item/itemlist";
	}


	@RequestMapping(value = "mdm/item/delete", method = RequestMethod.POST)
	public String delete(HttpServletRequest request, Model model ) {

		String[] deleteId = request.getParameterValues("selectId");
		
		for(String id : deleteId){
			itemService.deleteItem(id);
		}
		
		return "redirect:/mdm/item/itemlist";
	}

	@RequestMapping(value = "mdm/item/save", method = RequestMethod.POST , consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
	public String save(HttpServletRequest request, Model model, @RequestParam("item_image") MultipartFile file) throws Exception {
		System.out.println("ItemController save()");
		
			ItemDTO dto = new ItemDTO();
//			StockDTO stockDTO = new StockDTO();
			
			String itemPrefix = request.getParameter("item_prefix");
		    String prefix = itemPrefix.equals("P") ? "P" : "I";
		    String maxItemNum = itemService.getMaxItemNum(prefix);

		    int newNum;
		    if (maxItemNum != null) {
		        int currentNum = Integer.parseInt(maxItemNum.substring(1));
		        newNum = currentNum + 1;
		    } else {
		        newNum = 1;
		    }

		    String newItemNum = String.format("%s%03d", prefix, newNum);
		    dto.setItem_num(newItemNum);
		
//			dto.setItem_num(request.getParameter("item_num"));
		    dto.setItem_type(request.getParameter("item_type"));
		    dto.setItem_name(request.getParameter("item_name"));
		    dto.setWeight(Integer.parseInt(request.getParameter("weight")));
		
			String supplier = request.getParameter("supplier");
		    if (supplier != null && !supplier.isEmpty()) {
		        dto.setsupplier(supplier);
		    }
		    
		    String supply_price = request.getParameter("supply_price");
		    if (supply_price != null && !supply_price.isEmpty()) {
		        dto.setSupply_price(Integer.parseInt(supply_price));
		    } else {
		        dto.setSupply_price(0);
		    }

		    String sales_price = request.getParameter("sales_price");
		    if (sales_price != null && !sales_price.isEmpty()) {
		        dto.setSales_price(Integer.parseInt(sales_price));
		    } else {
		        dto.setSales_price(0);
		    }    
		    
		    if (!file.isEmpty()) {
		    UUID uuid=UUID.randomUUID();
		    String filename=uuid.toString()+"_"+file.getOriginalFilename();
		    
		    FileCopyUtils.copy(file.getBytes(), new File(itemUploadPath, filename));
		    
		    dto.setItem_image(filename);
		    }
		    
		itemService.save(dto);
		//재고테이블에도 반영
//		stockDTO.setItem_name(request.getParameter("item_name"));
//		stockDTO.setItem_num(newItemNum);
//		stockDTO.setItem_type(request.getParameter("item_type"));
//		stockService.insertStock(stockDTO);
		
		return "redirect:/mdm/item/itemlist";
	}

	

}
