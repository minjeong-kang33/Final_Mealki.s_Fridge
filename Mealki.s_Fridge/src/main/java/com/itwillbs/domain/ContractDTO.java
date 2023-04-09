package com.itwillbs.domain;

import java.sql.Timestamp;

public class ContractDTO {

	private int business_num;
	private String cust_num;
	private String cust_name;
	private String item_num;
	private String item_name;
	private String business_name;
	private String business_date;
	private String out_date;
	private String incharge_code;
	private String incharge_name;
	private int contract_qty;
	private String exists_in_workorder;
	
	public String getExists_in_workorder() {
		return exists_in_workorder;
	}
	public void setExists_in_workorder(String exists_in_workorder) {
		this.exists_in_workorder = exists_in_workorder;
	}
	public int getBusiness_num() {
		return business_num;
	}
	public void setBusiness_num(int business_num) {
		this.business_num = business_num;
	}
	public String getCust_num() {
		return cust_num;
	}
	public void setCust_num(String cust_num) {
		this.cust_num = cust_num;
	}
	public String getCust_name() {
		return cust_name;
	}
	public void setCust_name(String cust_name) {
		this.cust_name = cust_name;
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
	public String getBusiness_name() {
		return business_name;
	}
	public void setBusiness_name(String business_name) {
		this.business_name = business_name;
	}
	
	
	
	public String getBusiness_date() {
		return business_date;
	}
	public void setBusiness_date(String business_date) {
		this.business_date = business_date;
	}
	public String getOut_date() {
		return out_date;
	}
	public void setOut_date(String out_date) {
		this.out_date = out_date;
	}
	public String getIncharge_code() {
		return incharge_code;
	}
	public void setIncharge_code(String incharge_code) {
		this.incharge_code = incharge_code;
	}
	public String getIncharge_name() {
		return incharge_name;
	}
	public void setIncharge_name(String incharge_name) {
		this.incharge_name = incharge_name;
	}
	public int getContract_qty() {
		return contract_qty;
	}
	public void setContract_qty(int contract_qty) {
		this.contract_qty = contract_qty;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
