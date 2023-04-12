package com.itwillbs.domain;

import java.sql.Date;

public class WorkorderDTO {
	private String keyword;
	//	workorder 관련
	private String wo_num;
	private int business_num;
	private int wo_emp;
	private String wo_empname;
	private String wo_date;
	private int wo_qty;
	private String manu_name;
	private String wo_state;
	// contract 관련
	private String item_name;
	private String cust_name;
	private String business_date;
	private String out_date;
	private String item_num;
	private String contract_qty;
	// recipe 관련
	private String r_name;
	private String ritem_num;
	
	private int pr_sum;
	
	public String getContract_qty() {
		return contract_qty;
	}
	public void setContract_qty(String contract_qty) {
		this.contract_qty = contract_qty;
	}
	public String getItem_name() {
		return item_name;
	}
	public void setItem_name(String item_name) {
		this.item_name = item_name;
	}
	public String getCust_name() {
		return cust_name;
	}
	public void setCust_name(String cust_name) {
		this.cust_name = cust_name;
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
	public int getBusiness_num() {
		return business_num;
	}
	public void setBusiness_num(int business_num) {
		this.business_num = business_num;
	}
	public int getWo_emp() {
		return wo_emp;
	}
	public void setWo_emp(int wo_emp) {
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
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public String getR_name() {
		return r_name;
	}
	public void setR_name(String r_name) {
		this.r_name = r_name;
	}
	public String getWo_empname() {
		return wo_empname;
	}
	public void setWo_empname(String wo_empname) {
		this.wo_empname = wo_empname;
	}
	public int getPr_sum() {
		return pr_sum;
	}
	public void setPr_sum(int pr_sum) {
		this.pr_sum = pr_sum;
	}
	public String getRitem_num() {
		return ritem_num;
	}
	public void setRitem_num(String ritem_num) {
		this.ritem_num = ritem_num;
	}

	
		
		
	

}
