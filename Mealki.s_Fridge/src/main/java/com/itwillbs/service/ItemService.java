package com.itwillbs.service;

import java.util.List;

import com.itwillbs.domain.ItemDTO;
import com.itwillbs.domain.PageDTO;

public interface ItemService {
	 	public List<ItemDTO> getItemList(PageDTO pageDTO);
	 	public int getItemCount();
	 	public void saveItemImage(String itemNum, String imageName);
	 	  String getItemImage(String itemNum);
//	    public void insertItem(ItemDTO item);
//	    public void updateItem(ItemDTO item);
//	    public void deleteItem(String itemNum);
//	    public List<ItemDTO> searchItem(String itemName, String itemType);

}
