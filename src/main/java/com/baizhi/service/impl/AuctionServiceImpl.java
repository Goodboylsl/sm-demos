package com.baizhi.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.baizhi.dao.AuctionDao;
import com.baizhi.entity.Auction;
import com.baizhi.service.AuctionService;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class AuctionServiceImpl implements AuctionService {
	
	@Autowired
	private AuctionDao auctionDao;

	@Override
	public List<Auction> selectAll(Auction auction) {
		// TODO Auto-generated method stub
		List<Auction> list = auctionDao.selectAll(auction);
		return list;
	}

	@Override
	public Auction selectOne(int auction_id) {
		// TODO Auto-generated method stub
		Auction a = auctionDao.selectOne(auction_id);
		return a;
	}

	@Override
	public void update(Auction auction) {
		// TODO Auto-generated method stub
		auctionDao.update(auction);
		
	}

	@Override
	public void delete(int auction_id) {
		// TODO Auto-generated method stub
		auctionDao.delete(auction_id);
	}

	@Override
	public void insert(Auction auction) {
		// TODO Auto-generated method stub
		auctionDao.insert(auction);
	}

}
