package com.itwillbs.domain;

import java.sql.Timestamp;

public class ShippingDTO {

	private String shipping_num;
	private String wo_num;
	private String item_num;
	private String item_name;
	private String delivery_date;
	private String out_date;
	private String out_qty;
	private String qc_qty;
	private String incharge_name;
	private String business_name;
	private String out_progress;
	private String cust_name;
	
	public String getCust_name() {
		return cust_name;
	}
	public void setCust_name(String cust_name) {
		this.cust_name = cust_name;
	}
	public String getShipping_num() {
		return shipping_num;
	}
	public void setShipping_num(String shipping_num) {
		this.shipping_num = shipping_num;
	}
	public String getWo_num() {
		return wo_num;
	}
	public void setWo_num(String wo_num) {
		this.wo_num = wo_num;
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
	
	
	public String getDelivery_date() {
		return delivery_date;
	}
	public void setDelivery_date(String delivery_date) {
		this.delivery_date = delivery_date;
	}
	public String getOut_date() {
		return out_date;
	}
	public void setOut_date(String out_date) {
		this.out_date = out_date;
	}
	public String getOut_qty() {
		return out_qty;
	}
	public void setOut_qty(String out_qty) {
		this.out_qty = out_qty;
	}
	public String getQc_qty() {
		return qc_qty;
	}
	public void setQc_qty(String qc_qty) {
		this.qc_qty = qc_qty;
	}
	public String getIncharge_name() {
		return incharge_name;
	}
	public void setIncharge_name(String incharge_name) {
		this.incharge_name = incharge_name;
	}
	public String getBusiness_name() {
		return business_name;
	}
	public void setBusiness_name(String business_name) {
		this.business_name = business_name;
	}
	public String getOut_progress() {
		return out_progress;
	}
	public void setOut_progress(String out_progress) {
		this.out_progress = out_progress;
	}
	
	
	
	
}
