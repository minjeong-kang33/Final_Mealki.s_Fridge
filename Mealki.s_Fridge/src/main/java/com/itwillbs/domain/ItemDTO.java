package com.itwillbs.domain;

public class ItemDTO {
	private String item_num;
	private String item_type;
	private String item_name;
	private int weight;
	private String supplier;
	private int supply_price;
	private int sales_price;
	private String item_image;

	public String getItem_num() {
		return item_num;
	}
	public void setItem_num(String item_num) {
		this.item_num = item_num;
	}
	public String getItem_type() {
		return item_type;
	}
	public void setItem_type(String item_type) {
		this.item_type = item_type;
	}
	public String getItem_name() {
		return item_name;
	}
	public void setItem_name(String item_name) {
		this.item_name = item_name;
	}
	public int getWeight() {
		return weight;
	}
	public void setWeight(int weight) {
		this.weight = weight;
	}
	public String getsupplier() {
		return supplier;
	}
	public void setsupplier(String supplier) {
		this.supplier = supplier;
	}
	public int getSupply_price() {
		return supply_price;
	}
	public void setSupply_price(int supply_price) {
		this.supply_price = supply_price;
	}
	public int getSales_price() {
		return sales_price;
	}
	public void setSales_price(int sales_price) {
		this.sales_price = sales_price;
	}
	public String getItem_image() {
		return item_image;
	}
	public void setItem_image(String item_image) {
		this.item_image = item_image;
	}
	
	
}
