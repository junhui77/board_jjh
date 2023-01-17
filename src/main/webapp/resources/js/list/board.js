
$(document).ready(function(){



	var emptyCheck = function(){
	
		if($("#boardTitle").val().trim() == ""){
			alert("제목은 필수 입력사항입니다.");
			$("#boardTitle").focus();
			return false;
			}
		if($("#boardContent").val().trim() == ""){
			alert("내용은 필수 입력사항입니다.");
			$("#boardContent").focus();
			return false;
		}
		
		return true;
	}
	
	
	$("#registerBtn").click(function(){
		//alert('등록 이벤트');
		if(emptyCheck() == true){
			//$('#registerBtn').attr('type','submit');
			document.querySelector('#registerBtn').setAttribute('type','submit');
		}
	})


});


function goBoardDetail(str) {
	//alert("str =====> " + str);

	$("#num").val(str);
	$("#detailFrm").submit();
}

function goMemberMyPage(){
	alert("마이 페이지 이동")
	$("#myPage").submit();
	
}






function goDelete(num) {
	//alert('delete이벤트 발생');
	//var num = $("#num").val();
let result = confirm('정말 삭제하시겠습니까?')
if(result){
	$.ajax({
		url: "./boardDelete",
		data: "num="+ num,
		type: "POST",
		success: function(data){
			alert("성공적으로 삭제되었습니다.");
			location.href =  "./boardList";
		},
		error: function(){  
			alert("삭제 실패");  
		}
	});
}

   
}



$(document).ready(function(){


	$("#deleteBtn").click(function(){
		
		
		//alert("이벤트 발생");
		var cnt = $("input[name='checkDel']:checked").length;
		var arr = new Array();
		$("input[name='checkDel']:checked").each(function(){
		arr.push($(this).attr('id'));
		});

		
			var result = confirm("정말 삭제하시겠습니까?");
		
		
		console.log('result:' + result);
		
		//alert("삭제 클릭 :" + arr);
		if(cnt == 0){
		alert("하나 이상을 선택해주세요");
		}else if(result){
			
			$.ajax({
			type:"POST",
			url: "./boardCheckDelete",
			data: "chk=" + arr,
			dataType: "json",
			success: function(data) {
				
				if(data.result != "ok"){
				alert("삭제 실패");
				}else{
				alert("삭제 성공");
				location.reload();
				}
			},
			error: function(){
				alert("서버 통신 오류");
			}
			})
		}
	})

});

  






function goUpdate(num) {
	//alert('이벤트 발생');
	$("#num").val(num);
	$("#updateFrm").submit();
   
}


$('#boardContent').keyup(function (e) {

	//alert("이벤트 발생")
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