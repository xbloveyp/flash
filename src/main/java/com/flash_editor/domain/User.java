package com.flash_editor.domain;

import java.io.Serializable;

public class User implements Serializable{
	private String username;
	private long uid;
	private String password;
	private String email;
	
	public User(){}


	public long getUid() {
		return uid;
	}



	public void setUid(long uid) {
		this.uid = uid;
	}



	public String getUsername() {
		return username;
	}



	public void setUsername(String username) {
		this.username = username;
	}



	public String getPassword() {
		return password;
	}



	public void setPassword(String password) {
		this.password = password;
	}



	public String getEmail() {
		return email;
	}



	public void setEmail(String email) {
		this.email = email;
	}




	
	
}
