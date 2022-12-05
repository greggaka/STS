package com.gregg.zooKeeper.models;

public class Mammal {
	
	//attributes
	private int energy;
	
	//constructors
	public Mammal() {
		this.energy = 100;
	}
	
	public Mammal(int energy) {
		this.energy = energy;
	}

	//methods
	public int displayEnergy() {
		System.out.println("Energy level: " + this.energy);
		return this.energy;
	}
	
	//getters and setters
	public int getEnergy() {
		return energy;
	}

	public void setEnergy(int energy) {
		this.energy = energy;
	}
	
	

}
