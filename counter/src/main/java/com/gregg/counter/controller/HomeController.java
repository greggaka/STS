package com.gregg.counter.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {

	@GetMapping("/your_server")
	public String serverMain(HttpSession session) {
		if (session.getAttribute("count") == null) {
			session.setAttribute("count", 0);
		}
		Integer tempCount = (Integer) session.getAttribute("count");
		tempCount++;
		session.setAttribute("count", tempCount);
		return "server.jsp";
	}

	@GetMapping("/your_server/counter")
	public String serverCounter() {
		return "serverCounter.jsp";
	}
}
