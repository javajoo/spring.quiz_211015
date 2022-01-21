package com.quiz.lesson03;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.quiz.lesson03.bo.RealEstateBO;

@RestController
public class Lesson03Quiz03RestController {

	@Autowired
	private RealEstateBO realEstateBO;
	
	//http://localhost/lesson03/quiz03/1?id=8&type=매매&price=70000
	@RequestMapping("/lesson03/quiz03/1")
	public String quiz03_1(
			// 필수 파라미터면 value안써줘도 된다. 
			@RequestParam("id") int id,
			@RequestParam("type") String type,
			@RequestParam("price") int price) {
		
		int rowCount = realEstateBO.updateRealEstateById(id, type, price);
		
		return "수정 성공 : " + rowCount;
		
	}
}
