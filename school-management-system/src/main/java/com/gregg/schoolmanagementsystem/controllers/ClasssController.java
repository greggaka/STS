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
import com.gregg.schoolmanagementsystem.services.AdminService;
import com.gregg.schoolmanagementsystem.services.ClasssService;
import com.gregg.schoolmanagementsystem.services.FacultyService;
import com.gregg.schoolmanagementsystem.services.SchoolService;
import com.gregg.schoolmanagementsystem.services.StudentService;

@Controller
@RequestMapping("/classes")
public class ClasssController {

	private final AdminService adminServ;
	private final ClasssService classsServ;
	private final SchoolService schoolServ;
	private final FacultyService facultyServ;
	private final StudentService studentServ;
	
	public ClasssController(ClasssService classsServ, FacultyService facultyServ, SchoolService schoolServ, AdminService adminServ, StudentService studentServ) {
		this.adminServ = adminServ;
		this.classsServ = classsServ;
		this.schoolServ = schoolServ;
		this.facultyServ = facultyServ;
		this.studentServ = studentServ;
	}

	@GetMapping("/new")
	public String newClasss(@ModelAttribute("classs") Classs classs, HttpSession session, Model model) {
		if (session.getAttribute("admin_id") == null){
			return "redirect:/users/login/register";
		}
		model.addAttribute("allSchools", schoolServ.getAll());
		model.addAttribute("allClasses", classsServ.getAll());
		return "class/classNew.jsp";
	}
	
	@PostMapping("/new")
	public String processClasss(@Valid @ModelAttribute("classs") Classs classs, BindingResult result) {
		if (result.hasErrors()) {
			return "class/classNew.jsp";
		}
		classsServ.create(classs);
		return "redirect:/";
	}
	
	@GetMapping("/{id}")
	public String viewOneFaculty (@PathVariable("id") Long id, Model model, HttpSession session) {
		Classs classs = classsServ.getOne(id);
		model.addAttribute("loggedInAdmin", adminServ.getAdmin((Long) session.getAttribute("admin_id")));
		model.addAttribute("classs", classs);
		model.addAttribute("allClasses", classsServ.getAll());
		model.addAttribute("allStudents", studentServ.getAll());
		return "class/classView.jsp";
	}
	
	@GetMapping("/edit/{id}")
	public String editClasss (@PathVariable("id") Long id, Model model, HttpSession session) {
		if (session.getAttribute("admin_id") == null){
			return "redirect:/users/login/register";
		}
		model.addAttribute("allSchools", schoolServ.getAll());
		model.addAttribute("allClasses", classsServ.getAll());
		Classs classs = classsServ.getOne(id);
		model.addAttribute("classs", classs);
		return "class/classEdit.jsp";
	}
	
	@PutMapping("/edit/{id}")
	public String processEditClasss(@PathVariable("id") Long id, @Valid @ModelAttribute("classs") Classs classs, BindingResult result) {
		if (result.hasErrors()) {
			return "class/editClass.jsp";
		}
		classsServ.update(classs);
		return "redirect:/classes/{id}";
	}
	
	@DeleteMapping("/{id}")
	public String processDelete(@PathVariable("id") Long id) {
		classsServ.delete(id);
		return "redirect:/";
	}
	
	@GetMapping("/add-instructor/{id}")
	public String addInstructor(@PathVariable("id") Long id, Model model, HttpSession session) {
		if (session.getAttribute("admin_id") == null){
			return "redirect:/users/login/register";
		}
		model.addAttribute("allSchools", schoolServ.getAll());
		model.addAttribute("allClasses", classsServ.getAll());
		model.addAttribute("allFaculty", facultyServ.getAll());
		Classs classs = classsServ.getOne(id);
		model.addAttribute("classs", classs);
		return "class/classInstructor.jsp";
	}
	
	@PutMapping("/add-instructor/{id}")
	public String processAddInstructor(@PathVariable("id") Long id, @Valid @ModelAttribute("classs") Classs classs, BindingResult result) {
		if (result.hasErrors()) {
			return "class/classInstructor.jsp";
		}
		classsServ.update(classs);
		return "redirect:/classes/{id}";
	}
	
	@GetMapping("/add-student/{id}")
	public String addStudent(@PathVariable("id") Long id, Model model, HttpSession session) {
		if (session.getAttribute("admin_id") == null){
			return "redirect:/users/login/register";
		}
		model.addAttribute("allSchools", schoolServ.getAll());
		model.addAttribute("allClasses", classsServ.getAll());
		model.addAttribute("allFaculty", facultyServ.getAll());
		model.addAttribute("allStudents", studentServ.getAll());
		Classs classs = classsServ.getOne(id);
		model.addAttribute("classs", classs);
		return "class/classStudent.jsp";
	}
	
	@PutMapping("/add-student/{id}")
	public String processAddStudent(@PathVariable("id") Long id, @Valid @ModelAttribute("classs") Classs classs, BindingResult result) {
		if (result.hasErrors()) {
			return "class/classInstructor.jsp";
		}
		classsServ.update(classs);
		return "redirect:/classes/{id}";
	}
}
