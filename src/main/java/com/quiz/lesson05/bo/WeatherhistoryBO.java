package com.quiz.lesson05.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.quiz.lesson05.dao.WeatherhistoryDAO;
import com.quiz.lesson05.model.Weatherhistory;

@Service
public class WeatherhistoryBO {

	@Autowired
	private WeatherhistoryDAO weatherhistoryDAO;
	
	public List<Weatherhistory> getWeatherhistoryList() {
		return weatherhistoryDAO.selectWeatherhistoryList();
	}
	
	public void addWeatherhistory(String date,String weather,String microDust,double temperatures,
			double precipitation,double windSpeed) {
		weatherhistoryDAO.insertWeatherhistory(date, weather, microDust, temperatures, precipitation, windSpeed);
	}
	
	
}
