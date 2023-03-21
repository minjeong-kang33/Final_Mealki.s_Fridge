package com.itwillbs.dao;

import java.util.List;

import com.itwillbs.domain.ItemDTO;

public interface ItemDAO {
	public List<ItemDTO> getItemList();
//    public void insertItem(ItemDTO item);
//    public void updateItem(ItemDTO item);
//    public void deleteItem(String itemNum);
//    public List<ItemDTO> searchItem(String itemName, String itemType);
}
