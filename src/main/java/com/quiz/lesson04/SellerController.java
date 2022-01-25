package com.quiz.lesson04;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.quiz.lesson04.bo.SellerBO;
import com.quiz.lesson04.model.Seller;

@Controller
@RequestMapping("lesson04/quiz01")
public class SellerController {

	// http://localhost/lesson04/quiz01/1 -> 판매자 추가 view 화면
	// 주소 치고 들어가는 방식 : get방식!!!!!!!!!!!!
	// @RequestMapping(path = "1", method= RequestMethod.GET)
	@RequestMapping("/1")
	public String addSeller() {
		return "lesson04/addSeller";
		// 리턴되는 view의 경로 맨앞에 / 없다!!
	}

	@Autowired
	private SellerBO sellerBO;

	// 1. seller 추가
	// 추가 버튼을 눌렀을때의 화면
	@PostMapping("/add_seller")
	public String addSeller(
			// 자바쪽으로 넘어오면 필드명으로 맞춰주는게 좋다.
			@RequestParam("nickname") String nickname,
			@RequestParam(value = "profileImageUrl", required = false) String profileImageUrl,
			@RequestParam("temperature") double temperature) {

		// db insert
		sellerBO.addSeller(nickname, profileImageUrl, temperature);
		return "lesson04/afterAddSeller";
		// 브레이크 포인트 걸어서 잘 되었는지 확인한다. 다음 단계로 잘 넘어가는지 확인한다.
	}

	// 2. seller 출력
	// 1번 경로랑은 상관없다!
	// ID가 있으면 ID, 없으면 최신내용을 나오게 하기
	//http://localhost/lesson04/quiz01/seller_info
	//http://localhost/lesson04/quiz01/seller_info?id=1
	@GetMapping("/seller_info")
	public String getSellerInfo(Model model,
			// null 값 허용해야 하니까 Integer로 해줘야 한다.
			@RequestParam(value = "id", required = false) Integer id) {

		// view 화면은 똑같은데 어떻게 가져오는지 방식이 달라진다.
		if (id == null) {
			// 최근 seller 1행 정보 select
			Seller seller = sellerBO.getLastSeller();
			model.addAttribute("seller", seller);
		}

		else {
			// 새로운 메소드를 만들어야 한다.
			Seller seller = sellerBO.getSellerById(id);
			model.addAttribute("seller", seller);

		}

		return "lesson04/sellerInfo";
	}

	// 3. seller 검색 출력
	// ID가 있으면 ID, 없으면 최신내용을 나오게 하기
	// http://localhost/lesson04/quiz01/seller_info
	// http://localhost/lesson04/quiz01/seller_info?id=1
//	@GetMapping("/seller_info")
//	public String getSellerInfoById(
//			Model model,
//			@RequestParam(value="id", required = false) int id) {
//		Seller seller = sellerBO.getSellerInfoById(id);
//		model.addAttribute("result",seller);
//		
//		return "lesson04/sellerInfo";
//	}

}
