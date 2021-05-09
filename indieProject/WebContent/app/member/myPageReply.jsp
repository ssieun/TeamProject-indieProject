<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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

@media screen and (max-width: 980px) {
	#sidebarDiv {
		display: none;
	}
}

@media screen and (max-width: 736px) {
	.select {
		width: 40% !important;
	}
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

</style>

<body class="is-preload">
	<c:if test="${session_id eq null}">
		<script>
			   alert("로그인 후 이용해주세요");
			   location.replace("${pageContext.request.contextPath}/member/Login.me");
			</script>
	</c:if>

	<c:set var="replyList" value="${replyList}" />
	<c:set var="totalCnt" value="${totalCnt}" />
	<c:set var="startPage" value="${startPage}" />
	<c:set var="endPage" value="${endPage}" />
	<c:set var="nowPage" value="${nowPage}" />
	<c:set var="realEndPage" value="${realEndPage}" />
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
							<p>내가 작성한 댓글</p>
						</header>
						<fieldset id="movie"
							style="padding: 15px; border-radius: 10px; margin-bottom: 15px;">
							<table style="margin-bottom: 0;">
								<thead>
									<tr>
										<th>글 번호</th>
										<th>내용</th>
										<th>작성 날짜</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<c:choose>
											<c:when
												test="${replyList !=null and fn:length(replyList) > 0}">
												<c:forEach var="replay" items="${replyList}">
													<tr onmouseover="this.style.backgroudColor='F8F8F8'"
														onmouseout="this.style.backgroundColor='FFFFFF'"
														class="reply"
														>

														<%-- 글번호  --%>
														<td>${replay.getBoardNum()}</td>

														<%-- 내용 --%>
														<td>
														<a href="${pageContext.request.contextPath}/board/BoardView.bo?boardNum=${replay.getBoardNum()}&page=${nowPage}"
															data-poptrox="iframe,800x500">
																${replay.getReplyContent()}</a>
														</td>
														<%-- 작성시간 --%>
														<fmt:parseDate var="replyDate" value="${replay.getReplyDate()}" pattern="yyyy-MM-dd HH:mm"/>
														<td><fmt:formatDate value="${replyDate}" pattern="yyyy-MM-dd HH:mm"/></td>
												</c:forEach>
											</c:when>
											<c:otherwise>
												<td colspan="5" style="height: 300px; text-align: center;">
													<h1 style="margin-top: 15%;">작성한 댓글이 없습니다.</h1>
												</td>
											</c:otherwise>
										</c:choose>
									</tr>
								</tbody>
							</table>
							<div style="text-align: center;">
								<c:if test="${nowPage>1}">
									<a
										href="${pageContext.request.contextPath}/member/memberMyReply.me?page=${nowPage-1}">[이전]</a>
								</c:if>

								<c:forEach var="i" begin="${startPage}" end="${endPage}">
									<c:choose>
										<c:when test="${i eq nowPage}">
										${i}&nbsp;&nbsp;
										</c:when>
										<c:otherwise>
											<a
												href="${pageContext.request.contextPath}/member/memberMyReply.me?page=${i}">${i}&nbsp;</a>
										</c:otherwise>
									</c:choose>
								</c:forEach>
								<c:if test="${realEndPage != nowPage}">
									<a
										href="${pageContext.request.contextPath}/member/memberMyReply.me?page=${nowPage + 1}">&nbsp;&nbsp;[다음]</a>
								</c:if>

							</div>
						</fieldset>
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
	<script>$("#mrp").css("background", "rgba(144, 144, 144, 0.075)");</script>

	<script>
	$(function() {
		$('.reply').poptrox({
			usePopupCaption : true,
			usePopupNav : true,
			popupPadding : 0
		});
	});
	</script>

</body>
</html>