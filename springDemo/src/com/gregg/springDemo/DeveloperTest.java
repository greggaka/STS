package com.gregg.springDemo;

import java.util.ArrayList;

import com.gregg.springDemo.models.Developer;
import com.gregg.springDemo.models.FrontendDeveloper;

public class DeveloperTest {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		System.out.println("------------Developer Test-------------");

        FrontendDeveloper fed = new FrontendDeveloper("Gregg Akamine");
        
        ArrayList<String> lang = new ArrayList<String>(); //this line initializs array
        lang.add("Java");
        lang.add("Python");

        fed.setLanguages(lang);
        fed.giveRaise(25000);

        System.out.println(fed.displayStats());
        System.out.println(Developer.getDevCount());
        System.out.println(Developer.getTotalSalaries());
	}

}
