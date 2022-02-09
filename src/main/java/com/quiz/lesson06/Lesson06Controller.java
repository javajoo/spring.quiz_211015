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
	// http://localhost/lesson06/add_favorite_view
	@RequestMapping("/lesson06/add_favorite_view")
	public String addFavorite() {
		return "lesson06/addFavorite";
	}

	// 유저 추가 기능
	// http://localhost/lesson06/add_favorite
	@ResponseBody
	@PostMapping("/lesson06/add_favorite")
	public String addFavorite(
			@RequestParam("name") String name,
			@RequestParam("url") String url
			
			) {
		
		// insert db
		favoriteBO.addFavorite(name, url);
		
		return "성공";
	}

	// 유저 목록 화면
	// http://localhost/lesson06/get_favorite
	@RequestMapping("/lesson06/get_favorite")
	public String getFavorite(
			Model model) {
		
		// select db
		List<Favorite> favorite = favoriteBO.getFavoriteList();

		model.addAttribute("favorite", favorite);
		return "lesson06/afterFavorite";
	}

}
