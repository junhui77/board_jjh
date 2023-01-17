// 페이지 로드시 바로 실행
$(window).on("load", function () {

	// 체크 이벤트
	checkEve();
	// 버튼 이벤트
	btnEve();
	// 유효성 체크
	regexCheck();
	// 자동완성 끄기
	$("input").prop("autocomplete", "off");

});

var checkEve = function () {

	$("#checkAll").click(function () {
		if ($("#checkAll").is(":checked")) $("input[name=checkDel]").prop("checked", true);
		else $("input[name=checkDel]").prop("checked", false);
	});

	$("input[name=checkDel]").click(function () {
		var total = $("input[name=checkDel]").length;
		var checked = $("input[name=checkDel]:checked").length;

		if (total != checked) $("#checkAll").prop("checked", false);
		else $("#checkAll").prop("checked", true);

	});

}

$("deleteBtn").click(function deleteList() {
	var cnt = $("input[name='checkDel']:checked").length;
	var arr = new Array();
	$("input[name='checkDel']:checked").each(function () {
		arr.push($(this).attr('id'));
	});

	alert("삭제 클릭 :" + arr);
	if (cnt == 0)
		alert("하나 이상을 선택해주세요");
	else {
		$.ajax({
			type: "POST",
			url: "./boardDelete",
			data: "json",
			success: function (data) {
				alert("data.result===>>" + data.result);
				if (data.result != "ok") {
					//alert("삭제");
				} else {
					alert("삭제되었습니다.");
				}
			},
			error: function () {
				alert("서버 통신 오류");
			}
		})
	}
});



var btnEve = function () {

	$("#goRegBtn").click(function () {
		location.href = "./boardRegister";
	});

	$("#resetSearchBtn").unbind().click(function () {
		$("#searchCondition").val("");
		$("#memberSearchWord").val("");
	});

	$("#boardListBtn").click(function () {
		location.href = "./boardList";
	});

	$("#memberListBtn").click(function () {
		location.href = "./memberList";
	});

	$("#goBoardList").click(function () {
		location.href = getContextPath() + "/boardList";
	});

	$("#back").click(function () {
		location.href = getContextPath() + "/boardList";
	});

}


var delmemberChkList = function () {

	var checkedArr = new Array();
	var list = $("input[name='check']");

	for (var i = 0; i < list.length; i++) {
		if (list[i].checked) {
			checkedArr.push(list[i].value);
			//alert(list[i].value);
		}
	}
	if (checkedArr.length == 0) {
		alert("선택된 항목이 없습니다.");
	} else {
		var chk = confirm("해당 게시글을 삭제하시겠습니까?");
		$.ajax({
			url: getContextPath() + "/deletememberChkList",
			type: "POST",
			traditional: true, // 배열넘기기 option
			data: {
				checkedArr: checkedArr
			},
			success: function (result) {
				alert("성공적으로 삭제되었습니다.");
				location.href = getContextPath() + "/memberList";
			},
			error: function () {
				alert("삭제 실패");
			}
		});
	}
}



var regexCheck = function () {

	/*아이디 유효성검사*/
	$("#joinId").blur(function () {
		if ($("#joinId").val().trim() == "") {
			$('#idChkresult').css("color", "red");
			$('#idChkresult').text("아이디는 필수 정보입니다.");

			return false;
		}
	});

	/*이름 유효성검사*/
	$("#joinName").blur(function () {
		if ($("#joinName").val().trim() == "") {
			$('#nameChkresult').css("color", "red");
			$('#nameChkresult').text("이름은 필수 정보입니다.");
			//$("#joinName").focus();
			return false;
		} else {
			$('#nameChkresult').text("");
		}
	});

	/*성별 유효성검사*/
	$("#joinGender").blur(function () {
		if ($("#joinGender").val().trim() == "") {
			$('#genderChkresult').css("color", "red");
			$('#genderChkresult').text("성별은 필수정보입니다.");

			return false;
		} else {
			$('#genderChkresult').text("");
		}
	});

	/*비밀번호 유효성검사*/
	// $("#joinPwd").blur(function () {
	// 	var pswd = $("#joinPswd").val().trim();
	// 	if (pswd == "") {
	// 		$('#pswdChkresult').css("color", "red");
	// 		$('#pswdChkresult').text("필수정보입니다.");
	// 		$("#joinPswd").focus();
	// 		return false;
	// 	} else if (pswd.length < 8 || pswd.length > 20) {
	// 		$('#pswdChkresult').text("비밀번호는 8~20자 이내로 입력해주세요.");
	// 	} else if (pswd.search(/\s/) != -1) {
	// 		$('#pswdChkresult').text("비밀번호는 공백없이 입력해주세요.");
	// 	} else {
	// 		var regExp = /^(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$/;
	// 		var regResult = regExp.test(pswd);
	// 		if (!regResult) {
	// 			$('#pswdChkresult').text("비밀번호는 8자 이상이어야 하며, 숫자/소문자/특수문자를 모두 포함해야 합니다.");
	// 		} else {
	// 			$('#pswdChkresult').text("");
	// 		}
	// 	}
	// });

	$("#joinPwdCheck").blur(function () {
		if ($("#joinPwdCheck").val().trim() != "") {
			if ($("#joinPwdCheck").val().trim() != $("#joinPwd").val().trim()) {
				$("#pswdDplChkresult").text("비밀번호가 일치하지 않습니다.");
				$("#joinPwdCheck").val("");
				$("#joinPwdCheck").focus();
			} else {
				$("#pswdDplChkresult").text("");
			}
		} else {
			$("#pswdDplChkresult").text("필수정보입니다.");
		}
	});

	/*이메일 유효성검사*/
	$("#joinEmail").blur(function () {
		if ($("#joinEmail").val().trim() == "") {
			$('#emailChkresult').css("color", "red");
			$('#emailChkresult').text("필수정보입니다.");
			$("#joinEmail").focus();
			return false;
		} else {
			var regExp = /^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/;
			var regResult = regExp.test($("#joinEmail").val().trim());
			if (!regResult) {
				$('#emailChkresult').text("잘못된 이메일 형식입니다.");
			} else {
				$('#emailChkresult').text("");
			}
		}
	});

	/*핸드폰 유효성검사*/
	$("#joinTel").blur(function () {
		if ($("#joinTel").val().trim() == "") {
			$('#telChkresult').css("color", "red");
			$('#telChkresult').text("필수정보입니다.");
			$("#joinEmail").focus();
			return false;
		} else {
			var regExp = /^\d{3}-\d{3,4}-\d{4}$/;
			var regResult = regExp.test($("#joinTel").val().trim());
			if (!regResult) {
				$('#telChkresult').text("잘못된 전화번호입니다.");
			} else {
				$('#telChkresult').text("");
			}
		}
	});

	/*주소 유효성검사*/
	// $("#joinZipcode").blur(function(){
	// 	if($("#joinZipcode").val().trim() == ""){
	// 		$('#zcodeChkresult').css("color", "red");
	// 		$('#zcodeChkresult').text("필수정보입니다.");
	// 		$("#join").focus();
	// 		return false;
	// 	}else{
	// 		$('#zcodeChkresult').text("");
	// 	}
	// });

}

var emptyCheck = function () {

	if ($("#joinId").val().trim() == "") {
		$('#idChkresult').css("color", "red");
		$('#idChkresult').text("아이디는 필수 정보입니다.");
		$("#joinId").focus();
		return false;
	}
	if ($("#joinPwd").val().trim() == "") {
		$('#pswdChkresult').css("color", "red");
		$('#pswdChkresult').text("비밀번호는 필수 정보입니다.");
		$("#joinPwd").focus();
		return false;
	}
	if ($("#joinName").val().trim() == "") {
		$('#nameChkresult').css("color", "red");
		$('#nameChkresult').text("이름은 필수 정보입니다.");
		$("#joinName").focus();
		return false;
	}
	// if($("#joinGender").val().trim() == ""){
	// 	$('#genderChkresult').css("color", "red");
	// 	$('#genderChkresult').text("성별은 필수 정보입니다.");
	// 	$("#joinGender").focus();
	// 	return false;
	// }
	// if($("#joinEmail").val().trim() == ""){
	// 	$('#emailChkresult').css("color", "red");
	// 	$('#emailChkresult').text("이메일은 필수정보입니다.");
	// 	$("#joinEmail").focus();
	// 	return false;
	// }
	// if($("#joinPhone").val().trim() == ""){
	// 	$('#telChkresult').css("color", "red");
	// 	$('#telChkresult').text("전화번호는 필수정보입니다.");
	// 	$("#joinPhone").focus();
	// 	alert('emtyCheck 이벤트5');
	// 	return false;
	// }
	// if($("#joinZipcode").val().trim() == "" && $("#memberAddress").val().trim() == ""){
	// 	$('#zcodeChkresult').css("color", "red");
	// 	$('#zcodeChkresult').text("필수정보입니다.");
	// 	$("#joinZipcode").focus();
	// 	return false;
	// }
	alert('유효성검사 완료');
	return true;
}








$(document).ready(function () {



	$(document).ready(function () {

		$("#loginBtn").on("click", function () {

			$.ajax({
				url: "./loginCheck",
				type: "POST",
				data: $("#loginFrm").serialize(),
				dataType: "text",
				async: false,
				success: function (result) {
					if (result == "Y") {
						//alert("로그인 성공");
						$("#loginFrm").attr("action", "./boardList").submit();
					} else {
						alert("아이디와 비밀번호가 맞지 않습니다.");
					}
				},
				error: function (request, status, error) {
					alert("code:" + request.status);
					alert("message:" + request.responseText);
					alert("error:" + error);
				}
			});
		});
	});

	$("#regBtn").unbind().on("click", function () {

		var check = emptyCheck();
		var memAuth = $("#sesMemAuth").val();

		if (check) {

			$.ajax({
				url: "./registerMember",
				type: "POST",
				data: $("#joinFrm").serialize(),
				async: false,
				success: function (data) {
					alert("회원가입을 환영합니다.");
					if (memAuth == 'master' || memAuth == 'manager') {
						$("#joinFrm").attr("action", "./memberList").submit();
					} else {
						$("#joinFrm").attr("action", "./login");
					}
				},
				error: function () {
					alert("등록 실패");
				}
			});
		} else {
			alert("회원가입 이벤트 실패");
			return false;
		}
	});



	$("#uptBtn").on("click", function () {
		var memberIdx = $("#memberIdx").val();
		var memberAuth = $("#sesAuth").val();
		var changePswd = $("#changePswd").text();
		//변경됐는지 체킹
		if (changePswd == "변경하기") {
			$("#orginPswd").val($("#orginPswd").val());
		} else {
			//변경
			$("#orginPswd").val($("#uptmemberPswd").val());
		}
		$.ajax({
			url: getContextPath() + "./updatemember",
			type: "POST",
			data: $("#detailfrm").serialize(),
			success: function (data) {
				if (memberAuth == 'master' || memberAuth == 'manager') {
					alert("성공적으로 수정되었습니다.");
					location.href = getContextPath() + "/memberList";
				} else {
					alert("성공적으로 수정되었습니다.");
					location.href = getContextPath() + "/memberMyPage?memberIdx=" + memberIdx;
				}

			},
			error: function () {
				alert("수정 실패");
			}
		});
	});

	$("#delBtn").on("click", function (memberIdx) {
		var memberIdx = $("#memberIdx").val();
		$.ajax({
			url: getContextPath() + "/deletemember",
			data: "memberIdx=" + memberIdx,
			type: "GET",
			success: function (data) {
				alert("성공적으로 삭제되었습니다.");
				location.href = getContextPath() + "/memberList";
			},
			error: function () {
				alert("삭제 실패");
			}
		});
	});

	$("#memberZipcodeSearchBtn").unbind().click(function () {
		daum.postcode.load(function () {
			new daum.Postcode({
				oncomplete: function (data) {
					// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

					// 각 주소의 노출 규칙에 따라 주소를 조합한다.
					// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
					var addr = ''; // 주소 변수
					var extraAddr = ''; // 참고항목 변수

					//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
					if (data.memberSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
						addr = data.roadAddress;
					} else { // 사용자가 지번 주소를 선택했을 경우(J)
						addr = data.jibunAddress;
					}

					// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
					if (data.memberSelectedType === 'R') {
						// 법정동명이 있을 경우 추가한다. (법정리는 제외)
						// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
						if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
							extraAddr += data.bname;
						}
						// 건물명이 있고, 공동주택일 경우 추가한다.
						if (data.buildingName !== '' && data.apartment === 'Y') {
							extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
						}
						// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
						if (extraAddr !== '') {
							extraAddr = ' (' + extraAddr + ')';
						}
						// 조합된 참고항목을 해당 필드에 넣는다.
						document.getElementById("memberExtraAddress").value = extraAddr;

					} else {
						document.getElementById("memberExtraAddress").value = '';
					}

					// 우편번호와 주소 정보를 해당 필드에 넣는다.
					document.getElementById('memberZipcode').value = data.zonecode;
					document.getElementById("memberAddress").value = addr;
					// 커서를 상세주소 필드로 이동한다.
					document.getElementById("memberDetailAddress").focus();
				}
			}).open();
		});
	});

	$("#memberId").on("keyup", function () {
		var memberId = $("#memberId").val();
		if (memberId != '') {
			$.ajax({
				url: getContextPath() + "/idDplChk",
				type: "GET",
				data: "memberId=" + memberId,
				success: function (result) {
					if (result == '0') {
						var regExp = /^[a-z0-9]{1}[a-z0-9]{4,19}$/;
						var regResult = regExp.test($("#memberId").val().trim());
						if (regResult) {
							$('#idChkresult').css("color", "green");
							$('#idChkresult').text('사용 가능한 아이디입니다.');
						} else {
							if (!regResult) {
								$('#idChkresult').css("color", "red");
								$('#idChkresult').text('5~20자의 영문 소문자, 숫자만 사용가능합니다.');
							} else {
								$('#idChkresult').text("");
							}
						}
					} else {
						$('#idChkresult').css("color", "red");
						$('#idChkresult').text('이미 사용중인 아이디입니다.');
					}
				},
				error: function (request, status, error) {
					alert("code:" + request.status);
					alert("status:" + request.responseText);
					alert("error:" + error);
				}
			});
		} else {
			$('#idChkresult').css("color", "red");
			$('#idChkresult').text('아이디는 필수 정보입니다.');
			$("#memberId").focus();
		}
	});

	$("#changePswd").on("click", function () {
		var click = document.getElementById("pswd-content");
		if (click.style.display === "none") {
			click.style.display = "block";
			$("#changePswd").text("변경취소");
		} else {
			click.style.display = "none";
			$("#changePswd").text("변경하기");
			$("#memberCurPswd").val("");
			$("#chkCurPswd").text("");
			$("#uptmemberPswd").val("");
			$("#chkUptPswd").text("");
			$("#dblChkPswd").val("");
			$("#chkUptPswdResult").text("");
		}
	});

	$("#memberCurPswd").on("keyup", function () {
		var memberPswd = $("#memberCurPswd").val();
		if (memberPswd != null) {
			$.ajax({
				url: getContextPath() + "/pswdDplChk",
				type: "GET",
				data: "memberPswd=" + memberPswd,
				success: function (result) {
					if (result != '') {
						$('#chkCurPswd').css("color", "green").css("font-size", "13px");
						$('#chkCurPswd').text('기존비밀번호와 일치합니다.');
					} else {
						$('#chkCurPswd').css("color", "red").css("font-size", "13px");
						$('#chkCurPswd').text('기존비밀번호와 일치하지 않습니다.');
						return false;
					}
				},
				error: function (request, status, error) {
					alert("code:" + request.status);
					alert("status:" + request.responseText);
					alert("error:" + error);
				}
			});
		} else {
			$('#chkCurPswd').css("color", "red").css("font-size", "13px");
			$('#chkCurPswd').text('필수정보입니다.');
			return false;
		}
	});

	$("#uptmemberPswd").blur(function () {
		var pswd = $("#uptmemberPswd").val().trim();
		if (pswd == "") {
			$("#chkUptPswd").css("color", "red").css("font-size", "13px");
			$("#chkUptPswd").text("필수정보입니다.");
			$("#chkUptPswd").focus();
			return false;
		} else if (pswd.length < 8 || pswd.length > 20) {
			$("#chkUptPswd").css("color", "red").css("font-size", "13px");
			$("#chkUptPswd").text("비밀번호는 8~20자 이내로 입력해주세요.");
			return false;
		} else if (pswd.search(/\s/) != -1) {
			$("#chkUptPswd").css("color", "red").css("font-size", "13px");
			$("#chkUptPswd").text("비밀번호는 공백없이 입력해주세요.");
			return false;
		} else {
			var regExp = /^(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$/;
			var regResult = regExp.test(pswd);
			if (!regResult) {
				$("#chkUptPswd").css("color", "red").css("font-size", "13px");
				$("#chkUptPswd").text("비밀번호는 8자 이상, 숫자/소문자/특수문자를 모두 포함해야 합니다.");
				return false;
			} else {
				$("#chkUptPswd").text("");
			}
		}
	});

	$("#joinPwd").blur(function () {
		if ($("#joinPwd").val().trim() != "") {
			if ($("#uptmemberPswd").val().trim() != $("#joinPwd").val().trim()) {
				$("#chkUptPswdResult").css("color", "red").css("font-size", "13px");
				$("#chkUptPswdResult").text("비밀번호가 일치하지 않습니다.");
				$("#joinPwd").val("");
				$("#joinPwd").focus();
				return false;
			} else {
				$("#chkUptPswdResult").text("");
			}
		} else {
			$("#chkUptPswdResult").css("color", "red").css("font-size", "13px");
			$("#chkUptPswdResult").text("필수정보입니다.");
			return false;
		}
	});

	$("#memberAuth").on("change", function () {
		var selectVal = $(obj).val();
		$("#auth").val(selectVal);
	});
});

/* 절대 경로 */
function getContextPath() {
	var hostIndex = location.href.indexOf(location.host) + location.host.length;
	return location.href.substring(hostIndex, location.href.indexOf('/', hostIndex + 1));
}



// 넘어온 값이 빈값인지 체크합니다.
// !value 하면 생기는 논리적 오류를 제거하기 위해
// 명시적으로 value == 사용
// [], {} 도 빈값으로 처리
var isEmpty = function (value) {
	if (value == ""
		|| value == null
		|| value == undefined
		|| value == "undefined"
		|| (value != null && typeof value == "object" && !Object
			.keys(value).length)) {
		return true
	} else {
		return false
	}
};



function goMemberDelete(memIdx) {
	if (confirm("정말 탈퇴하시겠습니까?") == true) {
		var num = $("#memIdx").val();

		$.ajax({
			url: "./deleteMember",
			data: "memIdx=" + memIdx,
			type: "post",
			success: function (data) {
				alert("성공적으로 탈퇴되었습니다.");
				location.href = "./memberList";
			},
			error: function () {
				alert("탈퇴 실패");
			}
		});



	}


}

function goMemberDetail(str) {
	$("#memIdx").val(str);
	$("#detailFrm").submit();
}


// var goMemberMyPage = function(memIdx){
// 	location.href = "./goMyPageUpdate?memIdx=" + memIdx;
// }




// ready(() => {

	//alert('이벤트 발생')
// });

// 핸드폰 자동 하이픈 입력
// $(document).on("keyup", ".phoneNumber", function () {
// 	//alert('이벤트 발생')
// 	$(this).val($(this).val().replace(/[^0-9]/g, "")
// 	.replace(/(^02|^0505|^1[0-9]{3}|^0[0-9]{2})([0-9]+)?([0-9]{4})$/, "$1-$2-$3")
// 	.replace("--", "-"));

// });




// document.querySelector(".phoneNumber").addEventListener("keyup",function(){
// 	this.val(this.val().replace(/[^0-9]/g, "")
// 	.replace(/(^02|^0505|^1[0-9]{3}|^0[0-9]{2})([0-9]+)?([0-9]{4})$/, "$1-$2-$3")
// 	.replace("--", "-"));
// });


//  ready(() => { 
	
	

	// document.querySelector(".phoneNumber").addEventListener("keyup",function(){
	// 	alert('이벤트 발생')
	// 	this.val(this.val().replace(/[^0-9]/g, "")
	// 	.replace(/(^02|^0505|^1[0-9]{3}|^0[0-9]{2})([0-9]+)?([0-9]{4})$/, "$1-$2-$3")
	// 	.replace("--", "-"));
	// });

	// document.querySelector(".phoneNumber").addEventListener("keyup", (e) => {
 	// 	alert('이벤트 발생2');
 	// })


	//  document.addEventListener("keyup", () => { 
	// 	alert('이벤트 발생3')
	//   });

// 	  var phoneNumber = document.querySelector(".phoneNumber");


// 	  function phoneNumber(value) {
// 		alert('이벤트 발생3')
// 		value = value.replace(/[^0-9]/g, "");
// 		return value.replace(
// 		  /(^02.{0}|^01.{1}|[0-9]{3})([0-9]+)([0-9]{4})/,
// 		  "$1-$2-$3"
// 		);
// 	  }

//    });

//alert('이벤트 발생@')


	//alert('이벤트 발생@2')
// 핸드폰 자동 하이픈 입력
	var ready = (callback) => {
		if (document.readyState != "loading") callback();
		else document.addEventListener("DOMContentLoaded", callback);
	}


	ready(() => {

   // 핸드폰 자동 하이픈 입력
   var autoHypenPhone = function(str){
	

	
	str = str.replace(/[^0-9]/g, '');
	var tmp = '';
	if( str.length < 4){
		return str;
	}else if(str.length < 7){
		tmp += str.substr(0, 3);
		tmp += '-';
		tmp += str.substr(3);
		return tmp;
	}else if(str.length < 11){
		tmp += str.substr(0, 3);
		tmp += '-';
		tmp += str.substr(3, 3);
		tmp += '-';
		tmp += str.substr(6);
		return tmp;
	}else{              
		tmp += str.substr(0, 3);
		tmp += '-';
		tmp += str.substr(3, 4);
		tmp += '-';
		tmp += str.substr(7);
		return tmp;
	}
 id="phoneNum"
	return str;
}


var phoneNum = document.querySelector('.phoneNumber');

phoneNum.onkeyup = function(){
console.log(this.value);
this.value = autoHypenPhone( this.value ) ;  
}

	})



