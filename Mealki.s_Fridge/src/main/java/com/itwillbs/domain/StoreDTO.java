package com.itwillbs.domain;

import java.sql.Date;

public class StoreDTO {
	private String sto_num;
	private String order_num;
	private Date sto_date;
	private int sto_progress;
	private int sto_qty;
	private String sto_shelf;
	private int sto_shelfDetail;
	private int sto_empNum;
	
	
	public int getSto_shelfDetail() {
		return sto_shelfDetail;
	}
	public void setSto_shelfDetail(int sto_shelfDetail) {
		this.sto_shelfDetail = sto_shelfDetail;
	}
	public int getSto_empNum() {
		return sto_empNum;
	}
	public void setSto_empNum(int sto_empNum) {
		this.sto_empNum = sto_empNum;
	}
	public String getSto_num() {
		return sto_num;
	}
	public void setSto_num(String sto_num) {
		this.sto_num = sto_num;
	}
	public String getOrder_num() {
		return order_num;
	}
	public void setOrder_num(String order_num) {
		this.order_num = order_num;
	}
	public Date getSto_date() {
		return sto_date;
	}
	public void setSto_date(Date sto_date) {
		this.sto_date = sto_date;
	}
	public int getSto_progress() {
		return sto_progress;
	}
	public void setSto_progress(int sto_progress) {
		this.sto_progress = sto_progress;
	}
	public int getSto_qty() {
		return sto_qty;
	}
	public void setSto_qty(int sto_qty) {
		this.sto_qty = sto_qty;
	}
	public String getSto_shelf() {
		return sto_shelf;
	}
	public void setSto_shelf(String sto_shelf) {
		this.sto_shelf = sto_shelf;
	}

}
