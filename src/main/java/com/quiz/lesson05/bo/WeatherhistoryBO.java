package com.quiz.lesson05.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.quiz.lesson05.dao.WeatherhistoryDAO;
import com.quiz.lesson05.model.Weatherhistory;

@Service
public class WeatherhistoryBO {

	@Autowired
	private WeatherhistoryDAO weatherhistoryDAO;
	
	public void addWeatherhistory(Weatherhistory weatherhistory) {
		weatherhistoryDAO.insertWeatherhistory(weatherhistory);
	}
	
	public Weatherhistory selectWeatherhistory(int id) {
		return weatherhistoryDAO.selectWeatherhistory(id);
	}
}
