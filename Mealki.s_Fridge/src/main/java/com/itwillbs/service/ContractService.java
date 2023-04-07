package com.itwillbs.service;



import java.util.List;
import java.util.Map;

import com.itwillbs.domain.ContractDTO;
import com.itwillbs.domain.EmployeeDTO;
import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.PlaceOrderDTO;

public interface ContractService {
	 // 일반게시판 저장처리
	 public void insertBoard(ContractDTO dto);
	 // 일반 게시판 화면목록
	 public List<ContractDTO> getBoardList(PageDTO pageDTO);

	 // Total 개수 얻기 
	 public int selectContractTotal(ContractDTO dto);
	 
	 public int getContractCount(PageDTO pageDTO);
	 
	 public List<Map<String, Object>> getContractListMap();
	
	 public ContractDTO getBoard(int business_num);
	
	 public void updateBoard(ContractDTO dto);
	
	 public void deleteBoard(int business_num);
	
	 public List<PlaceOrderDTO> getProductList();

	 public List<ContractDTO> getNameList();
	
	 public List<EmployeeDTO> getNameList2();
	

	
}
