package com.baizhi.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.baizhi.entity.User;
import com.baizhi.service.UserService;

@Controller
@Scope("prototype")
@RequestMapping("/user")
public class UserController {
	
	@Autowired
	private UserService userService;
	
	@RequestMapping("/Login")
	public String Login(User user , HttpSession session,String passwords){
		User u = userService.Login(user.getUser_name(), user.getUser_password());
		String text = (String)session.getAttribute("kaptcha");
		if(u != null && ((String)session.getAttribute("kaptcha")).equalsIgnoreCase(passwords)){
			session.setAttribute("u", u);
			return "forward:/auction/SelectAll.do";
		}
		return "Login";
	}
	
	@RequestMapping("/Register")
	public String Register(User user){
		userService.Register(user);
		return "Login";
	}
}
