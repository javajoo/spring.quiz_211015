package com.quiz.lesson03;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.quiz.lesson03.bo.RealEstateBO;
import com.quiz.lesson03.model.RealEstate;

@RestController
public class Lesson03Quiz01RestController {

	// 1. id 로 select 하기
	@Autowired
	private RealEstateBO realEstateBO;
	
	//http://localhost/lesson03/quiz01/1?id=20
	@RequestMapping("/lesson03/quiz01/1")
	public RealEstate quiz01_1(
			@RequestParam(value="id") int id
			) {
		return realEstateBO.getRealEstate(id);
	}
	

	// 2. 월세 조건 select
	@Autowired
	private RealEstateBO realEstateBO1;
	
	//http://localhost/lesson03/quiz01/2?rent_price=200  이것만 됌 부등호 안됌!!
	//http://localhost/lesson03/quiz01/2?rent_price=90
	@RequestMapping("/lesson03/quiz01/2")
	public RealEstate quiz01_2(
			@RequestParam(value="rent_price") Integer rentPrice
			) {
		return realEstateBO1.getRealEstate1(rentPrice);
	}
	
	// 3. 복합조건 select
	@Autowired
	private RealEstateBO realEstateBO2;
	
	//http://localhost/lesson03/quiz01/3?area=90&price=130000
	@RequestMapping("/lesson03/quiz01/3")
	public RealEstate quiz01_3(
			@RequestParam(value="area") int area,
			@RequestParam(value="price") int price
			) {
		return realEstateBO2.getRealEstate2(area, price);
	}
	
	
	
	
	
}
