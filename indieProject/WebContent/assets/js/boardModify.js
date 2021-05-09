/**
 * 게시글 수정
 */

$(document).ready(function(){
	imageList();});


//이미지 목록 가져오기 

function imageList(){
	$.ajax({
		url :contextPath +"/board/BoardImageListOK.bo?boardNum="+boardNum,
		type:"get",
		dataType:"json",
		
		success : showImage
	});
}

	
	function showImage(boardImages){

		var i=0;		
					
		var img = "";

		for(let j = 0; j < 3; j++){
			if(boardImages[j] == null){
				i++;
	
				img += "<div id='img"+i+"' class='col-4 col-3-small photo'	style='text-align: center; margin-right: auto; margin-left: auto; width: 40%; visibility:hidden;'>"
				 +"<div class='poster image fit' style='padding-left: 0;'>"
					+"<img id='upImg"+i+"' class='img' alt='' src='' style='display: none; width: 100%; height: 100%;'>"
					+"<span id='span"+i+"' class='image fit'  style='padding-bottom: 30%;'> "
					+"<label for='file-input"+i+"'>"
					+"<img id='Img"+(i+1)+"' class='camera' src='"+contextPath+"/images/add.png' alt='영화 포스터' style='width: 50px; margin: 47% auto auto auto; cursor: pointer;' />"
					+"</label>"
					+"<input name='boardImage"+i+"' id='file-input"+i+"' type='file' accept='image/*' onchange='preview"+i+"(this)' style='display: none;' />"
					+"</span></div>"
					+"<a class='ddd' onclick='delete"+i+"()' style='cursor: pointer; display:none;'>삭제</a>"
					+"</div>";
			}	
			else{
					i++;
					img+="<div id='img"+i+"' class='col-4 col-3-small photo'	style='text-align: center; margin-right: auto; margin-left: auto; width: 40%;'>"
						+"<div class='poster image fit' style='padding-left: 0;'>"
						+"<img id='upImg"+i+"'class='img' alt='' src='"+contextPath+"/images/board/"+boardImages[j].imageName+"'style='display: block; width: 100%; height: 100%; object-fit:cover;'>"
						+"<span id='span"+i+"' class='image fit'  style='padding-bottom: 30%; display:none;'> "
						+"<label for='file-input"+i+"'>"
						+"<img id='Img"+(i+1)+"' class='camera' src='"+contextPath+"/images/add.png' alt='영화 포스터' style=' width: 50px; margin: 47% auto auto auto; cursor: pointer;' />"
						+"</label>"
						+"<input name='boardImage"+i+"' id='file-input"+i+"' type='file' accept='image/*' onchange='preview"+i+"(this)' style='display: none;' />"
						+"</span></div>"
						+"<a class='ddd' onclick='delete"+i+"()' style='cursor: pointer; display:none;'>삭제</a>"
						+"</div>";
					
			}
		
			photos.html(img);
		}	
		


	}//showImage end 

//---------------------------------------------------------------------
	
var flag = true;

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
	
	flag = true;
	upImg1.src = URL.createObjectURL(event.target.files[0]);
	upImg1.style.display = "block";
	upImg1.style.objectFit = "cover";
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
	
	upImg2.src = URL.createObjectURL(event.target.files[0]);
	upImg2.style.display = "block";
	upImg2.style.objectFit = "cover";
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
	
	upImg3.src = URL.createObjectURL(event.target.files[0]);
	upImg3.style.display = "block";
	upImg3.style.objectFit = "cover";
	span3.style.display = "none";
}

function delete1() {
	flag = false;
	upImg1.style.display = "none";
	upImg1.src = "";
	span1.style.display = "block";
	if(upImg2.style.display == "none" & upImg3.style.display == "none"){		
		img2.style.visibility = "hidden";
		img3.style.visibility = "hidden";
	}
	var agent = navigator.userAgent.toLowerCase();
	if ( (navigator.appName == 'Netscape' && navigator.userAgent.search('Trident') != -1) || (agent.indexOf("msie") != -1) ){
	    // ie 일때 input[type=file] init.
	    $("#file-input1").replaceWith( $("#file-input1").clone(true) );
	} else {
	    //other browser 일때 input[type=file] init.
	    $("#file-input1").val("");
	}
}
function delete2() {
	
	upImg2.style.display = "none";
	upImg2.src = "";
	span2.style.display = "block";
	if(upImg3.style.display == "none"){		
		img3.style.visibility = "hidden";
	}
	if(upImg1.style.display == "none"){
		img2.style.visibility = "hidden";
	}
	var agent = navigator.userAgent.toLowerCase();
	if ( (navigator.appName == 'Netscape' && navigator.userAgent.search('Trident') != -1) || (agent.indexOf("msie") != -1) ){
	    $("#file-input2").replaceWith( $("#file-input2").clone(true) );
	} else {
	    $("#file-input2").val("");
	}
}
function delete3() {
	
	upImg3.style.display = "none";
	upImg3.src = "";
	span3.style.display = "block";
	if(upImg2.style.display == "none"){		
		img3.style.visibility = "hidden";
	}
	var agent = navigator.userAgent.toLowerCase();
	if ( (navigator.appName == 'Netscape' && navigator.userAgent.search('Trident') != -1) || (agent.indexOf("msie") != -1) ){
	    // ie 일때 input[type=file] init.
	    $("#file-input3").replaceWith( $("#file-input3").clone(true) );
	} else {
	    //other browser 일때 input[type=file] init.
	    $("#file-input3").val("");
	}
}

$('textarea')
	.keyup(
		function() {
			var characterCount = $(this).val().length, current_count = $('#current_count'), maximum_count = $('#maximum_count'), count = $('#count');
			current_count.text(characterCount);
		});

function photo(){
	var text = "사진 수정 시 기존 사진들이 전부 삭제됩니다. 진행하시겠습니까?";
	if(confirm(text)){
		flag = false;
		$("input[name='photoChanged'").val("changed");
		delete1();
		delete2();
		delete3();
		$(".ddd").show();
	}
}

function submit(){
	if(!flag){
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