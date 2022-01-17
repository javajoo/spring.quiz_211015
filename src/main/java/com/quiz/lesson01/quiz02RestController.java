package com.quiz.lesson01;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RequestMapping("/lesson01/quiz02")
@RestController
public class quiz02RestController {

	// http://localhost:8080/lesson01/quiz02/1
	@RequestMapping("/1")
	public List<Map<String, Object>> print1() {
		
		// [] : list,  {} : map
		List<Map<String, Object>> list = new ArrayList<>();
		Map<String, Object> map = new HashMap<>(); // 하나의 맵이 생김
		map.put("rate", 15);
		map.put("directior", "봉준호");
		map.put("time", 131);
		map.put("title", "기생충");
		list.add(map); // 맵의 첫번째 칸에 들어간다.

		// 처음 만든 map 재활용하면서(새로 만들려면 이름 다르게 해서 해줘야 한다.) new로 새로 생성해준다.
		// 맵을 새로 생성할때마다 재활용을 해준다.
		
		// 리스트 인덱스 0
		map = new HashMap<>(); 
		map.put("rate", 0);
		map.put("directior", "로베르토 베니니");
		map.put("time", 116);
		map.put("title", "인생은 아름다워");
		list.add(map);

		// 리스트 인덱스 1
		map = new HashMap<>();
		map.put("rate", 12);
		map.put("directior", "크리스토퍼 놀란");
		map.put("time", 147);
		map.put("title", "인셉션");
		list.add(map);

		// 리스트 인덱스 2
		map = new HashMap<>();
		map.put("rate", 15);
		map.put("directior", "프란시스 로렌스");
		map.put("time", 137);
		map.put("title", "헝거게임");
		list.add(map);

		return list;

	}

	// http://localhost:8080/lesson01/quiz02/2
	@RequestMapping("/2")
	public List<Board> print2() { // <Board> class 넣어주면 된다.
		List<Board> list = new ArrayList<>();

		// 리스트 인덱스 0
		Board data = new Board(); 
		data.setTitle("안녕하세요 가입인사 드립니다.");
		data.setUser("hagulu");
		data.setContent("안녕하세요. 가입했어요. 앞으로 잘 부탁 드립니다. 활동 열심히 하겠습니다.");
		list.add(data);

		// 리스트 인덱스 1
		data = new Board();
		data.setTitle("헐 대박");
		data.setUser("bada");
		data.setContent("오늘 목요일이 었어... 금요일인줄");
		list.add(data);

		// 리스트 인덱스 2
		data = new Board();
		data.setTitle("오늘 데이트 한 이야기 해드릴게요.");
		data.setUser("dulumary");
		data.setContent("....");
		list.add(data);

		return list;
	}

	// http://localhost:8080/lesson01/quiz02/3
	@RequestMapping("/3")
	public ResponseEntity<Board> print3() {

		List<Board> list = new ArrayList<>();

		Board data = new Board();
		data.setTitle("안녕하세요 가입인사 드립니다.");
		data.setUser("hagulu");
		data.setContent("안녕하세요. 가입했어요. 앞으로 잘 부탁 드립니다. 활동 열심히 하겠습니다.");
		list.add(data);

		return new ResponseEntity<>(data, HttpStatus.INTERNAL_SERVER_ERROR);
								 //  객체,   에러처리
	}

}
