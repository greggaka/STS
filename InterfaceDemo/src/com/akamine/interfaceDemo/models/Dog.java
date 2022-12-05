package com.akamine.interfaceDemo.models;

import com.akamine.interfaceDemo.interfaces.Keepable;

public class Dog extends Pet implements Keepable {

	public Dog() {
		super();
	}
	
	public Dog(String name) {
		super(name);
	}

	@Override
	public void showAffection() {
		System.out.println("Licks your face");
		
	}

	@Override
	public void askForFood() {
		System.out.println("woof...");
	}

}
