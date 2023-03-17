package com.itwillbs.dao;

import java.util.List;

import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.WorkorderDTO;

public interface WorkorderDAO {

	public int getWorkorderCount();

	public List<WorkorderDTO> getWorkorderList(PageDTO pageDTO);

	
}
