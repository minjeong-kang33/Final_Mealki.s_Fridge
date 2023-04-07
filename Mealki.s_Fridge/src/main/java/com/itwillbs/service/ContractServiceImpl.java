package com.itwillbs.service;


import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.dao.ContractDAO;
import com.itwillbs.domain.ContractDTO;
import com.itwillbs.domain.EmployeeDTO;
import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.PlaceOrderDTO;
//컨트롤러와 연결되는 설정
@Service
public class ContractServiceImpl implements ContractService {

	
	@Inject
	private ContractDAO contractDAO;
	
	@Override
	public void insertBoard(ContractDTO dto) {
		System.out.println("ContractServiceImpl insertBoard()");
		
		 contractDAO.contractInsertBoard(dto);
	}

	@Override
	public List<ContractDTO> getBoardList(PageDTO pageDTO) {
			System.out.println("ContractServiceImpl selectBoardList()");
			//시작하는 행번호 구하기
			int startRow=(pageDTO.getCurrentPage()-1)*pageDTO.getPageSize()+1;
			int endRow = startRow+pageDTO.getPageSize()-1;
			
			pageDTO.setStartRow(startRow);
			pageDTO.setEndRow(endRow);
		
			return contractDAO.getBoardList(pageDTO);
	}
	
		@Override
		public int selectContractTotal(ContractDTO dto) {
			
			return contractDAO.selectContractTotal(dto);
		}
	
		@Override
		public int getContractCount(PageDTO pageDTO) {
			System.out.println("ContractServiceImpl getContractCount()");
			
			return contractDAO.getContractCount(pageDTO);
		}

		@Override
		public List<Map<String, Object>> getContractListMap() {
			
			return contractDAO.getContractListMap();
		}

		@Override
		public ContractDTO getBoard(int business_num) {
			
			return contractDAO.getBoard(business_num);
		}

		@Override
		public void updateBoard(ContractDTO dto) {
			
			contractDAO.updateBoard(dto);
		}

		@Override
		public void deleteBoard(int business_num) {
			contractDAO.deleteBoard(business_num);
		}

		@Override
		public List<PlaceOrderDTO> getProductList() {
			
			return contractDAO.getProductList();
		}

		@Override
		public List<ContractDTO> getNameList() {
			
			return contractDAO.getNameList();
		}

		@Override
		public List<EmployeeDTO> getNameList2() {
			
			return contractDAO.getNameList2();
		}

		

		
	
	

	
	

	

}
