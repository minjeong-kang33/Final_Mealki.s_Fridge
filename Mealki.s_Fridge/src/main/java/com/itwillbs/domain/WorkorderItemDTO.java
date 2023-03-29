package com.itwillbs.domain;

public class WorkorderItemDTO {
	
	private String wo_num;
	private String item_name;
	private int wo_qty;
	
	
	public String getWo_num() {
		return wo_num;
	}
	public void setWo_num(String wo_num) {
		this.wo_num = wo_num;
	}
	public String getItem_name() {
		return item_name;
	}
	public void setItem_name(String item_name) {
		this.item_name = item_name;
	}
	public int getWo_qty() {
		return wo_qty;
	}
	public void setWo_qty(int wo_qty) {
		this.wo_qty = wo_qty;
	}

}
