package com.itwillbs.domain;

public class WorkorderDTO {
	//	workorder 관련
	private String wo_num;
	private String business_num;
	private String wo_emp;
	private String wo_date;
	private int wo_qty;
	private String manu_name;
	private String wo_state;
	// contract 관련
	private String item_name;
	private String business_name;
	private String business_date;
	private String out_date;
	private String item_num;
	
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
	public String getItem_num() {
		return item_num;
	}
	public void setItem_num(String item_num) {
		this.item_num = item_num;
	}
	public String getWo_state() {
		return wo_state;
	}
	public void setWo_state(String wo_state) {
		this.wo_state = wo_state;
	}
	public String getWo_num() {
		return wo_num;
	}
	public void setWo_num(String wo_num) {
		this.wo_num = wo_num;
	}
	public String getBusiness_num() {
		return business_num;
	}
	public void setBusiness_num(String business_num) {
		this.business_num = business_num;
	}
	public String getWo_emp() {
		return wo_emp;
	}
	public void setWo_emp(String wo_emp) {
		this.wo_emp = wo_emp;
	}
	public String getWo_date() {
		return wo_date;
	}
	public void setWo_date(String wo_date) {
		this.wo_date = wo_date;
	}
	public int getWo_qty() {
		return wo_qty;
	}
	public void setWo_qty(int wo_qty) {
		this.wo_qty = wo_qty;
	}
	public String getManu_name() {
		return manu_name;
	}
	public void setManu_name(String manu_name) {
		this.manu_name = manu_name;
	}
	
		
		
	

}
