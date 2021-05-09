$(document).on("mouseover", ".posterTag", function(){
	$(this).children().children('#detailText').css('display', 'block');
	$(this).children().children('#detailText').toggleClass("on");
});

$(document).on("mouseout", ".posterTag", function(){
	$(this).children().children('#detailText').css('display', 'none');
	$(this).children().children('#detailText').toggleClass("on");
});

//poptrox
$(function() {
	$('.gallery').poptrox({
		usePopupCaption : true,
		usePopupNav : true,
		popupPadding : 0
	});
});

function link(boardNum){
	if (sessionId == ""){
		alert("로그인 후 이용해 주십시오.");
		location.replace(contextPath+"/member/Login.me?to=board");
	}else{
		/*$(".LinkBoardView").attr("href", contextPath + "/board/BoardView.bo?boardNum="+boardNum);*/
	}
}

function boardWrite(){
	if (sessionId == ""){
		alert("로그인 후 이용해 주십시오.");
		location.replace(contextPath+"/member/Login.me?to=boardWrite");
	}else{
		//$("#bWrite").attr("href", contextPath + "/board/BoardWrite.bo");
		location.replace(contextPath+"/board/BoardWrite.bo");
	}
}

var nowPage = 1;
var searchPage = 0;
var flag = false;
var sFlag = true;

if(window.matchMedia('(max-width: 480px)').matches){
	$("#scrollDone").css("cursor", "pointer");
	$("#scrollDone").children().text("더 보기");
	
	$(document).on("click", "#scrollDone", function(){
		if($("#keyword").val() == ""){
			loadPage();	
		}else{
			search('load');
		}
	});
}else{
	$(window).scroll(function(){   //스크롤이 최하단 으로 내려가면 리스트를 조회하고 page를 증가시킨다.
		if($(window).scrollTop() >= $(document).height() - $(window).height()){
			if($("#keyword").val() == ""){
				loadPage();	
			}else{
				search('load');
			}
		}
	});	
}


function loadPage(){
	if(!sFlag){
		return false;
	}
	var startRow = (nowPage * boardSize) + 1;
	var endRow;
	if(totalPageCnt <= nowPage){
		sFlag = false;
		$("#scrollDone").hide();
		return false;
	}
	if(totalPageCnt == (nowPage+1)){
		endRow = totalCnt;
	}else{
		endRow = (startRow + boardSize) - 1;
	}
	
	$.ajax({
		url : contextPath + "/board/LoadBoardList.bo",
		type : "post",
		data : {"startRow" : startRow, "endRow" : endRow},
		dataType : "json",
		success : showPage,
		error:function(){//통신 오류 시
			console.log("오류");
		}
	});
}

function showPage(boards, flag){
	if(boards != null && boards.length != 0){
		$.each(boards, function(index, board){
			var text = "<div class='col-poster' style='width: 30%; height: 10%; margin: 10px;'>"+
					"<div class='image fit posterTag gallery' style='margin-bottom: 0px;'>"+
					"<img src='"+contextPath+"/images/board/"+board.boardImage+"'/>"+
					"<a href='"+contextPath+"/board/BoardView.bo?boardNum="+board.boardNum+"'"+
					"onclick='link("+board.boardNum+")'"+
					"data-poptrox='iframe,800x500' style='width: 80%; height: 100%; background: transparent;'>"+
					"<span id='detailText' style='padding: 5px; display: none; position: absolute; top: 0; left: 0; bottom: 0; right: 0; color: white; background-color: rgba(0, 0, 0, 0.69); border-radius: 10px;'>"+
					board.boardContent+"</span></a></div></div>";
			if(flag == true){
				$("#posterRow").children().remove();
				$("#scrollDone").show();
			}
			flag = false;
			$("#posterRow").append(text);
			
			$(function() {
				$('.gallery').poptrox({
					usePopupCaption : true,
					usePopupNav : true,
					popupPadding : 0
				});
			});
		});
		nowPage++;
		searchPage++;
	}else{
		sFlag = false;
		$("#scrollDone").hide();
		if(flag == true){
			$("#posterRow").children().remove();
			var noResult = "<div style='margin: 5rem auto;'><h4><strong>검색 결과가 없습니다.</strong></h4></div>";
			$("#posterRow").append(noResult);
		}
	}
}

function search(ox){
	var keyword = $("#keyword").val();
	if(keyword == ""){
		alert("검색어를 입력해 주십시오.");
		return;
	}
	$(".start").hide();
	if(ox == 'click'){
		searchPage = 0;
		flag = true;
	}else{
		flag = false;
	}
	var startRow = (searchPage * boardSize) + 1;
	var endRow;
//	if(totalPageCnt <= searchPage){
//		return false;
//	}
//	if(totalPageCnt == (searchPage+1)){
//		endRow = totalCnt;
//	}else{
		endRow = (startRow + boardSize) - 1;
	//}
	
	$.ajax({
		url : contextPath + "/board/LoadBoardList.bo",
		type : "post",
		data : {"startRow" : startRow, "endRow" : endRow, "keyword" : keyword},
		dataType : "json",
		success : function(result){
			showPage(result, flag);
		},
		error:function(){//통신 오류 시
			console.log("오류");
		}
	});
}