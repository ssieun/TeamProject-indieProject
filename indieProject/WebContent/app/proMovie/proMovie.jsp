<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="assets/css/main.css" />
		<link rel="shortcut icon" href="${pageContext.request.contextPath}/images/camera2.png" type="image/x-icon">
		<link rel="icon" href="${pageContext.request.contextPath}/images/camera2.png" type="image/x-icon">
	</head>
	<style>
		.searchZone {
			width:70%;
			margin-left: auto !important;
			margin-right: auto !important;
		}
		.oneLine1 {
			width:30% !important;
		}
		.oneLine2 {
			width:50% !important;
		}
		.searchBtn {
			width:20% !important;
		}
		.row > .col-poster {
			width: 25%;
		}
		.pagingTable {
			width:50%;
		}
		
		@media screen and (max-width: 736px) {
			.searchZone {
				width:100%;
			}
			.oneLine1{
				width:100% !important;
			}
			.oneLine2{
				width:100% !important;
			}
			.searchBtn {
				width:100% !important;
			}
			.row > .col-poster {
			width: 33.33333%;
			}
			.pagingTable {
				width:100%;
			}
		}
	</style>
	<body class="is-preload">

		<!-- Header -->
				<jsp:include page="${pageContext.request.contextPath}/../header.jsp" />

		<!-- Main -->
			<section id="main">
				<div class="container">
					<header class="major">
						<h2>독립영화 모아보기</h2>
						<p>독립영화 정보 확인 페이지</p>
					</header>

					<!-- Content -->
					<section id="content">
						<div style="text-align: center;">
							<!-- 영화리스트 이미지 출력 -->
							
							<!-- 버튼 선택 -->
							<div class="row">
								<ul class="actions small" style="margin-left:auto; margin-right:auto;">
									<li><a href="#" class="button alt small">지난 상영</a>
									<a href="#" class="button primary small">현재 상영</a>
									<a href="#" class="button alt small">상영 예정</a></li>
								</ul>
							</div>

							
							<!-- 검색창 -->
							<form method="post" action="#">
								<div class="row gtr-uniform gtr-50">
									<div class="row gtr-uniform gtr-50 searchZone">
										<div class="col-6 col-12-small oneLine1">
											<select name="category" id="category">
												<option value="">영화 제목</option>
												<option value="">감독명</option>
											</select>
										</div>
										<div class="col-6 col-12-small oneLine2">
											<input type="text" name="name" id="name" value="" placeholder="검색어" />
										</div>
										<div class="col-3 col-6-large col-12-medium searchBtn">
											<ul class="actions stacked">
												<li>
													<a href="#" class="button alt small fit">검색</a>
												</li>
											</ul>
										</div>
									</div>
								</div>
							</form>
							
							<!-- 포스터 이미지 출력 -->
							<fieldset style="border:none;">
								<div class="box alt">
									<div class="row gtr-50 gtr-uniform">
										<!-- 반복문 시작 -->
										<div class="col-poster" onclick="">
											<div class="image fit posterTag" style="margin-bottom:4px;" onmouseover="" onmouseout="">
												<img src="images/testImage.jpg" alt="" style="border-radius: 10px;"/>
												<div id="detailText" style="padding:5px; display:none; position: absolute; top:0; left:0; bottom:0; right:0; color:white; background-color: rgba(0, 0, 0, 0.69); border-radius: 10px;">
													<div>가나다라마바사아자차카타파하가나다라마바사아자차카타파</div>
												</div>
											</div>
											<span><strong>어벤저스 엔드게임</strong></span>
										</div>
										<div class="col-poster" onclick="">
											<div class="image fit posterTag" style="margin-bottom:4px;" onmouseover="" onmouseout="">
												<img src="images/testImage.jpg" alt="" style="border-radius: 10px;"/>
												<div id="detailText" style="padding:5px; display:none; position: absolute; top:0; left:0; bottom:0; right:0; color:white; background-color: rgba(0, 0, 0, 0.69); border-radius: 10px;">
													<div>가나다라마바사아자차카타파하가나다라마바사아자차카타파</div>
												</div>
											</div>
											<span><strong>어벤저스 엔드게임</strong></span>
										</div>
										<div class="col-poster" onclick="">
											<div class="image fit posterTag" style="margin-bottom:4px;" onmouseover="" onmouseout="">
												<img src="images/testImage.jpg" alt="" style="border-radius: 10px;"/>
												<div id="detailText" style="padding:5px; display:none; position: absolute; top:0; left:0; bottom:0; right:0; color:white; background-color: rgba(0, 0, 0, 0.69); border-radius: 10px;">
													<div>가나다라마바사아자차카타파하가나다라마바사아자차카타파</div>
												</div>
											</div>
											<span><strong>어벤저스 엔드게임</strong></span>
										</div>
										<div class="col-poster" onclick="">
											<div class="image fit posterTag" style="margin-bottom:4px;" onmouseover="" onmouseout="">
												<img src="images/testImage.jpg" alt="" style="border-radius: 10px;"/>
												<div id="detailText" style="padding:5px; display:none; position: absolute; top:0; left:0; bottom:0; right:0; color:white; background-color: rgba(0, 0, 0, 0.69); border-radius: 10px;">
													<div>가나다라마바사아자차카타파하가나다라마바사아자차카타파</div>
												</div>
											</div>
											<span><strong>어벤저스 엔드게임</strong></span>
										</div>
										<div class="col-poster" onclick="">
											<div class="image fit posterTag" style="margin-bottom:4px;" onmouseover="" onmouseout="">
												<img src="images/testImage.jpg" alt="" style="border-radius: 10px;"/>
												<div id="detailText" style="padding:5px; display:none; position: absolute; top:0; left:0; bottom:0; right:0; color:white; background-color: rgba(0, 0, 0, 0.69); border-radius: 10px;">
													<div>가나다라마바사아자차카타파하가나다라마바사아자차카타파</div>
												</div>
											</div>
											<span><strong>어벤저스 엔드게임</strong></span>
										</div>
										<div class="col-poster" onclick="">
											<div class="image fit posterTag" style="margin-bottom:4px;" onmouseover="" onmouseout="">
												<img src="images/testImage.jpg" alt="" style="border-radius: 10px;"/>
												<div id="detailText" style="padding:5px; display:none; position: absolute; top:0; left:0; bottom:0; right:0; color:white; background-color: rgba(0, 0, 0, 0.69); border-radius: 10px;">
													<div>가나다라마바사아자차카타파하가나다라마바사아자차카타파</div>
												</div>
											</div>
											<span><strong>어벤저스 엔드게임</strong></span>
										</div>
										<div class="col-poster" onclick="">
											<div class="image fit posterTag" style="margin-bottom:4px;" onmouseover="" onmouseout="">
												<img src="images/testImage.jpg" alt="" style="border-radius: 10px;"/>
												<div id="detailText" style="padding:5px; display:none; position: absolute; top:0; left:0; bottom:0; right:0; color:white; background-color: rgba(0, 0, 0, 0.69); border-radius: 10px;">
													<div>가나다라마바사아자차카타파하가나다라마바사아자차카타파</div>
												</div>
											</div>
											<span><strong>어벤저스 엔드게임</strong></span>
										</div>
										<div class="col-poster" onclick="">
											<div class="image fit posterTag" style="margin-bottom:4px;" onmouseover="" onmouseout="">
												<img src="images/testImage.jpg" alt="" style="border-radius: 10px;"/>
												<div id="detailText" style="padding:5px; display:none; position: absolute; top:0; left:0; bottom:0; right:0; color:white; background-color: rgba(0, 0, 0, 0.69); border-radius: 10px;">
													<div>가나다라마바사아자차카타파하가나다라마바사아자차카타파</div>
												</div>
											</div>
											<span><strong>어벤저스 엔드게임</strong></span>
										</div>
										<div class="col-poster" onclick="">
											<div class="image fit posterTag" style="margin-bottom:4px;" onmouseover="" onmouseout="">
												<img src="images/testImage.jpg" alt="" style="border-radius: 10px;"/>
												<div id="detailText" style="padding:5px; display:none; position: absolute; top:0; left:0; bottom:0; right:0; color:white; background-color: rgba(0, 0, 0, 0.69); border-radius: 10px;">
													<div>가나다라마바사아자차카타파하가나다라마바사아자차카타파</div>
												</div>
											</div>
											<span><strong>어벤저스 엔드게임</strong></span>
										</div>
										<!-- 반복문 끝 -->
									</div>
								</div>
							</fieldset>
						</div>
					</section>
				</div>
			</section>

		<!-- Footer -->
			<jsp:include page="${pageContext.request.contextPath}/../footer.jsp" />

		<!-- Scripts -->
			<script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/jquery.dropotron.min.js"></script>
			<script src="assets/js/jquery.poptrox.min.js"></script>
			<script src="assets/js/browser.min.js"></script>
			<script src="assets/js/breakpoints.min.js"></script>
			<script src="assets/js/util.js"></script>
			<script src="assets/js/main.js"></script>
			
			<script src="//code.jquery.com/jquery-3.5.1.min.js" ></script>
			<script>
				$('.posterTag').on('mouseover', function(){
					$(this).children('#detailText').css('display', 'block');
					$(this).children('#detailText').toggleClass("on");
				})
				
				$('.posterTag').on('mouseout', function(){
					$(this).children('#detailText').css('display', 'none');
					$(this).children('#detailText').toggleClass("on");
				})
			</script>
	</body>
</html>