package com.quiz.lesson06;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	
	//http://localhost/lesson06/booking_list
	@RequestMapping("/lesson06/booking_list")
	public String bookingListView(Model model) {
		
		//DB select
		List<Booking> booking = bookingBO.getBookingList();
		model.addAttribute("booking",booking);
		
		return "lesson06/bookingList";
	}
	
	//lesson06/delete
	@ResponseBody
	@PostMapping("/lesson06/delete")
	public Map<String,String> delete(
			@RequestParam("id") int id) {
		
		//DB select
		bookingBO.deleteBooking(id);
		
		Map<String, String> result = new HashMap<>();
		result.put("result", "success");
		
		
		return result;
	}
	
	//@ResponseBody()
	//@PostMapping("/lesson06/booking_reserve")
	@RequestMapping("/lesson06/booking_reserve")
	public String bookingReserve() {
		return "lesson06/bookingReserve";
	}
	
}
