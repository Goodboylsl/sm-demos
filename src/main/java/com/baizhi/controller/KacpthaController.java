package com.baizhi.controller;

import java.awt.image.BufferedImage;
import java.io.IOException;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.code.kaptcha.Producer;

@Scope("prototype")
@Controller
public class KacpthaController {
	
	@Autowired
	private Producer producer;
	
	@RequestMapping("/getKaptcha")
	public  void getKaptcha(HttpSession session,HttpServletResponse response) throws IOException{
		
		//1.�����ı�����
		String text = producer.createText();
		
		//���ı����ݷ���session��
		session.setAttribute("kaptcha", text);
		
		//2.�����ɵ��ı����ݷ���һ��ͼƬ��===������һ��ͼƬ
		BufferedImage image = producer.createImage(text);
		
		//ͨ��ͼƬ�����࣬��ͼƬд�뵽��Ӧ�������
		ImageIO.write(image, "jpg", response.getOutputStream());
		
	}

}
