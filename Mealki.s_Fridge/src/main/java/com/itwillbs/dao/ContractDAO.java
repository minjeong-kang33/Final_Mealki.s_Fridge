package com.itwillbs.dao;


import java.util.List;
import java.util.Map;

import com.itwillbs.domain.ContractDTO;
import com.itwillbs.domain.EmployeeDTO;
import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.PlaceOrderDTO;

public interface ContractDAO {


	public void contractInsertBoard(ContractDTO dto);

	public List<ContractDTO> getBoardList(PageDTO pageDTO);

	public int getContractCount(PageDTO pageDTO);

	public int selectContractTotal(ContractDTO dto);

	public List<Map<String, Object>> getContractListMap();

	public ContractDTO getBoard(int business_num);

	public void updateBoard(ContractDTO dto);

	public void deleteBoard(int business_num);

	public List<PlaceOrderDTO> getProductList();

	public List<ContractDTO> getNameList();

	public List<EmployeeDTO> getNameList2();


	
	
	
}
