<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
	<div id="footer" style="position:relative;">
		<div class="container">
			<div class="row gtr-200 gtr-uniform">
				<section class="col-12" id="mainSection">
					<header class="major">
						<h2>indieProject</h2>
					</header>
						<h3 style="margin:0 0;">02-1234-5678</h3>
						<p style="margin:0 0;">indieProject@gmail.com</p>
						<p style="margin:0 0;">평일 10:00~18:00 (점심시간 12:00~13:00 / 토요일, 공휴일 휴무)</p>
					<p style="margin:0 0;"><a href=""><b>사업자 정보 확인</b></a> | 인디프로젝트 주식회사 | 서울시 역삼동 ㅇㅇㅇㅇ 3층 303호 | 대표자: 임조장 | 사업자 등록 번호: 123-45-67890 | 호스팅 사업자: NAVER</p>
					
				</section>
			</div>
		</div>
		<div class="copyright" style="margin-top:1em;">
			&copy; indieProject. All rights reserved.
		</div>
	</div>
</body>
<script src="//code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
<script>
var contextPath = "${pageContext.request.contextPath}";
	$.ajax({
		url:"/indieManager/checkManagerOk.ma",
		type:"get",
		dataType:"text",
		success: function(result){
			if(result.trim() == "ok"){
				var text = "<p style='margin:0 0;'><a href='"+contextPath+"/indieManager/managerNoneRefunds.ma'>관리자</a></p>"
				$("#mainSection").append(text);
			}
		}
	});
</script>
</html>