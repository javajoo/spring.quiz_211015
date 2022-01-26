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
			@ModelAttribute Realtor realtor,
			Model model
			) {
		
		// db insert -> id 반환을 받고 
		// @ModelAttribute로 받아온 객체를 넣어준다.
		realtorBO.addRealtor(realtor);
		
		// db select -> 반환받은 id로 
		// 상황에 따라서 realtor를 재활용 할건지 새로 만들건지 판단해야 한다.
		realtor = realtorBO.getRealtorById(realtor.getId());
		
		// jsp에서 사용할 객체를 model에 담는다.
		model.addAttribute("realtor", realtor);
		
		
		return "lesson04/afterAddRealtor"; // 추가된 공인중개사 jsp
	}
}
