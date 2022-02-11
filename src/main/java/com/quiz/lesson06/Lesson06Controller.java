package com.quiz.lesson06;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

	// 즐겨찾기 추가 화면 (뷰만)
	//http://localhost/lesson06/add_favorite_view
	@RequestMapping("/lesson06/add_favorite_view")
	public String addFavoriteView() {
		return "lesson06/addFavorite";
	}

	
	// 여기서는 즐겨찾기 목록 만들 수 없기에 새로운 메서드 만들어줘야 한다.
	// 즐겨찾기 추가 기능 - AJAX 호출로 들어오는 요청 (String으로 반드시 data값을 리턴해줘야 한다)
	//http://localhost/lesson06/add_favorite
	@ResponseBody
	@PostMapping("/lesson06/add_favorite")
	public Map<String, String> addFavorite(
			@RequestParam("name") String name,
			@RequestParam("url") String url
			
			) {
		
		// insert db
		favoriteBO.addFavorite(name, url);
		
		// return map -> return json String
		Map<String,String> result = new HashMap<>();
		result.put("result","success");
		result.put("code", "1");
		
		return result;
	}

	// 즐겨찾기 목록 화면
	//http://localhost/lesson06/get_favorite
	@RequestMapping("/lesson06/get_favorite")
	public String getFavorite(
			Model model) {
		
		// select db
		List<Favorite> favoriteList = favoriteBO.getFavoriteList();
		model.addAttribute("favoriteList", favoriteList);
		return "lesson06/afterFavorite";
	}
	
	// 주소 중복 확인 - AJAX 호출로 들어오는 요청(String)
	@PostMapping("/lesson06/is_duplication")
	@ResponseBody
	public Map<String,Boolean> isDuplication(
			@RequestParam("url") String url) {
		
		// 중복 확인 DB
		//boolean existFavorite = favoriteBO.existFavoriteByUrl(url);
		Favorite favorite = favoriteBO.getFavoriteByUrl(url);
		
		//Map 구성 후 리턴
		Map<String,Boolean> result = new HashMap<>();
		//result.put("is_duplication", existFavorite);
		
		result.put("result",true);
		
		if (favorite == null) {
			// 중복되지 않음
			result.put("result",false);
		}
		
		return result;
	}
	
	
	// 즐겨찾기 삭제 - AJAX 호출로 들어오는 요청(String)
	@ResponseBody
	@PostMapping("/lesson06/delete_favorite")
	public Map<String, String> deleteFavorite(
			@RequestParam("id") int id) {
		
		// DB delete
		favoriteBO.deleteFavoriteById(id);
		
		Map<String, String> result = new HashMap<>();
		result.put("result", "sucess");
		
		return result;
	}

}
