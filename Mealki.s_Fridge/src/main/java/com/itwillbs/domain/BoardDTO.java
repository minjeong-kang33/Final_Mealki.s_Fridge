package com.itwillbs.domain;

import java.sql.Timestamp;

public class BoardDTO {
	private int bo_num;
	private String bo_title;
	private String bo_name;
	private String bo_content;
	private int bo_count;
	private Timestamp bo_date;
	
	public int getBo_num() {
		return bo_num;
	}
	public void setBo_num(int bo_num) {
		this.bo_num = bo_num;
	}
	public String getBo_title() {
		return bo_title;
	}
	public void setBo_title(String bo_title) {
		this.bo_title = bo_title;
	}
	public String getBo_name() {
		return bo_name;
	}
	public void setBo_name(String bo_name) {
		this.bo_name = bo_name;
	}
	public String getBo_content() {
		return bo_content;
	}
	public void setBo_content(String bo_content) {
		this.bo_content = bo_content;
	}
	public int getBo_count() {
		return bo_count;
	}
	public void setBo_count(int bo_count) {
		this.bo_count = bo_count;
	}
	public Timestamp getBo_date() {
		return bo_date;
	}
	public void setBo_date(Timestamp bo_date) {
		this.bo_date = bo_date;
	}
	
}
