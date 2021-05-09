<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<style>
	.embed-container { 
		position: relative; 
		padding-bottom: 56.25%; 
		height: 0; overflow: 
		hidden; max-width: 100%; } 
	.embed-container iframe, .embed-container object, .embed-container embed { 
		position: absolute; 
		top: 0; 
		left: 0; 
		width: 100%; 
		height: 100%; }
		
	@media screen and (max-width: 480px) {
		#sendButton{
			width:100%;
		}
		#ch {
			display:none;
		}
	}
	@media screen and (max-width: 659px) {
		#starSelection {
			width: 100% !important;
		}
		#reviewInput {
			width: 100% !important;
			padding-left: 1.25em !important;
		}
		#reviewButton {
			width: 100% !important;
			padding-left: 1.25em !important;
		}
	}
	
</style>
	<head>
		<title>인디프로젝트</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css" />
		<link rel="shortcut icon" href="${pageContext.request.contextPath}/images/camera2.png" type="image/x-icon">
		<link rel="icon" href="${pageContext.request.contextPath}/images/camera2.png" type="image/x-icon">
	</head>
	<body class="is-preload">
		<c:set var="ama_vo" value="${ama_vo}" />
		<c:set var="amaReviews" value="${amaReviews}" />
		<c:set var="movieLink" value="${movieLink}" />

		<!-- Header -->
			<jsp:include page="${pageContext.request.contextPath}/header.jsp" />

		<!-- Movie -->
			<section id="banner" class="wrapper style1 special">
				<div class="container">
						<h2><c:out value="${ama_vo.getAmaTitleKor()}"/></h2>
						<br>
						<section id="content">
							<div class="embed-container">
								<div class="col-8 col-12-medium" style="margin:auto;">
									<iframe src='${movieLink}' frameborder='0' allowfullscreen></iframe>
								</div>
							</div>
						</section>
				</div>
			</section>
		
		<!-- Review -->
			<section class="wrapper style1 special" style="padding-bottom:0;">
				<div class="container">
					<header class="major">
						<h2>영화 후기</h2>
						<p>솔직한 후기를 남겨주세요!</p>
					</header>
					<section>
						<div class="row">
							<div id="starSelection" style="width:25%">						
								<select name="star" id="star">
									<option value="">- 별점 선택 -</option>
									<option value="1">⭐</option>
									<option value="2">⭐⭐</option>
									<option value="3">⭐⭐⭐</option>
									<option value="4">⭐⭐⭐⭐</option>
									<option value="5">⭐⭐⭐⭐⭐</option>
								</select>			
							</div>
							<div id="reviewInput" style="width:50%; padding:0;">								
								<input id="review" type="text">			
							</div>
							<div id="reviewButton" style="padding:0; width:25%">
								<ul class="actions stacked">
									<li><a href="javascript:insertReview()" class="button small fit alt" >내 감상평 남기기</a></li>
								</ul>										
							</div>
						</div>
						<div class="row">
							<div style="text-align:left;">								
								<h2 id="starAvg">⭐ 평균 평점 0.0</h2>
							</div>
							<div id="sendButton">
								<ul class="actions special">
									<li id="popcorn" style="display:none;"><a onclick="sendPopcorn()" class="button small fit">팝콘 보내기</a></li>
									<c:choose>
										<c:when test="${ama_vo.getPopcorn() eq 'popcornOn'}">
											<script>$("#popcorn").show()</script>
										</c:when>
									</c:choose>
								</ul>			
							</div>
						</div>
					</section>
				</div>
			</section>
			<section>
				<div class="container">
					<section>
						<fieldset id="movie" style="padding: 15px; border-radius: 10px; margin-bottom: 15px;">
							<table style="margin-bottom: 0;">
								<thead>
									<tr>
										<th>아이디</th>
										<th id="sh">별점</th>
										<th id="ch">내용</th>
										<th>작성시간</th>
									</tr>
								</thead>
								<tbody id="reviewTable">
									<!-- ajax로 감상평 가져오기 -->	
								</tbody>
							</table>
							<div id="paging" style="text-align: center;">
								<!-- ajax로 페이징 가져오기 -->
							</div>
						</fieldset>
					</section>
				</div>
			</section>


		<!-- Footer -->
			<jsp:include page="${pageContext.request.contextPath}/footer.jsp" />

		<!-- Scripts -->
			<script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
			<script src="${pageContext.request.contextPath}/assets/js/jquery.dropotron.min.js"></script>
			<script src="${pageContext.request.contextPath}/assets/js/jquery.poptrox.min.js"></script>
			<script src="${pageContext.request.contextPath}/assets/js/browser.min.js"></script>
			<script src="${pageContext.request.contextPath}/assets/js/breakpoints.min.js"></script>
			<script src="${pageContext.request.contextPath}/assets/js/util.js"></script>
			<script src="${pageContext.request.contextPath}/assets/js/main.js"></script>
			<script>
				var pageContext = "${pageContext.request.contextPath}";
				var amaNum = "${ama_vo.getAmaNum()}";
				var amaTitle = "${ama_vo.getAmaTitleKor()}";
				var sessionId = "${session_id}"
			</script>
			<script src="${pageContext.request.contextPath}/assets/js/watchMovie.js"></script>
	</body>
</html>