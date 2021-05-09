/**
 * 아이디 비밀번호 찾기
 *
 */



var id_div=document.getElementById("tabCont1_1");
var pw_div=document.getElementById("tabCont1_2");

var id_button=document.getElementById("id_button");
var pw_button=document.getElementById("pw_buttom");

//id 찾기 클릭시
function findId(){
	$("#findId").show();
	$("#findPw").hide();
	$("#findIdBtn").attr('style','color: white !important; background:#4fc2cd; box-shadow:none;');
	$("#findPwBtn").attr('style', 'background-color:transparent; box-shadow:inset 0 0 0 2px rgb(144 144 144 / 25%); color:#616161 !important');
}


//pw찾기 클릭시
function findPw(){
	$("#findPw").show();
	$("#findId").hide();
	$("#findPwBtn").attr('style','color: white !important; background:#4fc2cd; box-shadow:none;');
	$("#findIdBtn").attr('style', 'background-color:transparent; box-shadow:inset 0 0 0 2px rgb(144 144 144 / 25%); color:#616161 !important');
}

// 아이디 전송
function sendId(){
	var name = $("input[name='memberNameI']").val();
	var email = $("input[name='memberEmailI']").val();
	
	if(name == ""){
		alert("이름을 입력해 주십시오.");
		document.FindIdPwForm.memberNameI.focus();
	}else if(email == ""){
		alert("이메일을 입력해 주십시오.");
		document.FindIdPwForm.memberEmailI.focus();
	}else{
		alert("요청을 처리 중입니다.");
		$.ajax({
			url:contextPath + "/member/MemberFindIdAction.me?memberName="+name+"&memberEmail="+email,
			type:"get",
			dataType:"text",
			success:function(result){
				if(result.trim() == "ok"){
					alert("아이디 전송이 완료되었습니다. 이메일을 확인해 주십시오.");
					location.reload();
				}else if(result.trim() == "not-ok"){
					alert("일치하는 회원 정보가 없습니다. 다시 시도해 주십시오.");
				}else{
					alert("이메일 전송에 실패했습니다. 잠시 후 다시 시도해 주십시오.");
				}
			},
			error:function(){
				console.log("통신 오류");
			}
		});
	}
}



// 임시 비밀번호 전송
function sendTempPw(){
	var name = $("input[name='memberNameP']").val();
	var id = $("input[name='memberIdP']").val();
	var email = $("input[name='memberEmailP']").val();


	if(name == ""){
		alert("이름을 입력해 주십시오.");
		document.FindIdPwForm.memberNameP.focus();
	}else if(id == ""){
		alert("아이디를 입력해 주십시오.");
		document.FindIdPwForm.memberIdP.focus();
	}else if(email == ""){
		alert("이메일을 입력해 주십시오.");
		document.FindIdPwForm.memberEmailP.focus();
	}else{
		alert("요청을 처리 중입니다.");
		$.ajax({
			url:contextPath + "/member/MemberFindPwAction.me?memberName="+name+"&memberId="+id+"&memberEmail="+email,
			type:"get",
			dataType:"text",
			success:function(result){
				if(result.trim() == "ok"){
					alert("임시 비밀번호 전송이 완료되었습니다. 이메일을 확인해 주십시오.");
					location.reload();
				}else if(result.trim() == "not-ok"){
					alert("일치하는 회원 정보가 없습니다. 다시 시도해 주십시오.");
				}else{
					alert("이메일 전송에 실패했습니다. 잠시 후 다시 시도해 주십시오.");
				}
			},
			error:function(){
				console.log("통신 오류");
			}
		});
	}
}