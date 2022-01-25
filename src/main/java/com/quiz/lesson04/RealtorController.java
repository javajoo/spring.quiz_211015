package com.quiz.lesson04;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.quiz.lesson04.bo.RealtorBO;
import com.quiz.lesson04.model.Realtor;

@Controller
@RequestMapping("/lesson04/quiz02")
public class RealtorController {
	
	// mappers 처음부터 틀만 만들어놓으면 에러뜬다??!?!?!?! db연동인데 입력을 안해서?
	
	@Autowired
	private RealtorBO realtorBO;
	
	
	//http://localhost/lesson04/quiz02/1
	@RequestMapping("/1")
	public String quiz02_1() {
		return "lesson04/addRealtor";
	}
	
	//http://localhost/lesson04/quiz02/add_realtor
	@PostMapping("/add_realtor")
	public String addRealtor(
			Model model,
			@ModelAttribute Realtor realtor
			) {
		
		// insert db
		realtorBO.addRealtor(realtor);
		
		// select db
		realtor = realtorBO.getRealtorById(realtor.getId());
		model.addAttribute("result", realtor);
		
		
		return "lesson04/afterRealtor";
	}
}
