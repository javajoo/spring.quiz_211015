package com.quiz.lesson02.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.quiz.lesson02.model.Store;

@Repository
public interface StoreDAO {

	// 구현체가 없다.
	public List<Store> selectStoreList();
}
