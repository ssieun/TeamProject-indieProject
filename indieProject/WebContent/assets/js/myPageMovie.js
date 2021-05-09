/**
 * 
 */
var nowPage = 1;

if(window.matchMedia('(max-width: 480px)').matches){
	$("#scrollDone").css("cursor", "pointer");
	$("#scrollDone").children().text("더 보기");
	
	$(document).on("click", "#scrollDone", function(){
		loadPage();
	});
}else{
	$(window).scroll(function(){   //스크롤이 최하단 으로 내려가면 리스트를 조회하고 page를 증가시킨다.
		if($(window).scrollTop() >= $(document).height() - $(window).height()){
			loadPage();
		}
	});	
}

function loadPage(){
	var startRow = (nowPage * boardSize) + 1;
	var endRow;
	if(totalPageCnt <= nowPage){
		$("#scrollDone").hide();
		return false;
	}
	if(totalPageCnt == (nowPage+1)){
		endRow = totalCnt;
	}else{
		endRow = (startRow + boardSize) - 1;
	}
	
	$.ajax({
		url : contextPath + "/member/MemberLoadMyMovieListOk.me",
		type : "post",
		data : {"session_id" : session_id, "startRow" : startRow, "endRow" : endRow},
		dataType : "json",
		success : showPage,
		error:function(){//통신 오류 시
			console.log("오류");
		}
	})
}

function showPage(movies){
	if(movies != null && movies.length != 0){
		$.each(movies, function(index, movie){
			var text = "<div class='col-poster' style='width: 30%; height: 10%; margin: 10px;'>"+
					"<div class='image fit posterTag' style='margin-bottom: 0px;'>"+
					"<img  style='cursor: pointer;' src='"+contextPath+"/images/amaMovie/"+movie.fileName+"' alt='"+movie.fileName+"' onclick='moveDetail("+movie.amaNum+")'/>"+
					"<p><span style='display:block;'>"+movie.amaTitleKor+"</span><span><a style='text-decoration:none' href='javascript:modifyMovie("+movie.amaNum+")'>[수정]</a>"+
					"<a style='text-decoration:none' href='javascript:deleteMovie("+movie.amaNum+")'>[삭제]</a></span></p>"+
					"</div>"+
					"</div>";
			$("#posterRow").append(text);
			
		});
		nowPage++;
	}
}
function modifyMovie(amaNum){
	location.href=contextPath + "/amaMovie/AmaMovieModify.ama?amaNum="+amaNum;
}
function moveDetail(amaNum){
	location.href = contextPath+"/amaMovie/AmaMovieDetail.ama?amaNum="+amaNum;
}

function deleteMovie(amaNum){
	var reason;
	if(confirm("영화 삭제시 해당 영화와 관련된 모든 내용이 삭제됩니다. 동의합니까?")){
		if((reason = prompt("영화 삭제 사유를 입력해주세요.", "")) != null){
			$.ajax({
				url : contextPath + "/member/memberDeleteMovieOk.me",
				type : "post",
				data : {"amaNum" : amaNum, "reason" : reason},
				dataType : "text",
				success : function(result){
					if(result.trim() == "ok"){
						alert("삭제신청 완료되었습니다.");
					}else if(result.trim() == "complete"){
						alert("이미 삭제 신청 완료된 영화입니다.");
					}else{
						alert("오류 발생 잠시후 다시 시도해주세요.");
					}
				},
				error:function(){//통신 오류 시
					console.log("오류");
				}
			})
		}
	}
	
}