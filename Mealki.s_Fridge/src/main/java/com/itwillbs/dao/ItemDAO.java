package com.itwillbs.dao;

import java.util.List;
import java.util.Map;

import com.itwillbs.domain.ItemDTO;
import com.itwillbs.domain.PageDTO;

public interface ItemDAO {
	List<ItemDTO> getItemList(PageDTO pageDTO);
	int getItemCount();
	void saveItemImage(String itemNum, String imageName);
	String getItemImage(String itemNum);
	void insertItem(ItemDTO item);
	void updateItem(ItemDTO item);
	void deleteItem(String itemNum);
	ItemDTO selectItem(String itemNum);

}
