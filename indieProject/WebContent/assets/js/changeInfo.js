/**
 * 
 */

//비밀번호와 비밀번호 확인 일치여부
var pwSameCheck = false;
//이메일 변경되었는지 여부
var emailChanged = false;
//이메일 인증 성공 여부
var emailCheckOk = false;

//기존 이메일 정보 저장
var nowEmail;

//받아온 이메일 인증번호
var emailCode;


function sendEmail(){
	$("#sendEmail").hide()
	$("#checkEmail").show()
}

function checkPw(){
	pw = $("input[name='checkPw']").val();
	if(pw == ""){
		alert("비밀번호를 입력해주세요.");
	}else{
		$.ajax({
			url : contextPath + "/member/MemberCheckPwOk.me",
			type : "post",
			data : {"memberPw" : pw},
			dataType : "text",
			success : function(result){
				if(result.trim() == "no"){
					alert("비밀번호가 일치하지 않습니다.");
				}else{
					var memberData = JSON.parse(result);
					$("input[name='memberId']").val(memberData.memberId);
					$("input[name='memberEmail']").val(memberData.memberEmail);
					nowEmail = memberData.memberEmail;
					$("#step1").hide();
					$("#step2").show();
				}
			},
			error:function(){//통신 오류 시
				console.log("오류");
			}
		})
	}
}

//키 이벤트 함수
$("input[name='memberPw2']").keyup(function(event){
	var pw1 = $("input[name='memberPw']").val();
	var pw2 = $("input[name='memberPw2']").val();
	
	if(pw1 == pw2){
		$("input[name='memberPw2']").css("color", "green");
		pwSameCheck = true;
	}else{
		$("input[name='memberPw2']").css("color", "red");
		pwSameCheck = false;
	}
});

//이메일에 변경점이 있다면 인증해야한다.
$("input[name='memberEmail']").keyup(function(event){
	var email = $("input[name='memberEmail']").val();
	if(email != nowEmail){
		emailChanged = true;
	}else{
		emailChanged = false;
	}
});
function sendEmail(){
	var email = $("input[name='memberEmail']").val();
	if(email == ""){
		alert("변경할 이메일을 입력해주세요.");
	}else if(!emailChanged){
		alert("이메일 변경이 없을 경우 인증이 필요하지 않습니다.");
	}else{
		$("input[name='memberEmail']").attr("readOnly", "true");
		
		$.ajax({
			url : contextPath + "/member/MemberEmailCheckOkAction.me",
			type : "post",
			data : {"email" : email},
			dataType : "text",
			success : function(result){
				emailCode = result;
				alert("입력한 이메일로 인증번호가 전송되었습니다.");
				$("#checkEmail").show();
			},
			error:function(){//통신 오류 시
				console.log("오류");
			}
		})
	}
}

function emailCodeCheck(){
	var getEmailCode = $("input[name='emailCode']").val();
	if(getEmailCode != emailCode){
		alert("인증코드가 일치하지 않습니다.");
	}else{
		emailCheckOk = true;
		alert("인증되었습니다.");
	}
}

function saveInfo(){
	//1. 변경된 항목이 있는지 확인
	//2. 비밀번호 비어있는지 확인 -> 입력한 값이 조건 충족하는지 확인 -> 입력값과 확인값이 일치하는지 확인
	//3. 이메일 변경여부확인 -> 인증여부확인
	var password = $("input[name='memberPw']").val();
	if((password == "") && !emailChanged){
		alert("변경된 항목이 없습니다.");
		return false;
	}
	//비밀번호가 비어있지 않다면
	if(password != ""){
		var reg = /^(?=.*?[a-z])(?=.*?[0-9]).{8,}$/;
		//비밀번호가 조건을 충족하는지
		if(reg.test(password)){
			//비밀번호와 비밀번호 확인이 일치할 때
			if(!pwSameCheck){
				alert("비밀번호와 비밀번호 확인이 일치하지 않습니다.");
				return false;
			}
		}else{
			alert("비밀번호는 영문 숫자 포함 8자리 이상이어야 합니다.");
			return false;
		}
	}
	//이메일이 변경되었다면
	if(emailChanged){
		//이메일 인증이 완료되지 않았다면
		if(!emailCheckOk){
			alert("이메일 인증을 완료해주세요.");
			return false;
		}
	}
	
	alert("내 정보 변경이 완료되었습니다.");
	document.ChangeInfoForm.submit();
}