package com.itwillbs.domain;

import java.sql.Timestamp;

public class RecipeDTO {
	private String r_num;
	private String r_code;
	private String item_num;
	private String r_name;
	private String item_name;
	private int r_qty;
	private Timestamp r_date;
	private String r_etc;
	public String getR_num() {
		return r_num;
	}
	public void setR_num(String r_num) {
		this.r_num = r_num;
	}
	public String getR_code() {
		return r_code;
	}
	public void setR_code(String r_code) {
		this.r_code = r_code;
	}
	public String getItem_num() {
		return item_num;
	}
	public void setItem_num(String item_num) {
		this.item_num = item_num;
	}
	public String getR_name() {
		return r_name;
	}
	public void setR_name(String r_name) {
		this.r_name = r_name;
	}
	public String getItem_name() {
		return item_name;
	}
	public void setItem_name(String item_name) {
		this.item_name = item_name;
	}
	public int getR_qty() {
		return r_qty;
	}
	public void setR_qty(int r_qty) {
		this.r_qty = r_qty;
	}
	public Timestamp getR_date() {
		return r_date;
	}
	public void setR_date(Timestamp r_date) {
		this.r_date = r_date;
	}
	public String getR_etc() {
		return r_etc;
	}
	public void setR_etc(String r_etc) {
		this.r_etc = r_etc;
	}
	
	
	
}
