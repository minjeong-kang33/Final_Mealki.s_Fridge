package com.itwillbs.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.dao.UnstoreDAO;

@Service
public class UnstoreServiceImpl implements UnstoreService{

	
	@Inject
	public UnstoreDAO unstoreDAO;

	@Override
	public List<Map<String, Object>> getUnstoreListUnreleased() {
		System.out.println("UnstoreServiceImpl getUnstoreListUnreleased");
		return unstoreDAO.getUnstoreListUnreleased();
	}


	
}
