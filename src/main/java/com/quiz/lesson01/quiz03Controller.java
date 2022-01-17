package com.quiz.lesson01;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class quiz03Controller {

	@RequestMapping("/lesson01/quiz03/1")
	
	public String view() {
		
		return "lesson01/quiz03_1";
	}
}
