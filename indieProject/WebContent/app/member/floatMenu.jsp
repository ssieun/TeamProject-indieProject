<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>인디프로젝트</title>
</head>
<style>
	#floatMenu {
		position:absolute;
		width:18%;
	}
</style>
<body>
	<div id="sidebarDiv" class="col-3 col-12-medium" style="order:-2;">
		<fieldset id="floatMenu" style="border:solid; padding:10px; border-radius: 10px; display:block; border-width: 3px;">
			<!-- Sidebar -->
			<section id="sidebar">
					<h3>나의 인디프로젝트</h3>
					<ul class="actions stacked">
						<li><a id="my" href="${pageContext.request.contextPath}/member/memberMyPage.me" class="button small alt">마이페이지</a></li>
						<li><a id="ci" href="${pageContext.request.contextPath}/member/memberChnageInfo.me" class="button small alt">내 정보 수정</a></li>
						<li><a id="mp" href="${pageContext.request.contextPath}/member/memberMyPopcorn.me" class="button small alt">나의 팝콘</a></li>
						<li><a id="mm" href="${pageContext.request.contextPath}/member/memberMyMovie.me" class="button small alt">내가 올린 영화</a></li>
						<li><a id="mr" href="${pageContext.request.contextPath}/member/memberMyReview.me" class="button small alt">내가 쓴 감상평</a></li>
						<li><a id="mb" href="${pageContext.request.contextPath}/member/memberMyBoard.me" class="button small alt">내가 올린 게시글</a></li>
						<li><a id="mrp" href="${pageContext.request.contextPath}/member/memberMyReply.me" class="button small alt">내가 쓴 댓글</a></li>
						<li><a onclick="drop()" class="button small primary">회원 탈퇴</a></li>
					</ul>
			</section>
		</fieldset>
	</div>
</body>
<script src="//code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
<script>
	function drop(){
		var text = "회원 탈퇴 시 IndieProject에 등록된 모든 정보가 삭제됩니다. 계속하시겠습니까?";
		if(confirm(text)){			
			$.ajax({
				url : "${pageContext.request.contextPath}/member/memberDrop.me",
				type : "get",
				dataType : "text",
				success : function(result){
					alert(result);
					location.replace("${pageContext.request.contextPath}/Home.me");
				}
			});
		}
	}
</script>
</html>