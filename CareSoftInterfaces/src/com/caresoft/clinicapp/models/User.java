package com.caresoft.clinicapp.models;

public class User {
	//attributes
	protected Integer id;
	protected int pin;
	protected String role;
	
	
	//constructors
	public User() {
		this.id = 0;
	}
	
	public User(Integer id) {
		this.id = id;
	}
	
	public User(Integer id, String role) {
		this.id = id;
		this.role = role;
	}

	//getters and setters
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public int getPin() {
		return pin;
	}

	public void setPin(int pin) {
		this.pin = pin;
	}
	
	
}
