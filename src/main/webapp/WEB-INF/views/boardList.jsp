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
    <link rel="stylesheet" href="./resources/js/member/member.js">
    

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="./resources/css/list/bootstrap.min.css">
    <!-- Style -->
    <link rel="stylesheet" href="./resources/css/list/style.css">

<title>All List</title>

</head>
<body>
   <script>
     
     
    
function goDetail(str) {
	//alert("str =====> " + str);

	$("#num").val(str);
	$("#detailFrm").submit();
}


  

   </script>
    

        <div class="content" style="padding-top:50px;">
         
          <div class="container">
            <h1 class="mb-5" style="text-align:center">메모 게시판 리스트</h1>
            
            
            <form action="./boardDetail" id="detailFrm" name="detailFrm" method="post">
              <input type="hidden" id="num" name="num" autocomplete="off">
            </form>
             
            <div class="table-responsive">
                <!-- 검색 폼 -->
                
	                <form id="memSearchfrm" method="post" style="float:left" >
	                    <select id="searchCondition" name="searchCondition" value="${searchCondition}">
	                        <option value="" <c:if test="${search.searchCondition == null || search.searchCondition eq ''}"></c:if>>전체</option>
	                        <option value="title" <c:if test="${search.searchCondition eq 'title'}">selected</c:if>>제목</option>
	                        <option value="writer" <c:if test="${search.searchCondition eq 'writer'}">selected</c:if>>글쓴이</option>
	                        <option value="content" <c:if test="${search.searchCondition eq 'content'}">selected</c:if>>내용</option>
	                    </select>
	                    <input type="text" id="boardSearchWord" name="boardSearchWord" value="${search.boardSearchWord}">
	                  <button id="searchBtn">검색</button>
	                </form>
                
                <div style="width:500px;color:#f00; margin-left:40px;float:left">
                  	※게시글 더블클릭으로 상세보기가 가능합니다. </br>
                  	※운영자 아이디/비번 : admin/1234
                  </div>

                <div style="float:right;">
                  <c:if test="${sesMemId == null }">
                      <button type="button" onclick="location.href='./login'">로그인</button>
                  </c:if>
                  <c:if test="${sesMemId != null}">
                    <form action="./goMyPageUpdate" id="myPage" name="myPage" method="post">
                      <input type="hidden" id="memIdx" name="memIdx" value="${sesMemIdx}">
                    </form>
                    <button type="button" onclick="location.href='./logout'">로그아웃</button>
                    <c:if test="${sesMemId != 'admin'}">
                      <button type="submit" onclick="goMemberMyPage()">마이페이지</button>
                    </c:if>
                    <span>${sesMemId}님 환영합니다.</span>
                    <c:if test="${sesMemId == 'admin'}">
                      <button type="button" onclick="location.href='./memberList'">회원관리</button>
                    </c:if>
                  </c:if>
                 
                
              </div>

              <table class="table custom-table">
                <thead>
                  <tr>
                    <th scope="col">
                      <label class="control control--checkbox">
                        <input id ="checkAll" name="checkAll" type="checkbox" class="js-check-all"/>
                        <div class="control__indicator"></div>
                      </label>
                    </th>
                    <th scope="col">등록번호</th>
                    <th scope="col">제목</th>
                    <th scope="col">글쓴이</th>
                    <th scope="col">내용</th>
                    <th scope="col">등록날짜</th>
                    <th scope="col">작성날짜</th>
                    <th scope="col">수정날짜</th>
                    <th scope="col">좋아요</th>
                    <th scope="col">조회수</th>
                  </tr>
                </thead>
                <tbody>
                 
                    <c:forEach items="${boardList}" var="board">
             
                     <tr >
                        <td scope="row">
                          <label class="control control--checkbox">
                          
                            <input type="checkbox" id="${board.num}"  name="checkDel" />
                            <div class="control__indicator"></div>
                          </label>
                        </td>
                        <td ondblclick="goBoardDetail('${board.num}')"><c:out value="${board.num}"></c:out></td>
                        <td ondblclick="goBoardDetail('${board.num}')"><c:out value="${board.title}"></c:out></td>
                        <td ondblclick="goBoardDetail('${board.num}')"><c:out value="${board.writer}"></c:out></td>
                        <td ondblclick="goBoardDetail('${board.num}')"><c:out value="${board.content}"></c:out></td>
                        <td ondblclick="goBoardDetail('${board.num}')"><c:out value="${board.regdate}"></c:out></td>
                        
                        <c:if test="${board.writeDate != null}">
                          <td ondblclick="goBoardDetail('${board.num}')"><c:out value="${board.writeDate}"></c:out></td>
                        </c:if>
                        <c:if test="${board.writeDate == null}">
                          <td ondblclick="goBoardDetail('${board.num}')"><c:out value="-"></c:out></td>
                        </c:if>

                        <c:if test="${board.updateDate != null}">
                          <td ondblclick="goBoardDetail('${board.num}')"><c:out value="${board.updateDate}"></c:out></td>
                        </c:if>
                        <c:if test="${board.updateDate == null}">
                          <td ondblclick="goBoardDetail('${board.num}')"><c:out value="-"></c:out></td>
                        </c:if>

                        <td ondblclick="goBoardDetail('${board.num}')"><c:out value="${board.boardLike}"></c:out></td>
                        <td ondblclick="goBoardDetail('${board.num}')"><c:out value="${board.cnt}"></c:out></td>
                        
                    </tr>

                  



                    </c:forEach>
                
                  <tbody>
                    
                </tbody>
                 
                  
                  
                </tbody>
              </table>
              
              <br>
              
              
          </div>
          <div class="btns">	
          <c:if test ="${sesMemId != null}">
            <button type="button" onclick="location.href='./boardRegister'">등록</button>
            <button type= "button" id="deleteBtn"  name="deleteBtn">삭제</button>
          </c:if>
          </div>
          <div class="pagination">
            <ul>
              <c:if test="${paging.prev}">
                <span>
                  <a href='<c:url value="/boardList?page=${paging.startPage - 1}"/>'><i class='bx bxs-chevron-left'>이전</i></a>
                </span>
              </c:if>
              <c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="num">
                <c:choose>
                  <c:when test="${paging.criteria.page eq num}">
                    <span><a class="active">${num}</a></span>
                  </c:when>
                  <c:otherwise>
                    <span><a href='<c:url value="/boardList?page=${num}"/>'>${num}</a></span>
                  </c:otherwise>
                </c:choose>
              </c:forEach>
              <c:if test="${paging.next && paging.endPage > 0}">
                <span>
                  <a href='<c:url value="/boardList?page=${paging.endPage + 1}"/>'>다음<i class='bx bxs-chevron-right'>다음</i></a>
                </span>
              </c:if>
            </ul>
          </div>
      
        </div>
        
       
    
      
  
      <script src="./resources/js/list/jquery-3.3.1.min.js"></script>
      <script src="./resources/js/list/popper.min.js"></script>
      <script src="./resources/js/list/bootstrap.min.js"></script>
      <script src="./resources/js/list/main.js"></script>
    </body>
</html>



