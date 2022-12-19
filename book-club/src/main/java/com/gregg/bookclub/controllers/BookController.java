package com.gregg.bookclub.controllers;

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

import com.gregg.bookclub.models.Book;
import com.gregg.bookclub.services.BookService;

@Controller
@RequestMapping("/books")
public class BookController {
	
	private final BookService bookServ;

	public BookController(BookService bookServ) {
		this.bookServ = bookServ;
	}

	@GetMapping("/new")
	public String newBook(@ModelAttribute("book") Book book, HttpSession session) {
		if (session.getAttribute("user_id") == null){
			return "redirect:/users/login/register";
		}
		return "book/new.jsp";
	}
	
	@PostMapping("/new")
	public String processBook(@Valid @ModelAttribute("book") Book book, BindingResult result) {
		if (result.hasErrors()) {
			return "book/new.jsp";
		}
		bookServ.create(book);
		return "redirect:/";
	}
	
	@GetMapping("/{id}")
	public String viewBook(@PathVariable("id") Long id, Model model) {
		Book book = bookServ.getOne(id);
		model.addAttribute("book", book);
		return "book/view.jsp";
	}
	
	@GetMapping("/edit/{id}")
	public String editBook(@PathVariable ("id") Long id, Model model, HttpSession session) {
		if (session.getAttribute("user_id") == null){
			return "redirect:/users/login/register";
		}
		Book book = bookServ.getOne(id);
		model.addAttribute("book", book);
		return "book/edit.jsp";
	}
	
	@PutMapping("/edit/{id}")
	public String processEditBook(@PathVariable("id") Long id, @Valid @ModelAttribute("book") Book book, BindingResult result) {
		if (result.hasErrors()) {
			return "book/edit.jsp";
		}
		bookServ.update(book);
		return "redirect:/";
	}
	
	@DeleteMapping("/delete/{id}")
	public String deleteBook(@PathVariable("id") Long id) {
		bookServ.delete(id);
		return "redirect:/";
	}
	
	
}
