<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
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
		@media screen and (min-width:481px) {
			.col-8 .button {
				width: 11em;
			}
		}
	</style>
	<body class="is-preload">
		<c:set var="ama_vo" value="${ama_vo}" />
		<c:set var="mainPoster" value="${mainPoster}" />
		<c:set var="posters" value="${posters}" />
		<c:set var="stillcuts" value="${stillcuts}" />
		<c:set var="makers" value="${makers}" />
		<c:set var="actors" value="${actors}" />
		<c:set var="popcornSenders" value="${popcornSenders}" />
		<c:set var="reviews" value="${reviews}" />
		<!-- Header -->
			<jsp:include page="${pageContext.request.contextPath}/header.jsp" />

		<!-- Main -->
			<section id="banner" class="wrapper style1 special">
				<div class="container">
						<h2>영화 게시판</h2>
				</div>
			</section>
					<!-- Content -->
			<section id="one" class="wrapper style1">
				<div class="container">
					<section class="feature" style="border-bottom: solid 1px rgba(144, 144, 144, 0.25);">
						<div class="row gtr-200 aln-middle">
							<div class="col-4 col-12-medium">
								<span class="image fit">
									<img src="${pageContext.request.contextPath}/images/amaMovie/${mainPoster}" alt="영화 포스터" />
								</span>
							</div>
							<div class="col-8 col-12-medium">
								<header class="major">
									<h2><c:out value="${ama_vo.getAmaTitleKor()}"/> (<c:out value="${ama_vo.getAmaTitleEng()}"></c:out>)</h2>
									<fmt:parseDate var="amaMakeDate" value="${ama_vo.getAmaMakeDate()}" pattern="yyyy-MM-dd"/>
									<p><fmt:formatDate value="${amaMakeDate}" pattern="yyyy-MM-dd"/></p>
								</header>
									<p>
										감독 : <c:out value="${ama_vo.getAmaDirector()}"/><br>
										길이 : <c:out value="${ama_vo.getAmaMovieLength()}"/><br>
										장르 : <c:out value="${ama_vo.getGenre()}"/><br>
										영상물 등급 : <c:out value="${ama_vo.getRating()}"/>
									</p>
								<ul class="actions">
									<li><a href="javascript:watchMovie();" class="button alt">영화 보러 가기</a></li>
									<li id="popcorn" style="display:none;"><a id="popcornBtn" onclick="sendPopcorn()" class="button" >팝콘 보내기</a></li>
									<c:choose>
										<c:when test="${ama_vo.getPopcorn() eq 'popcornOn'}">
											<script>$("#popcorn").show()</script>
										</c:when>
									</c:choose>
								</ul>
							</div>
						</div>
					</section>
					<section id="content">
						<br>
						<h2>포스터 / 스틸컷</h2>
						<section class="carousel">
							<c:choose>
							<c:when test="${posters != null and fn:length(posters) > 0}">
								<c:forEach var="p" items="${posters}">
									<article>
										<a href="${pageContext.request.contextPath}/images/amaMovie/${p}" class="image"><img src="${pageContext.request.contextPath}/images/amaMovie/${p}" alt="" title="${ama_vo.getAmaTitleKor()}" /></a>
									</article>
								</c:forEach>
							</c:when>
							<c:when test="${stillcuts != null and fn:length(stillcuts) > 0}">
								<c:forEach var="s_vo" items="${stillcuts}">
									<article>
										<a href="${pageContext.request.contextPath}/images/amaMovie/${s_vo.getFileName()}" class="image"><img src="${pageContext.request.contextPath}/images/amaMovie/${s_vo.getFileName()}" alt="" title="${ama_vo.getAmaTitleKor()}" /></a>
									</article>
								</c:forEach>
							</c:when>
							<c:otherwise>
								
									<h4>등록된 사진이 없습니다.</h4>
								
							</c:otherwise>
							</c:choose>
						</section>
						<hr>
						<h2>시놉시스</h2>
						<p><c:out value="${ama_vo.getSynopsis()}"/></p>
						<hr>
						<h2>연출 의도</h2>
						<p><c:out value="${ama_vo.getTheme()}"/></p>
						<hr>
						<div class="row">
							<div class="col-6 col-12-medium">
								<h2>만든 사람들</h2>
								<c:choose>
									<c:when test="${makers != null and fn:length(makers) > 0}">
										<c:forEach var="m_vo" items="${makers}">
										<p> <c:out value="${m_vo.getMakerPosition()}"/> : <c:out value="${m_vo.getMakerName()}"/></p>
										</c:forEach>
									</c:when>
									<c:otherwise>
										<p>등록된 정보가 없습니다.</p>
									</c:otherwise>
								</c:choose>							
							</div>
							<div class="col-6 col-12-medium">
								<h2>나오는 사람들</h2>
								<c:choose>
									<c:when test="${actors != null and fn:length(actors) > 0}">
										<c:forEach var="a_vo" items="${actors}">
										<p> <c:out value="${a_vo.getAmaCast()}"/> : <c:out value="${a_vo.getActorName()}"/></p>
										</c:forEach>
									</c:when>
									<c:otherwise>
										<p>등록된 정보가 없습니다.</p>
									</c:otherwise>
								</c:choose>
							</div>
						</div>
						<hr>
						<h2>팝콘 후원자</h2>
						<div class="table-wrapper">
							<table>
								<thead>
									<tr>
										<th>아이디</th>
										<th>한마디</th>
										<th>보낸 팝콘 수</th>
									</tr>
								</thead>
								<tbody>
									<c:choose>
										<c:when test="${popcornSenders != null and fn:length(popcornSenders) > 0}">
											<c:forEach var="p_vo" items="${popcornSenders}">
												<tr>
													<td><c:out value="${p_vo.getSendId()}"/></td>
													<td><c:out value="${p_vo.getPopcornContent()}"/></td>
													<td><c:out value="${p_vo.getPopcornNum()}"/></td>
												</tr>
											</c:forEach>
										</c:when>
										<c:otherwise>
											<tr>
												<td colspan="3" align="center"><strong>따뜻한 팝콘이 필요합니다...</strong></td>
											</tr>
										</c:otherwise>
									</c:choose>
								</tbody>
							</table>
						</div>
						<hr>
						<h2>영화 감상평</h2>
						<ul class="actions">
							<li><a href="javascript:watchMovie();" class="button alt small fit">감상평 등록하러 가기</a></li>
						</ul>
						<table style="margin-bottom: 0;" id="review">
							<thead>
								<tr>
									<th>아이디</th>
									<th>별점</th>
									<th>내용</th>
									<th>작성시간</th>
								</tr>
							</thead>
							<tbody>
								<c:choose>
									<c:when test="${reviews !=null and fn:length(reviews) > 0 }">
										<c:forEach var="mr_vo"  items="${reviews}" >
								 			<tr>
               								<td>${mr_vo.getMemberId()}</td>
											<td>
												<c:choose>
													<c:when test="${mr_vo.getStars() eq 1}">⭐</c:when>
													<c:when test="${mr_vo.getStars() eq 2}">⭐⭐</c:when>
													<c:when test="${mr_vo.getStars() eq 3}">⭐⭐⭐</c:when>
													<c:when test="${mr_vo.getStars() eq 4}">⭐⭐⭐⭐</c:when>
													<c:when test="${mr_vo.getStars() eq 5}">⭐⭐⭐⭐⭐</c:when>
												</c:choose>
											</td>	
											<td>${mr_vo.getReplyContent()}</td>
											<td>${mr_vo.getReplyDate()}</td>
											</tr>
										</c:forEach>
									</c:when>
									<c:otherwise>
										<td colspan="4" align="center"><strong>아직 등록된 감상평이 없습니다.</strong></td>
									</c:otherwise>
								</c:choose>		
							</tbody>
						</table>
						<table style="margin-bottom: 0; display:none;" id="reviewMobile">
							<thead>
								<tr>
									<th>아이디</th>
									<th>별점 / 내용</th>
									<th>작성시간</th>
								</tr>
							</thead>
							<tbody>
								<c:choose>
									<c:when test="${reviews !=null and fn:length(reviews) > 0 }">
										<c:forEach var="mr_vo"  items="${reviews}" >
								 			<tr>
               								<td>${mr_vo.getMemberId()}</td>
											<td>
												<c:choose>
													<c:when test="${mr_vo.getStars() eq 1}">⭐</c:when>
													<c:when test="${mr_vo.getStars() eq 2}">⭐⭐</c:when>
													<c:when test="${mr_vo.getStars() eq 3}">⭐⭐⭐</c:when>
													<c:when test="${mr_vo.getStars() eq 4}">⭐⭐⭐⭐</c:when>
													<c:when test="${mr_vo.getStars() eq 5}">⭐⭐⭐⭐⭐</c:when>
												</c:choose>
												<br>
												${mr_vo.getReplyContent()}
											</td>
											<fmt:parseDate var="replyDate" value="${mr_vo.getReplyDate()}" pattern="yyyy-MM-dd HH:mm"/>
											<td><fmt:formatDate value="${replyDate}" pattern="yyyy-MM-dd HH:mm"/></td>
											</tr>
										</c:forEach>
									</c:when>
									<c:otherwise>
										<td colspan="4" align="center"><strong>아직 등록된 감상평이 없습니다.</strong></td>
									</c:otherwise>
								</c:choose>		
							</tbody>
						</table>
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
				function watchMovie(){
					if ("${session_id}" == ""){
						alert("로그인 후 이용해 주십시오.");
						location.replace("${pageContext.request.contextPath}/member/Login.me?to=amaWatch&amaNum=${ama_vo.getAmaNum()}");
					}else{
						location.replace("${pageContext.request.contextPath}/amaMovie/AmaMovieWatch.ama?amaNum=${ama_vo.getAmaNum()}");
					}
				}
				function sendPopcorn(){
					if ("${session_id}" == ""){
						alert("로그인 후 이용해 주십시오.");
						location.replace("${pageContext.request.contextPath}/member/Login.me?to=amaDetail&amaNum=${ama_vo.getAmaNum()}");
					}else{
						var _width = 380;
						var _height = 500;
						
						var _left = Math.ceil(( window.screen.width - _width )/2);
					    var _top = Math.ceil(( window.screen.height - _height )/2);
					    
						var sendPopcornFrame = window.open("${pageContext.request.contextPath}/amaMovie/PopcornSend.ama?amaNum=${ama_vo.getAmaNum()}&amaTitle=${ama_vo.getAmaTitleKor()}", 
								"popup","width=380px, height=500px, left="+_left+", top="+_top+", resizable=no, scrollbars=no");
					}
				}
				
				if(window.matchMedia('(max-width: 480px)').matches){
					$("#review").hide();
					$("#reviewMobile").show();
				}
			</script>

	</body>
</html>