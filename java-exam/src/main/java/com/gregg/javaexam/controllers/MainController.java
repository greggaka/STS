package com.gregg.javaexam.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.gregg.javaexam.services.NameService;
import com.gregg.javaexam.services.UserService;

@Controller
public class MainController {

	private final NameService nameServ;
	private final UserService userServ;
	
	public MainController(NameService nameServ, UserService userServ) {
		this.nameServ = nameServ;
		this.userServ = userServ;
	}
	
	@GetMapping("/")
	public String index(Model model, HttpSession session) {
		if (session.getAttribute("user_id") == null) {
			return "redirect:/users/login/register";
		}
		model.addAttribute("allNames", nameServ.getAll());
		model.addAttribute("loggedInUser", userServ.getUser((Long) session.getAttribute("user_id")));
		return "main/dashboard.jsp";
	}

}
