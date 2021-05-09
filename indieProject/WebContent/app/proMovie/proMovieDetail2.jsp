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
<style>
	@media screen and (max-width: 736px) {
		.col-4 {
			width: 100% !important;
		}
		.col-8 {
			width: 100% !important;
		}
		.image.fit img {
			/* width:100px !important; */
			margin: 0 auto;
		}
		td {
			padding: 0 0 !important;
		}
	}
	@media screen and (max-width: 480px) {
		body {
			min-width: 260px !important;
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
	<body class="is-preload" style="padding-top:0;">
	<c:set var="jsonDetail" value="${jsonDetail}"/>

		<!-- Main -->
			<section id="main">
				<div class="container">
					<!-- Content -->
					<section id="content">
						 <div class="box alt">
							<div class="row gtr-50 gtr-uniform">
								<div class="col-4"><span class="image fit"><img name="moviePoster" src="${jsonDetail.poster}" alt="" /></span></div>
								<div class="col-8">
									<div><h2><c:out value = "${jsonDetail.title}"/></h2></div>
									<table>
										<tr>
											<td><b>감독</b></td>
											<td><c:out value = "${jsonDetail.director}"/></td>
										</tr>
										<tr>
											<td><b>영상 길이</b></td>
											<td><c:out value = "${jsonDetail.length}"/></td>
										</tr>
										<tr>
											<td><b>장르</b></td>
											<td><c:out value = "${jsonDetail.genre}"/></td>
										</tr>
										<tr>
											<td><b>영상물 등급</b></td>
											<td><c:out value = "${jsonDetail.age}"/></td>
										</tr>
										<tr>
											<td><b>제작사</b></td>
											<td><c:out value = "${jsonDetail.company}"/></td>
										</tr>
									</table>
								</div>
							</div>
							<div class="row gtr-50 gtr-uniform">
								<h3>시놉시스</h3>
								<blockquote style="margin-bottom: 0;"><c:out value = "${jsonDetail.synop}"/></blockquote>
							</div>
						</div>
					</section>
				</div>
			</section>


		<!-- Scripts -->
			<script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
			<script src="${pageContext.request.contextPath}/assets/js/jquery.dropotron.min.js"></script>
			<script src="${pageContext.request.contextPath}/assets/js/jquery.poptrox.min.js"></script>
			<script src="${pageContext.request.contextPath}/assets/js/breakpoints.min.js"></script>
			<script src="${pageContext.request.contextPath}/assets/js/util.js"></script>
			<script src="${pageContext.request.contextPath}/assets/js/main.js"></script>

	</body>
</html>