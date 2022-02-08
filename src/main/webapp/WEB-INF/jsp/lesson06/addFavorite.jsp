<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>즐겨  찾기 추가하기</title>
<!-- bootstrap -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
	integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
	crossorigin="anonymous"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
	integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
	crossorigin="anonymous"></script>
</head>
<body>
	<div class="container">
		<h1>즐겨 찾기 추가하기</h1>
		<div class="form-group">
			<label for="name">제목</label>
			<input type="text" class="form-control" id="name" name="name">
		</div>
		
		<div class="form-group">
			<label for="url">주소</label>
			<input type="text" class="form-control" id="url" name="url">
		</div>
		<button type="button" class="btn btn-success form-control" id="addBtn">추가</button>
	</div>
</body>
<script>
	$(document).ready(function(){
		$('#addBtn').on('click',function(e){
			let name = $('#name').val().trim();
			if(name.length < 1) {
				alert("이름을 입력 해주세요")
				return;
			}
			
			let url = $('#url').val().trim();
			if(url == '') {
				alert("url을 입력 해주세요")
				return;
			}
		});
		
		$.ajax({
			type: 'post'
			, url: '/lesson05/addFavorite'
			, date: {'name':name, 'url':url}
			, success: function(data) {
				alert(data);
			}
			, error: function(e) {
				alert("error: " + e)
			}
		});
	});
</script>
</html>