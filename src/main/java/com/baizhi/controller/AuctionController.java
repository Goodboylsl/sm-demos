package com.baizhi.controller;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.baizhi.service.RecordService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.baizhi.entity.Auction;
import com.baizhi.service.AuctionService;

@Controller
@RequestMapping("/auction")
public class AuctionController {
	
	@Autowired
	private AuctionService auctionService;
	@Autowired
	private RecordService recordService;
	
	@RequestMapping("/SelectAll")
	public String selectAll(Auction auction,Map map){
		List<Auction> list = auctionService.selectAll(auction);
		map.put("list", list);
		return "ShowAll";
	}
	
	@RequestMapping("/DeleteUser")
	public String deleteUser(HttpSession session){
		session.removeAttribute("u");
		return "forward:/auction/SelectAll.do";
	}
	
	@RequestMapping("/UpdateState")
	public String updateState(Auction auction,HttpSession session){
		Auction a = auctionService.selectOne(auction.getAuction_id());
		
		System.out.println("*******************"+a);
		session.setAttribute("auction", a);
		return "Update";
	}
	
	@RequestMapping("/UpdateEnd")
	public String updateEnd(Auction auction,MultipartFile photo,HttpServletRequest request) throws IllegalStateException, IOException{
		if(!"".equals(photo.getOriginalFilename())){
		    //��ȡ���ϴ��������ļ���
		    String fileName=photo.getOriginalFilename();
		    //���ļ�����������
		    fileName=new Date().getTime()+"_"+fileName;
		    //����upload�ļ������֣����Ի�ȡ�����ľ���·��
	        String realPath = request.getRealPath("/images/");
	        //ת��ͼƬ����д���
	        photo.transferTo(new File(realPath+"\\"+fileName));
	    
		    auction.setAuction_pic(fileName);
		}else{
			Auction a = auctionService.selectOne(auction.getAuction_id());
			auction.setAuction_pic(a.getAuction_pic());
		}
		auctionService.update(auction);
		return "redirect:/auction/SelectAll.do";
	}
	
	@RequestMapping("/DeleteAuction")
	public String deleteAuction(Auction auction){
		recordService.delete(auction.getAuction_id());
		
		deleteRecord(auction);
		return  "redirect:/auction/SelectAll.do";
	}
	
	//ɾ����Ʒ
	public void deleteRecord(Auction auction){
		auctionService.delete(auction.getAuction_id());
	}
	
	@RequestMapping("/Add")
	public String add(Auction auction,MultipartFile photo,HttpServletRequest request) throws IllegalStateException, IOException{
		//��ȡ���ϴ��������ļ���
		String fileName=photo.getOriginalFilename();
		//���ļ�����������
		fileName=new Date().getTime()+"_"+fileName;
		//����upload�ļ������֣����Ի�ȡ�����ľ���·��
		String realPath = request.getRealPath("/images/");
		//ת��ͼƬ����д���
	    photo.transferTo(new File(realPath+"\\"+fileName));
	    //�洢ͼƬ
	    auction.setAuction_pic(fileName);
	    
	    //System.out.println("+++++++++++++++++++++++++++++++"+photo.getOriginalFilename());
	    //System.out.println("+++++++++++++++++++++++++++++++"+fileName);
		auctionService.insert(auction);
		
		return "redirect:/auction/SelectAll.do";
	}
	
}
