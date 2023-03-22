package com.itwillbs.domain;

public class PlaceOrderDTO {
	private String order_num;
	private String item_num;
	private int order_qty;
	private int order_sum;
	private int order_vat;
	private int order_date;
	private String whs_num;
	private int emp_num;
	
	public String getOrder_num() {
		return order_num;
	}
	public void setOrder_num(String order_num) {
		this.order_num = order_num;
	}
	public String getItem_num() {
		return item_num;
	}
	public void setItem_num(String item_num) {
		this.item_num = item_num;
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
	public int getOrder_date() {
		return order_date;
	}
	public void setOrder_date(int order_date) {
		this.order_date = order_date;
	}
	public String getWhs_num() {
		return whs_num;
	}
	public void setWhs_num(String whs_num) {
		this.whs_num = whs_num;
	}
	public int getEmp_num() {
		return emp_num;
	}
	public void setEmp_num(int emp_num) {
		this.emp_num = emp_num;
	}
	
	
	
}
