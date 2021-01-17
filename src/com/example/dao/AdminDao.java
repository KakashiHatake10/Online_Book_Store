package com.example.dao;

import java.util.List;

import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.example.bean.Feedback;
//import com.example.bean.Feedback;
import com.example.bean.Login_Bean;

public interface AdminDao {

	public int AddBooks(String title, String author, int qty, int price, String descr, String file, String category);

	public int UpdateBooks(int book_id, int quanty);

	public List<Login_Bean> Login_detials();

	public int MakeAdmin(String name, int type);

	public List<Feedback> get_Feedback();

	public int reply_feedback(String email, String reply);

}
