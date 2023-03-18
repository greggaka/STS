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

import com.gregg.schoolmanagementsystem.models.Classs;
import com.gregg.schoolmanagementsystem.models.Faculty;
import com.gregg.schoolmanagementsystem.models.School;
import com.gregg.schoolmanagementsystem.models.Student;
import com.gregg.schoolmanagementsystem.services.AdminService;
import com.gregg.schoolmanagementsystem.services.SchoolService;
import com.gregg.schoolmanagementsystem.services.StudentService;



@Controller
@RequestMapping("/students")
public class StudentController {

	private final AdminService adminServ;
	private final SchoolService schoolServ;
	private final StudentService studentServ;
	
	public StudentController(StudentService studentServ, AdminService adminServ, SchoolService schoolServ) {
		this.studentServ = studentServ;
		this.schoolServ = schoolServ;
		this.adminServ = adminServ;
	}
	
	@GetMapping("/new")
	public String newStudent(@ModelAttribute("student") Student student, HttpSession session, Model model) {
		if (session.getAttribute("admin_id") == null){
			return "redirect:/users/login/register";
		}
		model.addAttribute("loggedInAdmin", adminServ.getAdmin((Long) session.getAttribute("admin_id")));
		model.addAttribute("allSchools", schoolServ.getAll());
		model.addAttribute("allStudents", studentServ.getAll());
		return "student/studentNew.jsp";
	}
	
	@PostMapping("/new")
	public String processStudent(@Valid @ModelAttribute("student") Student student, BindingResult result) {
		if (result.hasErrors()) {
			return "student/studentNew.jsp";
		}
		studentServ.create(student);
		return "redirect:/";
	}
	
	@GetMapping("/{id}")
	public String viewOneFaculty (@PathVariable("id") Long id, Model model, HttpSession session) {
		Student student = studentServ.getOne(id);
		model.addAttribute("loggedInAdmin", adminServ.getAdmin((Long) session.getAttribute("admin_id")));
		model.addAttribute("allStudents", studentServ.getAll());
		model.addAttribute("student", student);
		return "student/studentView.jsp";
	}
	
	@GetMapping("/edit/{id}")
	public String editStudent (@PathVariable("id") Long id, Model model, HttpSession session) {
		if (session.getAttribute("admin_id") == null){
			return "redirect:/users/login/register";
		}
		model.addAttribute("allSchools", schoolServ.getAll());
		model.addAttribute("allStudents", studentServ.getAll());
		Student student = studentServ.getOne(id);
		model.addAttribute("student", student);
		return "student/studentEdit.jsp";
	}
	
	@PutMapping("/edit/{id}")
	public String processEditStudent(@PathVariable("id") Long id, @Valid @ModelAttribute("student") Student student, BindingResult result) {
		if (result.hasErrors()) {
			return "student/editStudent.jsp";
		}
		studentServ.update(student);
		return "redirect:/students/{id}";
	}
	
	@DeleteMapping("/{id}")
	public String processDelete(@PathVariable("id") Long id) {
		studentServ.delete(id);
		return "redirect:/";
	}
}
