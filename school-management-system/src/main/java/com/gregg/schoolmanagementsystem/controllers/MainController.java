package com.gregg.schoolmanagementsystem.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.gregg.schoolmanagementsystem.services.AdminService;
import com.gregg.schoolmanagementsystem.services.ClasssService;
import com.gregg.schoolmanagementsystem.services.FacultyService;
import com.gregg.schoolmanagementsystem.services.SchoolService;
import com.gregg.schoolmanagementsystem.services.StudentService;

@Controller
public class MainController {

	private final AdminService adminServ;
	private final SchoolService schoolServ;
	private final ClasssService classServ;
	private final FacultyService facultyServ;
	private final StudentService studentServ;
	
	public MainController(AdminService adminServ, SchoolService schoolServ, ClasssService classServ, FacultyService facultyServ, StudentService studentServ  ) {
		this.adminServ = adminServ;
		this.schoolServ = schoolServ;
		this.classServ = classServ;
		this.facultyServ = facultyServ;
		this.studentServ = studentServ;
	}
	
	@GetMapping("/")
	public String index(Model model, HttpSession session) {
		if (session.getAttribute("admin_id") == null) {
			return "redirect:/admin/login";
		}
		model.addAttribute("loggedInAdmin", adminServ.getAdmin((Long) session.getAttribute("admin_id")));
		model.addAttribute("allSchools", schoolServ.getAll());
		model.addAttribute("allClasses", classServ.getAll());
		model.addAttribute("allFaculty", facultyServ.getAll());
		model.addAttribute("allStudents", studentServ.getAll());
		return "main/dashboard.jsp";
	}
}
