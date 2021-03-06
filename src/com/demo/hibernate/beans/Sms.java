package com.demo.hibernate.beans;
// Generated 2016-4-24 22:36:56 by Hibernate Tools 3.5.0.Final

/**
 * Sms generated by hbm2java
 */
public class Sms{

	private Integer id;
	private String username;
	private String sender;
	private String message;
	private String sendertime;
	private String isRead;

	public Sms() {
	}

	public Sms(String username, String sender) {
		this.username = username;
		this.sender = sender;
	}

	public Sms(String username, String sender, String message, String sendertime, String isRead) {
		this.username = username;
		this.sender = sender;
		this.message = message;
		this.sendertime = sendertime;
		this.isRead = isRead;
	}

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getUsername() {
		return this.username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getSender() {
		return this.sender;
	}

	public void setSender(String sender) {
		this.sender = sender;
	}

	public String getMessage() {
		return this.message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public String getSendertime() {
		return this.sendertime;
	}

	public void setSendertime(String sendertime) {
		this.sendertime = sendertime;
	}

	public String getIsRead() {
		return this.isRead;
	}

	public void setIsRead(String isRead) {
		this.isRead = isRead;
	}

}
