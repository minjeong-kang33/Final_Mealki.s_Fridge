package com.itwillbs.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import com.itwillbs.dao.ChartDAO;
import com.itwillbs.domain.ChartDTO;

@Service
public class ChartServiceImpl implements ChartService{
	@Inject
	private ChartDAO chartDAO;

	@Override
	public List<ChartDTO> contract() {
		
		return chartDAO.contract();
	}

}
