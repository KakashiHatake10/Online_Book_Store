package com.example.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.example.bean.Books_details;
import com.example.bean.Login_Bean;
import com.example.dao.Admin_and_CustomerDaoImpl;

@org.springframework.stereotype.Controller
public class Login {
	@Autowired
	Admin_and_CustomerDaoImpl dao;
	ModelAndView mv = new ModelAndView();

// direct to the login page 
	@GetMapping(value = "/login")
	public String log() {
		return "login";
	}

// get the user name and pass then login and sebd to index page show the user name in index page 
	@PostMapping(value = "/sayhello")
	public ModelAndView edit(@RequestParam("user") String user, @RequestParam("pass") String pass) {

		System.out.println("dfdf1");
		Login_Bean emp = dao.login(user, pass);
		System.out.println("dfdf2");
		if (emp != null) {
			mv.addObject("name", emp.getUser());
			System.out.println("hi users " + emp.getUser());
			List<Books_details> img = dao.getPhoto();
			mv.addObject("login_id", emp.getLogin_id());
			mv.addObject("photo", img);
			if (emp.getType() == 0) {
				System.out.println("hi user " + emp.getUser());
				mv.setViewName("index");
			} else {
				System.out.println("hi user " + emp.getUser());
				mv.setViewName("Admin_panel");
			}
		} else {
			mv.addObject("error_msg", "no");
			mv.setViewName("login");
		}
		return mv;
	}

//  logout the user 
	@GetMapping(value = "/logout")
	public ModelAndView logout() {
		mv.addObject("name", null);
		mv.addObject("login_id", 0);
		mv.setViewName("index");
		return mv;
	}

// send the forget page 
	@GetMapping(value = "/forget_password")
	public String forget_pwd() {
		return "forget_password";
	}

	@GetMapping(value = "/change_password")
	public ModelAndView change_pass_page(@RequestParam("id") String l_id) {
		int log = Integer.valueOf(l_id);
		if (log == 0) {
			mv.setViewName("login");
		} else {
			mv.addObject("done", 0);
			mv.setViewName("Change_password");
		}
		return mv;
	}

	@PostMapping(value = "/change_password")
	public ModelAndView change_pass(@RequestParam("curt_pass") String old_pass, @RequestParam("new_pass") String pass,
			@RequestParam("login_id") String login_id) {
		int l_id = Integer.parseInt(login_id);
		if (l_id == 0) {
			mv.setViewName("login");
		} else {
			int new_pass = Integer.valueOf(pass);
			int i = dao.change_pass(old_pass, new_pass, l_id);
			mv.addObject("done", i);
			mv.setViewName("Change_password");
		}
		return mv;
	}

}