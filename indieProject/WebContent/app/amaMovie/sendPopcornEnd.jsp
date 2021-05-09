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
		font-size: 1.3em;
		font-family: SDSamliphopangche_Outline;
		margin: 0 0 0.5em 0;
	}
	h2 {
		font-size: 2.5em;
		font-family: SDSamliphopangche_Outline;
		color:#847349;
	}
	p {
		font-size: 1.3em;
		font-family: SDSamliphopangche_Outline;
		margin: 0 0 0.5em 0;
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
	<c:set var="popcornNum" value="${popcornNum}" />
	<c:set var="sendNum" value="${sendNum}" />

	<h2 style="margin-bottom:0;">팝콘 보내기</h2>
	<div>
		<div class="image fit">
			<img style="width:75%; margin:0 auto;" alt="" src="${pageContext.request.contextPath}/images/sendPopcorn.png">
		</div>
		<div>
			<h3><span style="color:#e2a40a;">${popcornNum}</span>개 선물 고맙습니다.</h3>
			<p>[<span>${amaTitle}</span>]에 남길<br>후원자 한마디:</p>
			<div style="display:flex; margin-bottom:18px;">
				<input id="popComment" type="text" style="width:64%; margin-left:auto;" placeholder="">
				<a href="javascript:sendPopcornEnd();" style="width:27%; margin-right:auto;" class="button primary fit small">작성</a>
			</div>
			<div>
				<a style="width:45%" href="javascript:exit()" class="button fit small">나가기</a>
			</div>
		</div>
	</div>
</body>
	<script src="//code.jquery.com/jquery-3.5.1.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
<script>
	function sendPopcornEnd(){
		var popComment = $("#popComment").val();
		if(popComment == ""){
			alert("빈칸을 채워주십시오.");
			return;
		}
		$.ajax({
			url : "${pageContext.request.contextPath}/amaMovie/PopcornSendEnd.ama?content="+popComment+"&sendNum=${sendNum}",
			type : "get",
			dataType : "text",
			success : function(result){
				alert(result);
				window.close();
			}
		});
	}
	function exit(){
		var text = "후원자 한마디 작성 없이 나가시겠습니까?"
		if(confirm(text)){
			window.close();
		}
	}
</script>
</html>