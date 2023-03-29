package com.itwillbs.service;

import java.util.List;

import com.itwillbs.domain.WorkorderItemDTO;

public interface WorkorderItemService {
	
	List<WorkorderItemDTO> getItemList(String wo_num);

}
