package com.itwillbs.controller;

import java.text.SimpleDateFormat;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.StockDTO;
import com.itwillbs.domain.StoreDTO;
import com.itwillbs.domain.UnstoreDTO;
import com.itwillbs.domain.WorkorderItemDTO;
import com.itwillbs.service.StockService;
import com.itwillbs.service.UnstoreService;
import com.itwillbs.service.WorkorderItemService;

@Controller
public class UnstoreController {
	
	
	@Inject
	private UnstoreService unstoreService;
	
	@Inject
	private WorkorderItemService workorderItemService;
	
	@Inject StockService stockService;
	

	@RequestMapping(value = "/wms/unstore/insertUnstore", method = RequestMethod.GET)
	public String insertUnstore(HttpServletRequest request, Model model)throws Exception {
		System.out.println("UnstoreController insertUnstore");

		String unsto_num = request.getParameter("unsto_num");
		String startDate = request.getParameter("startDate");
		String endDate = request.getParameter("endDate");
		String e_num = request.getParameter("emp_num");
		String item_name = request.getParameter("item_name");
		
		
		System.out.println(unsto_num+" "+startDate+" "+endDate+" "+e_num+" "+item_name);
		
		
		if(e_num==""||e_num==null) {e_num="0";}
		
		int emp_num = Integer.parseInt(e_num);
		
		int pageSize=15;		

		String pageNum=request.getParameter("pageNum");
		if(pageNum==null) {pageNum="1";}
		
		System.out.println("pageNum"+pageNum);
		
		int currentPage=Integer.parseInt(pageNum);
		
		PageDTO pageDTO = new PageDTO();
		pageDTO.setPageSize(pageSize);
		pageDTO.setPageNum(pageNum);
		pageDTO.setCurrentPage(currentPage);
		pageDTO.setEmp_num(emp_num);
		pageDTO.setUnsto_num(unsto_num);
		pageDTO.setItem_name(item_name);		

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		if(startDate != null && !startDate.equals("")) {
			java.util.Date date = sdf.parse(startDate);
			java.sql.Date order_date1 = new java.sql.Date(date.getTime());
			pageDTO.setOrder_date(order_date1);
		}
		if(endDate != null && !endDate.equals("")) {
			java.util.Date date2 = sdf.parse(endDate);
			java.sql.Date due_date1 = new java.sql.Date(date2.getTime());  
			pageDTO.setDue_date(due_date1);
		}	
		
		
		//전체출고 리스트
		List<Map<String, Object>> unstoreList = unstoreService.getUnstoreList(pageDTO);
		
		int count = unstoreService.getUnstoreListCount(pageDTO);
		
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
		
		model.addAttribute("unsto_num",unsto_num);
		model.addAttribute("item_name",item_name);
		model.addAttribute("emp_num",emp_num);
		model.addAttribute("startDate",startDate);
		model.addAttribute("endDate",endDate);
		model.addAttribute("pageDTO",pageDTO);
		model.addAttribute("unstoreList", unstoreList);		
		
		for(int i=0; i<unstoreList.size();i++) {
			String wo_num = unstoreList.get(i).get("wo_num").toString(); //추출된표에서 wo_num을 추출 
			System.out.println("작업지시번호"+wo_num);
			WorkorderItemDTO workorderItemDTO = new WorkorderItemDTO();
			workorderItemDTO.setWo_num(wo_num);
			workorderItemService.getItemList(wo_num); //작업지시번호로 생산을 위해 필요한 품목과 총수량을 가져옴
			
			List<WorkorderItemDTO> itemList = workorderItemService.getItemList(wo_num);
			
		for (WorkorderItemDTO item : itemList) {
				String item_name1 = item.getItem_name(); //오더에 따른 소요량 테이블
				System.out.println("품목명"+item_name);
				
			/*	
				  StockDTO stockDTO = new StockDTO(); stockDTO.setItem_name(item_name);
				  stockService.getItemList_unstore(item_name);
				  
				  
				  int sqt = stockService.getItemList_unstore(item_name);
				  System.out.println(sqt);  */
					
				  
			} // 품목이 잘 가져와지는지 확인  
		}
		return "wms/unstore/insertUnstore";
	}
	
	
	@ResponseBody
	@RequestMapping(value = "/wms/unstore/addUntore", method = RequestMethod.GET)
	public String addStore(HttpServletRequest request, Model model) {
		System.out.println("UnstoreController addUntore()");
		 
		 System.out.println(request.getParameter("item_num")); //데이터 잘 들고오는지 확인
		
		 UnstoreDTO unstoreDTO = new UnstoreDTO();
		 unstoreDTO.setWo_num(request.getParameter("wo_num"));//작업지시번호
		 unstoreDTO.setItem_name(request.getParameter("item_name"));//납품처명
		 unstoreDTO.setUnsto_qty(Integer.parseInt(request.getParameter("wo_qty")));//입고수량
		 unstoreDTO.setUnsto_progress("출고완료");
		 unstoreDTO.setEmp_num(Integer.parseInt(request.getParameter("emp_num")));//처리사원
		 unstoreDTO.setItem_num(request.getParameter("item_num"));
		 
		 unstoreService.insertUnstore(unstoreDTO);
		
		 return "/wms/unstore/insertUnstore";		
	}
}
