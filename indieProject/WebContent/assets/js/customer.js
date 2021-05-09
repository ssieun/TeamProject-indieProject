
/**
 * 고객센터
 */

var emailCheck=false;

$("input[name='memberEmail']").keyup(function(event){
	var memberEmail = $("input[name='memberEmail']").val();
	var regExp = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
	if(regExp.test(memberEmail)){
		emailCheck=true;
	}
	else {
		emailCheck=false;
	}	
});


function submit(){
	var memberName = $("input[name='memberName']").val();
	var memberEmail = $("input[name='memberEmail']").val();
	var message = $("#message").val();
	//카테고리 값 가져오기
	var category=$("select[name='category']").val();

	if(memberName == "" ){
		alert("이름을 입력해주세요.");
		return false;
	}else if(memberEmail==""){
		alert("이메일을 입력해주세요.");
		return false;
	}else if(emailCheck==false){
		alert("이메일 양식을 확인해주세요.");
		return false;
	}else if(category==""){
		alert("문의내용을 선택해주세요");
		return false;
	}else if(message==""){
		alert("문의내용을 입력해주세요.");
		return false;
	}else {
		$.ajax({
		url : contextPath+"/member/MemberCustomerAction.me",
		type:"post",
		data:({memberName: memberName , memberEmail : memberEmail,message : message, category : category}),
		datatype:"text",
		success : function(result){
			if(result.trim()=="ok"){
				alert("문의내역이 정상적으로 접수되었습니다.");
				//창 새로고침 해주기 
				history.go(0);
			}else{
				alert("문의 접수에 실패하였습니다. 다시 시도해주세요.");
			}
		},
		error:function(){//통신 오류 시
			console.log("오류");
		}
	})
}
}