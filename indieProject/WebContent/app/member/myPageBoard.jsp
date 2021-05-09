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
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/main.css" />
<link rel="shortcut icon" href="${pageContext.request.contextPath}/images/camera2.png" type="image/x-icon">
<link rel="icon" href="${pageContext.request.contextPath}/images/camera2.png" type="image/x-icon">
</head>
<style>
.button {
	width: 100%;
}

li {
	padding: 0 0 !important;
}

.poptrox-popup .closer:before {
	right: 0px !important;
	top: 0px !important;
	z-index: 9999 !important;
}

.poptrox-popup .closer {
	z-index: 9999;
	border-radius: 20px;
	right: 0px !important;
}

.poptrox-popup {
	top: 25px;
	padding-bottom: 0 !important;
}

.caption {
	display: none !important;
}

@media screen and (max-width: 980px) {
	#sidebarDiv {
		display: none;
	}
}

@media screen and (max-width: 1280px) {
	.col-poster {
		margin-left: auto !important;
		margin-right: auto !important;
	}
}

@media screen and (max-width: 683px) {
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
	.image {
		width: 80%;
	}
	.col-poster {
		margin-left: auto !important;
		margin-right: auto !important;
	}
}

@media screen and (max-width: 480px) {
	iframe {
		max-width: 330px !important;
	}
	.image {
		width: 40%;
	}
	.col-poster {
		margin-left: auto !important;
		margin-right: auto !important;
	}
}

</style>
<body class="is-preload">
	<c:set var="boards" value="${myBoardList}" />
	<c:set var="boardSize" value="${boardSize}"/>
	<c:set var="totalCnt" value="${totalCnt}"/>
	<c:set var="totalPageCnt" value="${totalPageCnt}"/>
		<c:if test="${session_id eq null}">
		<script>
			   alert("로그인 후 이용해주세요");
			   location.replace("${pageContext.request.contextPath}/member/Login.me");
			</script>
	</c:if>
	<!-- Header -->
	<jsp:include page="${pageContext.request.contextPath}/header.jsp" />

	<!-- Main -->
	<section id="main">
		<div class="container">

			<div class="row gtr-200">
				<jsp:include page="floatMenu.jsp" />
				<div class="col-9 col-12-medium imp-medium">
					<!-- Content -->
					<section id="content">
						<header class="major">
							<h2 onclick="javascript: location.href='${pageContext.request.contextPath}/member/memberMyPage.me';" style="cursor:pointer;" >마이페이지</h2>
							<p>내가 올린 게시글</p>
						</header>
						<div id="" style="text-align: center;">
							<fieldset
								style="padding-left: 5%; margin-bottom: 0; border-width: 3px; background: white;">
								<div class="row" style="width: 100%;" id="posterRow">
									<%-- <c:set var="i" value="${0}"/> --%>
									<c:choose>
										<c:when test="${boards != null and fn:length(boards) > 0}">
											<c:forEach var="b_vo" items="${boards}">
												<%-- <c:set var="i" value="${i+1}"/> --%>
												<div class="col-poster"
													style="width: 30%; height: 10%; margin: 10px;">
													<div  class="image fit posterTag gallery"
														style="margin-bottom: 0px;">
														<img
															src="${pageContext.request.contextPath}/images/board/${b_vo.getBoardImage()}"
															alt="" style="" /> 
														<a
															href="${pageContext.request.contextPath}/board/BoardView.bo?boardNum=${b_vo.getBoardNum()}"
															data-poptrox="iframe,800x500"
															style="width: 80%; height: 100%; background: transparent;">
															<span id="detailText"
															style="padding: 5px; display: none; position: absolute; top: 0; left: 0; bottom: 0; right: 0; color: white; background-color: rgba(0, 0, 0, 0.69); border-radius: 10px;">
																<c:out value="${b_vo.getBoardContent()}" />
														</span>
														</a>
													</div>
													<p>
														<a style="text-decoration: none; cursor:pointer;" href="${pageContext.request.contextPath}/board/BoardModify.bo?boardNum=${b_vo.getBoardNum()}">[수정]</a>
														<a  style="text-decoration: none; cursor:pointer;" onclick="deleteBoard(${b_vo.getBoardNum()})">[삭제]</a> 
													</p>
												</div>
											</c:forEach>
										</c:when>
	 									<c:otherwise>
											<div style="height: 400px; margin: 0 auto;">
												<p>내가 올린 게시글이 없습니다.</p>
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
							</fieldset>


						</div>

					</section>
				</div>
			</div>
		</div>
	</section>

	<!-- Footer -->
	<jsp:include page="${pageContext.request.contextPath}/footer.jsp" />

	<!-- Scripts -->
	<script
		src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
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
	<script src="${pageContext.request.contextPath}/assets/js/floatMenu.js"></script>
	<script src="https://unpkg.com/swiper@6.5.0/swiper-bundle.min.js"></script>
	<script>
		var contextPath = "${pageContext.request.contextPath}";
		var boardSize = Number("${boardSize}");
		var totalCnt = Number("${totalCnt}");
		var totalPageCnt = Number("${totalPageCnt}");
	</script>
	<script src="${pageContext.request.contextPath}/assets/js/myPageBoard.js"></script>
</body>
</html>