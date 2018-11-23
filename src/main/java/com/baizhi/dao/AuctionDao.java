package com.baizhi.dao;

import java.util.List;

import com.baizhi.entity.Auction;

public interface AuctionDao {
	public List<Auction> selectAll(Auction auction);
	
	public Auction selectOne(int auction_id);
	
	public void update(Auction auction);
	
	public void delete(int aucton_id);
	
	public void insert(Auction auction);
}
