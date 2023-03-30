package com.itwillbs.service;

import java.sql.Timestamp;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.dao.UnstoreDAO;
import com.itwillbs.domain.UnstoreDTO;

@Service
public class UnstoreServiceImpl implements UnstoreService{

	
	@Inject
	public UnstoreDAO unstoreDAO;

	@Override
	public List<Map<String, Object>> getUnstoreListUnreleased() {
		System.out.println("UnstoreServiceImpl getUnstoreListUnreleased");
		return unstoreDAO.getUnstoreListUnreleased();
	}

	@Override
	public void insertUnstore(UnstoreDTO unstoreDTO) {
		System.out.println("UnstoreServiceImpl insertUnstore");
		unstoreDTO.setUnsto_date(new Timestamp(System.currentTimeMillis()));
		unstoreDAO.insertUnstore(unstoreDTO);
		
	}

	@Override
	public List<Map<String, Object>> getUnstoreListSuccess() {
		System.out.println("UnstoreServiceImpl getUnstoreListSuccess");
		return unstoreDAO.getUnstoreListSuccess();
	}

	@Override
	public List<Map<String, Object>> getUnstoreList() {
		System.out.println("UnstoreServiceImpl getUnstoreList");
		return unstoreDAO.getUnstoreList();
	}


	
}
