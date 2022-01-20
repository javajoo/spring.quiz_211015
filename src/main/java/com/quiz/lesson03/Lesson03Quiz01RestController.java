package com.quiz.lesson03;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.quiz.lesson03.bo.RealEstateBO;
import com.quiz.lesson03.model.RealEstate;

@RestController
@RequestMapping("lesson03/quiz01")
public class Lesson03Quiz01RestController {
	
	// 자바는 카멜케이스로 정의해주기!
	
	// 1. id로 select 하기
	@Autowired
	private RealEstateBO realEstateBO;
	
	//http://localhost/lesson03/quiz01/1?id=20
	@RequestMapping("/1")
	// ★ 단건 요청!!!!!!★
	public RealEstate quiz01_1(
			// value = 주소 ?뒤 파라미터 
			// 필수 파라미터로 받아온 id가 int id로 저장된다.
			@RequestParam(value="id") int id) {
		return realEstateBO.getRealEstateById(id); // jackson 라이브러리로 인해 json으로 변환
	}
	
	// 2. 월세 조건 select
	//http://localhost/lesson03/quiz01/2?rent_price=90
	@RequestMapping("/2")
	// 여러건 요청 <List>
	public List<RealEstate> quiz01_2(
			// @RequestParam의 value는 ?rent_price와 완전히 일치해야 한다.
			// 메소드 역할로 생각해야 한다.
			@RequestParam(value="rent_price") int rentPrice) {
		return realEstateBO.getRealEstateListByRentPrice(rentPrice);
	}
	
	// 3. 복합조건 select
	//http://localhost/lesson03/quiz01/3?area=90&price=130000
	@RequestMapping("/3")
	public List<RealEstate> quiz01_3(
			@RequestParam(value="area") int area,
			@RequestParam(value="price") int price ) {
		return realEstateBO.getRealEstateListByAreaPrice(area,price);
	}
	
	
	

}
