package com.example.bean;

public class Feedback {

	private String email;
	private String login_id;
	private String name;
	private String feedback_type;
	private String feedback_reply;
	private String message;

	public String getFeedback_reply() {
		return feedback_reply;
	}

	public void setFeedback_reply(String feedback_reply) {
		this.feedback_reply = feedback_reply;
	}

	public String getFeedback_type() {
		return feedback_type;
	}

	public void setFeedback_type(String feedback_type) {
		this.feedback_type = feedback_type;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getLogin_id() {
		return login_id;
	}

	public void setLogin_id(String login_id) {
		this.login_id = login_id;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}
}
