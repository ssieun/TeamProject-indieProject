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
		<link rel="shortcut icon" href="${pageContext.request.contextPath}/images/camera2.png" type="image/x-icon">
		<link rel="icon" href="${pageContext.request.contextPath}/images/camera2.png" type="image/x-icon">
	</head>
	<style>
		.button {
			width:100%;
		}
		li {
			padding:0 0 !important;
		}
		.popcornDisplay {
			display:inline-block;
			margin-left:30px;
			text-align: center;
			border:solid;
			border-radius: 10px;
			padding: 10px;
			vertical-align: text-bottom;
		}
		#popcornDetailBtn{
			margin-bottom:30px;
		}
		
		#popcornBtnDiv {
			width:25%;
		}
		@media screen and (max-width: 980px) {
			#sidebarDiv {
				display: none;
			}
		}
		@media screen and (max-width: 736px) {
			.myDiv {
				width: 35% !important;
			}
			#popcornBtnDiv {
				width:70%;
				margin-left: 0 !important;
			}
			#popcornDetailBtn{
			margin-bottom:0px;
			}
		}
		@media screen and (max-width: 480px) {
			.popcornDisplay {
				margin-left:0;
				width:32%;
			}
			#popcornBtnDiv {
				width:100%;
				margin-left: 0 !important;
			}
		}
		
		#floatMenu {
			position:absolute;
			width:18%;
		}
		
	</style>
	<body class="is-preload">
		<c:set var="myMovieNum" value="${myMovieNum}"/>
		<c:set var="myReviewNum" value="${myReviewNum}"/>
		<c:set var="myBoardNum" value="${myBoardNum}"/>
		<c:set var="myReplyNum" value="${myReplyNum}"/>	
		<c:set var="myPopcornNum" value="${myPopcornNum}"/>	
		<c:set var="myReceivedPopcornNum" value="${myReceivedPopcornNum}"/>	
		<c:set var="movies" value="${myMovieList}"/>
		<c:set var="reviews" value="${myReviewList}"/>
		<c:set var="boards" value="${myBoardList}"/>
		<c:set var="replies" value="${myBoardReplyList}"/>
		<c:set var="movieTitles" value="${movieTitles}"/>
		
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
						<div id="sidebarDiv" class="col-3 col-12-medium" style="order:-2;">
							<jsp:include page="floatMenu.jsp" />
						</div>
						<div class="col-9 col-12-medium imp-medium">
							<!-- Content -->
							<section id="content">
								<header class="major">
									<h2>마이페이지</h2>
									<p><c:out value="${myName}"/>님 안녕하세요!</p>
								</header>                                                                                          
								<div class="image fit" style="margin:0;">
									<img alt="" src="${pageContext.request.contextPath}/images/film.png">
								</div>
								<fieldset style="padding: 15px; margin-bottom: 0; border-width: 3px; background:#8080800f;">
									<div style="height:60px;">
										<div style="float: left;"><h2 style="margin-bottom:0;">내 정보</h2></div>
										<div style="text-align: right; margin-right: 11px;"><a href="${pageContext.request.contextPath}/member/memberChnageInfo.me" style="text-decoration:none;">내 정보 수정하기 ></a></div>
									</div>
									<div>
										<div style="text-align: center;">
											<div class="myDiv" style="border:solid; padding:20px 10px; display:inline-block; border-radius: 10px; width:23%">
												<h3>내가 올린 영화</h3>
												<span style="font-size: 2em;"><c:out value="${myMovieNum}"/></span>
											</div>
											<div class="myDiv" style="border:solid; padding:20px 10px; display:inline-block; border-radius: 10px; width:23%">
												<h3>내가 쓴 감상평</h3>
												<span style="font-size: 2em;"><c:out value="${myReviewNum}"/></span>
											</div>
											<div class="myDiv" style="border:solid; padding:20px 10px; display:inline-block; border-radius: 10px; width:23%">
												<h3>내가 올린 게시글</h3>
												<span style="font-size: 2em;"><c:out value="${myBoardNum}"/></span>
											</div>
											<div class="myDiv" style="border:solid; padding:20px 10px; display:inline-block; border-radius: 10px; width:23%">
												<h3>내가 쓴 댓글</h3>
												<span style="font-size: 2em;"><c:out value="${myReplyNum}"/></span>
											</div>
										</div>
									</div>
								</fieldset>
								<div class="image fit" style="margin:0;">
									<img alt="" src="${pageContext.request.contextPath}/images/film.png">
								</div>
								<hr style="margin-bottom:0;">
								<fieldset style="padding: 15px; border-radius: 10px; margin-bottom: 15px;">
									<div style="height:60px;">
										<div style="float: left;"><h2 style="margin-bottom:0;">나의 팝콘</h2></div>
										<!-- <div style="text-align: right; margin-right: 11px;"><a href="#" style="text-decoration:none;">자세히 보기 ></a></div> -->
									</div>
									<div style="text-align: center;">
										<div style="display:inline-block; vertical-align: text-bottom;">
											<img style="width:100px;" alt="" src="${pageContext.request.contextPath}/images/popcorn_icon.png">
										</div>
										<div class="popcornDisplay">
											<h3 style="font-size: 1.5em;">보유 팝콘</h3>
											<span style="font-size:2em;"><c:out value="${myPopcornNum}"/></span>
										</div>
										<div class="popcornDisplay">
											<h3 style="font-size: 1.5em;">받은 팝콘</h3>
											<span style="font-size:2em;"><c:out value="${myReceivedPopcornNum}"/></span>
										</div>
										<div id="popcornBtnDiv" style="display:inline-block;  margin-left:30px; text-align: center; vertical-align: text-bottom;">
											<!-- <a href="#" class="button primary small">충전하기</a> -->
											<a id="popcornDetailBtn" href="${pageContext.request.contextPath}/member/memberMyPopcorn.me" class="button primary small">자세히 보기</a>
										</div>
									</div>
								</fieldset>
								<hr style="margin-bottom: 0;">
								<fieldset style="padding: 15px; border-radius: 10px; margin-bottom: 15px;">
									<div style="height:60px;">
										<div style="float: left;"><h2>내가 올린 영화</h2></div>
										<div style="text-align: right; margin-right: 11px;"><a href="${pageContext.request.contextPath}/member/memberMyMovie.me" style="text-decoration:none;">더보기 ></a></div>
									</div>
									<table style="margin-bottom: 0;">
										<thead>
											<tr>
												<th>번호</th>
												<th>영화 제목</th>
												<th>작성 날짜</th>
											</tr>
										</thead>
										<c:choose>
											<c:when test="${movies != null and fn:length(movies) > 0}">
												<c:forEach var="m_vo" items="${movies}">
													<tbody>
														<tr>
															<td>${m_vo.getAmaNum()}</td>
															<td>${m_vo.getAmaTitleKor()}</td>
															<fmt:parseDate var="amaDate" value="${m_vo.getAmaDate()}" pattern="yyyy-MM-dd HH:mm"/>
															<td><fmt:formatDate value="${amaDate}" pattern="yyyy-MM-dd HH:mm"/></td>
														</tr>
													</tbody>
												</c:forEach>
											</c:when>
											<c:otherwise>
												<tbody>
													<tr>
														<td colspan="3" align="center">내가 올린 영화가 없습니다.</td>
													</tr>
												</tbody>
											</c:otherwise>
										</c:choose>
									</table>
								</fieldset>
								<hr style="margin-bottom: 0;">
								<fieldset style="padding: 15px; border-radius: 10px; margin-bottom: 15px;" id="myReview">
									<div style="height:60px;">
										<div style="float: left;"><h2>내가 쓴 감상평</h2></div>
										<div style="text-align: right; margin-right: 11px;"><a href="${pageContext.request.contextPath}/member/memberMyReview.me" style="text-decoration:none;">더보기 ></a></div>
									</div>
									<table style="margin-bottom: 0;">
										<thead>
											<tr>
												<th>영화 제목</th>
												<th>별점</th>
												<th>내용</th>
												<th>작성 날짜</th>
											</tr>
										</thead>
										<c:choose>
											<c:when test="${reviews != null and fn:length(reviews) > 0}">
												<c:forEach var="r_vo" items="${reviews}">
													<tbody>
														<tr>
															<td>
																<c:set var="loop_flag" value="false"/>
																<c:forEach var="mt_vo"  items="${movieTitles}" >
																	<c:if test="${not loop_flag }">
				               								 			<c:if test="${r_vo.getAmaNum() eq mt_vo.getAmaNum()}"> 
				               												<c:out value="${mt_vo.getAmaTitleKor()}"/>
				               												<c:set var="loop_flag" value="true"/>
				               							 				</c:if>
				               							 			</c:if>
			               										</c:forEach>
															</td>
															<td>
																<c:choose>
																	<c:when test="${r_vo.getStars() eq 1}">⭐</c:when>
																	<c:when test="${r_vo.getStars() eq 2}">⭐⭐</c:when>
																	<c:when test="${r_vo.getStars() eq 3}">⭐⭐⭐</c:when>
																	<c:when test="${r_vo.getStars() eq 4}">⭐⭐⭐⭐</c:when>
																	<c:when test="${r_vo.getStars() eq 5}">⭐⭐⭐⭐⭐</c:when>
																</c:choose>
															</td>
															<td>${r_vo.getReplyContent()}</td>
															<fmt:parseDate var="reviewDate" value="${r_vo.getReplyDate()}" pattern="yyyy-MM-dd HH:mm"/>
															<td><fmt:formatDate value="${reviewDate}" pattern="yyyy-MM-dd HH:mm"/></td>
														</tr>
													</tbody>
												</c:forEach>
											</c:when>
											<c:otherwise>
												<tbody>
													<tr>
														<td colspan="4" align="center">내가 쓴 감상평이 없습니다.</td>
													</tr>
												</tbody>
											</c:otherwise>
										</c:choose>
									</table>
								</fieldset>
								<fieldset style="padding: 15px; border-radius: 10px; margin-bottom: 15px; display:none;" id="myReviewMobile">
									<div style="height:60px;">
										<div style="float: left;"><h2>내가 쓴 감상평</h2></div>
										<div style="text-align: right; margin-right: 11px;"><a href="${pageContext.request.contextPath}/member/memberMyReview.me" style="text-decoration:none;">더보기 ></a></div>
									</div>
									<table style="margin-bottom: 0;">
										<thead>
											<tr>
												<th>영화 제목</th>
												<th>별점 / 내용</th>
												<th>작성 날짜</th>
											</tr>
										</thead>
										<c:choose>
											<c:when test="${reviews != null and fn:length(reviews) > 0}">
												<c:forEach var="r_vo" items="${reviews}">
													<tbody>
														<tr>
															<td>
																<c:set var="loop_flag" value="false"/>
																<c:forEach var="mt_vo"  items="${movieTitles}" >
																	<c:if test="${not loop_flag }">
				               								 			<c:if test="${r_vo.getAmaNum() eq mt_vo.getAmaNum()}"> 
				               												<c:out value="${mt_vo.getAmaTitleKor()}"/>
				               												<c:set var="loop_flag" value="true"/>
				               							 				</c:if>
				               							 			</c:if>
			               										</c:forEach>
															</td>
															<td>
																<c:choose>
																	<c:when test="${r_vo.getStars() eq 1}">⭐</c:when>
																	<c:when test="${r_vo.getStars() eq 2}">⭐⭐</c:when>
																	<c:when test="${r_vo.getStars() eq 3}">⭐⭐⭐</c:when>
																	<c:when test="${r_vo.getStars() eq 4}">⭐⭐⭐⭐</c:when>
																	<c:when test="${r_vo.getStars() eq 5}">⭐⭐⭐⭐⭐</c:when>
																</c:choose>
																<br>
																${r_vo.getReplyContent()}
															</td>
															<fmt:parseDate var="reviewDate" value="${r_vo.getReplyDate()}" pattern="yyyy-MM-dd HH:mm"/>
															<td><fmt:formatDate value="${reviewDate}" pattern="yyyy-MM-dd HH:mm"/></td>
														</tr>
													</tbody>
												</c:forEach>
											</c:when>
											<c:otherwise>
												<tbody>
													<tr>
														<td colspan="4" align="center">내가 쓴 감상평이 없습니다.</td>
													</tr>
												</tbody>
											</c:otherwise>
										</c:choose>
									</table>
								</fieldset>
								<hr style="margin-bottom: 0;">
								<fieldset style="padding: 15px; border-radius: 10px; margin-bottom: 15px;">
									<div style="height:60px;">
										<div style="float: left;"><h2>내가 올린 게시글</h2></div>
										<div style="text-align: right; margin-right: 11px;"><a href="${pageContext.request.contextPath}/member/memberMyBoard.me" style="text-decoration:none;">더보기 ></a></div>
									</div>
									<table style="margin-bottom: 0;">
										<thead>
											<tr>
												<th>번호</th>
												<th>내용</th>
												<th>작성 날짜</th>
											</tr>
										</thead>
										<c:choose>
											<c:when test="${boards != null and fn:length(boards) > 0}">
												<c:forEach var="b_vo" items="${boards}">
													<tbody>
														<tr>
															<td>${b_vo.getBoardNum()}</td>
															<td>${b_vo.getBoardContent()}</td>
															<fmt:parseDate var="boardDate" value="${b_vo.getBoardDate()}" pattern="yyyy-MM-dd HH:mm"/>
															<td><fmt:formatDate value="${boardDate}" pattern="yyyy-MM-dd HH:mm"/></td>
														</tr>
													</tbody>
												</c:forEach>
											</c:when>
											<c:otherwise>
												<tbody>
													<tr>
														<td colspan="4" align="center">내가 올린 게시글이 없습니다.</td>
													</tr>
												</tbody>
											</c:otherwise>
										</c:choose>
									</table>
								</fieldset>
								<hr style="margin-bottom: 0;">
								<fieldset style="padding: 15px; border-radius: 10px; margin-bottom: 15px;">
									<div style="height:60px;">
										<div style="float: left;"><h2>내가 쓴 댓글</h2></div>
										<div style="text-align: right; margin-right: 11px;"><a href="${pageContext.request.contextPath}/member/memberMyReply.me" style="text-decoration:none;">더보기 ></a></div>
									</div>
									<table style="margin-bottom: 0;">
										<thead>
											<tr>
												<th>글 번호</th>
												<th>내용</th>
												<th>작성 날짜</th>
											</tr>
										</thead>
										<c:choose>
											<c:when test="${replies != null and fn:length(replies) > 0}">
												<c:forEach var="rp_vo" items="${replies}">
													<tbody>
														<tr>
															<td>${rp_vo.getReplyNum()}</td>
															<td>${rp_vo.getReplyContent()}</td>
															<fmt:parseDate var="replyDate" value="${rp_vo.getReplyDate()}" pattern="yyyy-MM-dd HH:mm"/>
															<td><fmt:formatDate value="${replyDate}" pattern="yyyy-MM-dd HH:mm"/></td>
														</tr>
													</tbody>
												</c:forEach>
											</c:when>
											<c:otherwise>
												<tbody>
													<tr>
														<td colspan="3" align="center">내가 쓴 댓글이 없습니다.</td>
													</tr>
												</tbody>
											</c:otherwise>
										</c:choose>
									</table>
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
		<script>$("#my").css("background", "rgba(144, 144, 144, 0.075)");</script>
			
		<script>
			if(window.matchMedia('(max-width: 480px)').matches){
				$("#myReview").hide();
				$("#myReviewMobile").show();
			}
		</script>
		
	</body>
</html>