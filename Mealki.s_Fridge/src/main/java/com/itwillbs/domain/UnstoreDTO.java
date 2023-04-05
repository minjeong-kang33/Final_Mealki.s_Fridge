package com.itwillbs.domain;

import java.sql.Timestamp;

public class UnstoreDTO {
	private String unsto_num;
	private String wo_num;
	private Timestamp unsto_date;
	private String unsto_progress;
	private int unsto_qty;
	private int emp_num;
	private String item_num;
	private String item_name;
	
	//재고상태 (디비저장안함)
	private String unstore_status;
	
	
	public String getUnstore_status() {
		return unstore_status;
	}
	public void setUnstore_status(String unstore_status) {
		this.unstore_status = unstore_status;
	}
	public String getItem_name() {
		return item_name;
	}
	public void setItem_name(String item_name) {
		this.item_name = item_name;
	}
	public String getItem_num() {
		return item_num;
	}
	public void setItem_num(String item_num) {
		this.item_num = item_num;
	}
	
	public int getEmp_num() {
		return emp_num;
	}
	public void setEmp_num(int emp_num) {
		this.emp_num = emp_num;
	}
	public String getUnsto_num() {
		return unsto_num;
	}
	public void setUnsto_num(String unsto_num) {
		this.unsto_num = unsto_num;
	}

	public String getWo_num() {
		return wo_num;
	}
	public void setWo_num(String wo_num) {
		this.wo_num = wo_num;
	}

	public Timestamp getUnsto_date() {
		return unsto_date;
	}
	public void setUnsto_date(Timestamp unsto_date) {
		this.unsto_date = unsto_date;
	}
	public String getUnsto_progress() {
		return unsto_progress;
	}
	public void setUnsto_progress(String unsto_progress) {
		this.unsto_progress = unsto_progress;
	}
	public int getUnsto_qty() {
		return unsto_qty;
	}
	public void setUnsto_qty(int unsto_qty) {
		this.unsto_qty = unsto_qty;
	}

	
}
