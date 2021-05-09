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
<style>
fieldset {
	border-radius: 7%;
	margin: 0 auto;
	padding-right: 0%;
}

.poster {
	border: dotted;
	/* width: 100%;
	height: 70%; */
}

.image.fit {
	margin: 0 0;
}
@media screen and (max-width: 480px) {
	.button {
		padding: 0 32px !important;
	}
}

#bImgHelp {
	display: none;
	position: absolute;
	width: 200px;
	margin: 0;
	padding: 0.5rem;
	background: #FFFFFF;
	border-radius: 5px;
	list-style: none;
	box-shadow: 0 15px 35px rgba(50, 50, 90, 0.1), 0 5px 15px
		rgba(0, 0, 0, 0.07);
	z-index: 999999;
}
</style>
<body class="is-preload">

	<!-- Header -->
	<jsp:include page="${pageContext.request.contextPath}/header.jsp" />

	<!-- Main -->
	<section id="main">
		<div class="container">
			<header class="major">
				<h2>게시글 작성</h2>
				<p>작성된 게시글은 자유 게시판에 등록됩니다.</p>
			</header>
			<div class="row">
				<!-- Text -->
				<div class="col-8 col-10-medium col-12-small" style="margin: 0 auto;">
					<fieldset
						style="border: solid; border-style: outset; padding-left: 4%; padding-top: 4%; padding-bottom: 4%; padding-right: 4%;">
						<br>
						<h3 style="display:inline-block;">사진 업로드</h3>
						<span><img id="bImg" style="width: 17px; cursor: help;" 
						src="${pageContext.request.contextPath}/images/question.png"></span>
						<div id="bImgHelp" style="display: none; resize: none;">첫번째로
							첨부된 이미지가 대표 이미지로 사용됩니다.</div>
						<section style="margin-right: auto; margin-left: auto;">
							<form action="${pageContext.request.contextPath}/board/BoardWriteOk.bo" method="post" name="boardForm" enctype="multipart/form-data">
								<div class="photos" style="display: flex;">
									<div class="col-4 col-3-small photo"
										style="text-align: center; margin-right: auto; margin-left: auto; width: 40%;">
										<div class="poster image fit"
											style="padding-left: 0;">
											<img id="firstImg" class="img" alt="" src=""
												style="display: none; width: 100%; height: 100%;"> 
											<span
												id="span1" class="image fit" style="padding-bottom: 30%;">
												<label for="first-file-input"> <img id="firstImg2"
													class="camera"
													src="${pageContext.request.contextPath}/images/add.png"
													alt="영화 포스터"
													style="width: 50px; margin: 47% auto auto auto; cursor: pointer;" />
												</label> 
												<input name="boardImage1" id="first-file-input" type="file"
												onchange="preview1(this)" accept="image/*" style="display: none;" />
											</span>
		
										</div>
										<a id="d1" onclick="delete1()" style="cursor: pointer;">삭제</a>
									</div>
		
									<div id="img2" class="col-4 col-3-small photo"
										style="text-align: center; margin-right: auto; margin-left: auto; width: 40%; visibility:hidden;">
										<div class="poster image fit"
											style="padding-left: 0;">
											<img id="secondImg" alt="" src="" class="img"
												style="display: none; width: 100%; height: 100%;"> 
											<span
												id="span2" class="image fit" style="padding-bottom: 30%;">
												<label for="second-file-input"> <img id="secondImg2"
													class="camera"
													src="${pageContext.request.contextPath}/images/add.png"
													alt="영화 포스터"
													style="width: 50px; margin: 47% auto auto auto; cursor: pointer;" />
												</label> 
												<input name="boardImage2" id="second-file-input" type="file"
													onchange="preview2(this)" accept="image/*" style="display: none;" />
											</span>
		
										</div>
										<a id="d2" onclick="delete2()" style="cursor: pointer;">삭제</a>
									</div>
									<div id="img3" class="col-4 col-3-small photo"
										style="text-align: center; margin-right: auto; margin-left: auto; width: 40%; visibility:hidden;">
										<div class="poster image fit"
											style="padding-left: 0;">
											<img id="thirdImg" alt="" src="" class="img"
												style="display: none; width: 100%; height: 100%;"> 
											<span
												id="span3" class="image fit" style="padding-bottom: 30%;">
												<label for="third-file-input"> <img id="thirdImg2"
													class="camera"
													src="${pageContext.request.contextPath}/images/add.png"
													alt="영화 포스터"
													style="width: 50px; margin: 47% auto auto auto; cursor: pointer;" />
												</label> 
												<input name="boardImage3" id="third-file-input" type="file"
													onchange="preview3(this)" accept="image/*" style="display: none;" />
											</span>
		
										</div>
										<a id="d3" onclick="delete3()" style="cursor: pointer;">삭제</a>
									</div>
		
								</div>
								<div>
									<br>
									<h3>게시글 내용 작성</h3>
									<textarea name="boardContent" maxlength="200"
										style="width: 100%; resize: none; margin-left: auto; margin-right: auto; margin-bottom: 1%;"></textarea>
									<div id="count">
										<span id="current_count">0</span> <span id="maximum_count">/
											200</span> 
									<a href="javascript: submit();" class="button" style="float: right;">업로드</a>
									</div>
								</div>
							</form>
						</section>
					</fieldset>
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
	<script src="${pageContext.request.contextPath}/assets/js/boardWrite.js"></script>
</body>
</html>