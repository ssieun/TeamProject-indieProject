<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
	
<!DOCTYPE html>
<html>
<head>
<title>인디프로젝트</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/main.css" />
<link rel="shortcut icon" href="${pageContext.request.contextPath}/images/camera2.png" type="image/x-icon">
<link rel="icon" href="${pageContext.request.contextPath}/images/camera2.png" type="image/x-icon">
</head>
<style>
fieldset {
	border-radius: 7%;
	margin: 0 auto;
	padding-right: 0%;
}

.poster {
	border: dotted;
	/* width: 100%;
	height: 70%; */
}

.image.fit {
	margin: 0 0;
}
@media screen and (max-width: 480px) {
	.button {
		float:none !important;
		width: 100%;
		padding: 0 32px !important;
	}
}
#bImgHelp {
	display: none;
	position: absolute;
	width: 200px;
	margin: 0;
	padding: 0.5rem;
	background: #FFFFFF;
	border-radius: 5px;
	list-style: none;
	box-shadow: 0 15px 35px rgba(50, 50, 90, 0.1), 0 5px 15px
		rgba(0, 0, 0, 0.07);
	z-index: 999999;
}
</style>
<body class="is-preload">
	<c:set var="b_vo"  value="${b_vo}"/>
	<c:set var="boardImages" value="${boardImages}"/>

	<c:if test="${session_id eq null}">
		<script>
			alert("로그인 후 이용해주세요");
			location
					.replace("${pageContext.request.contextPath}/member/Login.me");
		</script>
	</c:if>

	<!-- Header -->
	<jsp:include page="${pageContext.request.contextPath}/header.jsp" />

	<!-- Main -->
	<section id="main">
		<div class="container">
			<header class="major">
				<h2>게시글 수정</h2>
				<p>작성된 게시글은 자유 게시판에 등록됩니다.</p>
			</header>
			<div class="row">
				<!-- Text -->
				<div class="col-8 col-10-medium col-12-small" style="margin: 0 auto;">
					<fieldset
						style="border: solid; border-style: outset; padding-left: 4%; padding-top: 4%; padding-bottom: 4%; padding-right: 4%;">
						<br>
						<h3 style="display:inline-block;">사진 업로드</h3>
						<span><img id="bImg" style="width: 17px; cursor: help;" 
						src="${pageContext.request.contextPath}/images/question.png"></span>
						<div id="bImgHelp" style="display: none; resize: none;">첫번째로
							첨부된 이미지가 대표 이미지로 사용됩니다.</div>
						<section style="margin-right: auto; margin-left: auto;">
							<form action="${pageContext.request.contextPath}/board/BoardModifyOk.bo" method="post" name="boardForm" enctype="multipart/form-data">
								<input type="hidden" name="boardNum" value="${b_vo.getBoardNum()}">
								<input type="hidden" name="photoChanged">
								<div class="photos" style="display: flex;">
									<!-- 동적으로 사진 가져오기 -->
								</div>

								<div>
									<br>
									<h3>게시글 내용 작성</h3>
									<textarea name="boardContent" maxlength="200" id="boardContent"
										style="width: 100%; resize: none; margin-left: auto; margin-right: auto; margin-bottom: 1%;">${b_vo.getBoardContent()}</textarea>
									<div id="count">
									<%-- 내가 작성한 텍스트 길이 값  --%>
									<input type="hidden" id="contentCnt" value="${fn:length(b_vo.getBoardContent())}">
										<span id="current_count">0</span> <span id="maximum_count">/
											200</span> 
									<a href="javascript: submit();" class="button small" style="float: right;">수정 완료</a>
									<a href="javascript: photo();" class="button alt small" style="float: right;">사진 수정</a>
									</div>
								</div>
							</form>
						</section>
					</fieldset>
				</div>
			</div>
		</div>

			<form name="deleteBoard" method="post" action="${pageContext.request.contextPath}/board/BoardDeleteOk.bo">
				<input type="hidden" name="boardNum" value="${b_vo.getBoardNum()}">
			</form>

	</section>



	<!-- Footer -->
	<jsp:include page="${pageContext.request.contextPath}/footer.jsp" />

	<!-- Scripts -->
	<script>var photos=$(".photos");</script>
	<script>var boardNum = "${b_vo.getBoardNum()}";</script>
	<script>var contextPath = "${pageContext.request.contextPath}"; </script>
	<script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/jquery.dropotron.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/jquery.poptrox.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/browser.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/breakpoints.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/util.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/main.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/boardModify.js"></script>
	<script>
	
		var contentCnt=$('#contentCnt').val();
		
		$(document).ready(function(){
			var cnt = document.getElementById("current_count");
			cnt.innerHTML= document.getElementById("boardContent").value.length;	
		});
		
	</script> 
</body>
</html>