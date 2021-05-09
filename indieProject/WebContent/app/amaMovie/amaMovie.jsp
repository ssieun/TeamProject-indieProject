<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/amaMovie.css">
<body class="is-preload">
	<script>
		var movieJson = ${movieJson};
		var contextPath = "${pageContext.request.contextPath}";
	</script>
	<!-- Header -->
	<jsp:include page="${pageContext.request.contextPath}/header.jsp" />
	
	<!-- Main -->
	<section id="main">
		<div class="container">
			<header class="major">
				<h2>아마추어 독립영화</h2>
			</header>

			<!-- 검색창 -->
			<form method="post" action="#">
				<div class="row gtr-uniform gtr-50">
					<div class="row gtr-uniform gtr-50 searchZone">
						<div class="col-6 col-12-small oneLine2">
							<input type="text" id="searchMovie" value=""
								placeholder="영화제목" />
						</div>
						<div class="col-3 col-6-large col-12-medium searchBtn">
							<ul class="actions stacked">
								<li><a onclick="searchTitle()" class="button alt small fit">검색</a></li>
							</ul>
						</div>
						<div class="col-3 col-6-large col-12-medium searchBtn">
							<ul class="actions stacked">
								<li><a href="${pageContext.request.contextPath}/amaMovie/movieWrite.ama" style="padding:0 0;" class="button  small fit">영화 업로드</a></li>
							</ul>
						</div>
					</div>
				</div>
			</form>
			<!-- Content -->
			<section id="content">
				<!-- 영화리스트 이미지 출력 -->
				
				<!-- 포스터 이미지 출력 -->
				<!-- <div class="box alt">
					<div style="text-align: left;">
						<b style="font-size:2em;">장르1</b>
					</div>
					<div class="row gtr-50 gtr-uniform"></div>
				</div>
				<div class="swiper-container">
					<div class="swiper-wrapper">

						<div class="swiper-slide">
							<div class="col-poster">
								<div class="image fit posterTag" style="margin-bottom: 4px;">
									<img src="${pageContext.request.contextPath}/images/testImage.jpg" alt=""
										style="border-radius: 10px;" />
									<div id="detailText"
										style="padding: 5px; display: none; position: absolute; top: 0; left: 0; bottom: 0; right: 0; color: white; background-color: rgba(0, 0, 0, 0.69); border-radius: 10px;">
										<div style="height: 65%; text-overflow: ellipsis; line-height: initial; overflow: hidden; font-size: 0.8em; margin: 10px;">
											인피니티워 이후 절반만 살아남은 지구마지막 희망이 된 어벤져스 먼저 떠난 그들을 위해 모든 것을 걸었다! 위대한 어벤져스운명을 바꿀 최후의 전쟁이 펼쳐진다!
										</div>
										<a class="button primary small" href="${pageContext.request.contextPath}/amaMovie/AmaMovieDetail.ama?amaNum=4" 
											style="position: absolute; left: 16px; right: 16px; bottom: 16px; height: 38px; line-height: 38px; padding: 0 0;">
											상세보기 <img alt="" src="" title="영화제목">
										</a>
									</div>
								</div>
								<span><strong style="font-size:0.8em;">어벤저스 엔드게임1</strong></span>
							</div>
						</div>

					</div>
					<div class="swiper-button-prev leftBtn moveBtn"></div>
					<div class="swiper-button-next rightBtn moveBtn"></div>
				</div> -->
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

	<!-- 슬라이드 js -->
	<script src="https://unpkg.com/swiper@6.5.0/swiper-bundle.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/amaMovie.js"></script>
	

	
	
</body>
</html>