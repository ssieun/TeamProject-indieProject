<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
		.button {
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
		
		@media screen and (min-width: 737px) {
			#step2 .row div:first-child {
				border-right: solid;
				text-align: right;
				padding-right: 1rem;
			}
			
			#step2 .row div {
				padding-bottom:1rem;
			}
			
			.checkBtn{
				padding:0;
			}
			.checkBtn li{
				width:67%;
			}
		}
		
	</style>
	<body class="is-preload">
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
									<p>내 정보 수정</p>
								</header>
								<fieldset style="padding: 15px; margin-bottom: 0; border-width: 3px; background:#8080800f;">
									<form method="post" name="ChangeInfoForm" action="${pageContext.request.contextPath}/member/MemberChangeInfoOkAction.me">
	      				 				<section id="step1">
		      				 				<div class="row">
		      				 					<div class="col-2 col-12-small" style="margin: 1.5rem 0 0 auto;">
		      				 						<label>로그인 비밀번호</label>
		      				 					</div>
		      				 					<div class="col-5 col-12-small" style="margin: 1.25rem 0 0 0;">
		      				 						<input type="password" name="checkPw" id="checkPw" value="">
		      				 					</div>
		      				 					<div class="col-2 col-12-small" style="margin:1.25rem auto 0 0;">
		      				 						<ul class="actions stacked">
		      											<li><a class="button alt fit small" onclick="checkPw()" >확인</a></li>
		      										</ul>
		      				 					</div>
		      				 				</div>
	      				 				</section>
	      				 				<section id="step2" style="display:none;">
	      				 					<br>
		      				 				<div class="row">
												<div class="col-2 col-12-small" style="margin-left:auto;">								
													<h5>아이디</h5>
												</div>
												<div class="col-6 col-12-small" style="display: inherit;">								
													<input type="text" name="memberId" id="memberId" value="indieProject" readonly/>		
												</div>
												<div class="col-1 col-12-small" style="margin-right:auto;">											
												</div>
											</div>
											<div class="row">
												<div class="col-2 col-12-small" style="margin-left:auto;">								
													<h5>비밀번호</h5>																		
												</div>
												<div class="col-6 col-12-small">								
													<input type="password" name="memberPw" id="memberPw" value=""/>		
												</div>
												<div class="col-1 col-12-small" style="margin-right:auto;">											
												</div>
											</div>
											<div class="row">
												<div class="col-2 col-12-small" style="margin-left:auto;">								
													<h5>비밀번호 확인</h5>																		
												</div>
												<div class="col-6 col-12-small">								
													<input type="password" name="memberPw2" id="memberPw2" value=""/>	
												</div>
												<div class="col-1 col-12-small" style="margin-right:auto;">											
												</div>
											</div>
											
											<div class="row">
												<div class="col-2 col-12-small" style="margin-left:auto;">								
													<h5>이메일</h5>																		
												</div>
												<div class="col-6 col-12-small">								
													<input type="email" name="memberEmail" id="memberEmail" value="기존 이메일"/>	
												</div>
												<div class="col-1 col-12-small" style="margin-right:auto;">	
												</div>
											</div>
											<div class="row" id="sendEmail">
												<div class="col-2 col-12-small" style="margin-left:auto;">																									
												</div>
												<div class="col-6 col-12-small">								
													<ul class="actions stacked" style="margin-bottom:0;">
		      											<li><a class="button alt small" style="width:100%" onclick="sendEmail()">이메일 인증 번호 전송</a></li>
		      										</ul>			
												</div>
												<div class="col-1 col-12-small" style="margin-right:auto;">											
												</div>
											</div>
											<div class="row" id="checkEmail" style="display:none;">
												<div class="col-2 col-12-small" style="margin-left:auto;">																									
												</div>
												<div class="col-4 col-12-small">								
													<input type="text" name="emailCode" placeholder="인증 번호 입력" >			
												</div>
												<div class="col-3 col-12-small checkBtn" style="margin-right:auto;">
													<ul class="actions stacked" style="margin-bottom:0;">
		      											<li><a class="button small fit alt" onclick="emailCodeCheck()">확인</a></li>
		      										</ul>
												</div>
											</div>
											<br>
											<br>
											<div class="row">
												<div class="col-2 col-12-small" style="margin:auto; border:none;">											
													<ul class="actions stacked" style="margin-bottom:0;">
		      											<li><a onclick="saveInfo()" class="button small fit">완료</a></li>
		      										</ul>
												</div>
											</div>
										</section>
									</form>
								</fieldset>
							</section>
						</div>
					</div>
				</div>
			</section>
			<br>
			<br>
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
		<script src="${pageContext.request.contextPath}/assets/js/changeInfo.js"></script>
		<script src="${pageContext.request.contextPath}/assets/js/floatMenu.js"></script>
		<!-- <script>$("#ci").css("background", "rgba(144, 144, 144, 0.075)");</script> -->
		<script>var contextPath = "${pageContext.request.contextPath}";</script>
		
	</body>
</html>