package com.gregg.daikichiroutes.controllers;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/daikichi")
public class DaikichiController {

	@GetMapping("")
	public String daikichi() {
		return "Welcome";
	}
	
	@GetMapping("/today")
	public String daikichiToday() {
		return "Today you will find luck in all your endeavors!";
	}
	
	@GetMapping("/tomorrow")
	public String daikichiTomorrow() {
		return "Tomorrow, an opportunity will arise, so be sure to be open to new ideas!";
	}
	
	@GetMapping("/m/travel/{city}")
	public String daikichiTravel (@PathVariable("city") String city) {
		return "Congratulations! You will soon travel to " + city;
	}
	
	@GetMapping("/m/lotto/{num}")
	public String daikichiLotto(@PathVariable("num") Integer num) {
		if (num%2 == 0) {
			return "You will take a grand journey in the near future, but be wary of tempting offers.";
		}
		else {
			return "You have enjoyed the fruits of your labor, but now is a great time to spend time with family and friends.";
		}
	}

}
