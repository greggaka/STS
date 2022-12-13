package com.gregg.mvcdemo.controllers;

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
import org.springframework.web.bind.annotation.RequestParam;

import com.gregg.mvcdemo.models.Donation;
import com.gregg.mvcdemo.services.DonationService;
import com.gregg.mvcdemo.services.UserService;

@Controller
@RequestMapping ("/donations")
public class DonationController {

	public final DonationService donationServ;
	private final UserService userServ;
	
	public DonationController(DonationService donationServ, UserService userServ) {
		this.donationServ = donationServ;
		this.userServ = userServ;
	}
	
	@GetMapping("/all")
	public String allDonations(Model model) {
		model.addAttribute("allDonations", donationServ.getAll());
		model.addAttribute("donation", new Donation()); //to make "create new" form appear on show all page
		return "showAll.jsp";
	}
	
	@GetMapping("/search")
	public String searchDonation(@RequestParam("search") String search, Model model) {
		model.addAttribute("allDonations", donationServ.searchDonation(search));
		model.addAttribute("donation", new Donation());
		return "showAll.jsp";
	}
	
	@GetMapping("/one/{id}")
	public String oneDonation(@PathVariable("id") Long id, Model model) {
		Donation oneDonation = donationServ.findOne(id);
		model.addAttribute("oneDonation", oneDonation);
		return "oneDonation.jsp";
	}
	
	@GetMapping("/new")
	public String newDonation(@ModelAttribute("donation") Donation donation, Model model) {
		model.addAttribute("allUsers", userServ.findAll());
		return "newDonation.jsp";
	}
	
	@PostMapping("/new")
	public String processDonation1(@Valid @ModelAttribute("donation") Donation donation, BindingResult result, Model model) {
		if (result.hasErrors()) {
			model.addAttribute("allUsers", userServ.findAll());
			return"newDonation.jsp";
		}
		donationServ.create(donation);
		return "redirect:/donations/all";
	}
	
	@PostMapping("/all")
	public String processDonation(@Valid @ModelAttribute("donation") Donation donation, BindingResult result, Model model) {
		
		if (result.hasErrors()) {
			model.addAttribute("allDonations", donationServ.getAll());
			return"showAll.jsp";
		}
		donationServ.create(donation);
		return "redirect:/donations/all";
	}
	
	@GetMapping("/edit/{id}")
	public String editDonation(@PathVariable("id") Long id, Model model) {
		Donation donationToBeEdited = donationServ.findOne(id);
		model.addAttribute("donation", donationToBeEdited);
		return "donationEdit.jsp";
	}
	
	@PutMapping("/{id}")
	public String processEditDonation(@Valid @ModelAttribute("donation") Donation donation, BindingResult result) {
		if (result.hasErrors()) {
			return "donationEdit.jsp";
		}
		donationServ.update(donation);
		return "redirect:/";
	}
	
	@DeleteMapping("/{id}")
	public String processDelete(@PathVariable("id") Long id) {
		donationServ.deleteById(id);
		return "redirect:/donations/all";
	}

}
