package com.itwillbs.controller;

import java.text.SimpleDateFormat;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.WorkorderDTO;
import com.itwillbs.service.WorkorderService;


@Controller
public class WorkorderController {
	
	@Inject
	private WorkorderService workorderService;
	
	@RequestMapping(value = "mps/workorder/list", method = RequestMethod.GET)
	public String workorderlist(HttpServletRequest request, Model model) throws Exception  {
		System.out.println("WorkorderController workorderlist()");
				
		String wo_num=request.getParameter("wo_num");
		String business_num=request.getParameter("business_num");
		String order_date=request.getParameter("order_date");
		String out_date=request.getParameter("out_date");	
		String dorder_date=request.getParameter("dorder_date");
		String dout_date=request.getParameter("dout_date");
		
		
		// 한 화면에 보여줄 글 개수 설정
		int pageSize=10;
		// 현페이지 번호 가져오기
		String pageNum=request.getParameter("pageNum");
		
		if(pageNum==null) {
			//pageNum 없으면 1페이지 설정
			pageNum="1";
		}
		
		if(business_num == "") {
			business_num=null;
		}
		if(wo_num == "") {
			wo_num=null;
		}
		if(order_date == "") {
			order_date=null;
		}
		if(out_date == "") {
			out_date=null;
		}
		if(dorder_date == "") {
			dorder_date=null;
		}
		if(dout_date == "") {
			dout_date=null;
		}
		
		System.out.println("wo_num : " + wo_num);
		System.out.println("business_num : " + business_num);
		System.out.println("order_date : "+ order_date);
		System.out.println("out_date : " + out_date);
		
		// 페이지번호를 => 정수형 변경
		int currentPage=Integer.parseInt(pageNum);	
		PageDTO pageDTO=new PageDTO();
		pageDTO.setPageSize(pageSize);
		pageDTO.setPageNum(pageNum);
		pageDTO.setCurrentPage(currentPage);
		pageDTO.setWo_num(wo_num);
		pageDTO.setBusiness_num(business_num);
		
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		if(order_date!= null) {
			java.util.Date date = sdf.parse(order_date);
			java.sql.Date order_date1 = new java.sql.Date(date.getTime());
			pageDTO.setOrder_date(order_date1);
		}
		if(out_date != null) {
			java.util.Date date2 = sdf.parse(out_date);
			java.sql.Date out_date1 = new java.sql.Date(date2.getTime());  
			pageDTO.setOut_date(out_date1);
		}
		if(dorder_date!= null) {
			java.util.Date date3 = sdf.parse(dorder_date);
			java.sql.Date dorder_date1 = new java.sql.Date(date3.getTime());
			pageDTO.setDorder_date(dorder_date1);
		}
		if(dout_date != null) {
			java.util.Date date4 = sdf.parse(dout_date);
			java.sql.Date dout_date1 = new java.sql.Date(date4.getTime());  
			pageDTO.setDout_date(dout_date1);
		}
		
		
		List<WorkorderDTO> workorderList=workorderService.getworkorderList(pageDTO);
		
		String pageNum2=request.getParameter("pageNum2");
		if(pageNum2==null) {
			//pageNum 없으면 1페이지 설정
			pageNum2="1";
		}
		int currentPage2=Integer.parseInt(pageNum2);
		PageDTO pageDTO2 = new PageDTO();
		pageDTO2.setPageSize(pageSize);
		pageDTO2.setPageNum(pageNum2);
		pageDTO2.setCurrentPage(currentPage2);
		List<WorkorderDTO> workorderList2=workorderService.getworkorderList2(pageDTO2);
				
		// 페이징 처리
		// 전체
		int count = workorderService.getWorkorderCount(pageDTO);
		int pageBlock = 10;
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
		
		// 대기
		int count2 = workorderService.getWorkorderCount2(pageDTO);
		System.out.println("count2 = " +count2);
		int startPage2=(currentPage-1)/pageBlock*pageBlock+1;
		int endPage2=startPage2+pageBlock-1;
		int pageCount2=count2/pageSize+(count2%pageSize==0?0:1);
		if(endPage2 > pageCount2){
			endPage2 = pageCount2;
			}
				
		
		pageDTO2.setCount(count2);
		pageDTO2.setPageBlock(pageBlock);
		pageDTO2.setStartPage(startPage2);
		pageDTO2.setEndPage(endPage2);
		pageDTO2.setPageCount(pageCount2);
				
		model.addAttribute("workorderList", workorderList);
		model.addAttribute("pageDTO", pageDTO);
		
		// 대기
		model.addAttribute("workorderList2", workorderList2);
		model.addAttribute("pageDTO2", pageDTO2);
				
		return "mps/workorder/list";
	}
	
	@RequestMapping(value = "/workorder/ContractList", method = RequestMethod.GET)
	public String ContractList(HttpServletRequest request, Model model) {
		System.out.println("WorkorderController ContractList()");
		
		int pageSize=5;
		String pageNum=request.getParameter("pageNum");
		if(pageNum==null) {
			pageNum="1";
		}
		int currentPage=Integer.parseInt(pageNum);
		
		PageDTO pageDTO=new PageDTO();
		pageDTO.setPageSize(pageSize);
		pageDTO.setPageNum(pageNum);
		pageDTO.setCurrentPage(currentPage);
		
		List<WorkorderDTO> contractList=workorderService.getcontractList(pageDTO);
		
		// 페이징 처리
		int count = workorderService.getContractCount(pageDTO);
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
		
		return "mps/workorder/ContractList";
	}
	
	@RequestMapping(value = "/workorder/ContractSearch", method = RequestMethod.GET)
	public String ContractSearch(HttpServletRequest request, Model model) {
		System.out.println("WorkorderController ContractSearch()");

		String keyword=request.getParameter("keyword");
		
		WorkorderDTO workorderDTO=workorderService.ContractSearch(keyword);
		
		model.addAttribute("workorderDTO", workorderDTO);
		
		return "mps/workorder/ContractSearch";
	}
	
	@RequestMapping(value = "/workorder/WoInsert", method = RequestMethod.GET)
	public String WoInsert(HttpServletRequest request, Model model) {
		System.out.println("WorkorderController WoInsert()");
		
		String num=request.getParameter("business_num");
		
		List<WorkorderDTO> WoInsert=workorderService.WoInsert(num);
		
		model.addAttribute("WoInsert", WoInsert);
		
		return "mps/workorder/WoInsert";
	}
	
	@RequestMapping(value = "/mps/workorder/WoInsertPro", method = RequestMethod.POST)
	public String WoInsertPro(HttpServletRequest request,HttpSession session) {
		System.out.println("WorkorderController WoInsertPro()");
		System.out.println(session.getAttribute("emp_num"));
		System.out.println(request.getParameter("contract_qty"));
		System.out.println(request.getParameter("business_num"));
		System.out.println(request.getParameter("item_name"));
		System.out.println(request.getParameter("manu_name"));
		
		int wo_emp=(int) session.getAttribute("emp_num");
		String contract_qty=request.getParameter("contract_qty");
		String b=request.getParameter("business_num");
		String item_name=request.getParameter("item_name");
		String manu_name=request.getParameter("manu_name");
		
		int business_num=Integer.parseInt(b);
		
		WorkorderDTO workorderDTO=new WorkorderDTO();
		workorderDTO.setWo_emp(wo_emp);
		workorderDTO.setContract_qty(contract_qty);
		workorderDTO.setBusiness_num(business_num);
		workorderDTO.setItem_name(item_name);
		workorderDTO.setManu_name(manu_name);
		
//		WorkorderDTO workorderDTO
		workorderService.insertWorkorder(workorderDTO);
		
		return "mps/workorder/imsg";
	}
	
	@RequestMapping(value = "/workorder/WoUpdate", method = RequestMethod.GET)
	public String WoUpdate(HttpServletRequest request, Model model) {
		System.out.println("WorkorderController WoInsert()");
		System.out.println("wo_num = " + request.getParameter("wo_num"));
		String num=request.getParameter("wo_num");
		
		List<WorkorderDTO> WoInsert=workorderService.WoUpdateForm(num);
		
		model.addAttribute("WoInsert", WoInsert);
		
		return "mps/workorder/WoUpdate";
	}
	
	@RequestMapping(value = "/mps/workorder/WoUpdatePro", method = RequestMethod.POST)
	public String WoUpdatePro(HttpServletRequest request) {
		System.out.println("WorkorderController WoUpdatePro()");
		System.out.println(request.getParameter("manu_name"));
		System.out.println(request.getParameter("wo_num"));
		
		String wo_num=request.getParameter("wo_num");
		
		WorkorderDTO workorderDTO=new WorkorderDTO();
		workorderDTO.setWo_num(wo_num);
		workorderDTO.setManu_name(request.getParameter("manu_name"));

		workorderService.updateWorkorder(workorderDTO);
		
		return "mps/workorder/umsg";
	}
	
	@RequestMapping(value = "/mps/workorder/WoDelete", method = RequestMethod.POST)
	public String WoDelete(HttpServletRequest request) {
		System.out.println("WorkorderController WoDelete()");
		System.out.println(request.getParameter("wo_num"));
		
		String wo_num=request.getParameter("wo_num");

		workorderService.deleteWorkorder(wo_num);
		
		return "mps/workorder/dmsg";
	}
}