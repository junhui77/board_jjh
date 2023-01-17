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

			 <style>
				.login-row 
#idChkresult, 
#pswdChkresult, 
#pswdDplChkresult,
#nameChkresult,
#emailChkresult,
#genderChkresult,
#telChkresult,
#zcodeChkresult{ 
	color: red;
	font-size: 12px;
}
.login-row #genderChkresult{
	float: right;
	margin-right: 120px;
}
.login-row #userZipcode {
	width: 23%;
	margin-right: 10px;
}
.login-row #userName {
	width: 45%;
	margin-right: 30px;
}
.login-row #userGender {
	width: 45%;
}
.login-row #userZipcodeSearchBtn {
	padding: 8px;
	background-color: white; 
  	color: black; 
	border-radius: 5px;
 	border: 1px solid #ccc;
  	text-align: center;
  	text-decoration: none;
  	display: inline-block;
  	transition-duration: 0.4s;
  	cursor: pointer;
  	font-size: 15px;
}

			 </style>

			<title>회원가입</title>
		</head>

		<body>

		<div class="centerContent loginStyle" >

			<h1>회원가입</h1>
			<form id="joinFrm" method="POST" accept-charset="utf-8">
				<input type="hidden" id="sesMemAuth">
				<input type="hidden" id="joinPwdCheck" name="registDate" >
			<div class="form-label">
				<label for="joinId" class="form-label">아이디 :</label>
				<input type="text"  class="form-control" id="joinId" name="memId">
				<span id="idChkresult"></span>
			</div>
			<div class="form-label">
				<label for="joinPwd" class="form-label">비밀번호 :</label>
				<input type="password" class="form-control" id="joinPwd" name="memPwd">
				<span id="pswdChkresult"></span>
			</div>
			<div class="form-label">
				<label for="joinPwdCheck" class="form-label">비번확인 :</label>
				<input type="password" class="form-control"id="ptmemberPswd" >
				<span id="pswdDplChkresult"></span>
			</div>
			<div class="form-label">
				<label for="joinName" class="form-label">이름 :</label>
				<input type="text" class="form-control" id="joinName" name="memName">
				<span id="nameChkresult"></span>
			</div>
				<label for="joinGender" class="form-label">성별</label>
				<select id="joinGender" name="memGender" >
					<option value="" selected="selected">선택하세요</option>
					<option value="남성">남성</option>
					<option value="여성">여성</option>
					<span id="genderChkresult" style="float: right;"></span>
				</select>
			<div class="form-label">
				<label for="joinEmail" class="form-label">이메일 :</label>
				<input type="text" class="form-control" id="joinEmail" name="memEmail" placeholder="이메일을 입력하세요">
				<span id="emailChkresult"></span>
			</div>
			<div class="form-label">
				<label for="joinPhone" class="form-label">핸드폰 :</label>
				<input type="text" class="form-control phoneNumber" id="joinphon" name="memPhone" placeholder=" 하이픈(&quot;-&quot;)은 자동으로 입력됩니다.">
				<span id="telChkresult"></span>
			</div>
			
			<button type="button" onclick="location.href='./login'">로그인으로 바로가기</button>
			<button id="regBtn">회원가입</button>
			
		</form>

		</div>

		
		

		</body>
		

		</html>

		