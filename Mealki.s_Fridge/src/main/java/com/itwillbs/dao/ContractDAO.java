package com.itwillbs.dao;

import java.util.List;
import java.util.Map;

import com.itwillbs.domain.ContractDTO;
import com.itwillbs.domain.PageDTO;

public interface ContractDAO {

	public void contractInsertBoard(ContractDTO dto);

	public List<ContractDTO> getBoardList(PageDTO pageDTO);

	public int getContractCount(PageDTO pageDTO);

	public int selectContractTotal(ContractDTO dto);

	public List<Map<String, Object>> getContractListMap();

	public ContractDTO getBoard(int business_num);
	
	
}
