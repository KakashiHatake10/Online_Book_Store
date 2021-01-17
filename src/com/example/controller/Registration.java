package com.example.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.example.dao.Admin_and_CustomerDaoImpl;

@Controller
public class Registration {
	@Autowired
	Admin_and_CustomerDaoImpl dao;
	ModelAndView mv = new ModelAndView();

// direct to the register.jsp
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public String register() {
		return "Register";
	}

// get the data from register page and send the database 
	@RequestMapping(value = "/submit", method = RequestMethod.POST)
	public ModelAndView submit_register(@RequestParam("name") String name, @RequestParam("pass") String pass,
			@RequestParam("phone") String phone, @RequestParam("address") String address,
			@RequestParam("email") String email) {
		int phn = Integer.parseInt(phone);
		int pas = Integer.parseInt(pass);
		int i = dao.register(name, email, address, phn, pas);
		System.out.println(i);
		if (i != 0) {
			mv.addObject("name", name);
			mv.setViewName("index");
		} else {
			mv.addObject("msg", "no");
			mv.setViewName("Register");
		}
		return mv;
	}
}
