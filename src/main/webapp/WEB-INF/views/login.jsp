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

			<!-- 부트스트랩 -->
			<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
			<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
			<link rel="stylesheet" href="./resources/css/style.css">

			<title>Insert title here</title>
		</head>

		<body>
			

		<div class="centerContent loginStyle">
			<h1>로그인 페이지</h1>
			<form id="loginFrm" method="POST" accept-charset="utf-8">
				

				<div class="form-label">
					<label for="joinId" class="form-label">아이디 :</label>
					<input type="text"  class="form-control" id="joinId" name="memId">
					
				</div>
				<div class="form-label">
					<label for="joinPwd" class="form-label">비밀번호 :</label>
					<input type="password" class="form-control" id="joinPwd" name="memPwd">
					
				</div>
				
				
				<button id="loginBtn">로그인</button>
				<button id="joinBtn" type="button" onclick="location.href='./join'">회원가입</button>
			</form>
		</div>
		</body>
		

		</html>

		