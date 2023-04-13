package com.itwillbs.service;

import java.util.List;
import java.util.Map;

import com.itwillbs.domain.CustomerDTO;
import com.itwillbs.domain.ItemDTO;
import com.itwillbs.domain.PageDTO;

public interface ItemService {
	List<ItemDTO> getItemList(PageDTO pageDTO);
	int getItemCount(PageDTO pageDTO);
	void save(ItemDTO item);
	void deleteItem(String itemNum);
	String getMaxItemNum(String prefix);
	List<CustomerDTO> getCustomerList();
}
