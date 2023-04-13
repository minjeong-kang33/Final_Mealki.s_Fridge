package com.itwillbs.dao;

import java.util.List;
import java.util.Map;

import com.itwillbs.domain.CustomerDTO;
import com.itwillbs.domain.ItemDTO;
import com.itwillbs.domain.PageDTO;

public interface ItemDAO {
	List<ItemDTO> getItemList(PageDTO pageDTO);
	int getItemCount(PageDTO pageDTO);
	void insertItem(ItemDTO item);
	void updateItem(ItemDTO item);
	void deleteItem(String itemNum);
	ItemDTO selectItem(String itemNum);
	String getMaxItemNum(String prefix);
	List<CustomerDTO> getCustomerList();
}
