<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
      <script src="./resources/compnent/jquery-3.3.1.min.js"></script>
			<script src="./resources/compnent/jquery-ui-1.12.1.custom/jquery-ui.min.js"></script>
			
			<script src="./resources/compnent/jquery-loading-master/dist/jquery.loading.min.js"></script>
			<script src="./resources/compnent/jqueryPrint/jqueryPrint.js"></script>

			<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js?autoload=false"></script>
			
			<script src="./resources/js/util/util.js"></script>
      <script src="./resources/js/list/board.js" charset="UTF-8"></script>
      <script src="./resources/js/member/member.js" charset="UTF-8"></script>
    
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="./resources/css/list/fonts/style.css">
    <link rel="stylesheet" href="./resources/css/list/owl.carousel.min.css">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="./resources/css/list/bootstrap.min.css">
    <!-- Style -->
    <link rel="stylesheet" href="./resources/css/list/style.css">
    

<title>All List</title>

</head>
<body>

  

        <div class="content">
         
          <div class="container" style="padding-top:50px;">
            <h1 class="mb-5" style="text-align:center">회원 관리</h1>
            
            <form action="./memberDetail" id="detailFrm" name="detailFrm" method="post">
              <input type="hidden" id="memIdx" name="memIdx" autocomplete="off">
            </form>
            
            <div class="table-responsive">
                <!-- 검색 폼 -->
                <form id="memSearchfrm" method="post">
                

                  <select id="searchCondition" name="searchCondition" value="${searchCondition}">
                    <option value="" <c:if test="${search.searchCondition == null || search.searchCondition eq ''}">selected</c:if>>전체</option>
                    <option value="memId" <c:if test="${search.searchCondition eq 'memeId'}">selected</c:if>>아이디</option>
                    <option value="memName" <c:if test="${search.searchCondition eq 'memName'}">selected</c:if>>이름</option>
                  </select>
                
                    
                  <input type="text" id="memSearchWord" name="memSearchWord" value="${search.memSearchWord}">
                  <button id="searchBtn">검색</button>
                  <span style="color:#f00; margin-left:20px">※회원정보 더블클릭으로 상세보기가 가능합니다.</span>
                
                </form>
                <div style="float:right">
                <c:if test="${sesMemId == null }">
                    <button type="button" onclick="location.href='./login'">로그인</button>
                </c:if>
                <c:if test="${sesMemId != null}">
                  <form action="./goMyPageUpdate" id="myPage" name="myPage" method="post">
                    <input type="hidden" id="memIdx" name="memIdx" value="${sesMemIdx}">
                  </form>
                  <button type="button" onclick="location.href='./logout'">로그아웃</button>
                  <c:if test="${sesMemId = 'admin'}">
                    <button type="submit" onclick="goMemberMyPage()">마이페이지</button>
                  </c:if>
                  <button type="button" onclick="location.href='./boardList'">게시글 목록</button>
                 
              </c:if>
            </div>

              <table class="table custom-table">
                <thead>
                  <tr>
                    <!-- <th scope="col">
                      <label class="control control--checkbox">
                        <input id ="checkAll" name="checkAll" type="checkbox" class="js-check-all"/>
                        <div class="control__indicator"></div>
                      </label>
                    </th> -->
                    <th>No</th>
                    <th>Id</th>
                    <th>이름</th>
                    <th>핸드폰번호</th>
                    <th>이메일</th>
                    <th>성별</th>
                    <th>등록일자</th>
                    <th>수정일자</th>
                    <th>IP</th>
                  </tr>
                </thead>
                <tbody>
                  <c:forEach var="member" items="${memberList}">
                    <tr ondblclick="goMemberDetail('${member.memIdx}')">
                      <!-- <td onclick="event.cancelBubble=true">
                        <input type="checkbox" id="${member.memIdx}" name="check" value="${member.memIdx}"/>
                      </td> -->
                      <td>${member.rowNum}</td>
                      <td>${member.memId}</td>
                      <td>${member.memName}</td>
                      <td>${member.memPhone}</td>
                      <td>${member.memEmail}</td> 
                      <td>${member.memGender}</td>
                      <td>${member.registDate}</td>
                      <td>${member.updateDate}</td>
                      <td>${member.memIp}</td>
                    </tr>
                  </c:forEach>
                  <tbody>
                    
                </tbody>
                 
                  
                  
                </tbody>
              </table>
         
              <br>

          </div>
      
          <div class="pagination">
            <ul>
              <c:if test="${paging.prev}">
                <span>
                  <a href='<c:url value="/memberList?page=${paging.startPage - 1}"/>'>이전<i
                      class='bx bxs-chevron-left'></i></a>
                </span>
              </c:if>
              <c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="memIdx">
                <c:choose>
                  <c:when test="${paging.criteria.page eq memIdx}">
                    <span><a class="active">${memIdx}</a></span>
                  </c:when>
                  <c:otherwise>
                    <span><a href='<c:url value="/memberList?page=${memIdx}"/>'>${memIdx}</a></span>
                  </c:otherwise>
                </c:choose>
              </c:forEach>
              <c:if test="${paging.next && paging.endPage > 0}">
                <span>
                  <a href='<c:url value="/memberList?page=${paging.endPage + 1}"/>'><i class='bx bxs-chevron-right'>다음</i></a>
                </span>
              </c:if>
            </ul>
          </div>
          

        </div>
      
      <script>
       

      </script>
    
 
  
      <script src="./resources/js/list/jquery-3.3.1.min.js"></script>
      <script src="./resources/js/list/popper.min.js"></script>
      <script src="./resources/js/list/bootstrap.min.js"></script>
      <script src="./resources/js/list/main.js"></script>
    </body>
</html>



