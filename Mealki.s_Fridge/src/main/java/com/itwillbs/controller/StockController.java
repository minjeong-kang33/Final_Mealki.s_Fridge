
package com.itwillbs.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.itwillbs.domain.ItemDTO;
import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.StockDTO;
import com.itwillbs.domain.WarehouseDTO;
import com.itwillbs.service.StockService;

@Controller
public class StockController {
	@Inject
	private StockService stockService;

	@RequestMapping(value = "/wms/stock/stockList", method = RequestMethod.GET)
	public String stockList(Model model, HttpServletRequest request) {
		System.out.println("StockController stockList");
		
		String item_type = request.getParameter("item_type");
		String item_num = request.getParameter("item_num");
		String item_name = request.getParameter("item_name");
		String whs_num = request.getParameter("whs_num");
		
		int pageSize=10;
		
		String pageNum=request.getParameter("pageNum");
		if(pageNum==null) {
			pageNum="1";
		}
		int currentPage=Integer.parseInt(pageNum);
		
		PageDTO pageDTO=new PageDTO();
		pageDTO.setPageSize(pageSize);
		pageDTO.setPageNum(pageNum);
		pageDTO.setCurrentPage(currentPage);
		pageDTO.setItem_type(item_type);
		pageDTO.setItem_num(item_num);
		pageDTO.setItem_name(item_name);
		pageDTO.setWhs_num(whs_num);
		
		List<StockDTO> stockList = stockService.getStockList(pageDTO);
		
		int count = stockService.getStockListCount(pageDTO);
		int pageBlock=10;
		int startPage=(currentPage-1)/pageBlock*pageBlock+1;
		int endPage=startPage+pageBlock-1;
		int pageCount=count/pageSize+(count%pageSize==0?0:1);
		if(endPage > pageCount){
			endPage = pageCount;
		}
		System.out.println(count);
		System.out.println(pageBlock);
		System.out.println(startPage);
		System.out.println(endPage);
		System.out.println(pageCount);
		
		pageDTO.setCount(count);
		pageDTO.setPageBlock(pageBlock);
		pageDTO.setStartPage(startPage);
		pageDTO.setEndPage(endPage);
		pageDTO.setPageCount(pageCount);
		
		model.addAttribute("stockList", stockList);
		model.addAttribute("item_type",item_type);
		model.addAttribute("item_num",item_num);
		model.addAttribute("item_name",item_name);
		model.addAttribute("whs_num",whs_num);
		model.addAttribute("pageDTO", pageDTO);
		
		return "wms/stock/stockList";
	}

	@RequestMapping(value = "/wms/stock/findWarehouse", method = RequestMethod.GET)
	public String findWarehouse(HttpServletRequest request, Model model) {
		System.out.println("StockController findWarehouse()");

		List<WarehouseDTO> warehouseList = stockService.getWarehouseList();
		model.addAttribute("warehouseList", warehouseList);

		return "wms/stock/findWarehouse";
	}
	
	@RequestMapping(value = "/wms/stock/finditem_type", method = RequestMethod.GET)
	public String finditem_type(HttpServletRequest request, Model model) {
		System.out.println("StockController finditem_type()");

		List<ItemDTO> item_typeList = stockService.getItem_typeList();
		model.addAttribute("item_typeList", item_typeList);

		return "wms/stock/finditem_type";
	}
	
//	@RequestMapping(value = "/wms/stock/stocksearch", method = RequestMethod.GET)
//	public String stocksearch(Model model) throws Exception {
//		System.out.println("StockController stocksearch");
//		
//		String item_type = request.getParameter("item_type");
//		String item_num = request.getParameter("item_num");
//		String item_name = request.getParameter("item_name");
//		String whs_num = request.getParameter("whs_num");
//		
//		int pageSize=10;
//		
//		String pageNum=request.getParameter("pageNum");
//		if(pageNum==null) {
//			pageNum="1";
//		}
//		int currentPage=Integer.parseInt(pageNum);
//		
//		PageDTO pageDTO=new PageDTO();
//		pageDTO.setPageSize(pageSize);
//		pageDTO.setPageNum(pageNum);
//		pageDTO.setCurrentPage(currentPage);
//		pageDTO.setItem_type(item_type);
//		pageDTO.setItem_num(item_num);
//		pageDTO.setItem_name(item_name);
//		pageDTO.setWhs_num(whs_num);
//		
//		List<StockDTO> stockList = stockService.getStockList(pageDTO);
//		
//		int count = stockService.getStockListCount(pageDTO);
//		int pageBlock=10;
//		int startPage=(currentPage-1)/pageBlock*pageBlock+1;
//		int endPage=startPage+pageBlock-1;
//		int pageCount=count/pageSize+(count%pageSize==0?0:1);
//		if(endPage > pageCount){
//			endPage = pageCount;
//		}
//		System.out.println(count);
//		System.out.println(pageBlock);
//		System.out.println(startPage);
//		System.out.println(endPage);
//		System.out.println(pageCount);
//		
//		pageDTO.setCount(count);
//		pageDTO.setPageBlock(pageBlock);
//		pageDTO.setStartPage(startPage);
//		pageDTO.setEndPage(endPage);
//		pageDTO.setPageCount(pageCount);
//		
//		model.addAttribute("stockList", stockList);
//		model.addAttribute("item_type",item_type);
//		model.addAttribute("item_num",item_num);
//		model.addAttribute("item_name",item_name);
//		model.addAttribute("whs_num",whs_num);
//		model.addAttribute("pageDTO", pageDTO);
//		
//		return "wms/stock/stockList";
//	}
	
	@ResponseBody
	@RequestMapping(value = "/wms/stock/updateQnt", method = RequestMethod.GET)
	public String addStore(HttpServletRequest request, Model model) {
		System.out.println("storeController updateQnt()");
		 
		System.out.println("item_num: "+request.getParameter("item_num"));
		System.out.println("new_qnt: "+request.getParameter("new_qnt"));
		
		StockDTO stockDTO = new StockDTO();
			
		stockDTO.setItem_num(request.getParameter("item_num"));
		stockDTO.setStk_qnt(Integer.parseInt(request.getParameter("new_qnt")));

		stockService.updateStockqnt(stockDTO);
			 
		return "redirect:/wms/stock/stockList";		

		
	}
	
	
}