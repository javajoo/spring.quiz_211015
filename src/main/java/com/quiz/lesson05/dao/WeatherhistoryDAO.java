package com.quiz.lesson05.dao;

import org.springframework.stereotype.Repository;

import com.quiz.lesson05.model.Weatherhistory;

@Repository
public interface WeatherhistoryDAO {
	public void insertWeatherhistory(Weatherhistory weatherhistory);

	public Weatherhistory selectWeatherhistory(int id);
}
