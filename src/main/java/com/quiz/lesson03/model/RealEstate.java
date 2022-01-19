package com.quiz.lesson03.model;

import java.util.Date;

public class RealEstate {

//	id int AI PK 
//	realtorId int 
//	address varchar(64) 
//	area int 
//	type char(2) 
//	price int 
//	rentPrice int 
//	createdAt timestamp 
//	updatedAt timestamp

	private int id;
	private int realtorId;
	private String aaddress;
	private int area;
	private String type;
	private int price;
	private int rentPrice;
	private Date createdAt;
	private Date updatedAt;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getRealtorId() {
		return realtorId;
	}

	public void setRealtorId(int realtorId) {
		this.realtorId = realtorId;
	}

	public String getAaddress() {
		return aaddress;
	}

	public void setAaddress(String aaddress) {
		this.aaddress = aaddress;
	}

	public int getArea() {
		return area;
	}

	public void setArea(int area) {
		this.area = area;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getRentPrice() {
		return rentPrice;
	}

	public void setRentPrice(int rentPrice) {
		this.rentPrice = rentPrice;
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
