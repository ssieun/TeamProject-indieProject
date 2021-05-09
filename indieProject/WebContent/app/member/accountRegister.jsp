<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css" />
<link rel="shortcut icon" href="${pageContext.request.contextPath}/images/camera2.png" type="image/x-icon">
<link rel="icon" href="${pageContext.request.contextPath}/images/camera2.png" type="image/x-icon">
<title>계좌 등록</title>
</head>
<style>

	body {
		text-align: center;
	}
	h3 {
		font-size: 1.5em;
		margin: 0 0 0.5em 0;
	}
	h2 {
		font-size: 2.5em;
		color:#847349;
	}
	label {
		font-size: 1em;
		margin-bottom:0;
		margin-top: 1em;
	}
</style>
<body style="padding:10px;">
	
	<h2 style="margin-bottom:0;">계좌 등록하기</h2>
	<div>
		<div>
			<h3 style="font-size: 1.2em;">첫 환전 시 계좌를 등록해야 합니다.</h3>
			<form name="registerForm" method="post" action="${pageContext.request.contextPath}/member/accountRegisterOk.me">
				<div style="text-align: left;">
					<label>예금주 명</label>
					<input name="memberName" type="text">
					<label>은행명</label>
					<select name="memberBank" id="memberBank">
								<option value="none">- 은행 선택 -</option>
								<option value="하나은행">KEB하나은행</option>
								<option value="제일은행">SC제일은행</option>
								<option value="국민은행">국민은행</option>
								<option value="신한은행">신한은행</option>
								<option value="외환은행">외환은행</option>
								<option value="우리은행">우리은행</option>
								<option value="한국시티은행">한국시티은행</option>
								<option value="경남은행">경남은행</option>
								<option value="광주은행">광주은행</option>
								<option value="대구은행">대구은행</option>
								<option value="부산은행">부산은행</option>
								<option value="전북은행">전북은행</option>
								<option value="제주은행">제주은행</option>
								<option value="기업은행">기업은행</option>
								<option value="농협">농협</option>
								<option value="농협중앙회">농협중앙회</option>
								<option value="수협">수협</option>
								<option value="카카오뱅크">카카오뱅크</option>
							</select>
					<label>계좌번호(-를 제외한 숫자만 입력해주세요.)</label>
					<input name="accountNum" type="text">
				</div>
			</form>
			<div>
				<a style="width:45%" href="javascript:goRegister()" class="button fit small">등록하기</a>
				<a style="width:45%" href="javascript:thisClose();" class="button fit small">나가기</a>
			</div>
		</div>
	</div>
</body>
	<script src="//code.jquery.com/jquery-3.5.1.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
	<script>
		var contextPath = "${pageContext.request.contextPath}";
		function goRegister(){
			var memberName = $("input[name='memberName']").val();
			var memberBank = $("select[name='memberBank']").val();
			var accountNum = $("input[name='accountNum']").val();
			
			if(memberName.trim() == ""){
				alert("예금주를 입력해주세요.");
				return false;
			}
			if(memberBank == "none"){
				alert("은행을 선택해주세요.");
				return false;
			}
			if(accountNum.trim() == ""){
				alert("계좌번호를 입력해주세요.");
				return false;
			}
			if(!Number.isInteger(Number(accountNum))){
				alert("계좌번호는 숫자만 입력해주세요.");
				return false;
			}
			var choice = confirm("은행: "+memberBank+"\n계좌번호: "+accountNum+"\n예금주: "+memberName+"\n한번 입력한 정보는 수정이 불가합니다.\n위 정보가 맞으면 확인을 눌러주세요.");
			
			if(choice){
				
				$.ajax({
					url:contextPath+"/member/accountRegisterOk.me",
					type:"get",
					data:{"memberBank" : memberBank, "accountNum" : accountNum, "memberName" : memberName},
					dataType:"text",
					success: function(result){
						if(result.trim() == "ok"){
							alert("계좌등록이 완료되었습니다. 다시 환전신청 해주세요.");
							thisClose();
						}else{
							alert("오류발생. 다시 시도해주세요.");
							thisClose();
						}
					},
					error:function(){//통신 오류 시
						console.log("오류");
					}
				});
			}
		}
		function thisClose()
		 {
			self.opener = self;
			window.close();
		 }
	</script>
</html>