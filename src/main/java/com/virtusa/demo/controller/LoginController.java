package com.virtusa.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.virtusa.demo.model.users;
import com.virtusa.demo.service.UserService;

@Controller
public class LoginController {
	
		@Autowired
		private UserService userService;
		
		@RequestMapping("/")
		public String indexpage()
		{
			return "index";
		}
		
		@RequestMapping("/login")
		public String loginPage()
		{
			return "login";
		}
		
		@RequestMapping("/logout")
		public String logoutPage()
		{
			return "login";
		}
		
		@RequestMapping("/Admin")
		public String AdminPage()
		{
			return "Admin";
		}
		
		
		@RequestMapping("/validateUser")
		public String validateUser(@RequestParam("id") long id,@RequestParam("password") String password,Model model)
		{
			users u=null;
			u=userService.getUserbyId(id);
			if(u!=null && u.getPassword().equals(password))
			{
				model.addAttribute("id",id);
				return "BookingPage";
			}
			model.addAttribute("error", "User not found,kindly Register");
			return "login";
		}
		
		@RequestMapping("/signup")
		public String SignUppage()
		{
			return "signup";
		}
		
		@RequestMapping("/adduser")
		public String SignUpCheck(@RequestParam("userName") String userName,@RequestParam("password1") String password1,@RequestParam("password2") String password2,@RequestParam("mobile") long mobile,Model model)
		{
				model.addAttribute("UserName",userName);
				users u=new users();
				//u.setId(100);
				u.setUname(userName);
				u.setPassword(password1);
				u.setMobile(mobile);
				userService.save(u);
				model.addAttribute("id", u.getId());
				return "BookingPage";
		}
		
		@RequestMapping("/UserPayment")
		public String UserPaymentPage()
		{
			return "UserPayment";
		}
		
}
