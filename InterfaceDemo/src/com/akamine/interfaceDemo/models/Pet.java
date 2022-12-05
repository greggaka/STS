package com.akamine.interfaceDemo.models;

public class Pet {
	//attributes
	private String name;
	private String type;

	//constructors
	public Pet() {
		this.name = "you haven't given me a name";
	}
	public Pet(String name) {
		this.name = name;
	}
	
	
	//methods
	
	
	
	//getters and setters
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	
}
