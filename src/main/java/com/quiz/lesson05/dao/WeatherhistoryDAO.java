package com.quiz.lesson05.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.quiz.lesson05.model.Weatherhistory;

@Repository
public interface WeatherhistoryDAO {
	public List<Weatherhistory> selectWeatherhistoryList();
	// 파라미터 타입이 없으니까 mapper에서 안써도 된다.

	
	public void insertWeatherhistory(
			@Param("date") String date,
			@Param("weather") String weather,
			@Param("microDust") String microDust,
			@Param("temperatures") double temperatures,
			@Param("precipitation") double precipitation,
			@Param("windSpeed") double windSpeed);
}
