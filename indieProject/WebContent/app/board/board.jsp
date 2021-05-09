<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<!--
	Gravity by Pixelarity
	pixelarity.com | hello@pixelarity.com
	License: pixelarity.com/license
-->
<html>
<head>
<title>인디프로젝트</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css" />
<link rel="shortcut icon" href="${pageContext.request.contextPath}/images/camera2.png" type="image/x-icon">
<link rel="icon" href="${pageContext.request.contextPath}/images/camera2.png" type="image/x-icon">
</head>
<!-- 슬라이드 css -->
<link rel="stylesheet"
	href="https://unpkg.com/swiper@6.5.0/swiper-bundle.min.css">
<style>
.searchZone {
	width: 50%;
	margin-left: auto !important;
	margin-right: auto !important;
}

.oneLine2 {
	width: 60% !important;
}

.searchBtn {
	width: 20% !important;
}

.row>.col-poster {
	width: 16.66666%;
}

.pagingTable {
	width: 50%;
}

.swiper-container {
	width: 100%;
	height: 100%;
}

.swiper-slide {
	text-align: center;
	font-size: 18px;
	background: #fff;
	/* Center slide text vertically */
	display: -webkit-box;
	display: -ms-flexbox;
	display: -webkit-flex;
	display: flex;
	-webkit-box-pack: center;
	-ms-flex-pack: center;
	-webkit-justify-content: center;
	justify-content: center;
	-webkit-box-align: center;
	-ms-flex-align: center;
	-webkit-align-items: center;
	align-items: center;
}

.leftBtn {
	background-color: rgb(0 0 0/ 5%);
	height: 100%;
	top: 0;
	color: white;
	left: 0;
}

.rightBtn {
	background-color: rgb(0 0 0/ 5%);
	height: 100%;
	top: 0;
	color: white;
	right: 0;
}

.btnMouseOver {
	background-color: rgb(0 0 0/ 43%);
}

.poptrox-popup .closer:before {
	right: 0px !important;
	top: 0px !important;
	z-index:9999 !important;
}
.poptrox-popup .closer {
	z-index: 9999;
	border-radius: 20px;
	right: 0px !important;
}
.poptrox-popup {
	top:25px;
	padding-bottom:0 !important;
	
}
.caption {
	display:none !important;
}

.pic{
        	line-height:0 !important;
        }

.floating { position: fixed; right: 50%; top: 180px; margin-right: -720px; text-align:center; width: 120px; }

@media screen and (max-width: 980px) {
	.searchZone {
		width: 80%;
	}
	
}
@media screen and (max-width: 736px) {
	.searchZone {
		width: 100%;
	}
	.oneLine1 {
		width: 100% !important;
	}
	.oneLine2 {
		width: 100% !important;
	}
	.searchBtn {
		width: 100% !important;
	}
	.row>.col-poster {
		width: 33.33333%;
	}
	.pagingTable {
		width: 100%;
	}
}
@media screen and (max-width: 480px) {
	ul {
		width: 80%;
	}
	.choiceBtn {
		width:32%;
	}
	iframe {
		max-width: 330px !important;
	}
	.image{
		width:40%;
	}
	
	.col-poster{
		margin-left: auto !important;
		margin-right: auto !important;
	}
}

</style>
<body class="is-preload">
	<c:set var="boards" value="${BoardList}" />
	<c:set var="boardSize" value="${boardSize}"/>
	<c:set var="totalCnt" value="${totalCnt}"/>
	<c:set var="totalPageCnt" value="${totalPageCnt}"/>
	
	<!-- Header -->
	<jsp:include page="${pageContext.request.contextPath}/header.jsp" />

	<!-- Main -->
	<section id="main">
		<div class="container">
			<header class="major">
				<h2>자유게시판</h2>
				
			</header>

			<!-- Content -->
			<section id="content">
				<div id="gallery" style="text-align: center;">
				
					<!-- 검색창 -->
					<form method="post" action="#">
						<div class="row gtr-uniform gtr-50">
							<div class="row gtr-uniform gtr-50 searchZone">
								<div class="col-6 col-12-small oneLine2">
									<input type="text" name="name" id="keyword" value=""
										placeholder="#" />
								</div>
								<div class="col-3 col-6-large col-12-medium searchBtn">
									<ul class="actions stacked">
										<li><a href="javascript:search('click');" data-poptrox="ignore" class="button alt small fit">검색</a></li>
									</ul>
								</div>
								<div class="col-3 col-6-large col-12-medium searchBtn">
									<ul class="actions stacked">
										<li><a id="bWrite" href="javascript: boardWrite();" data-poptrox="ignore" style="padding:0 0;" class="button small fit">게시글 작성</a></li>
									</ul>
								</div>
							</div>
						</div>
					</form>
					<!-- 포스터 이미지 출력 -->
					<div class="row" style="width: 100%;" id="posterRow">
						<c:choose>
							<c:when test="${boards != null and fn:length(boards) > 0}">
								<c:forEach var="b_vo" items="${boards}">
									<div class="col-poster start"
										style="width: 30%; height: 10%; margin: 10px;">
										<div  class="image fit posterTag gallery"
											style="margin-bottom: 0px;">
											<img
												src="${pageContext.request.contextPath}/images/board/${b_vo.getBoardImage()}"
												alt="" style="" /> 
											<a	class="LinkBoardView"
												href="${pageContext.request.contextPath}/board/BoardView.bo?boardNum=${b_vo.getBoardNum()}"
												onclick="link(${b_vo.getBoardNum()})" 
												data-poptrox="iframe,800x500"
												style="width: 80%; height: 100%; background: transparent;">
												<span id="detailText"
												style="padding: 5px; display: none; position: absolute; top: 0; left: 0; bottom: 0; right: 0; color: white; background-color: rgba(0, 0, 0, 0.69); border-radius: 10px;">
													<c:out value="${b_vo.getBoardContent()}" />
											</span>
											</a>
										</div>
									</div>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<div style="height: 400px; margin: 0 auto;">
									<p>등록된 게시글이 없습니다.</p>
								</div>
							</c:otherwise>
						</c:choose>
					</div>
					<c:choose>
						<c:when test="${boards != null and fn:length(boards) > 0}">
							<div id="scrollDone">
								<p style="margin-top: 2rem; margin-bottom: 0.5rem;color: black;">스크롤 해서 더 보기</p>
								<img src="${pageContext.request.contextPath}/images/down-arrow.png" style="height:2rem;">
							</div>
						</c:when>
					</c:choose>
				</div>	
			</section>
		</div>
	</section>

	<!-- Footer -->
		<jsp:include page="${pageContext.request.contextPath}/footer.jsp" />
	<!-- Scripts -->
	<script src="//code.jquery.com/jquery-3.5.1.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/jquery.dropotron.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/jquery.poptrox.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/browser.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/breakpoints.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/util.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/main.js"></script>
	<script>
		var contextPath = "${pageContext.request.contextPath}";
		var boardSize = Number("${boardSize}");
		var totalCnt = Number("${totalCnt}");
		var totalPageCnt = Number("${totalPageCnt}");
		var sessionId = "${session_id}";
	</script>
	<script src="${pageContext.request.contextPath}/assets/js/board.js"></script>
	
</body>
</html>