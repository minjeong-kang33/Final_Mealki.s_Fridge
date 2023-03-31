package com.itwillbs.service;

import java.sql.Timestamp;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.dao.UnstoreDAO;
import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.UnstoreDTO;

@Service
public class UnstoreServiceImpl implements UnstoreService{

	
	@Inject
	public UnstoreDAO unstoreDAO;


	@Override
	public void insertUnstore(UnstoreDTO unstoreDTO) {
		System.out.println("UnstoreServiceImpl insertUnstore");
		unstoreDTO.setUnsto_date(new Timestamp(System.currentTimeMillis()));
		unstoreDAO.insertUnstore(unstoreDTO);
		
	}

	@Override
	public List<Map<String, Object>> getUnstoreList(PageDTO pageDTO) {
		System.out.println("UnstoreServiceImpl getUnstoreList");
		
		int startRow=(pageDTO.getCurrentPage()-1)*pageDTO.getPageSize()+1;
		int endRow = startRow+pageDTO.getPageSize()-1;
		
		pageDTO.setStartRow(startRow);
		pageDTO.setEndRow(endRow);
		
		return unstoreDAO.getUnstoreList(pageDTO);
	}

	@Override
	public int getUnstoreListCount(PageDTO pageDTO) {
		System.out.println("UnstoreServiceImpl getUnstoreListCount");
		return unstoreDAO.getUnstoreListCount(pageDTO);
	}


	
}
