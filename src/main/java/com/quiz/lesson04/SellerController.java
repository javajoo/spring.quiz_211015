package com.quiz.lesson04;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.quiz.lesson04.bo.SellerBO;
import com.quiz.lesson04.model.Seller;

@Controller
@RequestMapping("lesson04/quiz01")
public class SellerController {

	// view 경로
	//http://localhost/lesson04/quiz01/1
	@RequestMapping(path = "1", method= RequestMethod.GET)
	public String addSeller() {
		return "lesson04/addSeller"; 
	}
	
	@Autowired
	private SellerBO sellerBO;
	
	// 1. seller 추가
	@PostMapping("/add_seller")
	public String addSeller(
			@RequestParam("nickname") String nickname,
			@RequestParam(value="profileImageUrl", required = false) String profileImageUrl,
			@RequestParam("temperature") double temperature
			) {
		sellerBO.addSeller(nickname, profileImageUrl, temperature);
		return "lesson04/afterAddSeller";
	}
	
	// 2. seller 출력
	//http://localhost/lesson04/quiz01/seller_info
//	@GetMapping("/seller_info")
//	public String getSellerInfo(
//			Model model) {
//		Seller seller = sellerBO.getSellerInfo();
//		model.addAttribute("result",seller);
//		
//		return "lesson04/sellerInfo";
//	}
	
	// 3. seller 검색 출력
	//http://localhost/lesson04/quiz01/seller_info?id=1
	@GetMapping("/seller_info")
	public String getSellerInfoById(
			Model model,
			@RequestParam(value="id", required = false) int id) {
		Seller seller = sellerBO.getSellerInfoById(id);
		model.addAttribute("result",seller);
		
		return "lesson04/sellerInfo";
	}

	
}
