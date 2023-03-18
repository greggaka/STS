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

import com.gregg.schoolmanagementsystem.models.Faculty;
import com.gregg.schoolmanagementsystem.services.AdminService;
import com.gregg.schoolmanagementsystem.services.ClasssService;
import com.gregg.schoolmanagementsystem.services.FacultyService;
import com.gregg.schoolmanagementsystem.services.SchoolService;

@Controller
@RequestMapping("/faculty")
public class FacultyController {

	private final AdminService adminServ;
	private final FacultyService facultyServ;
	private final SchoolService schoolServ;
	private final ClasssService classsServ;
	
	public FacultyController(FacultyService facultyServ, SchoolService schoolServ, AdminService adminServ, ClasssService classsServ) {
		this.facultyServ = facultyServ;
		this.schoolServ = schoolServ;
		this.adminServ = adminServ;
		this.classsServ = classsServ;
	}

	@GetMapping("/new")
	public String newFaculty(@ModelAttribute("faculty") Faculty faculty, HttpSession session, Model model) {
		if (session.getAttribute("admin_id") == null){
			return "redirect:/users/login/register";
		}
		model.addAttribute("loggedInAdmin", adminServ.getAdmin((Long) session.getAttribute("admin_id")));
		model.addAttribute("allSchools", schoolServ.getAll());
		model.addAttribute("allFaculty", facultyServ.getAll());
		return "faculty/facultyNew.jsp";
	}
	
	@PostMapping("/new")
	public String processFaculty(@Valid @ModelAttribute("faculty") Faculty faculty, BindingResult result) {
		if (result.hasErrors()) {
			return "faculty/facultyNew.jsp";
		}
		facultyServ.create(faculty);
		return "redirect:/";
	}
	
	@GetMapping("/{id}")
	public String viewOneFaculty (@PathVariable("id") Long id, Model model, HttpSession session) {
		Faculty faculty = facultyServ.getOne(id);
		model.addAttribute("loggedInAdmin", adminServ.getAdmin((Long) session.getAttribute("admin_id")));
		model.addAttribute("faculty", faculty);
		model.addAttribute("allFaculty", facultyServ.getAll());
		model.addAttribute("allClasses", classsServ.getAll());
		return "faculty/facultyView.jsp";
	}
	
	@GetMapping("/edit/{id}")
	public String editFaculty (@PathVariable("id") Long id, Model model, HttpSession session) {
		if (session.getAttribute("admin_id") == null){
			return "redirect:/users/login/register";
		}
		model.addAttribute("allSchools", schoolServ.getAll());
		model.addAttribute("allFaculty", facultyServ.getAll());
		model.addAttribute("allClasses", classsServ.getAll());
		Faculty faculty = facultyServ.getOne(id);
		model.addAttribute("faculty", faculty);
		return "faculty/facultyEdit.jsp";
	}
	
	@PutMapping("/edit/{id}")
	public String processEditFaculty(@PathVariable("id") Long id, @Valid @ModelAttribute("faculty") Faculty faculty, BindingResult result) {
		if (result.hasErrors()) {
			return "faculty/editFaculty.jsp";
		}
		facultyServ.update(faculty);
		return "redirect:/faculty/{id}";
	}
	
	@DeleteMapping("/{id}")
	public String processDelete(@PathVariable("id") Long id) {
		facultyServ.delete(id);
		return "redirect:/";
	}
	
	@GetMapping("/assign-class/{id}")
	public String assignClass(@PathVariable("id") Long id, Model model, HttpSession session) {
		Faculty faculty = facultyServ.getOne(id);
		model.addAttribute("loggedInAdmin", adminServ.getAdmin((Long) session.getAttribute("admin_id")));
		model.addAttribute("faculty", faculty);
		model.addAttribute("allClasses", classsServ.getAll());
		return "faculty/facultyAssignClass.jsp";
	}
	
	@PutMapping("/assign-class/{id}")
	public String processAssignClass(@PathVariable("id") Long id, @Valid @ModelAttribute("faculty") Faculty faculty, BindingResult result ) {
		facultyServ.update(faculty);
		return "redirect:/faculty/{id}";
	}
}
