package com.itwillbs.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.itwillbs.dao.ItemDAO;
import com.itwillbs.domain.ItemDTO;

@Service
public class ItemServiceImpl implements ItemService {
	
	@Inject
	private ItemDAO itemDAO;
	
	@Override
	public List<ItemDTO> getItemList() {
		System.out.println("ItemServiceImpl getItemList()");
		
		return itemDAO.getItemList();
	}

//	@Override
//	public void insertItem(ItemDTO item) {
//		// TODO Auto-generated method stub
//		
//	}
//
//	@Override
//	public void updateItem(ItemDTO item) {
//		// TODO Auto-generated method stub
//		
//	}
//
//	@Override
//	public void deleteItem(String itemNum) {
//		// TODO Auto-generated method stub
//		
//	}
//
//	@Override
//	public List<ItemDTO> searchItem(String itemName, String itemType) {
//		// TODO Auto-generated method stub
//		return null;
//	}
	 
	    }


