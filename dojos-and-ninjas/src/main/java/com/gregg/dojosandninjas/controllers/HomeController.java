package com.gregg.dojosandninjas.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.gregg.dojosandninjas.services.DojoService;
import com.gregg.dojosandninjas.services.NinjaService;

@Controller
public class HomeController {

	private final DojoService dojoServ;
	private final NinjaService ninjaServ;
	
	public HomeController(DojoService dojoServ,NinjaService ninjaServ) {
		this.dojoServ = dojoServ;
		this.ninjaServ = ninjaServ;
	}
	
	@GetMapping("/")
	public String index(Model model) {
		model.addAttribute("allDojos", dojoServ.getAll());
		model.addAttribute("allNinjas", ninjaServ.getAll());
		return "/dashboard.jsp";
	}

}
