package com.itwillbs.service;

import java.util.List;
import java.util.Map;

import com.itwillbs.domain.ItemDTO;
import com.itwillbs.domain.PageDTO;

public interface ItemService {
	List<ItemDTO> getItemList(PageDTO pageDTO);
	int getItemCount();
	void save(ItemDTO item);
	void deleteItem(String itemNum);
	String getMaxItemNum(String prefix);
//	ItemDTO getItemByNum(String item_num);
}
