package com.gregg.omikujiform.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class OmikujiController {

	@GetMapping("/omikuji")
	public String omikujiForm () {
		
		return "omikujiForm.jsp";
	}
	
	@PostMapping("omikuji/process")
	public String omikujiProcess (@RequestParam("num") int num, @RequestParam("city") String city, @RequestParam("person") String person, @RequestParam("endeavor") String endeavor, @RequestParam ("thing") String thing, @RequestParam("message") String message, HttpSession session) {
		session.setAttribute("num", num);
		session.setAttribute("city", city);
		session.setAttribute("person", person);
		session.setAttribute("endeavor", endeavor);
		session.setAttribute("thing", thing);
		session.setAttribute("message", message);
		return "redirect:/omikuji/show";
	}

	@GetMapping("/omikuji/show")
	public String omikujiDisplay() {
		return "omikujiDisplay.jsp";
	}
}
