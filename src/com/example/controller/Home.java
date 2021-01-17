package com.example.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import com.example.bean.Books_details;
import com.example.dao.Admin_and_CustomerDaoImpl;

@Controller
public class Home {
	@Autowired
	Admin_and_CustomerDaoImpl dao;
	ModelAndView mv = new ModelAndView();

	/* it will direct the index page the request and show the data */
	@RequestMapping("/")
	public ModelAndView homepage() {
		System.out.println("home page");
		List<Books_details> img = dao.getPhoto();
		mv.addObject("photo", img);
		mv.addObject("name", null);
		mv.addObject("login_id", 0);
		mv.setViewName("index");
		return mv;
	}

	@RequestMapping("/home")
	public ModelAndView backHomepage() {
		// System.out.println("home page");
		List<Books_details> img = dao.getPhoto();
		mv.addObject("photo", img);
		// System.out.println("hi user " + emp.getUser());
		mv.setViewName("index");
		return mv;
	}
}
