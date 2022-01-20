package com.quiz.lesson03.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.quiz.lesson03.model.RealEstate;

@Repository
public interface RealEstateDAO {

	public RealEstate setRealEstateById(int id);
	

	public List<RealEstate> setRealEstateListByRentPrice(int rentPrice);
	
	
	public List<RealEstate> setRealEstateListByAreaPrice(
			// @Param 파라미터들을 하나의 맵으로 만든다.
			// @RequestParam과 @Param과는 상관없다. xml에 보내는 값의 설정
			@Param("area") int area,
			@Param("price") int price);
	
	public int insertRealEstate(RealEstate realEstate);
}
