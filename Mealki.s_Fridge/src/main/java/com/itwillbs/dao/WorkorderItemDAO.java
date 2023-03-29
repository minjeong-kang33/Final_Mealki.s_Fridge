package com.itwillbs.dao;

import java.util.List;

import com.itwillbs.domain.WorkorderItemDTO;

public interface WorkorderItemDAO {
	
	List<WorkorderItemDTO> getItemList(String wo_num);
}
