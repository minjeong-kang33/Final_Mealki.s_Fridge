package com.itwillbs.domain;

public class PlaceOrderDTO2 {
	private String item_num;
	private String item_name;
	private int order_qty;
	private int order_sum;
	private int order_vat;
	
	public String getItem_num() {
		return item_num;
	}
	public void setItem_num(String item_num) {
		this.item_num = item_num;
	}
	public String getItem_name() {
		return item_name;
	}
	public void setItem_name(String item_name) {
		this.item_name = item_name;
	}
	public int getOrder_qty() {
		return order_qty;
	}
	public void setOrder_qty(int order_qty) {
		this.order_qty = order_qty;
	}
	public int getOrder_sum() {
		return order_sum;
	}
	public void setOrder_sum(int order_sum) {
		this.order_sum = order_sum;
	}
	public int getOrder_vat() {
		return order_vat;
	}
	public void setOrder_vat(int order_vat) {
		this.order_vat = order_vat;
	}
	
	
}
