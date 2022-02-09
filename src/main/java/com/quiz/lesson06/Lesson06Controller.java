package com.quiz.lesson06;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.quiz.lesson06.bo.FavoriteBO;
import com.quiz.lesson06.model.Favorite;

@Controller
public class Lesson06Controller {

	@Autowired
	private FavoriteBO favoriteBO;
	
	// 유저 추가 화면 (뷰만)
	//http://localhost/lesson06/add_Favorite_view
	@RequestMapping("/lesson06/add_Favorite_view")
	public String addFavorite() {
		return "lesson06/addFavorite";
	}
	

	
	// 유저 추가 기능 
	//http://localhost/lesson06/add_Favorite
	@ResponseBody
	@PostMapping("/lesson06/add_Favorite")
	public String addFavorite(
			@RequestParam("name") String name,
			@RequestParam("url") String url,
			Model model
			) {
		
		// insert db
		favoriteBO.addFavorite(name, url);
	
		// select db
		List<Favorite> favorite = favoriteBO.getFavoriteList();
		
		model.addAttribute("favorite",favorite);
		
		
		return "성공";
	}
	
	// 유저 목록 화면
	//http://localhost/lesson06/get_Favorite
	@RequestMapping("/lesson06/get_Favorite")
	public String getFavorite(	
			) {
	
		return "lesson06/afterFavorite";
	}
	
}
