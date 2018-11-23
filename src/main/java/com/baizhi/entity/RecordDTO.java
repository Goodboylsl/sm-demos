package com.baizhi.entity;

public class RecordDTO {
	
	private String name;
	private String price;
	private String buytime;
	public RecordDTO(String name, String price, String buytime) {
		super();
		this.name = name;
		this.price = price;
		this.buytime = buytime;
	}
	public RecordDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getBuytime() {
		return buytime;
	}
	public void setBuytime(String buytime) {
		this.buytime = buytime;
	}
	@Override
	public String toString() {
		return "RecordDTO [name=" + name + ", price=" + price + ", buytime="
				+ buytime + "]";
	}
	
}
