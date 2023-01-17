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
			<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
			<link rel="stylesheet" href="./resources/css/style.css">
			<title>게시글 수정</title>
			
		</head>
		
		
		</script>
		<body>
		
		<div class="centerContent">
			<h1 class="titleCenter">게시글 수정</h1>
			<form action="./update" method="POST" accept-charset="utf-8">
			<table>
				<input type="hidden" id="num" name="num" value="${updateBoard.num}" >
				<input type="hidden" id="regdate" name="regdate" value="${updateBoard.regdate}" >
			<div class="mb-3">
				<label for="boardTitle" class="form-label">제목</label>
				<input type="text" class="form-control" id="boardTitle" name="title" placeholder="제목을 입력해주세요" value="${updateBoard.title}">
			</div>
			<div class="mb-3">
				<label for="boardWriter" class="form-label">글쓴이</label>
				<input type="text" class="form-control" id="boardWriter" name="writer" value="${updateBoard.writer}" readonly="readonly">
			</div>
			<div>
				<label for="boardDate" class="form-label">작성날짜 :</label>
				<input type="date" id="boardDate" name="writeDate"  value="${updateBoard.writeDate}">
			</div>
			<div class="mb-3">
				<label for="boardContent" class="form-label">내용</label>
				<textarea class="form-control contentBox" id="boardContent" rows="3" name="content">${updateBoard.content}</textarea>
			</div>
			</table>
			<button type="submit" id="updateBtn" >수정 완료</button>
			<button type="button" id="listBtn" onclick="location.href='./boardList'">리스트</button>
			</form>
		</div>

		</body>
		<script>
			// $("#registerBtn").click(function(){
			// 	alert("이벤트 발생");
			// 	this.submit();
			// });

		</script>

		</html>

		