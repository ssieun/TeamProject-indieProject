<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
<script>var contextPath = "${pageContext.request.contextPath}";</script>
<title></title>
</head>
<style>
	#logoImage {
		width:233px;
	}
	@media screen and (max-width: 736px) {
		#logoImage {
			width:180px;
		}
	}
</style>
<body><%-- 
<c:if test="${session_id ne null}">
		   <script>
		         window.onload = function(){
		        	 var signUp = document.getElementById("signUp");
		             var logIn = document.getElementById("logIn");
		             
		             signUp.href = contextPath + "/member/memberMyPage.me";
		             logIn.href = contextPath + "/member/MemberLogOutAction.me";
		             
	            	var b1 = signUp.children;
	            	var b2 = logIn.children;
	            	
	            	b1[0].innerHTML = "MyPage";
	            	b2[0].innerHTML = "LogOut";
	            	
	            	console.log(b1);
	            	console.log(b2);
		         
	         }
         </script>
		</c:if>
		<c:if test="${session_id eq null}">
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
	<div id="header">
		<!-- <h1 id="logo"><a href="index.html">Gravity</a></h1> -->
		<div id="logo"><a href="${pageContext.request.contextPath}/index.jsp"><img id="logoImage" style="margin:0 auto;" src="${pageContext.request.contextPath}/images/logo_header.png" /></a></div>
		<nav id="nav">
			<ul>
				<li>
					<a href="${pageContext.request.contextPath}/proMovie/ProMovie.pro">IndieMovie</a>
				</li>
				<li>
					<a href="${pageContext.request.contextPath}/amaMovie/AmaMovie.ama">AmateurMovie</a>
					<%-- <ul>
						<li><a href="${pageContext.request.contextPath}/amaMovie/AmaMovie.ama">영화 조회</a></li>
						<li><a href="${pageContext.request.contextPath}/amaMovie/.ama"></a></li>
					</ul> --%>
				
				</li>
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
</body>
</html>