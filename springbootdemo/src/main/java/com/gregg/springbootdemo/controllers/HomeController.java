package com.gregg.springbootdemo.controllers;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController 
public class HomeController {

	public HomeController() {
		// TODO Auto-generated constructor stub
	}
	
	@RequestMapping("/api/number")
	public int apiNumber() {
		return 54;
	}

}
