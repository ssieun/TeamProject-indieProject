<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
	

		.searchZone {
			width:70%;
			margin-left: auto !important;
			margin-right: auto !important;
		}
		.oneLine1 {
			width:30% !important;
		}
		.oneLine2 {
			width:50% !important;
		}
		.searchBtn {
			width:20% !important;
		}
		.row > .col-poster {
			width: 25%;
		}
		.pagingTable {
			width:50%;
		}
		
		.leftBtn {
	background-color: rgb(0 0 0/ 5%);
	height: 100%;
	top: 0;
	color: white;
	left: 0;
}

.rightBtn {
	background-color: rgb(0 0 0/ 5%);
	height: 100%;
	top: 0;
	color: white;
	right: 0;
}
		

		
		
		
		
.floating { position: fixed;}

#layer_fixed
        {
            
           	
            position:fixed;
           
            
            background-color:white;
        }
        
* {box-sizing: border-box}
body {font-family: Verdana, sans-serif; margin:0}
.mySlides {display: none}
img {vertical-align: middle;}

/* Slideshow container */
.slideshow-container {
  max-width: 1000px;
  position: relative;
  margin: auto;
}

/* Next & previous buttons */
.prev, .next {
  cursor: pointer;
  position: absolute;
  top: 50%;
  width: auto;
  padding: 16px;
  margin-top: -22px;
  color: white;
  font-weight: bold;
  font-size: 18px;
  transition: 0.6s ease;
  border-radius: 0 3px 3px 0;
}

/* Position the "next button" to the right */
.next {
  right: 0;
  border-radius: 3px 0 0 3px;
}

/* On hover, add a black background color with a little bit see-through */
.prev:hover, .next:hover {
  background-color: rgba(0,0,0,0.8);
}

/* Caption text */
.text {
  color: #f2f2f2;
  font-size: 15px;
  padding: 8px 12px;
  position: absolute;
  bottom: 8px;
  width: 100%;
  text-align: center;
}

/* Number text (1/3 etc) */
.numbertext {
  color: #f2f2f2;
  font-size: 12px;
  padding: 8px 12px;
  position: absolute;
  top: 0;
}

/* The dots/bullets/indicators */
.dot {
  cursor: pointer;
  height: 15px;
  width: 15px;
  margin: 0 2px;
  background-color: #bbb;
  border-radius: 50%;
  display: inline-block;
  transition: background-color 0.6s ease;
}

.active, .dot:hover {
  background-color: #717171;
}

/* Fading animation */
.fade {
  -webkit-animation-name: fade;
  -webkit-animation-duration: 1.5s;
  animation-name: fade;
  animation-duration: 1.5s;
}

@-webkit-keyframes fade {
  from {opacity: .4} 
  to {opacity: 1}
}

@keyframes fade {
  from {opacity: .4} 
  to {opacity: 1}
}


    .content_wrap {
            clear:both; 
            display:block; 
            overflow:hidden !important; 
            margin:25px 20px 0 20px; 
            padding:5px;
            line-height:130%;
            height:20%;
            /* min-height:160px; */
            border:1px solid;
		}

    .btn_more {            
            display:block;
            padding:37px 0 0 0; 
            margin:30px 0 0 0;
            text-align:center; 
            font-size:12px; 
            color:#000;
}

    /* 시놉시스 더보기 */
    .SynopsisText {
/*             height: 15.6px !important;
 */          width: 100%;
            overflow: hidden !important;
            display: -webkit-box;
            -webkit-line-clamp: 1;
            -webkit-box-orient: vertical;
        }
        
        
/* On smaller screens, decrease text size */
	

         @media screen and (max-width: 853px) {
			#synopsis{
				width: 100%;
				margin-right:0% !important;
			}
			
		} 
		
		/* 문제있음 */
		
		

        @media screen and (max-width: 736px) {
			#titleBar{
				display:none;
			}
			
		    .img{
		    	position:static !important;
		    
		    	width:100% !important;
  		    	height:50% !important;
		    	margin:0;
		    	margin-top:2% !important;
		    	padding:0 !important;
		 
		    	
		    }
		    #changeToMargin0{
		    	margin:0% !important;
		    	width:40% !important;
		    }
		    
		    #layer_fixed{
		    	margin-left:0% !important;
		    	width:100% !important;
		    	
		    }
		    
		    #text{
		    	width:100% !important;
		    }
		    
		    #table{
		   	    width: 15% !important;
			    margin-right: 0 !important;
			    margin-top:1% !important;
				margin-bottom:4% !important;
		    }
		    .rest{
		    	position:static !important;
		    	bottom:0px !important;
		    	width:400% !important;
			    height:0% !important;
		    	padding:0 !important;
		    	margin:0 !important;
		    	margin-left:0% !important;
		    	
		    }
		    
		    .container{
		    	margin:0% !important;
		    }
		    
		    #title{
		    	height:0% !important;
		    	width: 100% !important;
		    }
		    #synopsis{
		    	height:0% !important;
		    }
		    
		    #SynopsisDiv{
		    	height:310px !important;
		    }
		    
		    #replyTable{
		    	width:30% !important;
		    	padding-bottom:7% !important;
		    	padding-right: 12% !important;
		    }
			
		}
		

	</style>
	<body class="is-preload">
	<c:set var="board" value="${board}"/>
	<c:set var="boardImages" value="${boardImages}"/>

		<!-- Header -->

		<!-- Main -->
		<div class="img">
		<section class="img" style="position:absolute; top:0px; left:0px;">
			<div class=" image fit posterTag floating img" style="width:40%;  height:100%; margin-bottom:0; display:flex;" onmouseover="" onmouseout="">
					<div class=" slideshow-container img" style="margin-top:0; margin-bottom:0; object-fit:cover;">
					<c:choose>
						<c:when test="${boardImages != null and fn:length(boardImages) > 0}">
							<c:forEach var="bi_vo" items="${boardImages}">
								<div class=" mySlides fade img" style="width:100%; height:100%; object-fit:cover;">
								  <img src="${pageContext.request.contextPath}/images/board/${bi_vo.getImageName()}" alt="" style="width:100%; height:100%;" class="boardImg img"/>
								</div>
							</c:forEach>
						</c:when>
						<c:otherwise>
								<div class=" mySlides fade img" style="width:100%; height:100%; object-fit:cover;">
								  <img src="${pageContext.request.contextPath}/images/testImage.jpg" alt="" style="width:100%; height:100%;" class="boardImg img"/>
								</div>
								<div class=" mySlides fade img" style="width:100%; height:100%; object-fit:cover;">
								  <img src="${pageContext.request.contextPath}/images/poster.jpeg" alt="" style="width:100%; height:100%;" class="boardImg img"/>
								</div>
						</c:otherwise>
					</c:choose>
						
						<a class=" prev" onclick="plusSlides(-1)">&#10094;</a>
						<a class=" next" onclick="plusSlides(1)">&#10095;</a>
					</div>
			</div>
		</section>
		</div>
			
	<div class="rest">
		<!-- 게시글 내용 -->
		<section id="layer_fixed" style=" margin-left:40%; top:0px; width:90%;">
				<div style="width:100%;">							
					<table style="all:revert; width:100%; margin-right:0;">				
						<tr height="0px" class="rest" style=" width:100%; background:transparent; margin-left:10%; background-color:#f7f7f7; color:black;">
							<td  style="padding-left:10px; width:10%;"><strong id="memberId"><c:out value="${board.getMemberId()}"/></strong></td>
							<td id="title" style="padding-left:10px; width:60%;">    
							<article class="content_wrap" id="synopsis" style="width:60%;border-style:none;height:100%; margin:0;">       
						       	<div id="SynopsisDiv" class="SynopsisText" style="width:100%; height:330px;">
						       		<c:out value="${board.getBoardContent()}"/> 	
						        </div>
						        <a href="javascript:showplay();" class="btn_more" id="synopMore" style="padding:0; margin:0; float:right;">댓글 열기</a>
						        <input name="hidTempSynopsis" type="hidden" id="hidTempSynopsis" value="0">
						    </article></td>												
						</tr>
					</table>
				</div>
		</section>
		<!-- 댓글 등록 -->
		<section  id="layer_fixed" style=" margin-left:40%; bottom:0px; width:90%;">
				<div style="width:100%;">		
					<table style="all:revert;">
						<tr style="background:transparent;">
								<td style="padding:0; padding-left:10px; width:5%;"><c:out value="${session_id}"/></td>
								<td valign="top" id="text" style="text-align:left;">
									<textarea rows="" cols="" name="replyContent" id="text" style="resize:none; width:60%;"></textarea>
									<a href="javascript: insertReply()" style="float:left;  text-decoration:none;">등록</a>
								</td>
							</tr>
					</table>
				</div>
		</section>
		<!-- 댓글 목록 -->
		<section  id="main" style="padding:0;">
			<div class="container" style="margin-right:0;">
				<!-- Content -->
				<section id="content">
					<div style="text-align: center;" class="main ">
						<div class=" rest" onclick="" style="width:100%; display:flex;">
							<div id="changeToMargin0" class="" style="margin-left:33%; width:100%; margin-bottom:20%;">
								<div>
								<table id="replyTable" class=""  style="all:revert; width:100%;">
									<!-- 여기가 댓글 내용 -->
								</table>
								</div>
							</div>
						</div>
					</div>
				</section>
			</div>					
		</section>	
	</div>

		<!-- Scripts -->
		<script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
		<script src="${pageContext.request.contextPath}/assets/js/jquery.dropotron.min.js"></script>
		<script src="${pageContext.request.contextPath}/assets/js/jquery.poptrox.min.js"></script>
		<script src="${pageContext.request.contextPath}/assets/js/browser.min.js"></script>
		<script src="${pageContext.request.contextPath}/assets/js/breakpoints.min.js"></script>
		<script src="${pageContext.request.contextPath}/assets/js/util.js"></script>
		<script src="${pageContext.request.contextPath}/assets/js/main.js"></script>
		<script src="https://rawgit.com/jackmoore/autosize/master/dist/autosize.min.js"></script>
		<script src="//code.jquery.com/jquery-3.5.1.min.js" ></script>
		<script src="https://unpkg.com/swiper@6.5.0/swiper-bundle.min.js"></script>
		
		<script>
			var pageContext = "${pageContext.request.contextPath}"
			var boardNum = "${board.getBoardNum()}"
			var sessionId = "${session_id}"
		</script>
		<%-- <script src="${pageContext.request.contextPath}/assets/js/board.js"></script> --%>
		<script src="${pageContext.request.contextPath}/assets/js/boardView.js"></script>
	</body>
</html>