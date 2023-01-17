<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

	<%
    request.setCharacterEncoding("UTF-8");
	%>
		<!DOCTYPE html>
		
		<html lang="en">

		<head>
			<meta charset="UTF-8">

			<script src="./resources/compnent/jquery-3.3.1.min.js"></script>
			<script src="./resources/compnent/jquery-ui-1.12.1.custom/jquery-ui.min.js"></script>
			
			<script src="./resources/compnent/jquery-loading-master/dist/jquery.loading.min.js"></script>
			<script src="./resources/compnent/jqueryPrint/jqueryPrint.js"></script>

			<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js?autoload=false"></script>
			
			<script src="./resources/js/util/util.js"></script>
			<script src="./resources/js/member/member.js" charset="UTF-8"></script>
			<script src="./resources/js/list/board.js" charset="UTF-8"></script>

			 <!-- 부트스트랩 -->
			 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
			 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
			 <link rel="stylesheet" href="./resources/css/style.css">
 



			<title>Insert title here</title>
		</head>

		<body>

			<div class="centerContent">
				<h1>작성 페이지</h1>
				<form action="./register" method="POST" accept-charset="utf-8">

				<!-- <div>
					<label for="boardTitle">제목 :</label>
					<input type="text" id="boardTitle" name="title">
				</div>
				<div>
					<label for="boardWriter">글쓴이 :</label>
					<input type="text" id="sesMemId" name="writer" value="${sesMemId}" readonly="readonly">
				</div>
				<div>
					<label for="boardContent">내용 :</label>
					<input type="text" id="boardcontent" name="content">
					<textarea name="" id="" cols="30" rows="10"></textarea>
				</div>
				<div>
					<label for="boardContent">작성날짜 :</label>
					<input type="date" id="boardDate" name="writeDate">
				</div> -->



				<div class="mb-3">
					<label for="boardTitle" class="form-label">제목</label>
					<input type="text" class="form-control" id="boardTitle" name="title" placeholder="제목을 입력해주세요" >
				</div>
				<div class="mb-3">
					<label for="boardWriter" class="form-label">글쓴이</label>
					<input type="text" class="form-control" id="boardWriter" name="writer" value="${sesMemId}" readonly>
				</div>
				<div>
					<label for="boardDate" class="form-label">작성날짜 :</label>
					<input type="date" id="writeDate" name="writeDate" >
				</div>
				<div class="mb-3">
					<label for="boardContent" class="form-label" style="width:100%;">내용</label>
					
					<textarea name="content" id="boardContent" style="width:100%; height:300px;" maxlength="300"></textarea>
				</div>
				
				<button type="button" id="registerBtn">등록</button>
				<button type="button" id="boardListBtn">목록</button>
			</form>

		</div>

		<script>
					
		$('#boardContent').keyup(function (e) {

		let content = $(this).val();

		// 글자수 세기
		if (content.length == 0 || content == '') {
			$('.textCount').text('0자');
		} else {
			$('.textCount').text(content.length + '자');
		}

		// 글자수 제한
		if (content.length > 200) {
			// 200자 부터는 타이핑 되지 않도록
			$(this).val($(this).val().substring(0, 200));
			// 200자 넘으면 알림창 뜨도록
			alert('글자수는 200자까지 입력 가능합니다.');
		};
		});


	


		</script>

		</body>
		

		</html>

		