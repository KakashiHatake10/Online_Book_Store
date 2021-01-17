package com.example.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import com.example.dao.Admin_and_CustomerDaoImpl;

@Controller
public class Order {
	@Autowired
	Admin_and_CustomerDaoImpl dao;
	ModelAndView mv = new ModelAndView();

// send to cancel page 
	@GetMapping(value = "/cancel")
	public ModelAndView cancel_Order_Page() {
		mv.addObject("delete", 0);
		mv.setViewName("Cancel_Order");
		return mv;
	}

// take the transaction id and cancel it
	@PostMapping(value = "/transaction_cancel")
	public ModelAndView cancel_Order_details(@RequestParam("trans_id") String transaction_id) {
		int transaction = Integer.valueOf(transaction_id);
		int i = dao.cancelOrder(transaction);
		mv.addObject("delete", i);
		mv.setViewName("Cancel_Order");
		return mv;
	}

	// send to return.jsp page
	@GetMapping(value = "/return")
	public ModelAndView return_Order_Page() {
		mv.addObject("return", 0);
		mv.setViewName("Return");
		return mv;
	}

	// get transaction id and return it
	@PostMapping(value = "/Order_return")
	public ModelAndView return_Order_details(@RequestParam("trans_id") String transaction_id) {
		int transaction = Integer.valueOf(transaction_id);
		int i = dao.returnOrder(transaction);
		mv.addObject("return", i);
		mv.setViewName("Return");
		return mv;
	}
}
