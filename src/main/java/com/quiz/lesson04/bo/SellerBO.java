package com.quiz.lesson04.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.quiz.lesson04.dao.SellerDAO;
import com.quiz.lesson04.model.Seller;

@Service
public class SellerBO {

	@Autowired
	private SellerDAO sellerDAO;
	
	public void addSeller(String nickname,String profileImageUrl,double temperature) {
		sellerDAO.insertSeller(nickname, profileImageUrl, temperature);
		// DAO로 넘어갈때 메서드 변수명까지 복사해서 작업하면 편리하다.
	}
	
	public Seller getLastSeller() {
		return sellerDAO.selectLastSeller();
	}
	
	public Seller getSellerById(int id) {
		return sellerDAO.selectSellerById(id);
	}
	
}
