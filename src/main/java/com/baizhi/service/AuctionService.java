package com.baizhi.service;

import java.util.List;

import com.baizhi.entity.Auction;

public interface AuctionService {
	
	public List<Auction> selectAll(Auction auction);
	
	public Auction selectOne(int auction_id);
	
	public void update(Auction auction);
	
	public void delete(int auction_id);
	
	public void insert(Auction auction);
}
