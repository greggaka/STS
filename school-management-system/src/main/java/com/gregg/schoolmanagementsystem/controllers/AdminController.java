package com.gregg.schoolmanagementsystem.controllers;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.gregg.schoolmanagementsystem.models.Admin;
import com.gregg.schoolmanagementsystem.models.LoginAdmin;
import com.gregg.schoolmanagementsystem.models.School;
import com.gregg.schoolmanagementsystem.services.AdminService;
import com.gregg.schoolmanagementsystem.services.SchoolService;



@Controller
@RequestMapping("/admin")
public class AdminController {

	private final AdminService adminServ;
	private final SchoolService schoolServ;
	
	public AdminController(AdminService adminServ, SchoolService schoolServ) {
		this.adminServ = adminServ;
		this.schoolServ = schoolServ;
	}
	
	@GetMapping("/login")
	public String loginReg(Model model) {
		model.addAttribute("newAdmin", new Admin());
		model.addAttribute("loginAdmin", new LoginAdmin());
		return "admin/login.jsp";
	}
	
	@GetMapping("/register")
	public String register(Model model) {
		model.addAttribute("newAdmin", new Admin());
		return "admin/register.jsp";
	}
	
	@PostMapping("/register")
	public String registerAdmin(@Valid @ModelAttribute("newAdmin") Admin admin, BindingResult result, HttpSession session, Model model) {
		//check if passwords match
		if (!admin.getPassword().equals(admin.getConfirm())) {
			result.rejectValue("password", "Match", "Passwords do not match");
		}
		//check if email already exists
		if (adminServ.getAdmin(admin.getEmail()) != null) {
			result.rejectValue("email", "Unique", "Email already exists");
		}
		if (result.hasErrors()) {
			model.addAttribute("loginAdmin", new LoginAdmin());
			return "/admin/register.jsp";
		}
		Admin newAdmin = adminServ.registerAdmin(admin);
		session.setAttribute("admin_id", newAdmin.getId());
		return "redirect:/";
	}
	
	@PostMapping("/login")
	public String loginAdmin(@Valid @ModelAttribute("loginAdmin") LoginAdmin loginAdmin, BindingResult result, Model model, HttpSession session) {
		Admin loggingInAdmin = adminServ.login(loginAdmin, result);
		if (result.hasErrors()) {
			model.addAttribute("newAdmin", new Admin());
			return "admin/login.jsp";
		}
		session.setAttribute("admin_id", loggingInAdmin.getId());
		return "redirect:/";
	}
	
	@GetMapping("logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}

}
