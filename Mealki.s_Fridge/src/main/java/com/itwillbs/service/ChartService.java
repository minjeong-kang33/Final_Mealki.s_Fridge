package com.itwillbs.service;

import java.util.List;

import org.springframework.http.ResponseEntity;

import com.itwillbs.domain.ChartDTO;

public interface ChartService {

	List<ChartDTO> contract();

	List<ChartDTO> prochart();

}
