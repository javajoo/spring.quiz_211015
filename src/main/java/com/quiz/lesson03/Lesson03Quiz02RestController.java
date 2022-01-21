package com.quiz.lesson03;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.quiz.lesson03.bo.RealEstateBO;
import com.quiz.lesson03.model.RealEstate;

@RestController
@RequestMapping("/lesson03/quiz02")
public class Lesson03Quiz02RestController {

	// 다른 테이블 객체 만들 때 @Autowired 다시 만들어준다.
	@Autowired
	private RealEstateBO realEstateBO;
	
	//http://localhost/lesson03/quiz02/1
	@RequestMapping("/1")
	public String quiz02_1() {
		// RealEstate 객체에 값을 세팅
		RealEstate realEstate = new RealEstate();
		realEstate.setRealtorId(3);
		realEstate.setAddress("푸르지용 리버 303동 1104호");
		realEstate.setArea(89);
		realEstate.setType("매매");
		realEstate.setPrice(100000);
		
		// BO insert 요청 => 입력된 성공 row 수 리턴
		int rowCount =  realEstateBO.addRealEstate(realEstate);
		
		// return 입력 성공: row
	
		
		return "입력성공 : " + rowCount;
	}	
	
	//http://localhost/lesson03/quiz02/2?realtor_id=5
	@RequestMapping("/2")
	public String quiz02_2(
			// ?realtor_id=5 : 리퀘스트에서 넘어온 파라미터의 값을 int realtorId 에 저장해준다. 필수:int
			@RequestParam(value="realtor_id" ) int realtorId
			) {
		
		int rowCount = realEstateBO.addRealEstateAsField(realtorId, "썅떼빌리버 오피스텔 814호",45, "월세", 100000, 120);
		
		return "입력 성공 : " + rowCount; 
	}
	
	
	
	
}
