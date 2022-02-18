package com.quiz.lesson06;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.quiz.lesson06.bo.BookingBO;
import com.quiz.lesson06.model.Booking;

@Controller
public class Lesson06Quiz03Controller {

	@Autowired
	private BookingBO bookingBO;
	
	// db mysql 3-5
	//http://localhost/lesson06/booking_list
	@RequestMapping("/lesson06/booking_list")
	public String bookingListView(Model model) {
		
		//DB select
		List<Booking> booking = bookingBO.getBookingList();
		model.addAttribute("booking",booking);
		
		return "lesson06/bookingList";
		
		// 화면(뷰) 일때만 : model
		// data 일때만 : @ResponseBody
	}
	
	//lesson06/delete
	// 예약 삭제 - ajax 호출
	@ResponseBody
	@DeleteMapping("/lesson06/delete")
	public Map<String,String> delete(
			@RequestParam("id") int id) {
		
		//DB delete
		int count = bookingBO.deleteBookingById(id);
		
		Map<String, String> result = new HashMap<>();
		result.put("result", "success");
		if (count < 1) {
			result.put("result", "fail");
		}
		
		
		return result;
	}
	
	@RequestMapping("/lesson06/booking_reserve")
	public String bookingReserve() {
		return "lesson06/bookingReserve";
	}
	
	// 예약하기 추가 - AJAX 통신
	@PostMapping("/lesson06/add")
	@ResponseBody
	public Map<String, String> add(
			@RequestParam("name") String name,
			@RequestParam("date") String date,
			@RequestParam("day") int day,
			@RequestParam("headcount") int headcount,
			@RequestParam("phoneNumber") String phoneNumber
			
			// state도 반드시 기본값으로 넣어줘야 한다.
			// controller에서부터 넣어줘도 되도 되지만 신경쓰지 않게 Mapper에서 넣어준다.
			) {
		
		//DB insert
		int count = bookingBO.addBooking(name, date, day, headcount, phoneNumber);
		
		// result map -> json
		
		Map<String, String> result = new HashMap<>();
		// 서버가 어떻게 결과값을 내릴 것인지 약속한다.
		result.put("result", "success");
		result.put("code", "1");
		
		if (count < 1) {
			result.put("result","fail");
		}
		return result;
	}
	
	// 예약 조회
	@RequestMapping("/lesson06/booking_check")
	public String bookingCheck() {
		return "lesson06/bookingCheck";
	}
	
	// 예약 조회 - ajax
	@PostMapping("/lesson06/check")
	@ResponseBody
	public Map<String, Object> check(
			@RequestParam("name") String name,
			@RequestParam("phoneNumber") String phoneNumber
			) {
		
		// db select by name, phonenumber
		
		Booking booking = bookingBO.getBookingByNamePhoneNumber(name, phoneNumber);
		
		// 결과 map -> json
		Map<String, Object> result = new HashMap<>();
	
		
		if (booking != null) {
			// 성공시
			// {"result": "success",
			// "code" : "1",
			// "booking": {"name: "신보람", "phonenumber": "010-222-2222"}}
			
			result.put("result", "success");
			result.put("code", 1); //Object이기 때문에 숫자만 넣어줘도 된다.
			result.put("booking", booking); // 키로 불러와서 booking 값 내려준다.
		} else {
			// 실패시, 없으면
			// {"result": "fail", "code": "500"}
			
			result.put("result", "fail");
			result.put("code", 500);
		}
		
		
	
		return result;
		
		// controller는 bo만 알수 있다. dao에서 하는일 모른다.
		//정확하게 데이터가 안겹치게 하려면 List로 가져와야 한다.
	}
}
