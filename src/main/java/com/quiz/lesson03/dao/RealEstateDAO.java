package com.quiz.lesson03.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.quiz.lesson03.model.RealEstate;

@Repository
public interface RealEstateDAO {

	public RealEstate selectRealEstateById(int id);
	

	public List<RealEstate> selectRealEstateListByRentPrice(int rentPrice);
	
	
	public List<RealEstate> selectRealEstateListByAreaPrice(
			// @Param 파라미터들을 하나의 맵으로 만든다.
			// @RequestParam과 @Param과는 상관없다. xml에 보내는 값의 설정
			@Param("area") int area,
			@Param("price") int price);
	
	
	public int insertRealEstate(RealEstate realEstate);
	
	
	// 성공한 행 갯수를 리턴한다.
	// db랑 붙어있기 때문에 db 쿼리 이름을 써준다.
	public int insertRealEstateAsField(
			@Param("realtorId") int realtorId, 
			@Param("address") String address, 
			@Param("area") int area,
			@Param("type") String type, 
			@Param("price") int price, 
			@Param("rentPrice") Integer rentPrice);
	
	public int updateRealEstateById(
			
			@Param("id") int id, 
			@Param("type") String type, 
			@Param("price") int price);

	
	public int deleteRealEstateById(int id);
}
