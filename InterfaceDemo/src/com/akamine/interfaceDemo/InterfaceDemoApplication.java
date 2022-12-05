package com.akamine.interfaceDemo;

import com.akamine.interfaceDemo.models.Cat;
import com.akamine.interfaceDemo.models.Dog;

public class InterfaceDemoApplication {

	public static void main(String[] args) {
		Cat cat1 = new Cat("zabu");
		cat1.play();
		cat1.showAffection();
		cat1.askForFood();
		System.out.println("**********************\n");
		
		Dog dog1 = new Dog("Ellie");
		dog1.play();
		dog1.showAffection();
		dog1.askForFood();
	}

}
