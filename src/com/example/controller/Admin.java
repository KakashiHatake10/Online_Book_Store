package com.example.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;
import com.example.bean.Login_Bean;
import com.example.bean.Order;
import com.example.dao.Admin_and_CustomerDaoImpl;

@Controller
public class Admin {
	@Autowired
	Admin_and_CustomerDaoImpl dao;

// send to the  Add_book.jsp
	@GetMapping("/add")
	public ModelAndView homepage(ModelAndView mv) {
		System.out.println("add books");
		mv.setViewName("Add_book");
		return mv;
	}

// add book data in database 
	@GetMapping(value = "savefile")
	public ModelAndView saveimage(@RequestParam("title") String title, @RequestParam("catogory") String category,
			@RequestParam("file") CommonsMultipartFile img, @RequestParam("author") String author,
			@RequestParam("qty") String qty, @RequestParam("title") String price, @RequestParam("decsr") String descr)
			throws Exception {
		System.out.println("hello");
		String send = "E:/Spring/MVC/test/WebContent/resources/img/";
		int quant = Integer.parseInt(qty);
		int rs = Integer.parseInt(price);

		CommonsMultipartFile f = img;
		String filename = f.getOriginalFilename();

		String set = "/resources/img/".concat(filename);

		System.out.println(set + "  " + title);

		System.out.println(send + " " + filename);
		int add = dao.AddBooks(title, author, quant, rs, descr, set, category);
		System.out.println(add);
		byte[] bytes = f.getBytes();
		BufferedOutputStream stream = new BufferedOutputStream(
				new FileOutputStream(new File(send + File.separator + filename)));
		stream.write(bytes);
		stream.flush();
		stream.close();

		return new ModelAndView("uploadform", "filesuccess", "File successfully saved!");
	}

// send to Update_book.jsp page
	@GetMapping(value = "/update")
	public ModelAndView Update_book1() {
		return new ModelAndView("Update_Book");
	}

// update the book in database
	@PostMapping(value = "/update")
	public ModelAndView Update_book2(@RequestParam("b_id") String b_id, @RequestParam("qty") String qty) {
		int book_id = Integer.parseInt(b_id);
		int quant = Integer.parseInt(qty);
		System.out.println(book_id);
		System.out.println(quant);
		int x = dao.UpdateBooks(book_id, quant);
		System.out.println("x" + x);
		return new ModelAndView("Update_Book");

	}

// send to the make_admin.jsp page 
	@GetMapping(value = "/more_admin")
	public ModelAndView make_admin() {
		List<Login_Bean> users = dao.Login_detials();
		return new ModelAndView("make_admin", "users", users);
	}

// make the admin or customer 
	@PostMapping("/more_admin")
	public ModelAndView make_admin1(@RequestParam("name") String name, @RequestParam("type") String type) {
		int t = Integer.parseInt(type);
		int x = dao.MakeAdmin(name, t);
		System.out.println("update ,make admin" + x);
		List<Login_Bean> users = dao.Login_detials();
		return new ModelAndView("make_admin", "users", users);
	}

// send to all_order.jsp page with database data
	@GetMapping(value = "/all_order")
	public ModelAndView All_order() {
		ModelAndView mv = new ModelAndView();
		List<Order> info = dao.All_Order();
		for (Order b : info) {
			System.out.println("date12 " + b.Status);
		}

		mv.addObject("order", info);
		mv.setViewName("All_Order");
		return mv;
	}

	// direct to the change status page
	@GetMapping(value = "/change_Status")
	public ModelAndView change_Status_page() {
		ModelAndView mv = new ModelAndView();
		mv.addObject("update", 0);
		mv.setViewName("Change_Status");
		return mv;
	}

// change the status of shipped book
	@PostMapping(value = "/change_Status")
	public ModelAndView change_Status(@RequestParam("trans_id") String transaction_id) {
		ModelAndView mv = new ModelAndView();
		int transaction = Integer.valueOf(transaction_id);
		int i = dao.UpdateOrder(transaction);
		System.out.println(i);
		mv.addObject("update", i);
		mv.setViewName("Change_Status");
		return mv;
	}

}