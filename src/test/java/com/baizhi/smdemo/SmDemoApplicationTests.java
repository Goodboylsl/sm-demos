package com.baizhi.smdemo;

import com.baizhi.dao.AuctionDao;
import com.baizhi.entity.Auction;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.List;

@RunWith(SpringRunner.class)
@SpringBootTest
public class SmDemoApplicationTests {
	@Autowired
	private AuctionDao auctionDao;
	@Test
	public void contextLoads() {
		List<Auction> auctions = auctionDao.selectAll(null);
		for (Auction a:auctions){
			System.out.println(a);
		}
	}

}
