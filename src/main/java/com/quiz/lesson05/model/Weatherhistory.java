package com.quiz.lesson05.model;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class Weatherhistory {

	private int id;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	// 스트링은 date로 바꿀 수 없다. 넘어오는 패턴을 똑같이 설정해준다.
	// moedel 에서랑 나머지 class에서랑 다르게 설정해야한다!!!
	private Date date;
	private String weather;
	private double temperatures;
	private double precipitation;
	private String microDust;
	private double windSpeed;
	private Date createdAt;
	private Date updatedAt;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public String getWeather() {
		return weather;
	}

	public void setWeather(String weather) {
		this.weather = weather;
	}

	public double getTemperatures() {
		return temperatures;
	}

	public void setTemperatures(double temperatures) {
		this.temperatures = temperatures;
	}

	public double getPrecipitation() {
		return precipitation;
	}

	public void setPrecipitation(double precipitation) {
		this.precipitation = precipitation;
	}

	public String getMicroDust() {
		return microDust;
	}

	public void setMicroDust(String microDust) {
		this.microDust = microDust;
	}

	public double getWindSpeed() {
		return windSpeed;
	}

	public void setWindSpeed(double windSpeed) {
		this.windSpeed = windSpeed;
	}

	public Date getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}

	public Date getUpdatedAt() {
		return updatedAt;
	}

	public void setUpdatedAt(Date updatedAt) {
		this.updatedAt = updatedAt;
	}

}
