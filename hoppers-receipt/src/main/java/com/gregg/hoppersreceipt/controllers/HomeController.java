package com.gregg.hoppersreceipt.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {

	@GetMapping("/")
	public String index(Model model) {
		
		String name = "John Smith";
		String itemName = "Iphone";
		double price = 999.99;
		String description = "Iphone 14 pro.";
		String vendor = "Apple";
		
		model.addAttribute("name", name);
		model.addAttribute("itemName", itemName);
		model.addAttribute("price", price);
		model.addAttribute("description", description);
		model.addAttribute("vendor", vendor);
		
		return "index.jsp";
	}

}
