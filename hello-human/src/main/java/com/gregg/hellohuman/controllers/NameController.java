package com.gregg.hellohuman.controllers;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/")
public class NameController {

	@GetMapping("")
	public String printHello(@RequestParam(value="name", required=false) String name) {
		if (name != null) {
			return "Hello " + name;
		}
		else {
			return "Hello Human";			
		}
	}
}
