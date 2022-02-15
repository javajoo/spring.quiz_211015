package com.quiz.lesson06.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.quiz.lesson06.dao.BookingDAO;
import com.quiz.lesson06.model.Booking;

@Service
public class BookingBO {
	@Autowired
	private BookingDAO bookingDAO;

	public List<Booking> getBookingList() {
		return bookingDAO.selectBookingList();
	}
	
	public int deleteBookingById(int id) {
		return bookingDAO.deleteBookingById(id);
	}
	
	public int addBooking(String name,String date,int day,int headcount,String phoneNumber) {
		return bookingDAO.insertBooking(name, date, day, headcount, phoneNumber);
	}
	

	public Booking getBookingByNamePhoneNumber(String name, String phoneNumber) {
		List<Booking> bookingList = bookingDAO.selectBookingByNamePhoneNumber(name, phoneNumber);
		// [] 
		// 데이터가 없을 때
		Booking booking = null;
		
		// 한건만 받으려고 한다고 가정
		// 처음꺼
		//bookingList.get(0);
		// 마지막꺼
		// 데이터가 있을 때
		if (bookingList.isEmpty() == false) { 
			booking = bookingList.get(bookingList.size()-1);
		}
		return booking;
	}
}
