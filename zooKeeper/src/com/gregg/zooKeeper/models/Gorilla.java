package com.gregg.zooKeeper.models;

public class Gorilla extends Mammal {

	//constructors
	public Gorilla() {
		super();
	}

	//methods
	public void throwSomething () {
		System.out.println("Gorilla has thrown something. -5 from its energy");
		this.setEnergy(this.getEnergy() - 5);
	}
	
	public void eatBananas () {
		System.out.println("Gorilla eats bananas. +10 from its energy");
		this.setEnergy(getEnergy() + 10);
	}

	public void climb () {
		System.out.println("Gorilla climbs a tree. -10 from its energy");
		this.setEnergy(getEnergy() - 10);
	}
}
