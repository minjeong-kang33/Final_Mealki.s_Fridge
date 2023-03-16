package com.itwillbs.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.dao.WorkorderDAO;
import com.itwillbs.domain.WorkorderDTO;

@Service
public abstract class WorkorderServiceImpl implements EmployeeService{
	@Inject
	private WorkorderDAO workorderDAO;

//	@Override
//	public WorkorderDTO workorderInsert(WorkorderDTO workorderDTO) {
//		System.out.println("WorkorderServiceImpl workorderInsert()");
//		
//		return WorkorderDTO.workorderInsert(workorderDTO);
//	}
	
	
}