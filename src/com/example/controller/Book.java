package com.example.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.example.bean.Books_details;
import com.example.bean.Order_info;
import com.example.dao.Admin_and_CustomerDaoImpl;

@Controller
public class Book {
	@Autowired
	Admin_and_CustomerDaoImpl dao;
	ModelAndView mv = new ModelAndView();

	// it will send to the book.jsp page with the book data
	@RequestMapping(value = "/books", method = RequestMethod.GET)
	public ModelAndView photo2(@RequestParam("id") String id) {
		System.out.println("we" + id);
		int d = Integer.parseInt(id);
		List<Books_details> img = dao.getPhotoById(d);
		System.out.println(img);
		mv.addObject("photo", img);
		mv.setViewName("Books");
		return mv;
	}

// it will show the particular book data so you can buy or add to cart it
	@RequestMapping(value = "/details", method = RequestMethod.GET)
	public ModelAndView book_details(@RequestParam("id") int id) {
		System.out.println("we" + id);
		List<Books_details> img = dao.getBookId(id);
		System.out.println(img);
		mv.addObject("photo", img);
		mv.addObject("msg", 0);
		mv.setViewName("Book_details");
		return mv;
	}

// it will add the book in cart or your buy list
	@RequestMapping(value = "/order", method = RequestMethod.GET)
	public ModelAndView order(@RequestParam("id") String id, @RequestParam("qty") String qty,
			@RequestParam("login_id") String login_id, @RequestParam("buy") String buy,
			@RequestParam("price") String price, @RequestParam("title") String title) {
		System.out.println("inside order 1" + id);

		System.out.println("buy === " + buy);
		if (buy.equalsIgnoreCase("Buy Now")) {
			mv.addObject("title", title);
			mv.addObject("price", price);
			mv.addObject("one_product", "one");
			mv.setViewName("Payment");
		} else if (login_id.equals("0")) {
			mv.setViewName("login");
			return mv;
		} else {
			int l_id = Integer.parseInt(login_id);
			int b_id = Integer.parseInt(id);
			int quant = Integer.parseInt(qty);
			int pri = Integer.parseInt(price);
			System.out.println("get order");
			System.out.println("inside template order");

			int i = dao.Temp_Cart(b_id, quant, l_id, pri);
			System.out.println(i);
			mv.addObject("msg", i);
			mv.setViewName("Book_details");
		}
		return mv;
	}

// direct to the cart if you login if not it will send to login page
	@RequestMapping(value = "/cart", method = RequestMethod.GET)
	public ModelAndView cart(@RequestParam("id") String l_id) {
		System.out.println("hi order" + l_id);
		int log = Integer.valueOf(l_id);
		if (log == 0) {
			mv.setViewName("login");
		} else {
			List<Order_info> info = dao.cart(log);

			mv.addObject("order", info);
			mv.setViewName("cart");
		}
		return mv;
	}

// send to payment gateway
	@GetMapping(value = "/Checkout")
	public ModelAndView Checkout(@RequestParam("login_id") String log) {
		System.out.println("check_method");
		int login = Integer.valueOf(log);
		List<Order_info> info = dao.cart(login);
		mv.addObject("title", "no_one");
		mv.addObject("price", "no_one");
		mv.addObject("one_product", "mul");
		mv.addObject("order", info);
		mv.addObject("payment", 0);
		mv.setViewName("Payment");
		return mv;
	}

// all info to card no,amount add to the database 
	@GetMapping(value = "/payment")
	public ModelAndView Checkout(@RequestParam("total_price") String price, @RequestParam("login_id") String login_id,
			@RequestParam("cardnumber") String Card_no) {
		System.out.println(Card_no + " " + price);
		int amount = Integer.valueOf(price);
		int Customer_id = Integer.valueOf(login_id);
		int card_no = Integer.valueOf(Card_no);
		int i = dao.payment(Customer_id, amount, card_no);
		mv.addObject("payment", i);
		mv.setViewName("Payment");
		return mv;

	}

// send to the myorder page so you can see the your all order and track them
	@GetMapping(value = "/myorder")
	public ModelAndView myOrder(@RequestParam("id") String l_id) {
		System.out.println("hi myorder" + l_id);
		int log = Integer.valueOf(l_id);
		if (log == 0) {
			mv.setViewName("login");
		} else {
			List<com.example.bean.Order> info = dao.myOrder(log);
			List<Object> date_info = new ArrayList<Object>();
			for (com.example.bean.Order b : info) {
				System.out.println("date12 " + b.Pay_date);
				date_info.add(b.Pay_date);
			}
			mv.addObject("date", date_info);
			mv.addObject("order", info);
			mv.setViewName("My_Order");
		}
		return mv;
	}

}
