package com.gregg.carAndDriver.models;

public class Car {
	//attributes
	private int gas;
	
	public Car() {
		this.gas = 10;
	}
	
	//methods
	public void display() {
		System.out.println("Remaining Amount of Gas: " + this.gas);
	}

	public int getGas() {
		return gas;
	}

	public void setGas(int gas) {
		this.gas = gas;
	}
	
	

}
