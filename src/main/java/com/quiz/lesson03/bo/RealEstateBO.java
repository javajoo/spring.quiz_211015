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
		return realEstateDAO.selectRealEstateById(id);
	}

	public List<RealEstate> getRealEstateListByRentPrice(int rentPrice) {
		return realEstateDAO.selectRealEstateListByRentPrice(rentPrice);
	}

	// 파라미터 2개인 경우 2개 카멜로 써주면 된다.
	public List<RealEstate> getRealEstateListByAreaPrice(int area, int price) {
		return realEstateDAO.selectRealEstateListByAreaPrice(area, price);
		// 자동완성시 파라미터 믿지말기!!! 자동완성 되더라도 다시 확인해줘야 한다.
	}

	public int addRealEstate(RealEstate realEstate) {
		return realEstateDAO.insertRealEstate(realEstate);
	}

	// addRealEstate 똑같이 오버로딩(파라미터의 개수가 다르다.)으로 하거나 다른 이름으로 지정해줘도 된다.
	// id, 날짜 빼고 넣어주면 된다.
	public int addRealEstateAsField(int realtorId, String address, int area, String type, int price,
			Integer rentPrice) {

//			realtorId int 
//			address varchar(64) 
//			area int 
//			type char(2) 
//			price int 
//			rentPrice int nullable
		
		// 자동완성시 순서랑 갯수 맞는지 확인한다.
		return realEstateDAO.insertRealEstateAsField(realtorId, address, area, type, price, rentPrice);
	}
	
	public int updateRealEstateById(int id, String type, int price) {
		return realEstateDAO.updateRealEstateById(id, type, price);
	}
	
	public int deleteRealEstateById(int id) {
		return realEstateDAO.deleteRealEstateById(id);
	}
	
}
