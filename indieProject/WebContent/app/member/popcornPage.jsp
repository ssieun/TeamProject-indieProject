<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>

<html>
	<head>
		<title>인디프로젝트</title>
		<meta charset="utf-8" />
		<meta name="viewport"
			content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/jquery-ui.css" />
		<link rel="shortcut icon" href="${pageContext.request.contextPath}/images/camera2.png" type="image/x-icon">
		<link rel="icon" href="${pageContext.request.contextPath}/images/camera2.png" type="image/x-icon">
		<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
		<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
		 <meta name="viewport" content="width=device-width; initial-scale=1.0"> 

	</head>
	<style>
.button {
	width: 100%;
}

li {
	padding: 0 0 !important;
}

* {
	margin: 0 auto;
	padding: 0;
}

ul, li {
	list-style: none;
}

button {
	background-color: cadetblue;
	border: 0;
	padding: 5px;
}

div.wrap {
	width: 70%;
	float: right;
	background-color: antiquewhite;
	padding: 30px;
}

div.left {
	width: 48%;
	float: left;
	margin: 0 auto;
	box-sizing: border-box;
}

.right {
	width: 48%;
	float: right;
	box-sizing: border-box;
	position: absolute;
	top: 3%;
	left: 54%;
	height: 60%;
}

.right>.top {
	background-color: #fff;
	width: 97%;
	border-radius: 10px;
	padding: 23px;
	box-sizing: border-box;
	position: absolute;
	right: 13%;
	height: 103%;
}

.top>ul.pop {
	width: 100%;
}

.top>.pop>li {
	padding: 10px;
}

.top>.pop>li>.button primary small {
	float: right;
}

.right>.bottom {
	padding: 23px;
	box-sizing: border-box;
	margin-top: 44px;
	width: 98%;
	border-radius: 10px;
	background-color: #fff;
	position: absolute;
	right: 12%;
	top: 96%;
}

.bottom>div {
	margin-top: 10px;
	width: 100%;
	position: relative;
}

@media screen and (max-width: 1280px) {
	.top>.pop>li {
		margin-bottom: 14px;
	}
}

@media screen and (max-width: 980px) {
	#sidebarDiv {
		display: none;
	}
}

@media screen and (max-width: 720px) {
	#sidebarDiv {
		display: none;
	}
	.popcorn_img {
		width: 41%;
	}
	.popcorn_box {
		width: 16%;
	}
	.right>.top {
		width: 107%;
	}
	.right>.bottom {
		width: 107%;
		top: 94%;
	}
	.change_popcorn {
		width: 61% !important;
	}
	#button_1 {
		width: 38% !important;
	}

/* ~여기서 부터~ 조회 기간 CSS 최후 수정 */	
@media screen and (max-width: 684px){
	.date2 {
		width: 40% !important;
	}
	#date1 {
		margin-left: 8% !important;
	}
	.date {
		display: block !important;
	}
	#searchCss {
		width: 85% !important;
		display: block !important;
		margin-left: 8% !important;
	}
}
@media screen and (max-width: 480px){
	.date2{
		width: 40% !important;
	}
	
	#date1 {
		margin-left: 10% !important;
		margin-top: 5% !important;
	}
	#date2 {
		/* margin-left: 3% !important; */
		margin-bottom: 5% !important;
	}
	
/* 	#spanCss{
		margin-left: 25% !important;
	} */
	#searchCss {
		width: 87% !important;
		display: block !important;
		margin-left: 10% !important;
	}
}
/* 조회 기간 CSS 최후 수정 ~여기까지~ */

	@media screen and (max-width: 480px) {
		#sidebarDiv {
			display: none;
		}
		.popcorn_box {
			width: 41%;
		}
		.popcorn_img {
			width: 92%;
		}
		.right>.top {
			top: 500px !important;
			width: 189% !important;
			height: 55% !important;
		}
		.right>.bottom {
			width: 191% !important;
			height: 23% !important;
			top: 873px !important;
			margin-left: 0 !important;
			padding: 9% !important
		}
		#popcorn_main {
			margin-bottom: 120% !important;
			width: 88% !important;
			height: 584px !important;
			margin-left: 10% !important;
		}
		.popcorn_date {
			width: 90%;
		}
		.date {
			float: none !important;
		}
	}
	@media screen and (max-width: 400px) {
		#sidebarDiv {
			display: none;
		}
		.right>.top {
			top: 460px !important;
		}
		.right>.bottom {
			top: 812px !important;
		}
		.popcorn_date {
			width: 90%;
		}
/* 		.date {
			float: none !important;
		}
		.date2 {
			width: 183px !important;
		} */
		.text {
			font-size: 1.2em !important;
		}
	}
	@media screen and (max-width: 380px) {
		#sidebarDiv {
			display: none;
		}
		.right>.top {
			width: 193% !important;
			top: 460px !important;
			height: 50% !important;
		}
		.right>.bottom {
			top: 768px !important;
			height: 25% !important;
		}
		.popcorn_date {
			width: 90%;
		}
/* 		.date {
			float: none !important;
		}
		.date2 {
			width: 139px !important;
		} */
		.text {
			font-size: 1.2em !important;
		}
		.moneytext {
			font-size: 13px !important;
		}
	}
}
</style>
	<body class="is-preload">
	<c:if test="${session_id eq null}">
		<script>
			alert("로그인 후 이용해주세요");
			location
					.replace("${pageContext.request.contextPath}/member/Login.me");
		</script>
	</c:if>
      
      
      <c:if test="${myPopcornNum ne null}">
      	<c:set var="myPopcornNum" value="${myPopcornNum}"/>
      </c:if>
      <c:if test="${myPopcornNum eq null}">
      	<c:set var="myPopcornNum" value="0"/>
      </c:if>
      
       <c:if test="${myReceivedPopcornNum ne null}">
      <c:set var="myReceivedPopcornNum" value="${myReceivedPopcornNum}"/>
      </c:if>
      <c:if test="${myReceivedPopcornNum eq null}">
      	<c:set var="myReceivedPopcornNum" value="0"/>
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
									<p>나의 팝콘 정보</p>
								</header>

						<hr style="margin-bottom: 0;">
						<fieldset class="main"
							style="padding: 5%; border-radius: 10px; background-color: #e6e6d6; position: relative;">
							<div style="height: 60px;">
								<div style="float: left;">
									<h2 id="popCornNum" style="margin-bottom: 0;">
										<c:out value="${myName}" />
										고객님의 팝콘
									</h2>
								</div>
							</div>

							<div class="right">
								<div class="top">
									<h1>팝콘 충전</h1>
									<hr
										style="margin-bottom: 0; margin-top: 5%; margin-bottom: 4%;">

									<ul class="pop">
										<li><span class="inner-left"> <img
												src="${pageContext.request.contextPath}/images/smallpopcorn.png"
												alt="x10개" style="width: 19%; vertical-align: middle;">
												<span style="font-weight: 700; margin-top: 5%;">X 10
													개</span></span> <a class="button primary small"
											id="check_module1" style="width: 40%; float: right;">1,000원</a></li>

										<li><span class="inner-left"> <img
												src="${pageContext.request.contextPath}/images/smallpopcorn.png"
												style="width: 19%; vertical-align: middle;"><span
												style="font-weight: 700; margin-top: 5%;"> X 50 개</span>
										</span> <a class="button primary small" id="check_module2"
											style="width: 40%; float: right;">5,000원</a></li>

										<li><span class="inner-left"> <img
												src="${pageContext.request.contextPath}/images/smallpopcorn.png"
												style="width: 19%; vertical-align: middle;"><span
												style="font-weight: 700; margin-top: 5%;"> X 100 개</span>
										</span> <a class="button primary small" id="check_module3"
											style="width: 40%; float: right;">10,000원</a></li>

										<li><span class="inner-left"> <img
												src="${pageContext.request.contextPath}/images/smallpopcorn.png"
												style="width: 19%; vertical-align: middle;"> <span
												style="font-weight: 700; margin-top: 5%;">X 500 개</span>
										</span> <a class="button primary small" id="check_module4"
											style="width: 40%; float: right;">50,000원</a></li>
									</ul>
								</div>

								<div class="bottom">
									<h1>
										환전가능한 팝콘 :
										<c:out value="${myReceivedPopcornNum}" />
									</h1>

									<p style="margin: 0;">●  100개 이상부터 환전 가능</p>

									<div>
										<div style="display: flex;">
											<input type="text" class=" change_popcorn" name="change_popcorn" id="change_popcorn"
												placeholder="팝콘갯수" style="width: 68%; display: inline;" />
											<a href="#" id="button_1" class="button primary small" style="width: 33%;"
												onclick="goExchange()">환전하기</a>
										</div>
									</div>
								</div>
							</div>

							<!--"popcorn_add"  -->
							
							<!--  popcorn_money"-->

							<div id="popcorn_main">
								<div id="img_popcorn_head">
									<img alt=""
										src="${pageContext.request.contextPath}/images/popcornhead.png"
										class="popcorn_img">
								</div>
								<div class="my_popcorn">
									<div
										style="display: inline-block; vertical-align: text-bottom;">
									</div>
									<div class="popcorn_box"
										style="display: inline-block; text-align: center; border: solid; border-radius: 10px; padding: 10px; vertical-align: text-bottom; background-color: #ebd490;">
										<h3 style="font-size: 1.5em;" class="text">보유 팝콘</h3>
										<h4>
											<c:out value="${myPopcornNum}" />
											개
										</h4>
									</div>

									<div class="popcorn_box"
										style="display: inline-block; margin-left: 30px; text-align: center; border: solid; border-radius: 10px; padding: 10px; vertical-align: text-bottom; background-color: #ebd490;">
										<h3 style="font-size: 1.5em;" class="text">받은 팝콘</h3>
										<h4>
											<c:out value="${myReceivedPopcornNum}" />
											개
										</h4>
									</div>

									<div id="img_popcorn_body">
										<img alt=""
											src="${pageContext.request.contextPath}/images/popcornbody.png"
											class="popcorn_img">
									</div>
								</div>
							</div>
						</fieldset>
						<div class="popcoen_give" style="margin-top: 5%;">
							<h2 style="color: black;">후원내역 조회</h2>
							<ul>
								<li style="color: black;" class="moneytext">이미 후원한 금액은 다시 환불 할 수 없습니다</li>
							</ul>
						</div>
						<div class="date">
							<fieldset
								style="padding: 3%; margin-bottom: 5%; border-width: 3px; background: #8080800f;">
								<form class="popcorn_date" style="margin: 0;" action="" method="post">
									<p
										style="margin: 0; margin-top: 1%; font-weight: bold; margin-left: 6%; display:inline-block;" class="date">조회기간</p>
									<input type='text' name='date1' id='date1'  class="date2 datepicker"
										style="margin-left: 5%; width: 25%; border: 1px solid #d8d9db; padding: 0 10px; display:inline;"
										placeholder="yyyy.mm.dd" readonly/> 
									<span id="spanCss" style="font-weight: 900; font-size: 1.5rem;">~</span>
									<input type='text' name='date2' id='date2'  class="date2 datepicker"
											style="display: inline; width: 25%; border: 1px solid #d8d9db; padding: 0 10px;"
											placeholder="yyyy.mm.dd" readonly/> 
									<a href="javascript:search();" id="searchCss"
										class="button alt small fit" style="width: 20%; display:inline-grid; margin-left:5%;">조회</a>
								</form>
							</fieldset>
						</div>

						<div id="popchon_table">
							<table style="margin-bottom: 0;" id="table">
								<thead>
									<tr>
										<th>번호</th>
										<th>영화제목</th>
										<th>후원받은아이디</th>
										<th>금액</th>
										<th>팝콘갯수</th>
										<th>후원날짜</th>
									</tr>
								</thead>

								<tr id="popCornTr">

									<td colspan="6" align="center">후원 내역이 없습니다.</td>
													
								</tr>

								</tbody>
							</table>

						</div>

					</section>
						</div>
					</div>
				</div>
			</section>

		<!-- Footer -->
		<jsp:include page="${pageContext.request.contextPath}/footer.jsp" />

		<!-- Scripts -->
		<script>var contextPath = "${pageContext.request.contextPath}";</script>
		<script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
		<script src="${pageContext.request.contextPath}/assets/js/jquery.dropotron.min.js"></script>
		<script src="${pageContext.request.contextPath}/assets/js/jquery.poptrox.min.js"></script>
		<script src="${pageContext.request.contextPath}/assets/js/browser.min.js"></script>
		<script src="${pageContext.request.contextPath}/assets/js/breakpoints.min.js"></script>
		<script src="${pageContext.request.contextPath}/assets/js/util.js"></script>
		<script src="${pageContext.request.contextPath}/assets/js/jquery-ui.js"></script>
	 	<script src="${pageContext.request.contextPath}/assets/js/main.js"></script>
 		<script src="${pageContext.request.contextPath}/assets/js/floatMenu.js"></script>
 		<script>
 			var myReceivedPopcornNum = "${myReceivedPopcornNum}";
 		</script>
		<script src="${pageContext.request.contextPath}/assets/js/popcornPage.js"></script>


	</body>
</html>