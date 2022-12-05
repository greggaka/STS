package com.gregg.carAndDriver.models;

public class Driver extends Car{

	public Driver() {
		super();
	}
	
	//methods
	public void drive () {
		this.setGas(this.getGas()-1);
		System.out.println("You drive the car. \nGas remaining: " + this.getGas() + "/10");
		if (this.getGas()<=0) {
			System.out.println("Game Over. Thanks for driving.");
		}
	}

	public void useBoosters () {
		if (this.getGas() < 3) {
			System.out.println("Cannot use boosters. Need at least 3 gas remaining");
		}
		else {
			this.setGas(this.getGas() - 3);
			System.out.println("You use the car's boosters. \nGas remaining: " + this.getGas() + "/10");
		}
		if (this.getGas()<=0) {
			System.out.println("Game Over. Thanks for driving.");
		}
	}
	
	public void refuel () {
		if (this.getGas() > 8) {
			System.out.println("Cannot refuel. Gas must be lower than 8 to refuel");
		}
		else {
			this.setGas(this.getGas() + 2);
			System.out.println("You refuel the car. \nGas remaining: " + this.getGas() + "/10");			
		}
	}
}
