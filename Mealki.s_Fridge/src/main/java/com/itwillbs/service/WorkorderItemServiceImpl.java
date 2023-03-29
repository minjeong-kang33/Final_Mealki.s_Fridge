package com.itwillbs.service;


import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.dao.WorkorderItemDAO;

@Service
public class WorkorderItemServiceImpl implements WorkorderItemService{

	@Inject
	public WorkorderItemDAO  workorderItemDAO;


}
