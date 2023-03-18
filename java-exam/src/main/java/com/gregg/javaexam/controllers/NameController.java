package com.gregg.javaexam.controllers;

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

import com.gregg.javaexam.models.Name;
import com.gregg.javaexam.services.NameService;

@Controller
@RequestMapping("/names")
public class NameController {
	
	private final NameService nameServ;

	public NameController(NameService nameServ) {
		this.nameServ = nameServ;
	}
	
	@GetMapping("/new")
	public String newName(@ModelAttribute("name") Name name, HttpSession session) {
		if (session.getAttribute("user_id") == null){
			return "redirect:/users/login/register";
		}
		return "name/new.jsp";
	}
	
	@PostMapping("/new")
	public String processBook(@Valid @ModelAttribute("name") Name name, BindingResult result) {
		if (result.hasErrors()) {
			return "name/new.jsp";
		}
		nameServ.create(name);
		return "redirect:/";
	}
	
	@GetMapping("/{id}")
	public String viewName(@PathVariable("id") Long id, Model model) {
		Name name = nameServ.getOne(id);
		model.addAttribute("name", name);
		return "name/view.jsp";
	}
	
	@GetMapping("/edit/{id}")
	public String editName(@PathVariable ("id") Long id, Model model, HttpSession session) {
		if (session.getAttribute("user_id") == null){
			return "redirect:/users/login/register";
		}
		Name name = nameServ.getOne(id);
		model.addAttribute("name", name);
		return "name/edit.jsp";
	}
	
	@PutMapping("/edit/{id}")
	public String processEditName(@PathVariable("id") Long id, @Valid @ModelAttribute("name") Name name, BindingResult result) {
		if (result.hasErrors()) {
			return "name/edit.jsp";
		}
		nameServ.update(name);
		return "redirect:/";
	}
	
	@DeleteMapping("/delete/{id}")
	public String deleteName(@PathVariable("id") Long id) {
		nameServ.delete(id);
		return "redirect:/";
	}

}
