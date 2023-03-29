package com.itwillbs.service;


import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.dao.WorkorderItemDAO;
import com.itwillbs.domain.WorkorderItemDTO;

@Service
public class WorkorderItemServiceImpl implements WorkorderItemService{

	@Inject
	public WorkorderItemDAO  workorderItemDAO;

	@Override
	public List<WorkorderItemDTO> getItemList(String wo_num) {
		System.out.println("WorkorderItemServiceImpl getItemList");
		return workorderItemDAO.getItemList(wo_num);
	}


}
