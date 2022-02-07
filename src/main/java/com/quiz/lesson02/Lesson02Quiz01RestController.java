package com.quiz.lesson02;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.quiz.lesson02.bo.StoreBO;
import com.quiz.lesson02.model.Store;

@Controller
public class Lesson02Quiz01RestController {

	@Autowired
	private StoreBO storeBO; // DI : Dependency Injection 필요할때마다 new를 하지 않아도 사용할 수 있다.
	
	// url 패턴은 겹치게 만들면 안된다.
	//http://localhost/lesson02/quiz01
	@RequestMapping("/lesson02/quiz01")
	public String quiz01(Model model) {
		List<Store> store =	storeBO.getStoreList(); // json (@ResponseBody가 있어서 jackson 라이브러리 작동)
		
		model.addAttribute("store",store);
		return "lesson05/quiz06";
	}
}
