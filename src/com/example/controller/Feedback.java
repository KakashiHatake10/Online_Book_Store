package com.example.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.example.dao.Admin_and_CustomerDaoImpl;

@Controller
public class Feedback {

	@Autowired
	Admin_and_CustomerDaoImpl dao;
	ModelAndView mv = new ModelAndView();

	// go feedback page using get method
	@GetMapping(value = "/feedback")
	public ModelAndView feedbackpage() {
		System.out.println("inside the feedback page method");
		mv.addObject("done", 0);
		mv.setViewName("feedback");
		return mv;
	}

	// get feedback page data by post method
	@PostMapping(value = "/feedback")
	public ModelAndView Feedback_data(@RequestParam("fname") String fname, @RequestParam("lname") String lname,
			@RequestParam("message") String msg, @RequestParam("email") String email,
			@RequestParam("type") String f_type) {
		// send data to feedback method of CustomerDao interface implement by
		// Admin_and_CustomerDaoImpl.java
		System.out.println("inside the feedback data method");
		int i = dao.feedback_Submit(fname, lname, email, msg, f_type);
		// if data insert successful return 1 other wise 0
		mv.addObject("done", i);
		mv.setViewName("feedback");
		return mv;

	}

	// get feedback page data by post method
	@GetMapping(value = "/All_feedback")
	public ModelAndView all_Feedback_data() {
		System.out.println("inside the All_feedback data method");
		List<com.example.bean.Feedback> fb = dao.get_Feedback();
		mv.addObject("feedback", fb);
		mv.addObject("submit", 0);
		mv.setViewName("All_feedback");
		return mv;
	}

	// admin reply customer feedback and that save in the database using dao class
	// implement the admindao class
	@GetMapping(value = "feedback_reply")
	@ResponseBody
	public ModelAndView reply_feedback(@RequestParam("email") String email, @RequestParam("reply") String reply) {
		System.out.println("inside the reply_feedback method " + reply + "  " + email);
		int i = dao.reply_feedback(email, reply);
		mv.addObject("submit", i);
		mv.setViewName("All_feedback");
		return mv;
	}
}
