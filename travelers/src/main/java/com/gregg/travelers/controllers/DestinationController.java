package com.gregg.travelers.controllers;

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

import com.gregg.travelers.models.Destination;
import com.gregg.travelers.services.DestinationService;

@Controller
@RequestMapping("/destinations")
public class DestinationController {

	private final DestinationService destinationServ;
	
	public DestinationController(DestinationService destinationServ) {
		this.destinationServ = destinationServ;
	}
	
	@GetMapping("/create")
	public String createDestination(@ModelAttribute ("destination") Destination destination, HttpSession session) {
		if (session.getAttribute("user_id") == null){
			return "redirect:/users/login/register";
		}
		return "destination/destinationCreate.jsp";
	}
	
	@PostMapping("/create")
	public String processDestination(@Valid @ModelAttribute("destination") Destination destination, BindingResult result) {
		if (result.hasErrors()) {
			return "destination/destinationCreate.jsp";
		}
		destinationServ.create(destination);
		return "redirect:/";
	}
	
	@GetMapping("/edit/{id}")
	public String editDestination(@PathVariable ("id") Long id, Model model, HttpSession session) {
		if (session.getAttribute("user_id") == null){
			return "redirect:/users/login/register";
		}
		Destination destination = destinationServ.getOne(id);
		model.addAttribute("destination", destination);
		return "destination/destinationEdit.jsp";
	}
	
	@PutMapping("/edit/{id}")
	public String processEditDestination(@PathVariable("id") Long id, @Valid @ModelAttribute("destination") Destination destination, BindingResult result) {
		if (result.hasErrors()) {
			return "destination/destinationEdit.jsp";
		}
		destinationServ.update(destination);
		return "redirect:/";
	}
	
	@DeleteMapping("/delete/{id}")
	public String deleteDestination(@PathVariable("id") Long id) {
		destinationServ.delete(id);
		return "redirect:/";
	}
	
	@GetMapping("/view/{id}")
	public String viewDestination(@PathVariable("id") Long id, Model model) {
		Destination destination = destinationServ.getOne(id);
		model.addAttribute("destination", destination);
		return "destination/destinationView.jsp";
	}
}
