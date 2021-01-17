package com.example.bean;

public class Login_Bean {

	private String user;
	private int pass;
	private int login_id;
	private int type;
	private int change_pass;

	public int getChange_pass() {
		return change_pass;
	}

	public void setChange_pass(int change_pass) {
		this.change_pass = change_pass;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

	public int getLogin_id() {
		return login_id;
	}

	public void setLogin_id(int login_id) {
		this.login_id = login_id;
	}

	public String getUser() {
		return user;
	}

	public void setUser(String user) {
		this.user = user;
	}

	public int getPass() {
		return pass;
	}

	public void setPass(int pass) {
		this.pass = pass;
	}

}
