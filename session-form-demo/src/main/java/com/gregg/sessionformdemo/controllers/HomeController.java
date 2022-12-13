package com.gregg.sessionformdemo.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class HomeController {

	@GetMapping("/")
	public String setCount(HttpSession session) {
		if (session.getAttribute("count") == null) {
			session.setAttribute("count", 0);			
		}
		Integer tempCount = (Integer)session.getAttribute("count");
		tempCount++;
		session.setAttribute("count", tempCount);
		return "counterPage.jsp";
	}
	
	@GetMapping("/get/count")
	public String getCount() {
		return "countGet.jsp";
	}
	
	@GetMapping("/search")
	public String searchForm () {
		return "searchForm.jsp";
	}
	
	@GetMapping("/results")
	public String displayResults(@RequestParam("test") String keyword, Model model) {
		model.addAttribute("results", keyword);
		return "results.jsp";
	}
	
	@GetMapping("/review/form")
	public String renderReviewForm() {
		return "postMethodForm/reviewForm.jsp";
	}
	
	@PostMapping("/review/process")
	public String processForm(@RequestParam("movie") String movie, @RequestParam("comment") String comment, @RequestParam("rating") int rating, HttpSession session, RedirectAttributes redirectAttributes, @RequestParam("userId") String userId) {
		boolean isValid = true;
		if (rating > 10 || rating < 0) {
			isValid = false;
			redirectAttributes.addFlashAttribute("ratingError", "Please keep rating between 0 - 10");
			
		}
		if (movie.length() < 2) {
			isValid = false;
			redirectAttributes.addFlashAttribute("movieError", "Movie needs to be more than 2 characters");
		}
		if (isValid == false) {
			return "redirect:/review/form";			
		}
		session.setAttribute("userId", userId);
		session.setAttribute("movie", movie);
		session.setAttribute("comment", comment);
		session.setAttribute("rating", rating);
		return "redirect:/review/display";
	}
	
	@GetMapping("/review/display")
	public String displayForm() {
		return "postMethodForm/displayReviewForm.jsp";
	}
}
