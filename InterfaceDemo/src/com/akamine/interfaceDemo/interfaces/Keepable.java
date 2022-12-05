package com.akamine.interfaceDemo.interfaces;

public interface Keepable {
	
	public default void play() {
		System.out.println("playing...");
	}
	
	//contracts for our classes that implement this keepable interface to fill out the body of the method
	abstract void showAffection();
	abstract void askForFood();
}
