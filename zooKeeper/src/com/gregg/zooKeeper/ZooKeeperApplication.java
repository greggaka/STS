package com.gregg.zooKeeper;

import com.gregg.zooKeeper.models.Bat;
import com.gregg.zooKeeper.models.Gorilla;

public class ZooKeeperApplication {

	public static void main(String[] args) {
		Gorilla harambe = new Gorilla();
		harambe.displayEnergy();
		harambe.throwSomething(); //95
		harambe.throwSomething(); //90
		harambe.throwSomething(); //85
		harambe.eatBananas(); //95
		harambe.eatBananas(); //105
		harambe.climb(); //95
		harambe.displayEnergy(); //95
		
		System.out.println("\n");
		
		Bat dracula = new Bat();
		dracula.displayEnergy();
		dracula.fly();
		dracula.attackTown();
		dracula.eatHumans();
		dracula.fly();
		dracula.attackTown();
		dracula.eatHumans();
		dracula.fly();
		dracula.displayEnergy();
		

	}

}
