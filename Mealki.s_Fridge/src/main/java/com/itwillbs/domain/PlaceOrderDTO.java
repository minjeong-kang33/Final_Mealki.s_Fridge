package com.itwillbs.domain;

import java.sql.Date;
import java.util.List;

public class PlaceOrderDTO {
	private String order_num;
	private String item_num;
	private String item_name;
	private int order_qty;
	private int order_sum;
	private int order_vat;
	private Date order_date;
	private Date due_date;
	private String whs_num;
	private int emp_num;
	private List<PlaceOrderDTO2> dto;
	
	public List<PlaceOrderDTO2> getDto() {
		return dto;
	}
	public void setDto(List<PlaceOrderDTO2> dto) {
		this.dto = dto;
	}
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
	public Date getOrder_date() {
		return order_date;
	}
	public void setOrder_date(Date order_date) {
		this.order_date = order_date;
	}
	public Date getDue_date() {
		return due_date;
	}
	public void setDue_date(Date due_date) {
		this.due_date = due_date;
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
