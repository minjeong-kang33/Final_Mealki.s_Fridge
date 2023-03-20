package com.itwillbs.service;

import java.util.List;

import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.PlaceOrderDTO;
import com.itwillbs.domain.WarehouseDTO;

public interface PlaceOrderService {
	public List<WarehouseDTO> getWarehouseList(PageDTO pageDTO);
	public int getStk_qnt();
}
