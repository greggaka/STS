package com.gregg.zooKeeper.models;

public class Bat extends Mammal {
	
	//constructors
	public Bat() {
		super(300);
	}

	//methods
	public void fly() {
		System.out.println("The bat flies. -50 to its energy");
		this.setEnergy(getEnergy() - 50);
	}
	
	public void eatHumans() {
		System.out.println("The bat eats a human. +25 to its energy");
		this.setEnergy(getEnergy() + 25);
	}
	
	public void attackTown() {
		System.out.println("The bat attacks the town. -100 to its energy");
		this.setEnergy(getEnergy() - 100);
	}
}
