/**
 * 
 */


function step1(){
	$('#step1').show();
	$('#s1').css("color", "#4fc2cd");
	$('#step2').hide();
	$('#s2').css('color', '#616161');
	$('#step3').hide();
	$('#s3').css('color', '#616161');
}

function step2(){
	$('#step1').hide();
	$('#s1').css("color", "#616161");
	$('#step2').show();
	$('#s2').css('color', '#4fc2cd');
	$('#step3').hide();
	$('#s3').css('color', '#616161');
	
}

function step3(){
	$('#step1').hide();
	$('#s1').css("color", "#616161");
	$('#step2').hide();
	$('#s2').css('color', '#616161');
	$('#step3').show();
	$('#s3').css('color', '#4fc2cd');	
}
				
$.datepicker.setDefaults({
    dateFormat: 'yy.mm.dd',
    prevText: '이전 달',
    nextText: '다음 달',
    monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
    monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
    dayNames: ['일', '월', '화', '수', '목', '금', '토'],
    dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
    dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
    showMonthAfterYear: true,
    yearSuffix: ' 년 ',
   	changeYear: true,
   	changeMonth: true
});

$("#datepicker").datepicker();

$(document).ready(function(){
	  //Show contextmenu:
  $("#poster").on("mouseover", function(e){
    //Get window size:
    var winWidth = $(document).width();
    var winHeight = $(document).height();
    //Get pointer position:
    var posX = e.pageX;
    var posY = e.pageY;
    //Get contextmenu size:
    var menuWidth = $("#posterHelp").width();
    var menuHeight = $("#posterHelp").height();
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
    $("#posterHelp").css({
      "left": posLeft,
      "top": posTop
    }).show();
    //Prevent browser default contextmenu.
    return false;
  });
  //Hide contextmenu:
  $("#poster").on("mouseout", function(){
    $("#posterHelp").hide();
  });
});


function posterAddOk(obj){
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
	
	$(obj).parent().children(".posterImgView").attr("src", URL.createObjectURL(event.target.files[0]));
	$(obj).parent().children(".posterImgView").css("objectFit", "contain");
	$(obj).parent().children(".posterImgView").css("display", "block");
	$(obj).parent().children(".posterImgSpan").css("display", "none");
	
	posterCnt++;
	
	var poster = "<div class='col-2 col-3-small poster' style='padding-left:0;'>"
		+"<img class='img posterImgView' style='display:none; width:100%; height:100%;'>"
		+"<span class='image fit posterImgSpan' style='padding-bottom:30%;'>"
		+"<label for='posterImg"+posterCnt+"'>"
		+"<img class='camera' src='"+contextPath+"/images/add.png' alt='영화 포스터' style='width:50px; margin:47% auto auto auto; cursor:pointer;'/>"
		+"</label></span>"
		+"<input id='posterImg"+posterCnt+"' name='posterImg"+posterCnt+"' type='file' onchange='posterAddOk(this)' style='display:none;'></div>";
	
	$(obj).parent().parent().append(poster);
};

function stillCutAddOk(obj){
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
	
	$(obj).parent().children(".stillCutImgView").attr("src", URL.createObjectURL(event.target.files[0]));
	$(obj).parent().children(".stillCutImgView").css("objectFit", "contain");
	$(obj).parent().children(".stillCutImgView").css("display", "block");
	$(obj).parent().children(".stillCutImgSpan").css("display", "none");
	
	stillCutCnt++;
	
	var stillCut = "<div class='col-2 col-3-small poster' style='padding-left:0;'>"
		+"<img class='img stillCutImgView' style='display:none; width:100%; height:100%;'>"
		+"<span class='image fit stillCutImgSpan' style='padding-bottom:30%;'>"
		+"<label for='stillCutImg"+stillCutCnt+"'>"
		+"<img class='camera' src='"+contextPath+"/images/add.png' alt='영화 포스터' style='width:50px; margin:47% auto auto auto; cursor:pointer;'/>"
		+"</label></span>"
		+"<input id='stillCutImg"+stillCutCnt+"' name='stillCutImg"+stillCutCnt+"' type='file' onchange='stillCutAddOk(this)' style='display:none;'></div>";
	
	$(obj).parent().parent().append(stillCut);
};



$(document).on("click", "#addMaker", function(){
	
	var newMaker="<div class='row maker'><div class='col-custom col-2-medium col-12-small' style='margin-left: auto;'></div>"+
				"<div style='padding-bottom:0;' class='col-2 col-3-medium col-5-small duty'><input type='text' name='makerPosition' id='' value='' /></div>"+
				"<div style='padding-bottom:0;' class='col-2 col-3-medium col-5-small makerName'><input type='text' name='makerName' id='' value='' /></div>"+
				"<div class='col-1 col-2-small' style='margin-right: auto; padding:0;'><a class='button alt small' id='deleteMaker' style='width:100%'>삭제</a></div></div>";
	
	$(this).parent().parent().parent().append(newMaker);
});

$(document).on("click", "#deleteMaker", function(){
	$(this).parent().parent().remove();
});

$(document).on("click", "#addActor", function(){
	
	var newActor="<div class='row actor'><div class='col-custom col-2-medium col-12-small' style='margin-left: auto;'></div>"+
				"<div style='padding-bottom:0;' class='col-2 col-3-medium col-5-small duty'><input type='text' name='actorCast' id='' value='' /></div>"+
				"<div style='padding-bottom:0;' class='col-2 col-3-medium col-5-small makerName'><input type='text' name='actorName' id='' value='' /></div>"+
				"<div class='col-1 col-2-small' style='margin-right: auto; padding:0;'><a class='button alt small' id='deleteActor' style='width:100%'>삭제</a></div></div>";
	
	$(this).parent().parent().parent().append(newActor);
});

$(document).on("click", "#deleteActor", function(){
	$(this).parent().parent().remove();
});

function writeFormSubmit(){
	//포스터 하나 이상 확인
	/*
	if($("input[name='posterImgMain']").val() == ""){
		alert("포스터는 하나 이상 등록되어야 합니다.");
		return false;
	}
	*/
	//영화제목 입력 확인
	if($("input[name='amaTitleKor']").val().trim() == ""){
		alert("영화제목(한글)을 입력해주세요.");
		return false;
	}
	if($("input[name='amaTitleEng']").val().trim() == ""){
		alert("영화제목(영문)을 입력해주세요.");
		return false;
	}
	//날짜 입력 확인
	if($("input[name='amaMakeDate']").val() == ""){
		alert("제작년도를 입력해주세요.");
		return false;
	}
	//영상 길이 확인
	if(($("input[name='amaMovieLength']").val() == "") || $("input[name='amaMovieLength']").val().match(/:/g).length != 1){
		alert("영상 길이를 xx:xx 형식으로 입력해주세요.");
		return false;
	}
	//감독 이름 확인
	if($("input[name='amaDirector']").val() == ""){
		alert("감독 이름을 입력해주세요.");
		return false;
	}
	//장르 입력 확인
	if($("select[name='genre']").val() == "none"){
		alert("영화 장르를 선택해주세요.");
		return false;
	}
	//영상물 등급 확인
	if($("select[name='rating']").val() == "none"){
		alert("영상물 등급을 선택해주세요.");
		return false;
	}
	//유튜브 링크 확인
	if(($("input[name='link']").val() == "") || !$("input[name='link']").val().includes("https://youtu.be/")){
		alert("유튜브 링크는 'https://youtu.be/'로 시작하는 형식으로 작성해주세요.");
		return false;
	}
	//시놉시스 입력 확인
	if($("textarea[name='synopsis']").val().trim() == ""){
		alert("시놉시스를 입력해주세요.");
		return false;
	}
	//연출의도 입력 확인
	if($("textarea[name='theme']").val().trim() == ""){
		alert("연출의도를 입력해주세요.");
		return false;
	}
	
	//제작진 한명이상 확인
	if(($("input[name='makerPosition']").val().trim() == "") || ($("input[name='makerName']").val().trim() == "")){
		alert("제작진은 한명 이상 입력해주세요.");
		return false;
	}
	//제작진 비어있는 내용 있는지 확인
	var makerPositionLength = $("input[name='makerPosition']").length;
	for(let i=0; i<makerPositionLength; i++){
		if(($("input[name='makerPosition']").eq(i).val().trim() == "") || ($("input[name='makerName']").eq(i).val().trim() == "")){
			alert("제작진에 비어있는 항목이 있습니다.")
			return false;
		} 
	}
	//출연진 한명 이상 확인
	if(($("input[name='actorCast']").val().trim() == "") || ($("input[name='actorName']").val().trim() == "")){
		alert("출연진은 한명 이상 입력해주세요.");
		return false;
	}
	//출연진 비어있는 내용 있는지 확인
	var actorCastLength = $("input[name='actorCast']").length;
	for(let i=0; i<actorCastLength; i++){
		if(($("input[name='actorCast']").eq(i).val().trim() == "") || ($("input[name='actorName']").eq(i).val().trim() == "")){
			alert("출연진에 비어있는 항목이 있습니다.")
			return false;
		} 
	}

	document.movieWriteForm.submit();
	
}
