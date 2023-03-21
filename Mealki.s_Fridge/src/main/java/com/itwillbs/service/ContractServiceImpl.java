package com.itwillbs.service;

import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.dao.ContractDAO;
import com.itwillbs.domain.ContractDTO;
import com.itwillbs.domain.PageDTO;
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
	public int getContractCount() {
		
		return contractDAO.getContractCount();
	}
	
	

	
	

	

}
