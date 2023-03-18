package com.gregg.schoolmanagementsystem.models;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;

public class LoginAdmin {

	@NotEmpty(message="Email is required")
	@Email(message="Invalid Email")
	private String email;
	
	@NotEmpty(message="Password is required")
	private String password;

	public LoginAdmin() {}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

}
