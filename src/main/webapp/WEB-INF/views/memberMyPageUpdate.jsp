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

			<title>회원 정보 수정</title>

			
			
		</head>
		
		</script>
		<body>
			
			
			<!-- <div>
				<label for="memName">이름 :</label>
				<input type="text" id="memName" name="memName" value="${memberUpdateDetail.memName}" >
			</div>
			<div>
				<label for="memPhone">핸드폰 번호 :</label>
				<input type="text" id="memPhone" name="memPhone" value="${memberUpdateDetail.memPhone}">
			</div>
			<div>
				<label for="memEmil">이메일 :</label>
				<input type="text" id="memEmil" name="memEmil" value="${memberUpdateDetail.memEmail}">
			</div>
			<div>
				<label for="mempwd">비밀번호 :</label>
				<input type="password" id="joinPwd" name="memPwd" value="${memberUpdateDetail.memPwd}">
			</div>
			<div>
				<label for="mempwd">비밀번호 확인:</label>
				<input type="password" id="joinPwdCheck"  value="${memberUpdateDetail.memPwd}">
				<span id="pswdDplChkresult"></span>
				
			</div> -->

			<div class="centerContent">

				<h1>회원 정보 수정</h1>
				<form action="./procUpdateMyPage" method="POST" accept-charset="utf-8">
				<input type="hidden" id="memIdx" name="memIdx" value="${memberUpdateDetail.memIdx}" >
				<input type="hidden" id="memIp" name="memIp" value="${memberUpdateDetail.memIp}" >
				
				<div class="mb-3">
					<label for="memName" class="form-label">아이디</label>
					<input type="text" class="form-control" id="memId"  name="memId" value="${memberUpdateDetail.memId}" readonly="readonly">
				</div>
				<div class="mb-3">
					<label for="memName" class="form-label">이름</label>
					<input type="text" class="form-control" id="memName" name="memName" value="${memberUpdateDetail.memName}" >
				</div>
				<div class="mb-3">
					<label for="boardTitle" class="form-label">핸드폰 번호</label>
					<input type="text" class="form-control phoneNumber" id="boardTitle" name="memPhone" value="${memberUpdateDetail.memPhone}" >
				</div>
				<div class="mb-3">
					<label for="memEmil" class="form-label">이메일</label>
					<input type="text" class="form-control" id="memEmail" name="memEmail" value="${memberUpdateDetail.memEmail}">
				</div>
				<div class="mb-3">
					<label for="memGender" class="form-label">성별</label>
					
					<select id="joinGender" name="memGender" value="${memberUpdateDetail.memGender}" >
						<option value="">선택하세요</option>
						<option class="man" value="남성">남성</option>
						<option class="woman" value="여성">여성</option>
						<span id="genderChkresult" style="float: right;"></span>
					</select>
				</div>
				<div class="mb-3">
					<label for="mempwd" class="form-label">비밀번호</label>
					<input type="password" class="form-control" id="joinPwd" name="memPwd" value="${memberUpdateDetail.memPwd}" >
				</div>
				<div class="mb-3">
					<label for="mempwd2" class="form-label">비밀번호 확인</label>
					<input type="password" class="form-control" id="joinPwdCheck" value="${memberUpdateDetail.memPwd}" >
				</div>
				
			



			
				<!-- <input type="hidden" id="joinPwdCheck" name="registDate" value="${memberUpdateDetail.registDate}"> -->
			
			<!-- <div>
				<label for="memGender">성별 :</label>
				<input type="text" id="memGender" name="memGender" value="${memberUpdateDetail.memGender}">

				<select id="memGender" name="memGender">
					<option value="" selected="selected">선택하세요</option>
					<option value="남성">남성</option>
					<option value="여성">여성</option>
					<span id="genderChkresult" style="float: right;"></span>
				</select>
			</div> -->
			
			
			
			<button type="submit" id="updateBtn" >수정완료</button>
			<button type="button"  onclick="location.href='./boardList'">목록</button>
			</form>

		</div>

		<script>
            let genderCheck = $("#joinGender").attr("value");
            //alert(genderCheck);

            if (genderCheck == "남성") {
                $(".man").attr('selected', 'selected');
            } else {
                $(".woman").attr('selected', 'selected');
            }
            

        </script>

		</body>
		

		</html>



		