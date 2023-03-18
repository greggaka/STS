package com.gregg.auth.controllers;

import java.security.Principal;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gregg.auth.models.User;
import com.gregg.auth.services.UserService;
import com.gregg.auth.validator.UserValidator;

@Controller
public class UserController {
	private UserService userServ;
	private final UserValidator userValid;

	public UserController(UserService userServ, UserValidator userValid) {
		this.userServ = userServ;
		this.userValid = userValid;
	}
	
	@GetMapping("/registration")
	public String registerForm(@Valid @ModelAttribute("user") User user) {
		return "registrationPage.jsp";
	}
	
	@PostMapping("/registration")
	public String registration(@Valid @ModelAttribute("user") User user, BindingResult result, Model model) {
		userValid.validate(user, result);
		if (result.hasErrors()) {
			return "registrationPage.jsp";
		}
		userServ.saveUserWithAdminRole(user);
		return "redirect:/login";
	}
	
	@RequestMapping("/admin")
	public String adminPage(Principal principal, Model model) {
		String username = principal.getName();
		model.addAttribute("currentUser", userServ.findByUserName(username));
		return "adminPage.jsp";
	}
	
	@RequestMapping("/login")
	public String login(@RequestParam(value="error", required=false) String error, @RequestParam(value="logout", required=false) String logout, Model model) {
		if (error != null) {
			model.addAttribute("errorMessage", "Invalid Credentials. Please try again.");
		}
		if (logout != null) {
			model.addAttribute("logoutMessage", "Logout Successful");
		}
		return "loginPage.jsp";
	}
	
	//Both "/" and /home go to home page.
	@RequestMapping(value = {"/", "/home"})
	public String home(Principal principal, Model model) {
		String username = principal.getName();
		model.addAttribute("currentUser", userServ.findByUserName(username));
		return "homePage.jsp";
	}

}
