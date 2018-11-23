package com.baizhi.entity;

import java.util.List;

/*
 * ������Ʒ�ľ��ļ�¼
*/
public class Record {
	
	private int id;         //���ļ�¼���
	private int user_id;//�����߱��
	private int auction_id;//����Ʒ���
	private String auction_time; //����ʱ��
	private Double auction_price;//���ļ۸�
	public Record(int id, int user_id, int auction_id, String auction_time,
			Double auction_price) {
		super();
		this.id = id;
		this.user_id = user_id;
		this.auction_id = auction_id;
		this.auction_time = auction_time;
		this.auction_price = auction_price;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public int getAuction_id() {
		return auction_id;
	}
	public void setAuction_id(int auction_id) {
		this.auction_id = auction_id;
	}
	public String getAuction_time() {
		return auction_time;
	}
	public void setAuction_time(String auction_time) {
		this.auction_time = auction_time;
	}
	public Double getAuction_price() {
		return auction_price;
	}
	public void setAuction_price(Double auction_price) {
		this.auction_price = auction_price;
	}
	public Record() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "Record [id=" + id + ", user_id=" + user_id + ", auction_id="
				+ auction_id + ", auction_time=" + auction_time
				+ ", auction_price=" + auction_price + "]";
	}
	public Record(int user_id, int auction_id, String auction_time,
			Double auction_price) {
		super();
		this.user_id = user_id;
		this.auction_id = auction_id;
		this.auction_time = auction_time;
		this.auction_price = auction_price;
	}
	
}
