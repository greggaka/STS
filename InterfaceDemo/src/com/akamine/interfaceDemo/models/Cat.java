package com.akamine.interfaceDemo.models;

import com.akamine.interfaceDemo.interfaces.Keepable;

public class Cat extends Pet implements Keepable{

	public Cat() {
		super();
	}
	
	public Cat(String name) {
		super(name);
	}

	@Override
	public void showAffection() {
		System.out.println("Purrrrr...");
	}

	@Override
	public void askForFood() {
		System.out.println("Meow...");
	}

}
