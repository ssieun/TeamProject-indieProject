<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="assets/css/main.css" />
<link rel="shortcut icon" href="images/camera2.png" type="image/x-icon">
<link rel="icon" href="images/camera2.png" type="image/x-icon">
<script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
<script>var contextPath = "${pageContext.request.contextPath}";</script>

<title>인디프로젝트</title>
</head>
<style>
	@media screen and (max-width: 736px) {
	#logoImage {
		width:90px !important;
	}
}
	
	#logoImage {
		width:300px;
    animation: fadein 2s;
    -moz-animation: fadein 2s; /* Firefox */
    -webkit-animation: fadein 2s; /* Safari and Chrome */
    -o-animation: fadein 2s; /* Opera */
}

	/* .col-4 col-12-medium{
		overflow:visble;
	} */
	
@keyframes fadein {
    from {
        opacity:0;
    }
    to {
        opacity:1;
    }
}
@-moz-keyframes fadein { /* Firefox */
    from {
        opacity:0;
    }
    to {
        opacity:1;
    }
}
@-webkit-keyframes fadein { /* Safari and Chrome */
    from {
        opacity:0;
    }
    to {
        opacity:1;
    }
}
@-o-keyframes fadein { /* Opera */
    from {
        opacity:0;
    }
    to {
        opacity: 1;
    }
}
	.carousel .image img{
		width: 14em;
	}
@media screen and (max-width: 1680px){
	.carousel .image img{
		width: 14em;
	}
}
@media screen and (max-width: 1280px){
	.carousel .image img{
		width: 12em;
	}
}
@media screen and (max-width: 736px){
	.carousel .image img{
		width: 9em;
	}
}
@media screen and (max-width: 480px){
	.carousel .image img{
		width: 6em;
	}
}
</style>
	<body class="landing is-preload">
		<%-- <c:if test="${session_id eq null}">
			<script>
				window.onload = function(){
		
		       	 var signUp = document.getElementById("signUp");
		            var logIn = document.getElementById("logIn");
		            
		            signUp.href = contextPath + "/member/SignUp.me";
		            logIn.href = contextPath + "/member/Login.me";
		            
		       	var b1 = signUp.children;
		       	var b2 = logIn.children;
		       	
		       	b1[0].innerHTML = "SignUp";
		       	b2[0].innerHTML = "LogIn";
		       	
		        }
			</script>
		</c:if> --%>
		<!-- Header -->
			<div id="header" class="alt" style="padding:0 0;">
				<div id="logo"><img id="logoImage" style="margin:0 auto;" src="images/logoBlack.png" /></div>
				<!-- <h1 id="logo"><a href="index.html">IndieProject</a></h1> -->
				<nav id="nav">
					<ul>
						<li><a href="${pageContext.request.contextPath}/proMovie/ProMovie.pro">IndieMovie</a></li>
						<li><a href="${pageContext.request.contextPath}/amaMovie/AmaMovie.ama">AmateurMovie</a></li>
						<li><a href="${pageContext.request.contextPath}/board/Board.bo">Board</a></li>
						<li><a href="${pageContext.request.contextPath}/member/MemberCustomerOk.me">Customer</a></li>
						<c:if test="${session_id ne null}">
						<li><a href="${pageContext.request.contextPath} /member/memberMyPage.me" id="signUp"><b>MyPage</b></a></li>
						<li style="margin-left:0.5rem;"><a href="${pageContext.request.contextPath}/member/MemberLogOutAction.me" id="logIn"><b>LogOut</b></a></li>			
						</c:if>		
						<c:if test="${session_id eq null}">
						<li><a href="${pageContext.request.contextPath}/member/SignUp.me" id="signUp"><b>SignUp</b></a></li>
						<li style="margin-left:0.5rem;"><a href="${pageContext.request.contextPath}/member/Login.me" id="logIn"><b>Login</b></a>
						</c:if>
				

			</ul>

				</nav>
			</div>
		
			<section id="banner" style="padding-left:0; padding-right:0;">
				<div class="container">
					<h2>최신 업로드 영화</h2>
				</div>
				
				<section class="carousel" id="amaMovieSlide" style="margin-bottom:3%;">
				</section>
				
				<div class="container">
					<ul class="actions special">
						<li><a href="${pageContext.request.contextPath}/amaMovie/AmaMovie.ama" class="button">최신 아마추어 영화 보러가기</a></li>
					</ul>
				</div>
				<div class="container">
					<h2>현재 상영 중인 영화</h2>
				</div>
				<section class="carousel" id = "proMovieSlide" style="margin-bottom:3%;">
				</section>
				<div class="container">
					<ul class="actions special">
						<li><a href="${pageContext.request.contextPath}/proMovie/ProMovie.pro" class="button">최신 독립영화 보러가기</a></li>
					</ul>
				</div>
			</section>
	
			<section id="one" class="wrapper style1">
				<div class="container">
					<section class="feature">
						<div class="row gtr-200 aln-middle">
							<div class="col-8 col-12-medium">
								<header class="major">
									<h2>indieProject</h2>
									<p>인디프로젝트는 이렇게 만들어졌습니다.</p>
								</header>
								<p>
									indieProject는 일반 상업 영화가 아닌 독립영화를 알리기 위해 시작되었습니다.<br>
									독립영화 또는 인디영화는 일반 상업 영화의 체계, 영화의 제작·배급·선전을 통제하는 주요 제작사의 소수 독점의 관행으로부터 벗어나 제작된 영화를 의미합니다.<br>
									작가 정신에 충실한 작품을 추구하여 만들어지는 영화이기 때문에 일반 상업 영화에 비해 설 자리가 부족함에 초점을 맞추었습니다.<br>
									독립영화를 소개하고 홍보하는 공간이 되어 영화감독, 제작진, 배우를 꿈꾸는 분들이 마음놓고 자신의 작품을 마음껏 뽐낼 수 있도록 돕겠습니다.
								</p>
								<!-- <ul class="actions">
									<li><a href="#" class="button alt">Learn more</a></li>
								</ul> -->
							</div>
							<div class="col-4 col-12-medium important(medium)">
								<span class="image fit rounded">
									<img src="images/camera2.png" alt="" />
								</span>
							</div>
						</div>
					</section>
				</div>
			</section>

		<!-- Footer -->
		<jsp:include page="${pageContext.request.contextPath}/footer.jsp" />
		
		<!-- Scripts -->
			<script src="assets/js/jquery.min.js"></script>
			<script src="//code.jquery.com/jquery-3.5.1.min.js"></script>
			<script src="assets/js/jquery.dropotron.min.js"></script>
			<script src="assets/js/jquery.poptrox.min.js"></script>
			<script src="assets/js/browser.min.js"></script>
			<script src="assets/js/breakpoints.min.js"></script>
			<script src="assets/js/util.js"></script>
			<script src="assets/js/main.js"></script>
         	<script src="assets/js/indexPro.js"></script>
         	<script src="assets/js/indexAma.js"></script>	

<%-- <c:if test="${session_id ne null}">
		   <script>
				  $(document).ready(function(){
		        	 var signUp = document.getElementById("signUp");
		             var logIn = document.getElementById("logIn");
		             
		             signUp.href = contextPath + "/member/memberMyPage.me";
		             logIn.href = contextPath + "/member/MemberLogOutAction.me";
		             
		            $("#signUp").parent().css("right", "6em");
		            
	            	var b1 = signUp.children;
	            	var b2 = logIn.children;
	            	
	            	b1[0].innerHTML = "MyPage";
	            	b2[0].innerHTML = "LogOut";
	            	
	            	console.log(b1);
	            	console.log(b2);
	            	
		         
	         });
         </script>
		</c:if> --%>
</body>
</html>