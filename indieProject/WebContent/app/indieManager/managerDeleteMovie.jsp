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
	<c:set var="noneDeleteMovieList" value="${noneDeleteMovieList}"/>
	
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
						<a href="${pageContext.request.contextPath}/indieManager/managerRefunds.ma" class="button alt">처리된 환급</a>
					</li>
					<li>
						<a href="${pageContext.request.contextPath}/indieManager/managerRefunds.ma" class="button primary">영화 삭제</a>
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
										<th>신청일자</th>
										<th>신청자 ID</th>
										<th>영화 번호</th>
										<th>영화 제목</th>
										<th>삭제 사유</th>
										<th>삭제 승인</th>
										<th>삭제 미승인</th>
									</tr>
								</thead>
								<tbody>
									<c:choose>
										<c:when test="${noneDeleteMovieList !=null and fn:length(noneDeleteMovieList) > 0 }">
											<c:forEach var="data" items="${noneDeleteMovieList}">
												<tr>
													<td>${data.getRequestDate()}</td>
													<td>${data.getMemberId()}</td>
													<td>${data.getAmaNum()}</td>
													<td>${data.getAmaTitleKor()}</td>
													<c:choose>
														<c:when test="${fn:length(data.getReason()) > 15}">
															<td onclick="alert('${data.getReason()}')" width = "250">${fn:substring(data.getReason(), 0, 15)}...</td>
														</c:when>
														<c:otherwise>
															<td width = "250">${data.getReason()}</td>
														</c:otherwise>
													</c:choose>
													<td><a style="cursor:pointer; text-decoration: none;" onclick="deleteOk('${data.getMemberId()}', '${data.getAmaNum()}', '${data.getAmaTitleKor()}', this)">[승인]</a></td>
													<td><a style="cursor:pointer; text-decoration: none;" onclick="deleteNotOk('${data.getMemberId()}', '${data.getAmaNum()}', '${data.getAmaTitleKor()}', this)">[미승인]</a></td>
												</tr>
											</c:forEach>
										</c:when>
										<c:otherwise>
											<tr>
												<td colspan="7" style="text-align: center;">삭제 신청된 영화가 존재하지 않습니다.</td>
											</tr>
										</c:otherwise>
									</c:choose>
								
								</tbody>
							</table>
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
	<script>
		function deleteOk(memberId, amaNum, amaTitleKor, tag){
			if(confirm(amaNum+"번 영화 삭제처리 하시겠습니까?")){
				$.ajax({
					url : contextPath + "/indieManager/deleteMovieOk.ma",
					type : "post",
					data : {"memberId" : memberId, "amaNum" : amaNum, "amaTitleKor" : amaTitleKor},
					dataType : "text",
					success : function(result){
						if(result.trim() == "ok"){
							$(tag).text("완료");
							$(tag).attr("onclick", "");
							$(tag).parent().next().children().text("완료");
							$(tag).parent().next().children().attr("onclick", "");
							alert("삭제 완료");
						}else{
							alert("삭제 실패_잠시후 다시 시도해주세요.");
						}
					},
					error:function(){//통신 오류 시
						console.log("오류");
					}
				})
			}
		}
		
		function deleteNotOk(memberId, amaNum, amaTitleKor, tag){
			if(confirm(amaNum+"번 영화 삭제 미승인 하시겠습니까?")){
				var noReason = prompt("미승인 사유를 입력해주세요.","");
				if(noReason != null){
					$.ajax({
						url : contextPath + "/indieManager/deleteMovieCancleOk.ma",
						type : "post",
						data : {"memberId" : memberId, "amaNum" : amaNum, "amaTitleKor" : amaTitleKor, "noReason" : noReason},
						dataType : "text",
						success : function(result){
							if(result.trim() == "ok"){
								$(tag).text("완료");
								$(tag).attr("onclick", "");
								$(tag).parent().prev().children().text("완료");
								$(tag).parent().prev().children().attr("onclick", "");
								alert("미승인 완료");
							}else{
								alert("미승인 실패_잠시후 다시 시도해주세요.");
							}
						},
						error:function(){//통신 오류 시
							console.log("오류");
						}
					})
				}
			}
		}
	</script>
</body>
</html>