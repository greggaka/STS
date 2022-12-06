package com.gregg.routespringdemo.controllers;

import java.util.ArrayList;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {
	
	@GetMapping("/")
	public String home(Model model) {
		model.addAttribute("someData", "this is the someData");
		return "index.jsp";
		}

	@GetMapping("/java/demo")
	public String demo() {
		return "demo.jsp";
	}
	
	@GetMapping("/jstl/demo")
	public String jstlDemo(Model model) {
		ArrayList<String> users = new ArrayList<String>();
		String name = "Gregg";
		Integer age = 29;
		Boolean isHungry = true;
		model.addAttribute("nameFromController", name);
		model.addAttribute("ageFromController", age);
		model.addAttribute("isHungryFromController", isHungry);
		model.addAttribute("test", "<script>alert('h1')</script>");
		
		users.add("Andrew");
		users.add("Reed");
		users.add("Scott");
		model.addAttribute("usersListFromController", users);
		
		return "jstlDemo.jsp";
	}
}
