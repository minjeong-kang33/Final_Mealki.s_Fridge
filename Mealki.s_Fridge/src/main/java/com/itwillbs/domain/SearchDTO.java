package com.itwillbs.domain;

public class SearchDTO {
	private String search_option;
	private String keyword;
	private String search_check; //퇴사자포함 체크박스 (직원관리화면)
	
	public String getSearch_option() {
		return search_option;
	}
	public void setSearch_option(String search_option) {
		this.search_option = search_option;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public String getSearch_check() {
		return search_check;
	}
	public void setSearch_check(String search_check) {
		this.search_check = search_check;
	}
	
	
}
