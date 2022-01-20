package com.quiz.lesson03.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.quiz.lesson03.dao.RealEstateDAO;
import com.quiz.lesson03.model.RealEstate;


@Service
public class RealEstateBO {

	@Autowired
	private RealEstateDAO realEstateDAO;
	
	// 파라미터로 받는 id까지 넣어주면 더 명확해진다.
	// int id : id 필수값, null갑값 들어갈 수 없다.<규칙>
	public RealEstate getRealEstateById(int id) {
		return realEstateDAO.setRealEstateById(id);
	}
	
	
	public List<RealEstate> getRealEstateListByRentPrice(int rentPrice) {
		return realEstateDAO.setRealEstateListByRentPrice(rentPrice);
	}
	
	// 파라미터 2개인 경우 2개 카멜로 써주면 된다.
	public List<RealEstate> getRealEstateListByAreaPrice(int area, int price) {
		return realEstateDAO.setRealEstateListByAreaPrice(area,price);
		// 자동완성시 파라미터 믿지말기!!! 자동완성 되더라도 다시 확인해줘야 한다.
	}
	
	public int addRealEstate(RealEstate realEstate) {
		return realEstateDAO.insertRealEstate(realEstate);
	}
}
