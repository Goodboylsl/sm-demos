package com.baizhi.controller;

import java.io.UnsupportedEncodingException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.baizhi.entity.Auction;
import com.baizhi.entity.Record;
import com.baizhi.entity.RecordDTO;
import com.baizhi.entity.User;
import com.baizhi.service.AuctionService;
import com.baizhi.service.RecordService;


@Controller
@Scope("prototype")
@RequestMapping("/record")
public class RecordController {
	
	@Autowired
	private RecordService recordService;
	@Autowired
	private AuctionService auctionService;
	
	@RequestMapping("/ShowAllRecord")
	public String ShowAllRecord(Integer auction_id,Map map,HttpSession session) throws UnsupportedEncodingException{
		
		User user = (User)session.getAttribute("u");
		Auction auction = auctionService.selectOne(auction_id);
		map.put("auction", auction);
		
		List<RecordDTO> list = recordService.selectAll(auction_id);
		
		//System.out.println("+_+_+_+_+__+"+user);
		//System.out.println("_____________+_+_+_+_+_+_+_+_+_+_+_+"+list);
		//System.out.println("_+_+_+_+_+__+_+_+_+:"+auction_id);
		map.put("list", list);
		return "ShowAllRecord";
	}
	
	
	@RequestMapping("/AddRecord")
	public String AddRecord(Record record,HttpSession session,Map map){
		User user = (User) session.getAttribute("u");
		record.setUser_id(user.getUser_id());
		
		recordService.insert(record);
		
		Auction auction = auctionService.selectOne(record.getAuction_id());
		List<RecordDTO> list = recordService.selectAll(user.getUser_id());
		
		map.put("auction", auction);
		map.put("list", list);
		
		//System.out.println("+++++_+_+++++++++_+:"+record);
		return "redirect:/record/ShowAllRecord.do?auction_id="+record.getAuction_id();
	}
    
}
