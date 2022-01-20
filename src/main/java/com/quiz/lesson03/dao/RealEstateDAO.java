package com.quiz.lesson03.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.quiz.lesson03.model.RealEstate;

@Repository
public interface RealEstateDAO {
	public RealEstate selectRealEstate(@Param("id") int id);
	public RealEstate selectRealEstate1(@Param("rentPrice") Integer rentPrice);
	public RealEstate selectRealEstate2(@Param("area") int area, @Param("price") int price);
}

