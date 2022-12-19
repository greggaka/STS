package com.gregg.travelers.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.gregg.travelers.services.DestinationService;
import com.gregg.travelers.services.UserService;

@Controller
public class MainController {

	private final UserService userServ;
	private final DestinationService destinationServ;
	
	public MainController(UserService userServ, DestinationService destinationServ) {
		this.userServ = userServ;
		this.destinationServ = destinationServ;
	}
	
	@GetMapping("/")
	public String dashboard(HttpSession session, Model model) {
		if (session.getAttribute("user_id") == null) {
			return "redirect:/users/login/register";
		}
		model.addAttribute("allDestinations", destinationServ.getAll());
		model.addAttribute("loggedInUser", userServ.getUser((Long) session.getAttribute("user_id")));
		return "main/dashboard.jsp";
	}

}
