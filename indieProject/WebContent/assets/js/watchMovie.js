/**
 * 
 */
$(document).ready(function(){getAmaReviews();});

function getAmaReviews(page){
	$.ajax({
		url : pageContext + "/amaMovie/AmaMovieReview.ama",
		type : "post",
		data : {"amaNum" : amaNum, "page" : page},
		dataType : "json",
		success : showAmaReviews
	});
}

function showAmaReviews(reviews){
	var textReview = "";
	var textPaging = "";
	var nowPage = "";
	var startPage = "";
	var endPage = "";
	var realEndPage = "";
	var stars = 0;
	if(reviews != null && reviews.length != 0){
		$.each(reviews, function(index, review){
			nowPage = review.nowPage;
			startPage = review.startPage;
			endPage = review.endPage;
			realEndPage = review.realEndPage;
			totalCnt = review.totalCnt;
			starAvg = review.starAvg.toFixed(1);
			// 감상평 목록
			textReview += "<tr><td>"+review.memberId+"</td>";
			if(review.stars == 1){
				textReview += "<td>⭐";
			}else if (review.stars == 2){
				textReview += "<td>⭐⭐";
			}else if (review.stars == 3){
				textReview += "<td>⭐⭐⭐";
			}else if (review.stars == 4){
				textReview += "<td>⭐⭐⭐⭐";
			}else if (review.stars == 5){
				textReview += "<td>⭐⭐⭐⭐⭐";
			}
			if(window.matchMedia('(max-width: 480px)').matches){
				textReview += "<br>"+review.replyContent;
				if(review.memberId == sessionId){
					textReview += "<br><a href='javascript:deleteReview("+amaNum+")' style='text-decoration:none;'>[삭제]</a></td>";
				}
				textReview += "<td>"+review.replyDate+"</td>";
			}else{
				textReview += "</td>";
				textReview += "<td>"+review.replyContent+"</td>";		
				textReview += "<td>"+review.replyDate+"</td>";	
				if(review.memberId == sessionId){
					textReview += "<td><a href='javascript:deleteReview("+amaNum+")' style='text-decoration:none;'>[삭제]</a></td>";
				}
			}
			
			textReview += "</tr>";
			$("#starAvg").text("⭐ 평균 평점 "+starAvg);
		});
		// 페이징
		if(nowPage > 1){
			textPaging += "<a href='javascript:getAmaReviews("+(nowPage-1)+")'>[이전]</a>";
		}
		for(let i=startPage; i<=endPage; i++){
			if(i == nowPage){
				textPaging += i+"  ";
			}else{
				textPaging += "<a href='javascript:getAmaReviews("+i+")'>"+i+"  </a>";
			}
		}
		if(realEndPage != nowPage){
			textPaging += "<a href='javascript:getAmaReviews("+(nowPage+1)+")'>[다음]</a>";
		}
	}else{
		$("#starAvg").text("⭐ 평균 평점 0.0");
		textReview += "<td colspan='4' align='center'><strong>아직 등록된 감상평이 없습니다.</strong></td>";
	}
	
	$("#reviewTable").html(textReview);
	$("#paging").html(textPaging);
	
}

// 감상평 등록
function insertReview(){
	var star = $("#star option:selected").val();
	var review = $("#review").val();
	if(star == ""){
		alert("별점을 선택해 주십시오.");
		return;
	}
	if(review == ""){
		alert("감상평을 작성해 주십시오.");
		return;
	}
	$.ajax({
		url : pageContext + "/amaMovie/AmaMovieReviewOk.ama",
		type : "post",
		data : {"star" : star, "review" : review, "amaNum" : amaNum},
		dataType : "text",
		success : function(result){
			alert(result);
			$("#star option:eq(0)").attr("selected", "selected");
			$("#review").val("");
			getAmaReviews(1);
		}
	});
}

// 감상평 삭제
function deleteReview(amaNum){
	if(confirm('감상평을 삭제하시겠습니까?')){
		$.ajax({
			url : pageContext + "/amaMovie/AmaMovieReviewDelete.ama",
			type : "post",
			data : {"amaNum" : amaNum},
			dataType : "text",
			success : function(result){
				alert(result);
				getAmaReviews(1);
			}
		});
	}else{
		alert("감상평 삭제를 취소했습니다.");
	}
}

//팝콘 보내기
function sendPopcorn(){
		var _width = 380;
		var _height = 500;
		
		var _left = Math.ceil(( window.screen.width - _width )/2);
	    var _top = Math.ceil(( window.screen.height - _height )/2);
	    
		var sendPopcornFrame = window.open(pageContext+"/amaMovie/PopcornSend.ama?amaNum="+amaNum+"&amaTitle="+amaTitle, 
				"popup","width=380px, height=500px, left="+_left+", top="+_top+", resizable=no, scrollbars=no", true);
}