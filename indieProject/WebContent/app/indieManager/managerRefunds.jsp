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
<body class="is-preload">
	<c:set var="exchangeList" value="${exchangeList}"/>
	<c:set var="startPage" value="${startPage}"/>
	<c:set var="endPage" value="${endPage}"/>
	<c:set var="page" value="${page}"/>
	<c:set var="realEndPage" value="${realEndPage}"/>
	
	<!-- Header -->
	<jsp:include page="${pageContext.request.contextPath}/header.jsp" />

	<!-- Main -->
	<section id="main">
		<div class="container">
			<header class="major" style="margin: 0 0;">
				<h2>관리자 페이지</h2>
			</header>
			<div class="row" style="margin-bottom: 1em;">
				<ul class="actions" style="margin: 0 auto;">
					<li>
						<a href="${pageContext.request.contextPath}/indieManager/managerNoneRefunds.ma" class="button alt">미처리 환급</a>
					</li>
					<li>
						<a href="${pageContext.request.contextPath}/indieManager/managerRefunds.ma" class="button primary">처리된 환급</a>
					</li>
					<li>
						<a href="${pageContext.request.contextPath}/indieManager/managerDeleteMovie.ma" class="button alt">영화 삭제</a>
					</li>
				</ul>
			</div>
			<!-- Content -->
			<section id="content">
				<div class="row">
					<div class="col-12">
						<div class="table-wrapper">
							<table class="alt">
								<thead>
									<tr>
										<th>신청번호</th>
										<th>신청일자</th>
										<th>완료일자</th>
										<th>신청자 ID</th>
										<th>환전 신청 개수</th>
										<th>실 환전 금액</th>
										<th>예금주</th>
										<th>은행</th>
										<th>계좌번호</th>
									</tr>
								</thead>
								<tbody>
									<c:choose>
										<c:when test="${exchangeList !=null and fn:length(exchangeList) > 0 }">
											<c:forEach var="data" items="${exchangeList}">
												<tr>
													<td>${data.getExchangeNum()}</td>
													<td>${data.getExchangeDate()}</td>
													<td>${data.getSuccessDate()}</td>
													<td>${data.getMemberId()}</td>
													<td>${data.getPopcornNum()}개</td>
													<td>${data.getMoney()}원</td>
													<td>${data.getMemberName()}</td>
													<td>${data.getMemberBank()}</td>
													<td>${data.getAccountNum()}</td>
												</tr>
											</c:forEach>
										</c:when>
										<c:otherwise>
											
										</c:otherwise>
									</c:choose>
								
								</tbody>
							</table>
							
							<div style="text-align: center;">
								<c:if test="${page>1}">
									<a style="text-decoration:none" href="${pageContext.request.contextPath}/indieManager/managerRefunds.ma?page=${page-1}">[이전]&nbsp;</a>
								</c:if>
								<c:forEach var="i" begin="${startPage}" end="${endPage}">
									<c:choose>
										<c:when test="${i eq page}">
											${i}&nbsp;
										</c:when>
										
										<c:otherwise>
											<a style="text-decoration:none" href="${pageContext.request.contextPath}/indieManager/managerRefunds.ma?page=${i}">${i}&nbsp;</a>
										</c:otherwise>
									</c:choose>
								</c:forEach>
								
								<c:if test="${realEndPage != page}">
         							<a style="text-decoration:none" href="${pageContext.request.contextPath}/indieManager/managerRefunds.ma?page=${page + 1}">&nbsp;[다음]</a>
         						</c:if>
							</div>
							
						</div>
					</div>
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
	
</body>
</html>