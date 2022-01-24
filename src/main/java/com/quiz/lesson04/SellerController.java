package com.quiz.lesson04;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.quiz.lesson04.bo.SellerBO;

@Controller
@RequestMapping("/lesson04/quiz01")
public class SellerController {

	
	@Autowired
	private SellerBO sellerBO;
	
	//http://localhost/lesson04/quiz01/1
	@RequestMapping(path ="1" , method =RequestMethod.GET)
	public String addSeller() {
		return "/lesson04/addSeller";
		
	}
	
	
	//http://localhost/lesson04/quiz01/seller_info
	@PostMapping("/seller_info")
	public String sellerInfo(
			@RequestParam("nickname") String nickname,
			@RequestParam(value = "profileImageUrl", required = false) String profileImageUrl,
			@RequestParam("temperature") double temperature
			) {
		
		sellerBO.addSeller(nickname, profileImageUrl, temperature);
		return "lesson04/afterAddSeller";
	}
	
	@GetMapping()
	
	
}
