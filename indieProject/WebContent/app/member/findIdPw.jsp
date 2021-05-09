<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<title>인디프로젝트</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css" />
		<link rel="shortcut icon" href="${pageContext.request.contextPath}/images/camera2.png" type="image/x-icon">
		<link rel="icon" href="${pageContext.request.contextPath}/images/camera2.png" type="image/x-icon">
		<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
		
	</head>
	<style>
		.button {
			width:100%;
		}
		li {
			padding:0 0 !important;
		}
		
		 fieldset{
		   border-radius: 7% ;
		  	margin:0 auto ;
		}
		
		@media screen and (max-width: 736px) {
			.select {
				width: 40% !important;
			}
			#findId a, #findPw a {
				width: 100% !important;
			}
		}
		
		
	</style>
	<body class="is-preload">

		<!-- Header -->
			<jsp:include page="${pageContext.request.contextPath}/header.jsp" />

		<!-- Main -->
			<section id="main">
				<div class="container">
					<header class="major">
						<h2>아이디 / 비밀번호 찾기</h2>
						<div class="row gtr-200">
							<ul class="actions stacked" style="margin:2rem auto 0 auto; width:100%; display:inline;">
								<li class="select" style="display:inline-block; width:25%">
									<a href="javascript: findId()" class="button primary small" id="findIdBtn">아이디 찾기</a>
								</li>
								<li class="select" style="display:inline-block; width:25%">
									<a href="javascript: findPw()" class="button alt small" id="findPwBtn">비밀번호 찾기</a>
								</li>
							</ul>
						</div>
					</header>

					<!-- Content -->
					<section id="content">
						<div class="row gtr-uniform gtr-50">
							<div class="col-6 col-9-medium col-12-small" style="margin:auto;">
								<fieldset class="fieldset" style="border: solid; border-style: outset; padding-left: 5%; padding-top: 3%; ppadding-right: 0%;">
									<form method="post" name="FindIdPwForm">
										<br>
										<section id="findId">
											<h4>입력한 이메일로 아이디가 발송됩니다.</h4>
											<br>
											<h4>이름</h4>
											<input style="width:94%; margin-bottom: 15px;" type="text" name="memberNameI" id="" value="" placeholder="NAME" />
											<h4>이메일</h4>
											<input style="width:94%;" type="text" name="memberEmailI" id="" value="" placeholder="EMAIL" />
											<div style="width:94%; margin-top:2rem; text-align:center;">
												<a style="width:10em;" href="javascript: sendId()" class="button alt">전송</a>
											</div>
										</section>
										<section id="findPw" style="display:none;">
											<h4>입력한 이메일로 임시 비밀번호가 발송됩니다.</h4>
											<br>
											<h4>이름</h4>
											<input style="width:94%; margin-bottom: 15px;" type="text" name="memberNameP" id="" value="" placeholder="NAME" />
											<h4>아이디</h4>
											<input style="width:94%; margin-bottom: 15px;" type="text" name="memberIdP" id="" value="" placeholder="ID" />
											<h4>이메일</h4>
											<input style="width:94%;" type="text" name="memberEmailP" id="" value="" placeholder="EMAIL" />
											<div style="width:94%; margin-top:2rem; text-align:center;">
												<a style="width:10em;" href="javascript: sendTempPw()" class="button alt">전송</a>
											</div>
										</section>
									</form>
								</fieldset>
							</div>
							
						</div>
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
			<script src="${pageContext.request.contextPath}/assets/js/findIdPw.js"></script>
			<script>var contextPath = "${pageContext.request.contextPath}";</script>

	</body>
</html>