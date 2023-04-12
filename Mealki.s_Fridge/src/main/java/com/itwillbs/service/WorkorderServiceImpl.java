package com.itwillbs.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.dao.WorkorderDAO;
import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.WorkorderDTO;

@Service
public class WorkorderServiceImpl implements WorkorderService{
	@Inject
	private WorkorderDAO workorderDAO;

	@Override
	public int getWorkorderCount(PageDTO pageDTO) {
		System.out.println("WorkorderServiceImpl getWorkorderCount()");
		
		
		return workorderDAO.getWorkorderCount(pageDTO);
	}

	@Override
	public List<WorkorderDTO> getworkorderList(PageDTO pageDTO) {
		System.out.println("WorkorderServiceImpl getworkorderList()");
		int startRow=(pageDTO.getCurrentPage()-1)*pageDTO.getPageSize()+1;
		int endRow = startRow+pageDTO.getPageSize()-1;
		
		pageDTO.setStartRow(startRow);
		pageDTO.setEndRow(endRow);
		
		return workorderDAO.getWorkorderList(pageDTO);
	}
	
	@Override
	public int getContractCount(PageDTO pageDTO) {
		System.out.println("WorkorderServiceImpl getcontractCount()");
		
		
		return workorderDAO.getContractCount(pageDTO);
	}

	

	@Override
	public List<WorkorderDTO> getcontractList(PageDTO pageDTO) {
		System.out.println("WorkorderServiceImpl getcontractList()");
		int startRow=(pageDTO.getCurrentPage()-1)*pageDTO.getPageSize()+1;
		int endRow = startRow+pageDTO.getPageSize()-1;
		
		pageDTO.setStartRow(startRow);
		pageDTO.setEndRow(endRow);
		
		return workorderDAO.getcontractList(pageDTO);
	}

	@Override
	public WorkorderDTO ContractSearch(String keyword) {
		System.out.println("WorkorderServiceImpl ContractSearch()");
		
		
		return workorderDAO.ContractSearch(keyword);
	}
	
	@Override
	public List<WorkorderDTO> WoInsert(String num) {
		System.out.println("WorkorderServiceImpl WoInsert()");
		
		
		return workorderDAO.WoInsert(num);
	}

	@Override
	public void insertWorkorder(WorkorderDTO workorderDTO) {
		System.out.println("WorkorderServiceImpl insertWorkorder()");
		
		
		workorderDAO.insertWorkorder(workorderDTO);
	}

	@Override
	public List<WorkorderDTO> WoUpdateForm(String num) {
		System.out.println("WorkorderServiceImpl WoUpdateForm()");
		
		return workorderDAO.WoUpdateForm(num);
	}

	@Override
	public void updateWorkorder(WorkorderDTO workorderDTO) {
		System.out.println("WorkorderServiceImpl WoUpdateForm()");
		
		workorderDAO.updateWorkorder(workorderDTO);
	}

	@Override
	public void deleteWorkorder(String wo_num) {
		System.out.println("WorkorderServiceImpl deleteWorkorder()");
		
		
		workorderDAO.deleteWorkorder(wo_num);
	}

	@Override
	public List<WorkorderDTO> getworkorderList2(PageDTO pageDTO) {
		System.out.println("WorkorderServiceImpl getworkorderList2()");
		int startRow=(pageDTO.getCurrentPage()-1)*pageDTO.getPageSize()+1;
		int endRow = startRow+pageDTO.getPageSize()-1;
		
		pageDTO.setStartRow(startRow);
		pageDTO.setEndRow(endRow);
		
		return workorderDAO.getWorkorderList2(pageDTO);
	}

	@Override
	public int getWorkorderCount2(PageDTO pageDTO) {
			System.out.println("WorkorderServiceImpl getWorkorderCount2()");
		
		
		return workorderDAO.getWorkorderCount2(pageDTO);
	}


	
	

}