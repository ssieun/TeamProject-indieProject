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
<title>팝콘 보내기</title>
</head>
<style>

	body {
		text-align: center;
	}
	h3 {
		font-size: 1.5em;
		font-family: SDSamliphopangche_Outline;
		margin: 0 0 0.5em 0;
	}
	h2 {
		font-size: 2.5em;
		font-family: SDSamliphopangche_Outline;
		color:#847349;
	}
	
	@font-face {
	    font-family: 'SDSamliphopangche_Outline';
	    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts-20-12@1.0/SDSamliphopangche_Outline.woff') format('woff');
	    font-weight: normal;
  	 	font-style: normal;
	}
</style>
<body style="padding:10px;">
	<c:set var="amaTitle" value="${amaTitle}" />
	<c:set var="amaNum" value="${amaNum}" />
	<c:set var="myPopcorn" value="${myPopcorn}" />
	
	<h2 style="margin-bottom:0;">팝콘 보내기</h2>
	<div>
		<div class="image fit">
			<img style="width:75%; margin:0 auto;" alt="" src="${pageContext.request.contextPath}/images/sendPopcorn.png">
		</div>
		<div>
			<h3 style="font-size: 1.8em;">보유 팝콘: <span>${myPopcorn}</span>	</h3>
			<h3>보낼 팝콘 개수</h3>
			<div style="display:flex; margin-bottom:18px;">
				<input name="popcorn" type="number" style="width:64%; margin-left:auto;" placeholder="">
				<a href="javascript: sendPopcorn();" style="width:27%; margin-right:auto;" class="button primary fit small">보내기</a>
			</div>
			<div>
				<a style="width:45%" 
				href="javascript:window.open('${pageContext.request.contextPath}/member/memberMyPopcorn.me', '', '_blank');" class="button fit small">충전하기</a>
				<a style="width:45%" href="javascript:window.close();" class="button fit small">나가기</a>
			</div>
		</div>
	</div>
</body>
	<script src="//code.jquery.com/jquery-3.5.1.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
<script>
	function sendPopcorn(){
 		var amaNum = "${amaNum}";
		var amaTitle = "${amaTitle}";
		var myPopcorn = "${myPopcorn}";
 		var popcornNum = $("input[name='popcorn']").val();
 		var text = "영화 ["+amaTitle + "]에 팝콘 " + popcornNum +" 개를 선물합니다.\n진행하시겠습니까?";
 		
		if(popcornNum == ""){
			alert("팝콘 수를 입력해 주십시오.");
			return;
		}else if(popcornNum <= 0){
			alert("팝콘은 최소 1개부터 선물할 수 있습니다.");
			return;
		}else if (parseInt(myPopcorn) < parseInt(popcornNum)){
			alert("팝콘 보유 개수가 모자랍니다. 충전 후 다시 시도해 주십시오.");
			return;
		}else{
			
			if(confirm(text)){
				location.replace("${pageContext.request.contextPath}/amaMovie/PopcornSendOk.ama?amaNum="
									+amaNum+"&amaTitle="+amaTitle+"&popcornNum="+popcornNum);
			}else{
				alert("팝콘 선물하기가 취소되었습니다.");
			}
		}
			
	}
</script>
</html>