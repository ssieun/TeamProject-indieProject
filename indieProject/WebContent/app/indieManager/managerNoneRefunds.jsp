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
	<c:set var="noneExchangeList" value="${noneExchangeList}"/>
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
						<a href="${pageContext.request.contextPath}/indieManager/managerNoneRefunds.ma" class="button primary">미처리 환급</a>
					</li>
					<li>
						<a href="${pageContext.request.contextPath}/indieManager/managerRefunds.ma" class="button alt">처리된 환급</a>
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
										<th>신청자 ID</th>
										<th>환전 신청 개수</th>
										<th>실 환전 금액</th>
										<th>예금주</th>
										<th>은행</th>
										<th>계좌번호</th>
										<th>완료</th>
									</tr>
								</thead>
								<tbody>
									<c:choose>
										<c:when test="${noneExchangeList !=null and fn:length(noneExchangeList) > 0 }">
											<c:forEach var="data" items="${noneExchangeList}">
												<tr>
													<td>${data.getExchangeNum()}</td>
													<td>${data.getExchangeDate()}</td>
													<td>${data.getMemberId()}</td>
													<td>${data.getPopcornNum()}개</td>
													<td>${data.getMoney()}원</td>
													<td>${data.getMemberName()}</td>
													<td>${data.getMemberBank()}</td>
													<td>${data.getAccountNum()}</td>
													<td><a onclick="exchange(${data.getExchangeNum()}, this)">입금완료</a></td>
												</tr>
											</c:forEach>
										</c:when>
										<c:otherwise>
											<tr>
												<td colspan="9" style="text-align: center;">입금 신청이 없습니다.</td>
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
		var contextPath = "${pageContext.request.contextPath}";
		
		function exchange(exchangeNum, btn){
			if(confirm(exchangeNum+"번 입금처리 하시겠습니까?")){
				$.ajax({
					url : contextPath + "/indieManager/managerExchangeOk.ma",
					type : "post",
					data : {"exchangeNum" : exchangeNum},
					dataType : "text",
					success : function(result){
						if(result.trim() == "ok"){
							$(btn).text("완료");
							$(btn).attr("onclick", "");
						}else{
							alert("오류_잠시후 다시 시도해주세요.");
						}
					},
					error:function(){//통신 오류 시
						console.log("오류");
					}
				})
				
			}
		}
	</script>
</body>
</html>