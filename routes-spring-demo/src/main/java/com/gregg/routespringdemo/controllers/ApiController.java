package com.gregg.routespringdemo.controllers;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api")
public class ApiController {

	public ApiController() {
		// TODO Auto-generated constructor stub
	}
	
	//requestmapping defaults to GET
	@RequestMapping("/option/1")
	public String option1() {
		return "option 1 request mapping";
	}
	
	//explicity sets request method
	@RequestMapping(value="/option/2", method = RequestMethod.GET)
	public String option2() {
		return "Option 2 request mapping";
	}
	
	//preferred method
	@GetMapping("/option/3")
	public String option3() {
		return "option 3 request mapping";
	}
}
