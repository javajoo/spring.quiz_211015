package com.quiz.lesson04.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.quiz.lesson04.model.Seller;

@Repository
public interface SellerDAO {
	public void insertSeller(
			@Param("nickname") String nickname,
			@Param("profileImageUrl") String profileImageUrl,
			@Param("temperature") double temperature
			);
	
	public Seller selectLastSeller();
	
	// 하나의 경우에는 @param 안해도 된다!!!
	public Seller selectSellerById(int id);
}
