/**
 * 
 */

/**
 * 회원가입
 */


var idDiv=document.getElementById("idPw_Signup");
var emailDiv=document.getElementById("email_Signup");
var checkDiv=document.getElementById("check_Signup");
var finishDiv=document.getElementById("signup_finish");


//아이디 중복검사 여부 flag
var idCheck = false;
//비밀번호 확인
var pwCheck=false;
//이메일 코드검사 여부
var codeCheck=false;



function step1(){
	$("#step1").css("display", "block");
	$("#step2").css("display", "none");
	$("#step3").css("display", "none");
}

function step2(){

	var id = $("input[name='memberId']").val();
	var pw = $("input[name='memberPw']").val();
	var pw_check = $("input[name='memberPw2']").val();
	var name = $("input[name='memberName']").val();
	
	if(name==""){
		alert("이름을 입력해주세요.");
		return false;
	}else if(id=="" || !idCheck){
		alert("아이디를 확인해주세요.");
		return false;	
	}else if(pw=""){
		alert("비밀번호를 입력해주세요");
		return false;
	}else if(pwCheck==false){
		alert("비밀번호는 영문 숫자 포함 8자리 이상입력해주세요.");
		return false;
	}else{	
	$("#step1").css("display", "none");
	$("#step2").css("display", "block");
	}

}

//약관 동의 
function step3(){
	var email = $("input[name='memberEmail]").val();
	if(codeCheck==false){
		alert("이메일 인증을 확인해주세요.");
		return false;
	}else if(email==""){
		alert("이메일을 입력해주세요.");
		return false;		
	}else{
		$("#step1").css("display", "none");
		$("#step2").css("display", "block");
	}	
}

//회원가입 버튼
function signUpEnd(){
	var form=document.signupForm;
	
	if(! $("input[name='check1']").prop("checked")  ||  ! $("input[name='check2']").prop("checked")){
		alert("약관에 모두 동의해주세요.");
		return false;	
	}else{
		form.submit();
	}
}

//키 이벤트 함수
$("input[name='memberId']").keyup(function(event){
	var id = $("input[name='memberId']").val();
	checkId(id);
});

function checkId(id){
	if(id == ""){
		$("#pwCheck_text").text("아이디를 입력해주세요.");
	}else{
		$.ajax({
			url : contextPath + "/member/MemberCheckIdOk.me?id="+id,
			type : "get",
			dataType : "text",
			success : function(result){
				if(result.trim() == "ok"){
					idCheck = true;
					$("#pwCheck_text").text("사용 가능한 아이디입니다.");
					$("#pwCheck_text").css("color", "black");
				}else{
					$("#pwCheck_text").text("중복된 아이디입니다.");
					$("#pwCheck_text").css("color", "red");
					idCheck = false;
				}
			},
			error:function(){//통신 오류 시
				console.log("오류");
			}

		})
	}
}

//ajax로 받은 코드 저장할 전역변수
var code;

function goEmailCheck(){
	var email=$("input[name='memberEmail']").val();
	
	if(email==""){
		//이메일 미입력시
		alert("이메일을 입력해주세요");
		return false;
	}else{
		//인증코드 보낼시 다시 이메일 수정 못하도록 막아주기 
		document.signupForm.memberEmail.readOnly = true;
		$.ajax({
			url : contextPath + "/member/MemberEmailCheckOkAction.me",
			type:"post",
			data:({"email":email}),
			dataType:"text",
			success : function(result){
				if(result.trim() == "no"){
					alert("중복된 이메일 입니다.");
					document.signupForm.memberEmail.readOnly = false;
				}else{
					alert("인증코드를 발송하였습니다.");
					code=result;					
				}
			},
			error:function(){
				console.log("오류");
			}
		});
	}
}

//인증코드 확인 버튼 
function checkCode(){
	var emailcode=$("input[name='emailCheck']").val();
	
	if(emailcode==""){
		alert("인증코드를 입력해주세요.");
		document.signupForm.memberEmail.readOnly = false;
	}else if(code==emailcode){
		//인증코드 맞음 
		alert("인증되었습니다.");
		codeCheck=true;
	}else if(code!=emailcode){
		//인증코드 틀림
		//인증코드 보낼시 다시 이메일 수정할 수 있도록 
		document.signupForm.memberEmail.readOnly = false;
		alert("인증에 실패했습니다.다시 시도해주세요");
		codeCheck=false;
		return false;
	}
		
}

