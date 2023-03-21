package com.itwillbs.dao;

import java.util.List;

import com.itwillbs.domain.ContractDTO;
import com.itwillbs.domain.PageDTO;

public interface ContractDAO {

	public void contractInsertBoard(ContractDTO dto);

	public List<ContractDTO> getBoardList(PageDTO pageDTO);

	public int getContractCount();

	public int selectContractTotal(ContractDTO dto);
	
	
}
