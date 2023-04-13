package com.itwillbs.dao;

import java.util.List;

import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.WorkorderDTO;

public interface WorkorderDAO {

	public int getWorkorderCount(PageDTO pageDTO);

	public List<WorkorderDTO> getWorkorderList(PageDTO pageDTO);

	public List<WorkorderDTO> getcontractList(PageDTO pageDTO);

	public int getContractCount(PageDTO pageDTO);

	public WorkorderDTO ContractSearch(String keyword);

	public List<WorkorderDTO> WoInsert(String num);

	public void insertWorkorder(WorkorderDTO workorderDTO);

	public List<WorkorderDTO> WoUpdateForm(String num);

	public void updateWorkorder(WorkorderDTO workorderDTO);

	public void deleteWorkorder(String wo_num);

	public List<WorkorderDTO> getWorkorderList2(PageDTO pageDTO);

	public int getWorkorderCount2(PageDTO pageDTO);


	
}
