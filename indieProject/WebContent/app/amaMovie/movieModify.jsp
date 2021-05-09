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
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/jquery-ui.css" />
<link rel="shortcut icon" href="${pageContext.request.contextPath}/images/camera2.png" type="image/x-icon">
<link rel="icon" href="${pageContext.request.contextPath}/images/camera2.png" type="image/x-icon">
</head>
<style>

.buttonEmpty{
	width:20%;
}
@media screen and (max-width: 980px) {
	.buttonEmpty{
		width:40%;
	}
}
@media screen and (min-width: 736px) {
	/* #step1 .row div:first-child, */
	#step2 .row div:first-child, #step3 .row div:first-child {
		border-right: solid;
		text-align: right;
		padding-right: 1rem;
	}
	#step2 .row div, #step3 .row div {
		padding-bottom: 1rem;
	}
	#step2 .row .col-1 {
		padding-left: 2em;
	}
	#step2 .row .col-3 {
		padding-left: 0;
	}
	#step3 .inputName {
		padding-left: 0;
	}
}
@media screen and (max-width: 480px) {
	.topH3 {
		font-size: 0.9em !important;
	}
}
@media screen and (max-width: 736px) {
	section h3{
		margin-top:1em;
	}
	section h4{
		margin-top:1em;
	}
}

.poster {
	border: dotted;
	margin: 1rem;
}

.stillcut {
	border: dotted;
	margin: 1rem;
}

#step1 h4:after {
	background-color: #888;
	content: '';
	display: inline-block;
	height: 1px;
	margin: 2em 0 0 0;
	position: relative;
	width: 5em;
}

#posterHelp {
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

.maker input, .actor input {
	margin-bottom: 0.5rem;
}
.col-custom{
	width:12.5%;
}

</style>
<body class="is-preload">
	<c:if test="${session_id eq null}">
		<script>
		   alert("로그인 후 이용해주세요");
		   location.replace("${pageContext.request.contextPath}/member/Login.me");
		</script>
	</c:if>
	<c:set var="movieData" value="${movieData}"/>
	<c:set var="posterList" value="${posterList}"/>
	<c:set var="stillCutList" value="${stillCutList}"/>
	<c:set var="makerList" value="${makerList}"/>
	<c:set var="actorList" value="${actorList}"/>
	<script>
		var posterCnt = "${fn:length(posterList)}";
		var stillCutCnt = "${fn:length(stillCutList)}";
	</script>
	<!-- Header -->
	<jsp:include page="${pageContext.request.contextPath}/header.jsp" />

	<!-- Main -->
	<section id="main">
		<div class="container">
			<header class="major">
				<h2>작품 수정하기</h2>
				<br>
				<h3 class="topH3">
					<a href="javascript:step1()" id="s1" style="color: #4fc2cd;">포스터
						업로드</a>&ensp;&ensp;>&ensp;&ensp;<a href="javascript:step2()" id="s2">기본
						정보 제공</a>&ensp;&ensp;>&ensp;&ensp;<a href="javascript:step3()" id="s3">상세
						정보 제공</a>
				</h3>
			</header>

			<!-- Content -->
			<form name="movieWriteForm" method="post" action="${pageContext.request.contextPath}/amaMovie/AmaMovieModifyOk.ama" enctype="multipart/form-data">
				<input type="hidden" name="amaNum" value="${movieData.getAmaNum()}"/>
				<section id="step1">
					<h3 style="display: inline;">포스터</h3>
					<span><img id="poster" style="width: 17px; cursor: help;"
						src="${pageContext.request.contextPath}/images/question.png"></span>
					<div id="posterHelp" style="display: none; resize: none;">영화 수정에서는 포스터, 스틸컷 추가만 가능합니다.</div>
					<div class="row" id="posterDiv">
						<c:forEach var="poster" items="${posterList}">
							<c:if test="${fn:substring(poster.getFileName(),0,5) == 'main_'}">
								<div class="col-2 col-3-small poster" style="padding-left: 0;">
									<c:set var="textSize" value="${fn:length(poster.getFileName())}"/>
									<img src="${pageContext.request.contextPath}/images/amaMovie/${fn:substring(poster.getFileName(),5,textSize)}" class="img posterImgView" style="width:100%; height:100%;">
								</div>
							</c:if>
						</c:forEach>
						
						<c:forEach var="poster" items="${posterList}">
							<c:if test="${fn:substring(poster.getFileName(),0,5) != 'main_'}">
								<div class="col-2 col-3-small poster" style="padding-left: 0;">
									<c:set var="textSize" value="${fn:length(poster.getFileName())}"/>
									<img src="${pageContext.request.contextPath}/images/amaMovie/${poster.getFileName()}" class="img posterImgView" style="width:100%; height:100%;">
								</div>
							</c:if>
						</c:forEach>
						
						<div class="col-2 col-3-small poster" style="padding-left: 0;">
							<img class="img posterImgView" style="display:none; width:100%; height:100%;">
							<span class="image fit posterImgSpan" style="padding-bottom: 30%;">
								<label for="posterImg">
									<img class="camera" src="${pageContext.request.contextPath}/images/add.png" alt="영화 포스터"
									style="width: 50px; margin: 47% auto auto auto; cursor: pointer;" />
								</label>
							</span>
							<input id="posterImg" name="posterImg" type="file" accept="image/*" onchange="posterAddOk(this)" style="display:none;">
						</div>
						
					</div>
					
					<br>
					
					<h3>스틸컷</h3>
					<div class="row">
						<c:forEach var="stillCut" items="${stillCutList}">
							<div class="col-2 col-3-small poster" style="padding-left: 0;">
								<img src="${pageContext.request.contextPath}/images/amaMovie/${stillCut.getFileName()}" class="img stillCutImgView" style="width:100%; height:100%;">
							</div>
						</c:forEach>
						
						<div class="col-2 col-3-small poster" style="padding-left: 0;">
							<img class="img stillCutImgView" style="display:none; width:100%; height:100%;">
							<span class="image fit stillCutImgSpan" style="padding-bottom: 30%;">
								<label for="stillCutImg1">
									<img class="camera" src="${pageContext.request.contextPath}/images/add.png" alt="영화 스틸컷"
									style="width: 50px; margin: 47% auto auto auto; cursor: pointer;" />
								</label>
							</span>
							<input id="stillCutImg1" name="stillCutImg" type="file" accept="image/*" onchange="stillCutAddOk(this)" style="display:none;">
						</div>
						
					</div>
					<br>
					<div class="row">
						<div class="col-2 col-12-small"
							style="text-align: right; margin:0 auto; padding:0 0;">
								<a style="width:100%;" href="#" class="button small moveBtn" onclick="step2()">다음</a>
						</div>
					</div>
				</section>
				
				<section id="step2" style="display: none;">
					<div class="row">
						<div class="col-custom col-2-medium col-12-small" style="margin-left: auto;">
							<h4>영화 제목</h4>
						</div>
						<div class="col-1 col-12-small">
							<h5>한글</h5>
						</div>
						<div class="col-4 col-6-medium col-12-small" style="margin-right:auto;">
							<input type="text" name="amaTitleKor" id="amaTitleKor" value="${movieData.getAmaTitleKor()}" />
						</div>
					</div>
					<div class="row">
						<div class="col-custom col-2-medium col-12-small" style="margin-left: auto;">
						</div>
						<div class="col-1 col-12-small">
							<h5>영문</h5>
						</div>
						<div class="col-4 col-6-medium col-12-small" style="margin-right:auto;">
							<input type="text" name="amaTitleEng" id="amaTitleEng" value="${movieData.getAmaTitleEng()}" />
						</div>
					</div>
<!-- 					<hr class="mobileHr" style="margin: 0.5em 0 0.5em 0;"> -->

					<div class="row">
						<div class="col-custom col-2-medium col-12-small" style="margin-left: auto;">
							<h4>제작년도</h4>
						</div>
						<div class="col-5 col-7-medium col-12-small" style="display: inherit; margin-right:auto;">
							<input type="text" name="amaMakeDate" id="datepicker" value="${movieData.getAmaMakeDate()}" readonly />
						</div>
					</div>

					<div class="row">
						<div class="col-custom col-2-medium col-12-small" style="margin-left: auto;">
							<h4>영상 길이</h4>
						</div>
						<div class="col-5 col-7-medium col-12-small" style="display: inherit; margin-right:auto;">
							<input type="text" name="amaMovieLength" id="amaMovieLength" value="${movieData.getAmaMovieLength()}"
								placeholder="예) 18:21 (분:초)" />
						</div>
					</div>

					<div class="row">
						<div class="col-custom col-2-medium col-12-small" style="margin-left: auto;">
							<h4>감독</h4>
						</div>
						<div class="col-5 col-7-medium col-12-small" style="display: inherit; margin-right:auto;">
							<input type="text" name="amaDirector" id="amaDirector" value="${movieData.getAmaDirector()}" />
						</div>
					</div>

					<div class="row">
						<div class="col-custom col-2-medium col-12-small" style="margin-left: auto;">
							<h4>장르</h4>
						</div>
						<div class="col-5 col-7-medium col-12-small" style="margin-right:auto;">
							<select name="genre" id="genre">
								<option value="none">- 영화 장르 선택 -</option>
								<option value="드라마">드라마</option>
								<option value="공포 / 스릴러">공포 / 스릴러</option>
								<option value="판타지">판타지</option>
								<option value="코미디">코미디</option>
								<option value="애니메이션">애니메이션</option>
								<option value="기타">기타</option>
							</select>
						</div>
					</div>
					<div class="row">
						<div class="col-custom col-2-medium col-12-small" style="margin-left: auto;">
							<h4>영상물 등급</h4>
						</div>
						<div class="col-5 col-7-medium col-12-small" style="margin-right:auto;">
							<select name="rating" id="rating">
								<option value="none">- 미분류 -</option>
								<option value="전체관람가">전체관람가</option>
								<option value="12세이상관람가">12세이상관람가</option>
								<option value="15세이상관람가">15세이상관람가</option>
								<option value="청소년관람불가">청소년관람불가</option>
							</select>
						</div>
					</div>
					<div class="row">
						<div class="col-custom col-2-medium col-12-small" style="margin-left: auto;">
							<h4>작품 링크</h4>
						</div>
						<div class="col-5 col-7-medium col-12-small" style="margin-right:auto;">
							<input type="text" name="link" id="link" value="${movieData.getLink()}"
								placeholder="예) https://youtu.be/86BST8NIpNM" />
						</div>
					</div>
					<div class="row">
						<div class="col-custom col-2-medium col-12-small" style="margin-left: auto;">
							<h4>팝콘 후원</h4>
						</div>
						<div class="col-2 col-3-medium col-6-small">
							<input type="radio" id="priority-low" name="popcorn" value="popcornOn" checked>
							<label for="priority-low">팝콘 받기</label>
						</div>
						<div class="col-3 col-4-medium col-6-small" style="margin-right:auto;">
							<input type="radio" id="priority-normal" value="popcornOff" name="popcorn">
							<label for="priority-normal">팝콘 받지 않기</label>
						</div>
					</div>
					<br>
					<div class="row">
						<div class="col-2 col-12-small"
							style="margin-left: auto; border: none; padding:0 0;">
								<a style="width:100%;" href="#" class="button small moveBtn" onclick="step1()">이전</a>
						</div>
						<div class="buttonEmpty"></div>
						<div class="col-2 col-12-small"
							style="text-align: right; margin-right: auto; padding:0 0;">
								<a style="width:100%;" href="#" class="button small moveBtn" onclick="step3()">다음</a>
						</div>
					</div>
				</section>
				
				
				<section id="step3" style="display: none;">
					<div class="row">
						<div class="col-custom col-2-medium col-12-small" style="margin-left: auto;">
							<h4>시놉시스</h4>
						</div>
						<div class="col-5 col-7-medium col-12-small" style="margin-right: auto;">
							<textarea name="synopsis" id="synopsis" rows="3" cols="" style="resize: none;">${movieData.getSynopsis()}</textarea>
						</div>
					</div>

					<div class="row">
						<div class="col-custom col-2-medium col-12-small" style="margin-left: auto;">
							<h4>연출 의도</h4>
						</div>
						<div class="col-5 col-7-medium col-12-small" style="margin-right: auto;">
							<textarea name="theme" id="theme" rows="3" cols="" style="resize: none;">${movieData.getTheme()}</textarea>
						</div>
					</div>

					<div class="row maker">
						<div class="col-custom col-2-medium col-12-small" style="margin-left: auto; padding-bottom:0;">
							<h4>제작진</h4>
						</div>
						<div class="col-2 col-3-medium col-5-small duty" style="padding-bottom:0;">
							<h5>직책</h5>
						</div>
						<div class="col-2 col-3-medium col-5-small makerName" style="padding-bottom:0;">
							<h5>이름</h5>
						</div>
						<div class="col-1" style="margin-right: auto;"></div>
					</div>
					<div>
						<c:set var="makerCnt" value="0"/>
						<c:forEach var="maker" items="${makerList}">
							<c:choose>
								<c:when test="${makerCnt == 0}">
									<c:set var="makerCnt" value="1"/>
									<div class="row maker">
										<div class="col-custom col-2-medium col-12-small" style="margin-left: auto;">
										</div>
										<div style="padding-bottom:0;" class="col-2 col-3-medium col-5-small duty">
											<input type="text" name="makerPosition" value="${maker.getMakerPosition()}" />
										</div>
										<div style="padding-bottom:0;" class="col-2 col-3-medium col-5-small makerName">
											<input type="text" name="makerName" value="${maker.getMakerName()}" />
										</div>
										<div class="col-1 col-2-small" style="margin-right: auto; padding:0;">
											<a class="button alt small" id="addMaker" style="width:100%">추가</a>
										</div>
									</div>
								</c:when>
								<c:otherwise>
									<div class="row maker">
										<div class="col-custom col-2-medium col-12-small" style="margin-left: auto;">
										</div>
										<div style="padding-bottom:0;" class="col-2 col-3-medium col-5-small duty">
											<input type="text" name="makerPosition" value="${maker.getMakerPosition()}" />
										</div>
										<div style="padding-bottom:0;" class="col-2 col-3-medium col-5-small makerName">
											<input type="text" name="makerName" value="${maker.getMakerName()}" />
										</div>
										<div class="col-1 col-2-small" style="margin-right: auto; padding:0;">
											<a class="button alt small" id="deleteMaker" style="width:100%">삭제</a>
										</div>
									</div>
								</c:otherwise>
							</c:choose>
						</c:forEach>
					</div>

					<div class="row actor">
						<div class="col-custom col-2-medium col-12-small" style="margin-left: auto; padding-bottom:0;">
							<h4>출연진</h4>
						</div>
						<div class="col-2 col-3-medium col-5-small duty" style="padding-bottom:0;">
							<h5>배역</h5>
						</div>
						<div class="col-2 col-3-medium col-5-small makerName" style="padding-bottom:0;">
							<h5>배우</h5>
						</div>
						<div class="col-1" style="margin-right: auto;"></div>
					</div>
					<div>
						<c:set var="actorCnt" value="0"/>
						<c:forEach var="actor" items="${actorList}">
							<c:choose>
								<c:when test="${actorCnt == 0}">
									<c:set var="actorCnt" value="1"/>
									<div class="row maker">
										<div class="col-custom col-2-medium col-12-small" style="margin-left: auto;">
										</div>
										<div style="padding-bottom:0;" class="col-2 col-3-medium col-5-small cast">
											<input type="text" name="actorCast" value="${actor.getAmaCast()}" />
										</div>
										<div style="padding-bottom:0;" class="col-2 col-3-medium col-5-small actorName">
											<input type="text" name="actorName" value="${actor.getActorName()}" />
										</div>
										<div class="col-1 col-2-small" style="margin-right: auto; padding:0;">
											<a class="button alt small" id="addActor" style="width:100%">추가</a>
										</div>
									</div>
								</c:when>
								
								<c:otherwise>
									<div class="row maker">
										<div class="col-custom col-2-medium col-12-small" style="margin-left: auto;">
										</div>
										<div style="padding-bottom:0;" class="col-2 col-3-medium col-5-small cast">
											<input type="text" name="actorCast" value="${actor.getAmaCast()}" />
										</div>
										<div style="padding-bottom:0;" class="col-2 col-3-medium col-5-small actorName">
											<input type="text" name="actorName" value="${actor.getActorName()}" />
										</div>
										<div class="col-1 col-2-small" style="margin-right: auto; padding:0;">
											<a class="button alt small" id="deleteActor" style="width:100%">삭제</a>
										</div>
									</div>
								</c:otherwise>
							</c:choose>
						</c:forEach>
					</div>
					<br>
					<div class="row">
						<div class="col-2 col-12-small"
							style="margin-left: auto; border: none; padding:0 0;">
								<a  style="width:100%;" href="#" class="button small moveBtn" onclick="step2()">이전</a>
						</div>
						<div style="width:20%;"></div>
						<div class="col-2 col-12-small"
							style="text-align: right; margin-right: auto; padding:0 0;">
								<a style="width:100%;" onclick="writeFormSubmit()" class="button small moveBtn">완료</a>
						</div>
					</div>
				</section>


			</form>

		</div>
	</section>
	<!-- Footer -->
	<jsp:include page="${pageContext.request.contextPath}/footer.jsp" />

	<!-- Scripts -->
	<script>var contextPath = "${pageContext.request.contextPath}" </script>
	<script
		src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/jquery-ui.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/js/jquery.dropotron.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/js/jquery.poptrox.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/js/browser.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/js/breakpoints.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/util.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/main.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/js/movieModify.js"></script>
</body>
</html>