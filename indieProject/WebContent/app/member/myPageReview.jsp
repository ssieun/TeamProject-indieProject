<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css" />
	</head>
	<style>
		.button{
			width:100%;
		}
		li {
			padding:0 0 !important;
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
	</style>
	<body class="is-preload">
		<c:set var="myReviewListAll" value="${myReviewListAll}"/>
		<c:set var="totalCnt" value="${totalCnt}"/>
		<c:set var="startPage" value="${startPage}"/>
		<c:set var="endPage" value="${endPage}"/>
		<c:set var="nowPage" value="${nowPage}"/>
		<c:set var="realEndPage" value="${realEndPage}"/>
		<c:set var="movieTitle" value="${movieTitle}"/>
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
									<p>내가 작성한 감상평</p>
								</header>
								<fieldset id="movie" style="padding: 15px; border-radius: 10px; margin-bottom: 15px;">
									<table style="margin-bottom: 0;">
										<thead>
											<tr>
												<th>영화 제목</th>
												<th>별점</th>
												<th>내용</th>
												<th>작성 날짜</th>
											</tr>
										</thead>
										<tbody>
											<c:choose>
												<c:when test="${myReviewListAll !=null and fn:length(myReviewListAll) > 0 }">
													<c:forEach var="myReviewVO"  items="${myReviewListAll}" >
											 			<tr onmouseover="this.style.backgroudColor='F8F8F8'" onmouseout="this.style.backgroundColor='FFFFFF'">
			               								<td>
			               									<c:set var="loop_flag" value="false"/>
			               									<c:forEach var="movieTitle"  items="${movieTitle}" >
			               										<c:if test="${not loop_flag }">
				               								 		<c:if test="${myReviewVO.getAmaNum() eq movieTitle.getAmaNum()}"> 
				               											<a href="${pageContext.request.contextPath}/amaMovie/AmaMovieDetail.ama?amaNum=${myReviewVO.getAmaNum()}&page=${nowPage}"><c:out value="${movieTitle.getAmaTitleKor()}"/></a>
				               											<c:set var="loop_flag" value="true"/>
				               							 			</c:if>
				               							 		</c:if>
			               								</c:forEach>
			               								</td>
														
														<td>
															<c:choose>
																<c:when test="${myReviewVO.getStars() eq 1}">⭐</c:when>
																<c:when test="${myReviewVO.getStars() eq 2}">⭐⭐</c:when>
																<c:when test="${myReviewVO.getStars() eq 3}">⭐⭐⭐</c:when>
																<c:when test="${myReviewVO.getStars() eq 4}">⭐⭐⭐⭐</c:when>
																<c:when test="${myReviewVO.getStars() eq 5}">⭐⭐⭐⭐⭐</c:when>
															</c:choose>
														</td>	
														
														<td><c:out value="${myReviewVO.getReplyContent()}"/></td>
														<fmt:parseDate var="reviewDate" value="${myReviewVO.getReplyDate()}" pattern="yyyy-MM-dd HH:mm"/>
														<td><fmt:formatDate value="${reviewDate}" pattern="yyyy-MM-dd HH:mm"/></td>
													</tr>
												</c:forEach>
											</c:when>
											<c:otherwise>
												<td colspan="5" style=" height:300px; text-align:center;">
													<h1 style="margin-top:15%;">작성한 감상평이 없습니다.</h1>
												</td>
											</c:otherwise>
											</c:choose>		
										</tbody>
									</table>
									<div style="text-align: center;">
									<c:if test="${nowPage>1}">
										<a href="${pageContext.request.contextPath}/member/memberMyReview.me?page=${nowPage-1}">[이전]&nbsp;&nbsp;</a>
									</c:if>
			
									<c:forEach var="i" begin="${startPage}" end="${endPage}">
									<c:choose>
									<c:when test="${i eq nowPage}">
										${i}&nbsp;&nbsp;
										</c:when>
										<c:otherwise>
										<a href="${pageContext.request.contextPath}/member/memberMyReview.me?page=${i}">${i}&nbsp;</a>
									</c:otherwise>
									</c:choose>
								</c:forEach>
								<c:if test="${realEndPage != nowPage}">
         							<a href="${pageContext.request.contextPath}/member/memberMyReview.me?page=${nowPage + 1}">&nbsp;&nbsp;[다음]</a>
         						</c:if>
									</div>
								</fieldset>
								<fieldset id="movieMobile" style="padding: 15px; border-radius: 10px; margin-bottom: 15px; display:none;">
									<table style="margin-bottom: 0;">
										<thead>
											<tr>
												<th>영화 제목</th>
												<th>별점 / 내용</th>
												<th>작성 날짜</th>
											</tr>
										</thead>
										<tbody>
											<c:choose>
												<c:when test="${myReviewListAll !=null and fn:length(myReviewListAll) > 0 }">
													<c:forEach var="myReviewVO"  items="${myReviewListAll}" >
											 			<tr onmouseover="this.style.backgroudColor='F8F8F8'" onmouseout="this.style.backgroundColor='FFFFFF'">
			               								<td>
			               									<c:set var="loop_flag" value="false"/>
			               									<c:forEach var="movieTitle"  items="${movieTitle}" >
			               										<c:if test="${not loop_flag }">
				               								 		<c:if test="${myReviewVO.getAmaNum() eq movieTitle.getAmaNum()}"> 
				               											<a href="${pageContext.request.contextPath}/amaMovie/AmaMovieDetail.ama?amaNum=${myReviewVO.getAmaNum()}&page=${nowPage}"><c:out value="${movieTitle.getAmaTitleKor()}"/></a>
				               											<c:set var="loop_flag" value="true"/>
				               							 			</c:if>
				               							 		</c:if>
			               								</c:forEach>
			               								</td>
														
														<td>
															<c:choose>
																<c:when test="${myReviewVO.getStars() eq 1}">⭐</c:when>
																<c:when test="${myReviewVO.getStars() eq 2}">⭐⭐</c:when>
																<c:when test="${myReviewVO.getStars() eq 3}">⭐⭐⭐</c:when>
																<c:when test="${myReviewVO.getStars() eq 4}">⭐⭐⭐⭐</c:when>
																<c:when test="${myReviewVO.getStars() eq 5}">⭐⭐⭐⭐⭐</c:when>
															</c:choose>
															<br>
															<c:out value="${myReviewVO.getReplyContent()}"/>
														</td>	
														<fmt:parseDate var="reviewDate" value="${myReviewVO.getReplyDate()}" pattern="yyyy-MM-dd HH:mm"/>
														<td><fmt:formatDate value="${reviewDate}" pattern="yyyy-MM-dd HH:mm"/></td>
													</tr>
												</c:forEach>
											</c:when>
											<c:otherwise>
												<td colspan="5" style=" height:300px; text-align:center;">
													<h1 style="margin-top:15%;">작성한 감상평이 없습니다.</h1>
												</td>
											</c:otherwise>
											</c:choose>		
										</tbody>
									</table>
									<div style="text-align: center;">
									<c:if test="${nowPage>1}">
										<a href="${pageContext.request.contextPath}/member/memberMyReview.me?page=${nowPage-1}">[이전]&nbsp;&nbsp;</a>
									</c:if>
			
									<c:forEach var="i" begin="${startPage}" end="${endPage}">
									<c:choose>
									<c:when test="${i eq nowPage}">
										${i}&nbsp;&nbsp;
										</c:when>
										<c:otherwise>
										<a href="${pageContext.request.contextPath}/member/memberMyReview.me?page=${i}">${i}&nbsp;</a>
									</c:otherwise>
									</c:choose>
								</c:forEach>
								<c:if test="${realEndPage != nowPage}">
         							<a href="${pageContext.request.contextPath}/member/memberMyReview.me?page=${nowPage + 1}">&nbsp;&nbsp;[다음]</a>
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
		<script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
		<script src="${pageContext.request.contextPath}/assets/js/jquery.dropotron.min.js"></script>
		<script src="${pageContext.request.contextPath}/assets/js/jquery.poptrox.min.js"></script>
		<script src="${pageContext.request.contextPath}/assets/js/browser.min.js"></script>
		<script src="${pageContext.request.contextPath}/assets/js/breakpoints.min.js"></script>
		<script src="${pageContext.request.contextPath}/assets/js/util.js"></script>
		<script src="${pageContext.request.contextPath}/assets/js/main.js"></script>
		<script src="${pageContext.request.contextPath}/assets/js/floatMenu.js"></script>
		<script>$("#mr").css("background", "rgba(144, 144, 144, 0.075)");</script>
		
		<script>
			if(window.matchMedia('(max-width: 480px)').matches){
				$("#movie").hide();
				$("#movieMobile").show();
			}
		</script>
		<script>
		/* 	var pageContext = "${pageContext.request.contextPath}";
			function getList(){
				$.ajax({
					url : pageContext + "/member/memberMyReview.me",
					dataType : "text",
					success : function(list){
						console.log(JSON.parse(list));
					}
				});
			} */
		</script>
	</body>
</html>