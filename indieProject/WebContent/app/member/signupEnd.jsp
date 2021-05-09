<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
<body class="is-preload">

	<!-- Header -->
	<jsp:include page="${pageContext.request.contextPath}/header.jsp" />


	<!-- Main -->
	<section id="main">
		<div class="container">
			<header class="major">
				<h2>회원가입</h2>
			</header>
			
			<!-- Content -->
			<form>
				<section>
					<div class="row" style="display: contents;">
						<div class="col-6 col-9-medium col-12-small" style="border:solid; border-style: outset; border-radius: 15px; margin:0 auto; padding:15px;">
							<h3 style="text-align: center;">회원가입 완료</h3>
							<p style="text-align: center;">환영합니다! 로그인하여 IndieProject를 즐기세요!</p>
							<ul class="actions stacked" style="margin:0 0;">
								<li style="text-align: center;">
									<a href="${pageContext.request.contextPath}/member/Login.me"  class="button">로그인</a>
								</li>
							</ul>
						</div>
					</div>
				</section>
			</form>
		</div>
		<!--  main -->

	</section>

	<!-- Footer -->
	<jsp:include page="${pageContext.request.contextPath}/footer.jsp" />

	<!-- Scripts -->

	<script src="//code.jquery.com/jquery-3.5.1.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/js/jquery.dropotron.min.js"></script>
	<%-- 		<script src="${pageContext.request.contextPath}/assets/js/jquery.poptrox.min.js"></script> --%>
	<script
		src="${pageContext.request.contextPath}/assets/js/browser.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/js/breakpoints.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/util.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/main.js"></script>
	<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
	<script>var contextPath = "${pageContext.request.contextPath}";</script>

</body>
</html>