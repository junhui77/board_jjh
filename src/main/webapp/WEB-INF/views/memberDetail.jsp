<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <!DOCTYPE html>
        <html>

        <head>
            <meta charset="UTF-8">
            <title>회원 상세 정보</title>
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
    
            
        </head>

        <body>
            <script>
     
      

             function goDelete(idx) {
                    alert('delete이벤트 발생');
                    var idx = $("#num").val();
		
                $.ajax({
                    url: "./memberDelete",
                    data: "idx="+ idx,
                    type: "GET",
                    success: function(data){
                        alert("성공적으로 탈퇴되었습니다.");
                        location.href =  "./memberList";
                    },
                    error: function(){  
                        alert("탈퇴 실패");  
                    }
                });
                   
                }
       


            function goUpdate(num) {
                    alert('이벤트 발생');
                    $("#num").val(num);
	                $("#updateFrm").submit();
                   
                }
               // location.href = getContextPath() + "/boardUpdate?num=" + num;
          
      

            </script>
            <div class="centerContent">
            <h1>회원 정보</h1>
            <form action="./memberUpdate" id="updateFrm" name="updateFrm" method="post">
                    <input type="hidden" id="memIdx" name="memIdx" autocomplete="off" value="${memberDetail.memIdx}">
            
                <!-- <div>아이디: <span>${memberDetail.memId}</span></div>
                <div>이름: <span>${memberDetail.memName}</span></div>
                <div>핸드폰 번호: <span>${memberDetail.memPhone}</span></div>
                <div>이메일: <span>${memberDetail.memEmail}</span></div>
                <div>성별: <span>${memberDetail.memGender}</span></div>
                <div>권한: <span>${memberDetail.memAuth}</span></div>
                <div>등록 날짜: <span>${memberDetail.registDate}</span></div>
                <div>수정 날짜: <span>${memberDetail.updateDate}</span></div> -->


                
            <div style="float:right;padding-bottom:2px">
                <button id="listBtn" type="button" onclick="location.href='./memberList'">목록</button>
                <button id="updateBtn" type="submit" onclick="goUpdate(${memberDetail.memIdx})">수정</button>
                <button id="deleteBtn" onclick="goMemberDelete(${memberDetail.memIdx})">탈퇴</button>
            </div>
              

            <div class="mb-3">
                <label for="boardTitle" class="form-label">아이디</label>
                <input type="text" class="form-control" id="boardTitle" value="${memberDetail.memId}" readonly="readonly">
            </div>
            <div class="mb-3">
                <label for="boardTitle" class="form-label">이름</label>
                <input type="text" class="form-control" id="boardTitle" value="${memberDetail.memName}" readonly="readonly">
            </div>
            <div class="mb-3">
                <label for="boardTitle" class="form-label">핸드폰 번호</label>
                <input type="text" class="form-control phoneNumber" id="boardTitle" value="${memberDetail.memPhone}" readonly="readonly">
            </div>
            <div class="mb-3">
                <label for="boardTitle" class="form-label">이메일</label>
                <input type="text" class="form-control" id="boardTitle" value="${boardDetail.memEmail}" readonly="readonly">
            </div>
            <div class="mb-3">
                <label for="boardTitle" class="form-label">성별</label>
                <!-- <input type="text" class="form-control" id="boardTitle" value="${memberDetail.memGender}" readonly="readonly"> -->
                <select id="joinGender" name="memGender"  value="${memberDetail.memGender}" disabled>
					<option value="">선택하세요</option>
					<option class="man" value="남성">남성</option>
					<option class="woman" value="여성">여성</option>
					<span id="genderChkresult" style="float: right;"></span>
				</select>
            </div>
            <div class="mb-3">
                <label for="boardTitle" class="form-label">권한</label>
                <input type="text" class="form-control" id="boardTitle" value="${memberDetail.memAuth}" readonly="readonly">
            </div>
            <div class="mb-3">
                <label for="boardTitle" class="form-label">등록 날짜</label>
                <input type="text" class="form-control" id="boardTitle" value="${memberDetail.registDate}" readonly="readonly">
            </div>
            <div class="mb-3">
                <label for="boardTitle" class="form-label">수정 날짜</label>
                <input type="text" class="form-control" id="boardTitle" value="${memberDetail.updateDate}" readonly="readonly">
            </div>
            

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
           
            
             
           
            <script src="./resources/js/list/jquery-3.3.1.min.js"></script>
            <script src="./resources/js/list/popper.min.js"></script>
            <script src="./resources/js/list/bootstrap.min.js"></script>
            <script src="./resources/js/list/main.js"></script>

        </body>

        </html>