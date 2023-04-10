package com.itwillbs.dao;

import java.util.List;

import org.springframework.http.ResponseEntity;

import com.itwillbs.domain.ChartDTO;

public interface ChartDAO {

	List<ChartDTO> contract();

	List<ChartDTO> prochart();

}
