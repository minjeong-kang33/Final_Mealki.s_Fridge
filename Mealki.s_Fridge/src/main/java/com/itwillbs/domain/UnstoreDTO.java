package com.itwillbs.domain;

import java.sql.Timestamp;

public class UnstoreDTO {
	private String unsto_num;
	private String sto_num2;
	private String wo_num;
	private String business_num;
	private Timestamp unsto_date;
	private String unsto_progress;
	private String unsto_qty;
	public String getUnsto_num() {
		return unsto_num;
	}
	public void setUnsto_num(String unsto_num) {
		this.unsto_num = unsto_num;
	}
	public String getSto_num2() {
		return sto_num2;
	}
	public void setSto_num2(String sto_num2) {
		this.sto_num2 = sto_num2;
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
	public String getUnsto_qty() {
		return unsto_qty;
	}
	public void setUnsto_qty(String unsto_qty) {
		this.unsto_qty = unsto_qty;
	}
	
}
