/**
 * 
 */

function preview1(obj) {
	var fileValue = $(obj).val().split("\\");
	var fileName = fileValue[fileValue.length-1];
	if(fileName.length > 100){
		alert("파일명은 100자 이내로 설정해주세요.");
		$(obj).val("");
		return false;
	}
	var ext = $(obj).val().slice($(obj).val().lastIndexOf(".")+1).toLowerCase();
	if(ext != 'jpg' && ext != 'jpeg' && ext != 'png'){
		alert("이미지 파일 확장자는 jpg, jpeg, png만 가능합니다.");
		$(obj).val("");
		return false;
	}
	
	firstImg.src = URL.createObjectURL(event.target.files[0]);
	firstImg.style.display = "block";
	firstImg.style.objectFit = "cover";
	span1.style.display = "none";
	img2.style.visibility = "visible";
}
function preview2(obj) {
	var fileValue = $(obj).val().split("\\");
	var fileName = fileValue[fileValue.length-1];
	if(fileName.length > 100){
		alert("파일명은 100자 이내로 설정해주세요.");
		$(obj).val("");
		return false;
	}
	var ext = $(obj).val().slice($(obj).val().lastIndexOf(".")+1).toLowerCase();
	if(ext != 'jpg' && ext != 'jpeg' && ext != 'png'){
		alert("이미지 파일 확장자는 jpg, jpeg, png만 가능합니다.");
		$(obj).val("");
		return false;
	}
	
	secondImg.src = URL.createObjectURL(event.target.files[0]);
	secondImg.style.display = "block";
	secondImg.style.objectFit = "cover";
	span2.style.display = "none";
	img3.style.visibility = "visible";
}
function preview3(obj) {
	var fileValue = $(obj).val().split("\\");
	var fileName = fileValue[fileValue.length-1];
	if(fileName.length > 100){
		alert("파일명은 100자 이내로 설정해주세요.");
		$(obj).val("");
		return false;
	}
	var ext = $(obj).val().slice($(obj).val().lastIndexOf(".")+1).toLowerCase();
	if(ext != 'jpg' && ext != 'jpeg' && ext != 'png'){
		alert("이미지 파일 확장자는 jpg, jpeg, png만 가능합니다.");
		$(obj).val("");
		return false;
	}
	
	thirdImg.src = URL.createObjectURL(event.target.files[0]);
	thirdImg.style.display = "block";
	thirdImg.style.objectFit = "cover";
	span3.style.display = "none";
}

function delete1() {
	firstImg.style.display = "none";
	firstImg.src = "";
	span1.style.display = "block";
	if(secondImg.style.display == "none" & thirdImg.style.display == "none"){		
		img2.style.visibility = "hidden";
		img3.style.visibility = "hidden";
	}
	var agent = navigator.userAgent.toLowerCase();
	if ( (navigator.appName == 'Netscape' && navigator.userAgent.search('Trident') != -1) || (agent.indexOf("msie") != -1) ){
	    // ie 일때 input[type=file] init.
	    $("#first-file-input").replaceWith( $("#first-file-input").clone(true) );
	} else {
	    //other browser 일때 input[type=file] init.
	    $("#first-file-input").val("");
	}
}
function delete2() {
	secondImg.style.display = "none";
	secondImg.src = "";
	span2.style.display = "block";
	if(thirdImg.style.display == "none"){		
		img3.style.visibility = "hidden";
	}
	if(firstImg.style.display == "none"){
		img2.style.visibility = "hidden";
	}
	var agent = navigator.userAgent.toLowerCase();
	if ( (navigator.appName == 'Netscape' && navigator.userAgent.search('Trident') != -1) || (agent.indexOf("msie") != -1) ){
	    $("#second-file-input").replaceWith( $("#second-file-input").clone(true) );
	} else {
	    $("#second-file-input").val("");
	}
}
function delete3() {
	thirdImg.style.display = "none";
	thirdImg.src = "";
	span3.style.display = "block";
	if(secondImg.style.display == "none"){		
		img3.style.visibility = "hidden";
	}
	var agent = navigator.userAgent.toLowerCase();
	if ( (navigator.appName == 'Netscape' && navigator.userAgent.search('Trident') != -1) || (agent.indexOf("msie") != -1) ){
	    // ie 일때 input[type=file] init.
	    $("#third-file-input").replaceWith( $("#third-file-input").clone(true) );
	} else {
	    //other browser 일때 input[type=file] init.
	    $("#third-file-input").val("");
	}
}

$('textarea')
	.keyup(
		function() {
			var characterCount = $(this).val().length, current_count = $('#current_count'), maximum_count = $('#maximum_count'), count = $('#count');
			current_count.text(characterCount);
		});

function submit(){
	if($("#first-file-input").val() == ""){
		alert("대표 사진 첨부는 필수입니다.");
		return;
	}
	if($('textarea').val() == ""){
		alert("내용을 입력해 주십시오.");
		$('textarea').focus();
		return;
	}
	
	boardForm.submit();
}

$(document).ready(function(){
	  //Show contextmenu:
$("#bImg").on("mouseover", function(e){
  //Get window size:
  var winWidth = $(document).width();
  var winHeight = $(document).height();
  //Get pointer position:
  var posX = e.pageX;
  var posY = e.pageY;
  //Get contextmenu size:
  var menuWidth = $("#bImgHelp").width();
  var menuHeight = $("#bImgHelp").height();
  //Security margin:
  var secMargin = 10;
  //Prevent page overflow:
  if(posX + menuWidth + secMargin >= winWidth
  && posY + menuHeight + secMargin >= winHeight){
    //Case 1: right-bottom overflow:
    posLeft = posX - menuWidth - secMargin + "px";
    posTop = posY - menuHeight - secMargin + "px";
  }
  else if(posX + menuWidth + secMargin >= winWidth){
    //Case 2: right overflow:
    posLeft = posX - menuWidth - secMargin + "px";
    posTop = posY + secMargin + "px";
  }
  else if(posY + menuHeight + secMargin >= winHeight){
    //Case 3: bottom overflow:
    posLeft = posX + secMargin + "px";
    posTop = posY - menuHeight - secMargin + "px";
  }
  else {
    //Case 4: default values:
    posLeft = posX + secMargin + "px";
    posTop = posY + secMargin + "px";
  };
  //Display contextmenu:
  $("#bImgHelp").css({
    "left": posLeft,
    "top": posTop
  }).show();
  //Prevent browser default contextmenu.
  return false;
});
//Hide contextmenu:
$("#bImg").on("mouseout", function(){
  $("#bImgHelp").hide();
});
});