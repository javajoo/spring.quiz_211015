package com.quiz.lesson04;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class RealtorController {

	//http://localhost/lesson04/quiz02/1
	@GetMapping("/lesson04/quiz02/1")
	public String quiz02_1() {
		return "lesson04/addRealtor";
	}
	
	@PostMapping("/lesson04/quiz02/add_realtor")
	public String addRealtor() {
		
	}
}
