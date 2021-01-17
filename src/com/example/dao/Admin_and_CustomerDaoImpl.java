package com.example.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.Format;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import com.example.bean.Books_details;
import com.example.bean.Feedback;
//import com.example.bean.Feedback;
import com.example.bean.Login_Bean;
import com.example.bean.Order;
import com.example.bean.Order_info;

public class Admin_and_CustomerDaoImpl implements CustomerDao, AdminDao {
	JdbcTemplate template;

// getting the connection
	public void setTemplate(JdbcTemplate template) {
		this.template = template;
	}

// get info to login
	@Override
	public Login_Bean login(String user, String pass) {
		try {
			String sql = "Select * From login_table where user=? and pass=?";
			return template.queryForObject(sql, new Object[] { user, pass }, new RowMapper<Login_Bean>() {
				public Login_Bean mapRow(ResultSet result, int rowNum) throws SQLException {
					Login_Bean e = new Login_Bean();
					e.setUser(result.getString("user"));
					e.setPass(result.getInt("pass"));
					e.setLogin_id(result.getInt("login_id"));
					e.setType(result.getInt("type"));
					return e;
				}
			});
		} catch (EmptyResultDataAccessException e) {
			return null;
		}
	}

// get info of register 
	@Override
	public int register(String name, String email, String address, int phn, int pass) {
		String mail = null;
		int i = 0;
		try {
			mail = this.template.queryForObject("Select email from user_table where email=?", new Object[] { email },
					String.class);
			if (mail.equalsIgnoreCase(email)) {
				return 0;
			}

		} catch (Exception e) {

			String sql1 = "insert into login_table(user,pass) values('" + email + "'," + pass + ")";
			template.update(sql1);
			String sql = "insert into user_table(email,name,address,phone,password) values('" + email + "','" + name
					+ "','" + address + "'," + phn + "," + pass + ")";
			i = template.update(sql);
		}
		return i;

	}

	@Override
	public List<Books_details> getPhoto() {
		List<Books_details> list = template.query("SELECT * FROM books", new RowMapper<Books_details>() {
			@Override
			public Books_details mapRow(ResultSet rs, int rowNum) throws SQLException {
				Books_details b = new Books_details();
				b.setPrice(rs.getInt("price"));
				b.setimgloc(rs.getString("imgloc"));
				b.setBookid(rs.getInt("bookid"));
				b.setTitle(rs.getString("title"));
				return b;
			}
		});
		return list;
	}

	@Override
	public List<Books_details> getPhotoById(int id) {
		List<Books_details> list = template.query("select * from books where categoryid =?", new Object[] { id },
				new RowMapper<Books_details>() {
					@Override
					public Books_details mapRow(ResultSet rs, int rowNum) throws SQLException {
						Books_details b = new Books_details();
						b.setPrice(rs.getInt("price"));
						b.setimgloc(rs.getString("imgloc"));
						b.setBookid(rs.getInt("bookid"));
						b.setTitle(rs.getString("title"));
						return b;
					}
				});
		return list;
	}

	@Override
	public List<Books_details> getBookId(int id) {
		List<Books_details> list = template.query("select * from books where bookid =?", new Object[] { id },
				new RowMapper<Books_details>() {
					@Override
					public Books_details mapRow(ResultSet rs, int rowNum) throws SQLException {
						Books_details b = new Books_details();
						b.setPrice(rs.getInt("price"));
						b.setimgloc(rs.getString("imgloc"));
						b.setBookid(rs.getInt("bookid"));
						b.setAuthor(rs.getString("author"));
						b.setDescription(rs.getString("description"));
						b.setTitle(rs.getString("title"));
						return b;
					}
				});
		return list;
	}

	@Override
	public int Temp_Cart(int id, int qty, int login_id, int price) {
		System.out.println("inside template order");
		java.util.Date date = new java.util.Date();
		java.sql.Date sqlDate = new java.sql.Date(date.getTime());
		System.out.println(sqlDate);
		String sql1 = "insert into mohit.cart (bookid,qty,login_id,price,Order_Date) values(" + id + "," + qty + ","
				+ login_id + "," + price + ", now()  )";
		int i = template.update(sql1);
		return i;
	}

	@Override
	public List<Order_info> cart(int log) {
		List<Order_info> list = template.query("\r\n"
				+ "select * from mohit.cart,mohit.books where mohit.books.bookid=mohit.cart.bookid and login_id =?",
				new Object[] { log }, new RowMapper<Order_info>() {
					@Override
					public Order_info mapRow(ResultSet rs, int rowNum) throws SQLException {
						Order_info b = new Order_info();
						b.setPrice(rs.getInt("price"));
						b.setLogin_id(rs.getInt("login_id"));
						b.setDescription(rs.getString("description"));
						b.setImgloc(rs.getString("imgloc"));
						b.setQty(rs.getInt("qty"));
						b.setTitle(rs.getString("title"));
						return b;
					}
				});

		return list;
	}

	@Override
	public int AddBooks(String title, String author, int qty, int price, String descr, String set, String category) {
		String sql1 = "insert into books (categoryid,title, author,qyt,price, description, \r\n" + "	imgloc, \r\n"
				+ "	publisherid\r\n" + "	)\r\n" + "	values(" + category + "," + title + "," + author + "," + qty
				+ "," + price + "," + descr + "," + set + ")";
		int i = template.update(sql1);
		return i;

	}

	@Override
	public int UpdateBooks(int book_id, int quanty) {
		String sql1 = "select qyt from books where bookid=?";
		int qyt = template.queryForObject(sql1, new Object[] { book_id }, Integer.class);
		qyt += quanty;
		System.out.println(qyt);
		String sql = "update books set qyt = " + qyt + " where bookid =" + book_id;
		int x = template.update(sql);
		return x;
	}

	@Override
	public List<Login_Bean> Login_detials() {
		List<Login_Bean> list = template.query("select 	login_id,user,pass,type from login_table ",
				new RowMapper<Login_Bean>() {
					@Override
					public Login_Bean mapRow(ResultSet rs, int rowNum) throws SQLException {
						Login_Bean b = new Login_Bean();
						b.setLogin_id(rs.getInt("login_id"));
						b.setPass(rs.getInt("pass"));
						b.setUser(rs.getString("user"));
						b.setType(rs.getInt("type"));
						System.out.println("type ==" + b.getType());
						return b;
					}
				});

		return list;
	}

	@Override
	public int MakeAdmin(String name, int type) {

		String sql = "update login_table set type = " + type + " where user ='" + name + "'";
		int x = template.update(sql);
		return x;
	}

	@Override
	public int payment(int Customer_id, int amount, int card_no) {

		String sql = "insert into mohit.payment(Card_No,Amount,Pay_Date,Customer_id,transaction_id,Product_Status) values("
				+ card_no + "," + amount + ",now()," + Customer_id + ",'process')";
		int i = template.update(sql);
		String sql1 = "delete from mohit.payment";
		template.update(sql1);
		return i;
	}

	@Override
	public List<Order> myOrder(int Customer_id) {
		List<Order> list = template.query("select	* from payment where Customer_id= " + Customer_id + ";",
				new RowMapper<Order>() {
					@Override
					public Order mapRow(ResultSet rs, int rowNum) throws SQLException {
						Order b = new Order();
						b.setCustomer_id(rs.getInt("Customer_id"));
						b.setTotal_amount(rs.getInt("Amount"));
						b.setCard_no(rs.getInt("Card_No"));
						b.setPay_date(rs.getDate("Pay_Date"));
						b.setTransaction(rs.getInt("transaction_id"));
						b.setStatus(rs.getString("Product_Status"));
						Format formatter = new SimpleDateFormat("yyyy-MM-dd");
						String s = formatter.format(b.getPay_date());
						b.setStrDate(s);
						Calendar c = Calendar.getInstance();
						c.setTime(b.getPay_date());
						c.add(Calendar.DATE, 5);
						Date modifiedDate = c.getTime();
						s = formatter.format(modifiedDate);
						b.setExpected(s);
						if (b.getStatus().equalsIgnoreCase("process")) {
							b.setProductStatus(1);
						} else if (b.getStatus().equalsIgnoreCase("retrun")) {
							b.setProductStatus(2);
						} else {
							b.setProductStatus(0);
						}
						System.out.println("date" + b.getProductStatus());
						return b;
					}
				});
		return list;
	}

	public int cancelOrder(int transaction) {

		String sql = "update mohit.payment set Product_Status= 'cancel' where transaction_id =" + transaction;
		int i = template.update(sql);
		return i;
	}

	public int returnOrder(int transaction) {
		String sql = "update mohit.payment set Product_Status= 'return' where transaction_id =" + transaction;
		int i = template.update(sql);
		return i;
	}

	public List<Order> All_Order() {
		List<Order> list = template.query("select * from payment", new RowMapper<Order>() {
			@Override
			public Order mapRow(ResultSet rs, int rowNum) throws SQLException {
				Order b = new Order();
				b.setCustomer_id(rs.getInt("Customer_id"));
				b.setTotal_amount(rs.getInt("Amount"));
				b.setCard_no(rs.getInt("Card_No"));
				b.setPay_date(rs.getDate("Pay_Date"));
				b.setTransaction(rs.getInt("transaction_id"));
				b.setStatus(rs.getString("Product_Status"));
				Format formatter = new SimpleDateFormat("yyyy-MM-dd");
				String s = formatter.format(b.getPay_date());
				b.setStrDate(s);
				Calendar c = Calendar.getInstance();
				c.setTime(b.getPay_date());
				c.add(Calendar.DATE, 5);
				Date modifiedDate = c.getTime();
				s = formatter.format(modifiedDate);
				b.setExpected(s);
				if (b.getStatus().equalsIgnoreCase("process")) {
					b.setProductStatus(1);
				} else if (b.getStatus().equalsIgnoreCase("retrun")) {
					b.setProductStatus(2);
				} else {
					b.setProductStatus(0);
				}
				System.out.println("date" + b.getProductStatus());
				return b;
			}
		});
		return list;
	}

	public int UpdateOrder(int transaction) {
		String sql = "update mohit.payment set Product_Status='complete' where transaction_id =" + transaction;
		int i = template.update(sql);
		return i;
	}

	@Override
	public int change_pass(String old_pass, int new_pass, int l_id) {
		String pass;
		pass = this.template.queryForObject("Select pass from mohit.login_table where login_id=?",
				new Object[] { l_id }, String.class);
		if (pass.equalsIgnoreCase(old_pass)) {
			int i = template.update("update mohit.login_table set pass= ? where login_id =?", new_pass, l_id);
			i = template.update("update mohit.user_table set password= ? where userid =?", new_pass, l_id);
			return i;
		} else {
			return 0;
		}
	}

	@Override
	public int feedback_Submit(String fname, String lname, String email, String msg, String f_type) {
		// TODO Auto-generated method stub
		int sql = this.template.update("insert into feedback(Name,Email,Message,Feedback_Type,Reply) values(?,?,?,?)",
				fname + " " + lname, email, msg, f_type, "NULL");
		return sql;
	}

	@Override
	public List<Feedback> get_Feedback() {
		List<Feedback> feed = this.template.query("select * from feedback where Reply is NULL",
				new RowMapper<Feedback>() {

					@Override
					public Feedback mapRow(ResultSet rs, int rowNum) throws SQLException {
						Feedback fb = new Feedback();
						fb.setEmail(rs.getString("Email"));
						fb.setName(rs.getString("Name"));
						fb.setMessage(rs.getString("Message"));
						fb.setFeedback_type(rs.getString("Feedback_Type"));
						return fb;
					}
				});
		return feed;
	}

	@Override
	public int reply_feedback(String email, String reply) {
		// TODO Auto-generated method stub
		int sql = this.template.update("update feedback set reply =? where email=?", reply, email);
		return sql;
	}
}