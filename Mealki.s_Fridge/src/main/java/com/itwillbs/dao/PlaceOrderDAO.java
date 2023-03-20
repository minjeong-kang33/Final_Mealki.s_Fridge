package com.itwillbs.dao;

import java.util.List;

import com.itwillbs.domain.PageDTO;
import com.itwillbs.domain.WarehouseDTO;

public interface PlaceOrderDAO {
	public List<WarehouseDTO> getWarehouseList(PageDTO pageDTO);
	public int getStk_qnt();
}
