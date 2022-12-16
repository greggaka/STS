package com.gregg.travelers.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
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
			return "redirect:/";
		}
		return "destination/destinationCreate.jsp";
	}

}
