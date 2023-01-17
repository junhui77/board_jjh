<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <!DOCTYPE html>
    <html>

    <head>
      <meta charset="UTF-8">
      <title>Insert title here</title>
      <script src="./resources/compnent/jquery-3.3.1.min.js"></script>
      <script src="./resources/compnent/jquery-ui-1.12.1.custom/jquery-ui.min.js"></script>

      <script src="./resources/compnent/jquery-loading-master/dist/jquery.loading.min.js"></script>
      <script src="./resources/compnent/jqueryPrint/jqueryPrint.js"></script>

      <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js?autoload=false"></script>

      <script src="./resources/js/util/util.js"></script>

      <script src="./resources/js/list/board.js" charset="UTF-8"></script>

      <!-- 웹용 아이콘 사용 -->
      <script src="https://unpkg.com/boxicons@2.1.4/dist/boxicons.js"></script>
      <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>

      <!-- 부트스트랩 -->
      <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
      <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
      <link rel="stylesheet" href="./resources/css/style.css">

    </head>


    <body>



      <div class="centerContent">
        <h1 class="titleCenter" >상세페이지</h1>
        <br><br>

        <form action="./boardUpdate" id="updateFrm" name="updateFrm" method="post">
          <input type="hidden" id="num" name="num" autocomplete="off" value="${boardDetail.num}">


          <div class="mb-3">
            <label for="boardTitle" class="form-label">제목</label><span style="color:rgb(189, 189, 189)"> (조회수 :
              ${boardDetail.cnt})</span>
            <input type="text" class="form-control" id="boardTitle" name="title" placeholder="제목을 입력해주세요"
              value="${boardDetail.title}" readonly="readonly">
          </div>
          <div class="mb-3">
            <label for="boardWriter" class="form-label">글쓴이</label>
            <input type="text" class="form-control" id="boardWriter" name="writer" value="${boardDetail.writer}"
              readonly="readonly">
          </div>
          <div>
            <label for="boardDate" class="form-label">작성날짜 :</label>
            <input type="text" class="form-control" id="boardDate" name="writeDate" value="${boardDetail.writeDate}"
              placeholder="-" readonly="readonly">
          </div>
          <div class="mb-3">
            <label for="boardContent" class="form-label">내용</label>
            <!-- <div class="form-control contentBox" id="boardContent" rows="3" name="content">${boardDetail.content}</div> -->
            <textarea  class="form-control contentBox" style="background-color:#fff;" name="content" id="boardContent" cols="30" rows="10" readonly="readonly">${boardDetail.content}</textarea>
          </div>

          <div class="heart_btn" id="boardLikeBtn">
            <a href="#n">
              <i id="heart" class="bx bx-heart" style="font-size:25px; color:#f00; float:left;margin: 2px 4px 0 0"></i>
            </a>
          </div>
          <span class="count_likes">
            좋아요 <span id="boardLikeCount">${boardLikeCount}</span>개
          </span>
          <button type="button" onclick="location.href='./boardList'">목록</button>

          <c:if test="${sesMemId == boardDetail.writer}">
            <button id="updateBtn" type="submit" onclick="goUpdate(${boardDetail.num})">수정</button>
            <button type="button" onclick="goDelete(${boardDetail.num})">삭제</button>
          </c:if>


        </form>

        <div class="card mb-2" style="margin-top:60px;">
          <div class="card-header bg-light">
            <i class="fa fa-comment fa"></i> 댓글
          </div>
          <div class="card-body">
            <ul class="list-group list-group-flush">
              <li class="list-group-item">
                <div class="form-inline mb-2">
                  <label for="replyId"><i class="fa fa-user-circle-o fa-2x"></i></label>
                  <c:if test="${sesMemId != null}">
                    <input type="text" class="form-control ml-2" value="${sesMemId}" id="replyId" readonly
                      style="background-color:#fff; color:rgb(115, 115, 115)">
                  </c:if>
                  <c:if test="${sesMemId == null}">
                    <input type="text" class="form-control ml-2" value="비회원" id="replyId" readonly
                      style="background-color:#fff; color:rgb(115, 115, 115)"">
                   </c:if>
                  <label for=" replyPassword" class="ml-4"><i class="fa fa-unlock-alt fa-2x"></i></label>
                </div>
                <c:if test="${sesMemId != null}">
                  <textarea class="form-control" id="replyContent" rows="3"></textarea>
                </c:if>
                <c:if test="${sesMemId == null}">
                  <textarea id="replyContent" value="비회원입니다." class="form-control" rows="3" readonly></textarea>
                </c:if>
                <button id="replyBtn" type="button" class="btn btn-dark mt-3" >댓글 등록</button>
              </li>
            </ul>
          </div>




        </div><!-- 댓글 입력 폼 end -->


       

        <section id="commentList">
          <!-- <ul style="margin-bottom:300px; padding-left:0">
            <li class="list-group-item">
              <div class="form-inline mb-2">
                <label for="replyId"><i class="fa fa-user-circle-o fa-2x"></i></label>
                <div id="replyId"></div>
                <label for="replyPassword" class="ml-4"><i class="fa fa-unlock-alt fa-2x"></i></label>
              </div>
              <div id="replyCont" style="font-size:14px;"></div>
              <button  type="button" class="btn btn-dark mt-3"  style="background-color:rgb(53, 134, 255); border:none">수정</button>
              <button  type="button" class="btn btn-dark mt-3"  style="background-color:rgb(110, 111, 166); border:none">삭제</button>
            </li>
          </ul> -->
        </section>








      </div> <!-- div.centerContent end -->




      <script src="./resources/js/list/jquery-3.3.1.min.js"></script>
      <script src="./resources/js/list/popper.min.js"></script>
      <script src="./resources/js/list/bootstrap.min.js"></script>
      <script src="./resources/js/list/main.js"></script>


      <script>
        // alert("member:" + "${member}");





        //게시글 좋아요

        if (${ boardFindLike == null }) {
          $('#heart').removeClass("bx bxs-heart");
          $('#heart').addClass("bx bx-heart");
        }else if (${ boardFindLike == 0 }) {

          //alert("좋아요 안한 게시글 ")
          $('#heart').removeClass("bx bxs-heart");
          $('#heart').addClass("bx bx-heart");

        } else {
          //alert("좋아요 한 게시글 ")
          $('#heart').removeClass("bx bx-heart");
          $('#heart').addClass("bx bxs-heart");
        }

        // 댓글 조회
        $.ajax({
          url: "./boards/" + ${ boardDetail.num } + "/replies",
          type: 'GET',
          contentType: 'application/json;charset=utf-8',
          dataType: 'json',
          success: function (data) {
            // alert('댓글 조회 이벤트 발생');
            if(${sesMemId == null}){
            	 getCommentList(data);
            }else
            getCommentListLogin(data);
          },
          fail: function (ex) {
            console.log("error : ", ex);
          }
        })




        /*
        <ul style="margin-bottom:300px; padding-left:0">
            <li class="list-group-item">
              <div class="form-inline mb-2">
                <label for="replyId"><i class="fa fa-user-circle-o fa-2x"></i></label>
                <div id="replyId"></div>
                <label for="replyPassword" class="ml-4"><i class="fa fa-unlock-alt fa-2x"></i></label>
              </div>
              <div id="replyCont" style="font-size:14px;"></div>
              <button  type="button" class="btn btn-dark mt-3"  style="background-color:rgb(53, 134, 255); border:none">수정</button>
              <button  type="button" class="btn btn-dark mt-3"  style="background-color:rgb(110, 111, 166); border:none">삭제</button>
            </li>
          </ul>
          */

         // 댓글 등록
          $('#replyBtn').on('click', function () {

            if (${ sesMemId == null }) {
            alert('로그인을 해야 댓글을 등록 할 수 있습니다.')

            } else if ($('#replycontent').val() != "") {
            // alert('댓글 등록 이벤트 시작 num:' + "${boardDetail.num}");
            $.ajax({
              url: "./boards/" + ${ boardDetail.num } + "/replies",
              type: 'POST',
              contentType: 'application/json;charset=Utf-8',
              dataType: 'json',
              data: JSON.stringify({
                replyContent: $('#replyContent').val()
              }),

              success: function (data) {
                $('#replyContent').val("");
                if(${sesMemId == null}){
               	 getCommentList(data);
               }else
               getCommentListLogin(data);
             },
              fail: function (ex) {
                alert("댓글 내용을 입력해주세요.");
              }

            })

          }

            });

         
           



        // 댓글 등록
        


        // 댓글 삭제
        $("#commentList").on("click", ".deleteBtn", function () {
          let replyIdx = $(this).closest("ul").data("id");
          // //let replyIdx = data.replyList;


          //alert('댓글 삭제 이벤트 발생: ' + replyIdx);
          $.ajax({
            url: "./boards/" + ${ boardDetail.num } + "/replies/" + replyIdx,
            type: 'DELETE',
            contentType: 'application/json;charset=utf-8',
            dataType: 'json',

            success: function (data) {
              //alert('댓글 삭제 이벤트 성공: ' + replyIdx);
            	if(${sesMemId == null}){
               	 getCommentList(data);
               }else
               getCommentListLogin(data);
             },

            fail: function (ex) {
              console.log("error:", ex);

            }

           });
        });


        //댓글 수정 폼 생성
        

        $("#commentList").on("click", ".editBtn", function () {
         // alert("hide 이벤트")
          
         
          $(this).siblings().show();
          $(this).hide();
          $(this).parent().parent().siblings().find(".hide").hide();
          $(this).parent().parent().siblings().find(".editBtn").show();
          

         
          
        });

       

       


        //댓글 수정
        $("#commentList").on("click", ".editEndBtn", function () {
       // $(".editEndBtnc").on("click", function() {
          $(this).siblings().find(".hide").hide();
          //$(this).hide();
        
          let replyIdx = $(this).closest("ul").data("id");
          //alert('댓글 수정완료 이벤트 발생!')
         
         
          //alert('댓글 수정 이벤트 발생!: ' + replyIdx)
          $(this).hide();
          $(this).siblings().show();

        //  if ($('#modifyContent').data("id") == replyIdx && $('#modifyContent').val() != "") {
          if ( $('#modifyContent').val() != "") {
            $.ajax({
              url: "./boards/" + ${ boardDetail.num } + "/replies/" + replyIdx,
              type: 'PUT',
              contentType: 'application/json;charset=utf-8',
              dataType: 'json',
              data: JSON.stringify({
               // replyContent: $('#modifyContent').parents("ul").children().data("id").val()
               replyContent: $('.'+ replyIdx).val()
              }),

              success: function (data) {
                console.log('댓글 수정 이벤트 성공1');
                $('#modifyContent').val("");
                $('#modifyContent').hide();
                if(${sesMemId == null}){
               	 getCommentList(data);
               }else
               getCommentListLogin(data);
             },
              error: function (ex) {
                alert('댓글 수정 이벤트 실패1 :' + ex)
                console.log(ex);
              }
            });

            }
            else {
          alert("댓글 내용을 입력하세요.");
        }

        return replyIdx;

        });



       
       
       //로그아웃 상태 댓글리스트
        function getCommentList(data) {
            let replyList = data.replyList;

            let htmlStr = "";

            for (let i = 0; i < replyList.length; i++) {
              //alert("replyId : " + replyList[i].memId);
              	
  				memIdx = replyList[i].memIdx;
  	            htmlStr += "<ul id=\"commentItem\" style=\"padding-left:0\" data-id=\"" + replyList[i].replyIdx + "\">"
  	            htmlStr += "<li class=\"list-group-item\">"
  	            htmlStr += "<div class=\"form-inline mb-2\" >" + replyList[i].memId + "</div>"
  	            htmlStr += "</div>"
  	            htmlStr += "<div id=\"replyCont\" style=\"font-size:14px;\">" + replyList[i].replyContent + "<span class=\"dateText\">&nbsp;&nbsp;" + replyList[i].replyRegdate + "</span></div>"
  	            htmlStr += "<input type=\"text\" id=\"modifyContent\" class=\" hide " + replyList[i].replyIdx + "  \" value=\"" + replyList[i].replyContent + "\" ></input>"  
  	            htmlStr += "<button  type=\"button\"  class=\" mt-3 editEndBtn editEndBtn"+replyList[i].replyIdx+" hide \"  style=\"background-color:rgb(53, 134, 255); border:none\">수정 완료</button>"
  	            htmlStr += "</li>"
  	            htmlStr += "</ul>"
              	
            }
            
          
            $("#commentList").html("");
            $("#commentList").append(htmlStr);

          }
       
       
       
       
       
       

		//로그인 상태 댓글리스트
        function getCommentListLogin(data) {
          let replyList = data.replyList;

          let htmlStr = "";

          for (let i = 0; i < replyList.length; i++) {
            //alert("replyId : " + replyList[i].memId);
            	
				memIdx = replyList[i].memIdx;
	            htmlStr += "<ul id=\"commentItem\" style=\"padding-left:0\" data-id=\"" + replyList[i].replyIdx + "\">"
	            htmlStr += "<li class=\"list-group-item\">"
	            htmlStr += "<div class=\"form-inline mb-2\" >" + replyList[i].memId + "</div>"
	            htmlStr += "</div>"
	            htmlStr += "<div id=\"replyCont\" style=\"font-size:14px;\">" + replyList[i].replyContent + "<span class=\"dateText\">&nbsp;&nbsp;" + replyList[i].replyRegdate + "</span></div>"

	            htmlStr += "<input type=\"text\" id=\"modifyContent\" class=\" hide " + replyList[i].replyIdx + "  \" value=\"" + replyList[i].replyContent + "\" ></input>"
	        
	            htmlStr += "<button  type=\"button\"  class=\" mt-3 editEndBtn editEndBtn"+replyList[i].replyIdx+" hide \"  style=\"background-color:rgb(53, 134, 255); border:none\">수정 완료</button>"
	          
	            //if(${sesMemIdx} == memIdx){
	            	
	            	if('${sesMemIdx}' == memIdx){
		        	   htmlStr += "<button  type=\"button\" class=\" mt-3 editBtn eventBlock\"  style=\"background-color:rgb(53, 134, 255); border:none\">수정</button>"
		   	           htmlStr += "<button  type=\"button\" class=\" mt-3 deleteBtn eventBlock\"  style=\"background-color:rgb(110, 111, 166); border:none\">삭제</button>"
	            	}
		   	       
		   	         //}
	
	            htmlStr += "</li>"
	            htmlStr += "</ul>"
            	 
	          
            
         
         
          }
          
        
          $("#commentList").html("");
          $("#commentList").append(htmlStr);

        }
        
        




        $('#boardLikeBtn').on('click', function () {


          if (${ sesMemId == null }) {
          alert('로그인을 해야 좋아요가 가능합니다.')


        } else {

          let div = this;
          let css = $(div).find('#heart').attr("class");

          if (css.includes('bx-heart')) {  //좋아요 추가
            // alert("좋아요 이벤트2")
            $.ajax({

              url: "./boardLike/" + ${ boardDetail.num },
              type: 'GET',
              contentType: 'application/json;charset=utf-8',
              dataType: 'json',
              success: function (data) {
                $(div).find('#heart').removeClass("bx bx-heart");   //빈 하트 사라짐
                $(div).find('#heart').addClass("bx bxs-heart");     //하트 생김           
                $('#boardLikeCount').html(data.boardLikeCount);
              },
              fail: function (ex) {
                console.log("error: ", ex);
              }
                
              });


        } else {  //좋아요 취소
          // alert("좋아요 취소 이벤트3 :" + ${boardDetail.num})
          $.ajax({
            url: "./deleteBoardLike/" + ${ boardDetail.num },
            type: 'GET',
            contentType: 'application/json;charset=utf-8',
            dataType: 'json',
            success: function (data) {
              $(div).find('#heart').removeClass("bx bxs-heart");
              $(div).find('#heart').addClass("bx bx-heart");
              $('#boardLikeCount').html(data.boardLikeCount);
            },
            fail: function (ex) {
              console.log("error: ", ex);
            }
              });

            }

            }


            })

         

            
            
            
            
            
            
            
            
    		//무한스크롤
            (() => {
            	  const $ul = document.querySelector('#commentList');
            	  let $li = document.querySelector('#commentItem:last-child');
            	  let count = $ul.children.length;

            	  // 1. 인터섹션 옵저버 생성
            	  const io = new IntersectionObserver((entry, observer) => {
            		  alert("인터섹션 옵저버 생성")
            	    // 3. 현재 보이는 target 출력
            	    const ioTarget = entry[0].target;

            	    // 4. viewport에 target이 보이면 하는 일
            	    if (entry[0].isIntersecting) {
            	      console.log('현재 보이는 타켓', ioTarget)
            	      // 5. 현재 보이는 target 감시 취소
            	      io.unobserve($li);

            	      // 6. 새로운 li 추가해
            	      $li = $ul.appendChild(document.createElement('li'));
            	      $li.textContent = ++count;
            	      // 7. 새로 추가된 li 감시
            	      io.observe($li);
            	    }
            	  }, {
            	    // 8. 타겟이 50% 이상 보일때
            	    threshold: 0.5
            	  });

            	  // 2. li감시해!
            	  io.observe($li);

            	})();
            



      </script>
     

    </body>

    </html>