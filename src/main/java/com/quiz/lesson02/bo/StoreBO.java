package com.quiz.lesson02.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.quiz.lesson02.dao.StoreDAO;
import com.quiz.lesson02.model.Store;

@Service
public class StoreBO {
	
	@Autowired
	private StoreDAO storeDAO;	
	
	public List<Store> getStoreList() {
		// 이름 만들때 List 같은거 없으면 맨 뒤에 아무것도 안붙이면 된다.
		return storeDAO.selectStoreList();
	}
}
