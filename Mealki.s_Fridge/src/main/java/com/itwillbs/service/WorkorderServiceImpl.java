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
	public int getWorkorderCount() {
		System.out.println("WorkorderServiceImpl getWorkorderCount()");
		
		
		return workorderDAO.getWorkorderCount();
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
	
}