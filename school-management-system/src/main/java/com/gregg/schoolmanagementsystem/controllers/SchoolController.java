package com.gregg.schoolmanagementsystem.controllers;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.gregg.schoolmanagementsystem.models.School;
import com.gregg.schoolmanagementsystem.services.AdminService;
import com.gregg.schoolmanagementsystem.services.ClasssService;
import com.gregg.schoolmanagementsystem.services.FacultyService;
import com.gregg.schoolmanagementsystem.services.SchoolService;
import com.gregg.schoolmanagementsystem.services.StudentService;

@Controller
@RequestMapping("/schools")
public class SchoolController {
	
	private final AdminService adminServ;
	private final SchoolService schoolServ;
	private final ClasssService classsServ;
	private final FacultyService facultyServ;
	private final StudentService studentServ;

	public SchoolController(SchoolService schoolServ, ClasssService classsServ, AdminService adminServ, FacultyService facultyServ, StudentService studentServ) {
		this.adminServ = adminServ;
		this.schoolServ = schoolServ;
		this.classsServ = classsServ;
		this.facultyServ = facultyServ;
		this.studentServ = studentServ;
	}
	
	@GetMapping("/new")
	public String newSchool(@ModelAttribute("school") School school, HttpSession session, Model model) {
		if (session.getAttribute("admin_id") == null){
			return "redirect:/users/login/register";
		}
		model.addAttribute("loggedInAdmin", adminServ.getAdmin((Long) session.getAttribute("admin_id")));
		model.addAttribute("allSchools", schoolServ.getAll());
		return "school/schoolNew.jsp";
	}
	
	@PostMapping("/new")
	public String processSchool(@Valid @ModelAttribute("school") School school, BindingResult result) {
		if (result.hasErrors()) {
			return "school/schoolNew.jsp";
		}
		schoolServ.create(school);
		return "redirect:/";
	}
	
	@GetMapping("/{id}")
	public String viewSchool(@PathVariable("id") Long id, Model model, HttpSession session) {
		School school = schoolServ.getOne(id);
		model.addAttribute("loggedInAdmin", adminServ.getAdmin((Long) session.getAttribute("admin_id")));
		model.addAttribute("school", school);
		model.addAttribute("allClasses", classsServ.getAll());
		model.addAttribute("allschools", schoolServ.getAll());
		model.addAttribute("allFaculty", facultyServ.getAll());
		model.addAttribute("allStudents", studentServ.getAll());
		return "school/schoolView.jsp";
	}
	
	@GetMapping("/edit/{id}")
	public String editSchool(@PathVariable("id") Long id, Model model, HttpSession session) {
		if (session.getAttribute("admin_id") == null){
			return "redirect:/users/login/register";
		}
		model.addAttribute("allSchools", schoolServ.getAll());
		School school = schoolServ.getOne(id);
		model.addAttribute("school", school);
		return "school/schoolEdit.jsp";
	}
	
	@PutMapping("/edit/{id}")
	public String processEditSchool(@PathVariable("id") Long id, @Valid @ModelAttribute("school") School school, BindingResult result) {
		if (result.hasErrors()) {
			return "school/editSchool.jsp";
		}
		schoolServ.update(school);
		return "redirect:/schools/{id}";
	}
	
	@DeleteMapping("/{id}")
	public String processDelete(@PathVariable("id") Long id) {
		schoolServ.delete(id);
		return "redirect:/";
	}
}
