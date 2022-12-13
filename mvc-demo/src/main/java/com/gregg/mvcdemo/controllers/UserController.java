package com.gregg.mvcdemo.controllers;

import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.gregg.mvcdemo.models.User;
import com.gregg.mvcdemo.services.UserService;

@Controller
@RequestMapping("/users")
public class UserController {

	private final UserService userServ;
	
	public UserController(UserService userServ) {
		this.userServ = userServ;
	}
	
	@GetMapping("/new")
	public String newUser(@ModelAttribute("user") User user) {
		return "user/create.jsp";
	}
	
	@PostMapping("/new")
	public String processNewUser(@Valid @ModelAttribute("user") User user, BindingResult result) {
		if (result.hasErrors()) {
			return "user/create.jsp";
		}
		userServ.create(user);
		return "redirect:/";
	}
	
	@GetMapping("/view/{id}")
	public String viewUser(@PathVariable("id") Long id, Model model) {
		model.addAttribute("user", userServ.getUser(id));
		return "user/view.jsp";
	}

}
