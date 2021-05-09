/**
 * 
 */

// 우경씨 코드
var slideIndex = 1;
showSlides(slideIndex);

function plusSlides(n) {
  showSlides(slideIndex += n);
}

function currentSlide(n) {
  showSlides(slideIndex = n);
}

function showSlides(n) {
  var i;
  var slides = document.getElementsByClassName("mySlides");
  var dots = document.getElementsByClassName("dot");
  if (n > slides.length) {slideIndex = 1}    
  if (n < 1) {slideIndex = slides.length}
  for (i = 0; i < slides.length; i++) {
      slides[i].style.display = "none";  
  }

  slides[slideIndex-1].style.display = "block";  
}

function showplay() {
 		        var flag = $('#hidTempSynopsis');
 		        var SynopsisDiv = $('#SynopsisDiv');
 		        var flagValue = flag.val();
 		        if (flag != null) {
 		            if (flagValue == "0") {
 		            	
// 		                SynopsisDiv.css("height", "17px");
// 		                SynopsisDiv.css("display", "-webkit-box");
// 		            	document.getElementById("memberId").style.display = "none";
 		                $("#synopMore").text("게시글 보기");
 		                SynopsisDiv.slideUp();
 		                
 		                flag.val("1");
 		            }
 		            else {
// 		              	SynopsisDiv.css("height", "320px");
  		               SynopsisDiv.slideDown();
//  		             document.getElementById("memberId").style.display = "block";
// 		                SynopsisDiv.css("display", "block");
 		                $("#synopMore").text("댓글 보기");

 		                flag.val("0");
 		            }
 		        }
 		        else {
 		            alert("[더보기] 추가 정보가 없습니다.");
 		        }
 		    }

//-----------------------------------------------------------
$(document).ready(function(){getBoardReplies();});

// 댓글 목록
function getBoardReplies(){
	$.ajax({
		url : pageContext + "/board/BoardReplyList.bo?boardNum="+ boardNum,
		type : "get",
		dataType : "json",
		success : showBoardReplies
	});
}

function showBoardReplies(replies){
		var text = "";
		
		if(replies != null && replies.length != 0){
			$.each(replies, function(index, reply){
				text += "<tr style='background:transparent;'><td style='padding:10px;'>" + reply.memberId + "</td>";
				text += "<td valign='top' style='text-align:left;'>";
				text += "<div name='dContent" + (index + 1) + "' id='d" + (index + 1) + "' class='re'>" + reply.replyContent + "</div>";
				text += "<textarea name='tContent" + (index + 1) + "' id='t" + (index + 1) + "' class='re' style='resize:none; display:none;'>" + reply.replyContent + "</textarea>";
				
				if(sessionId == reply.memberId){
					text += "<a href='javascript:deleteReply(" + reply.replyNum + ")' style='float:right; text-decoration:none;'>[삭제]</a>"
					text += "<a id='ready" + (index + 1) + "' href='javascript:updateReply(" + (index + 1) + ")' style='float:right; text-decoration:none;'>[수정]</a>";
					text += "<a id='ok"+ (index + 1) + "' href='javascript:updateReplyOk(" + reply.replyNum + ", " + (index + 1) + ")' style='text-decoration:none; display:none;'>[수정 완료]</a>";
				}
				text += "</td></tr>";

			});
		}else{
			text += "<tr align='center'><td align='center' width='150px' colspan='2'>댓글이 없습니다.</td></tr>";
		}
		
		$("#replyTable").html(text);
		//autosize($("textarea.re"));
}

// 댓글 등록
function insertReply(){
	var replyContent = $("textarea[name='replyContent']").val();
		$.ajax({
			url : pageContext + "/board/BoardReply.bo",
			type : "post",
			data : {"replyContent" : replyContent, "boardNum" : boardNum},
			dataType : "text",
			success : function(result){
				alert(result);
				$("textarea[name='replyContent']").val("");
				getBoardReplies();
			}
		});
}

var check = false;
// 댓글 수정
function updateReply(num){
	if(!check){
		var div = $("#d"+num);
		var textarea = $("#t"+num);
		var a_ready = $("a#ready" + num);
		var a_ok = $("a#ok" + num);
		
		div.hide()
		textarea.show();
		a_ready.hide();
		a_ok.show();
		check = true;
	}else {
		alert("수정 중인 댓글이 있습니다.");
	}
}
function updateReplyOk(replyNum, seq){
	var content = $("#t"+seq).val();
	$.ajax({
		url : pageContext + "/board/BoardReplyUpdate.bo",
		type : "post",
		data : {"replyNum" : replyNum, "replyContent" : content},
		dataType : "text",
		success : function(result){
			alert(result);
			check = false;
			getBoardReplies();
		}
	});
}
function deleteReply(replyNum){
	if(confirm('댓글을 삭제하시겠습니까?')){
		$.ajax({
			url : pageContext + "/board/BoardReplyDelete.bo?replyNum="+replyNum,
			type : "get",
			dataType : "text",
			success : function(result){
				alert(result);
				getBoardReplies();
			}
		});
	}else{
		alert("댓글 삭제를 취소했습니다.");
	}
}