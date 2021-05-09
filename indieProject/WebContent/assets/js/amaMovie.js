/**
 * proMovie js파일
 */

$(document).ready(function(){});
loadData();
$('.posterTag').on('mouseover', function(){
	//event.stopPropagation();
	$(this).children('#detailText').css('display', 'block');
	$(this).children('#detailText').toggleClass("on");
})

$('.posterTag').on('mouseout', function(){
	$(this).children('#detailText').css('display', 'none');
	$(this).children('#detailText').toggleClass("on");
})

$('.moveBtn').on('mouseover', function(){
	$(this).toggleClass("btnMouseOver");
})
$('.moveBtn').on('mouseout', function(){
	$(this).toggleClass("btnMouseOver");
})

$('.detailText').on('click', function(){
	
});

if(window.matchMedia('(max-width: 736px)').matches){}


var swiper = new Swiper('.swiper-container', {
	spaceBetween : 10,
	loop : false,
	loopFillGroupWithBlank : true,
	allowTouchMove: true,
	pagination : {
		el : '.swiper-pagination',
		clickable : true,
	},
	navigation : {
		nextEl : '.swiper-button-next',
		prevEl : '.swiper-button-prev',
	},
	breakpoints : { // 반응형 설정이 가능 width값으로 조정
		737: {
			slidesPerView : 5,
			slidesPerGroup : 5
		},
		981: {
			slidesPerView : 6,
			slidesPerGroup : 6
		},
		1: {
			slidesPerView : 3,
			slidesPerGroup : 3
		}
	}
});

//poptrox
$(function() {
	$('#gallery').poptrox({
		usePopupCaption : true,
		usePopupNav : true,
		popupPadding : 0
	});
});

function loadData(){
	if(movieJson == ""){
		var nonText = "<div class='row'>"+
					"<div style='height:400px; margin:0 auto;'><p>현재 업로드된 영화가 없습니다.</p></div>"+
					"</div>";
		$("#content").append(nonText);
	}
	$.each(movieJson, function(index, genre){
		var text = "<div class='box alt'>"+
					"<div style='text-align: left;'>"+
						"<b style='font-size:2em;'>"+index+"</b>"+
					"</div>"+
					"<div class='row gtr-50 gtr-uniform'></div>"+
				"</div>"+
				"<div class='swiper-container' style='margin-bottom: 20px;'>"+
					"<div class='swiper-wrapper'>";
		$.each(genre, function(index, movie){
			text += "<div class='swiper-slide'>"+
							"<div class='col-poster'>"+
								"<div class='image fit posterTag' style='margin-bottom: 4px;'>"+
									"<img src='"+contextPath+"/images/amaMovie/"+movie.fileName+"' style='border-radius: 10px;' />"+
									"<div id='detailText'"+
										"style='padding: 5px; display: none; position: absolute; top: 0; left: 0; bottom: 0; right: 0; color: white; background-color: rgba(0, 0, 0, 0.69); border-radius: 10px;'>"+
										"<div style='height: 65%; text-overflow: ellipsis; line-height: initial; overflow: hidden; font-size: 0.8em; margin: 10px;'>"+
											movie.synopsis+
										"</div>"+
										"<a class='button primary small' href='"+contextPath+"/amaMovie/AmaMovieDetail.ama?amaNum="+movie.amaNum+"'"+ 
											"style='position: absolute; left: 16px; right: 16px; bottom: 16px; height: 38px; line-height: 38px; padding: 0 0;'>"+
											"상세보기 <img alt='' src='' title='영화제목'>"+
										"</a>"+
									"</div>"+
								"</div>"+
								"<span><strong style='font-size:0.8em;'>"+movie.amaTitleKor+"</strong></span>"+
							"</div>"+
						"</div>";
		})
		text += "</div>"+
					"<div class='swiper-button-prev leftBtn moveBtn'></div>"+
					"<div class='swiper-button-next rightBtn moveBtn'></div>"+
				"</div>";
		$("#content").append(text);
	});
}


//영화검색
function searchTitle(){
 var keyword=$("#searchMovie").val();

 if(keyword==""){
		alert("검색어를 입력해 주십시오.");
		return false;
 }else{
  	$.ajax({
  		url:contextPath+"/amaMovie/AmaMovieSearchListOk.ama",
  		type :"post",
  		data:{"keyword" : keyword},
  		dataType : 'json',
  		success: function(result){
  			 if(result != null && result.length != 0){
  				 $.each(result, function(index, genre){
  					 var text = "<div class='box alt'>"+
  					 "<div style='text-align: left;'>"+
  					 "<b style='font-size:2em;'>"+genre.genre+"</b>"+
  					 "</div>"+
  					 "<div class='row gtr-50 gtr-uniform'></div>"+
  					 "</div>"+
  					 "<div class='swiper-container'>"+
  					 "<div class='swiper-wrapper'>";

  					 $.each(result, function(index, movie){
  						text += "<div class='swiper-slide'>"+
						"<div class='col-poster'>"+
							"<div class='image fit posterTag' style='margin-bottom: 4px;'>"+
								"<img src='"+contextPath+"/images/amaMovie/"+movie.fileName+"' style='border-radius: 10px;' />"+
								"<div id='detailText'"+
									"style='padding: 5px; display: none; position: absolute; top: 0; left: 0; bottom: 0; right: 0; color: white; background-color: rgba(0, 0, 0, 0.69); border-radius: 10px;'>"+
									"<div style='height: 65%; text-overflow: ellipsis; line-height: initial; overflow: hidden; font-size: 0.8em; margin: 10px;'>"+
										movie.synopsis+
									"</div>"+
									"<a class='button primary small' href='"+contextPath+"/amaMovie/AmaMovieDetail.ama?amaNum="+movie.amaNum+"'"+ 
										"style='position: absolute; left: 16px; right: 16px; bottom: 16px; height: 38px; line-height: 38px; padding: 0 0;'>"+
										"상세보기 <img alt='' src='' title='영화제목'>"+
									"</a>"+
								"</div>"+
							"</div>"+
							"<span><strong style='font-size:0.8em;'>"+movie.amaTitleKor+"</strong></span>"+
						"</div>"+
					"</div>";
	})
  					 text += "</div>"+
  					 "<div class='swiper-button-prev leftBtn moveBtn'></div>"+
  					 "<div class='swiper-button-next rightBtn moveBtn'></div>"+
  					 "</div>";
  					 $("#content").html(text);
  					 
  					 
  				 });
  				var swiper = new Swiper('.swiper-container', {
  					spaceBetween : 10,
  					loop : false,
  					loopFillGroupWithBlank : true,
  					allowTouchMove: true,
  					pagination : {
  						el : '.swiper-pagination',
  						clickable : true,
  					},
  					navigation : {
  						nextEl : '.swiper-button-next',
  						prevEl : '.swiper-button-prev',
  					},
  					breakpoints : { // 반응형 설정이 가능 width값으로 조정
  						737: {
  							slidesPerView : 5,
  							slidesPerGroup : 5
  						},
  						981: {
  							slidesPerView : 6,
  							slidesPerGroup : 6
  						},
  						1: {
  							slidesPerView : 3,
  							slidesPerGroup : 3
  						}
  					}
  				});
  				
  				$('.posterTag').on('mouseover', function(){
  					//event.stopPropagation();
  					$(this).children('#detailText').css('display', 'block');
  					$(this).children('#detailText').toggleClass("on");
  				})

  				$('.posterTag').on('mouseout', function(){
  					$(this).children('#detailText').css('display', 'none');
  					$(this).children('#detailText').toggleClass("on");
  				})

  				$('.moveBtn').on('mouseover', function(){
  					$(this).toggleClass("btnMouseOver");
  				})
  				$('.moveBtn').on('mouseout', function(){
  					$(this).toggleClass("btnMouseOver");
  				})

  				$('.detailText').on('click', function(){
  					
  				});
  				
  				$(function() {
  					$('#gallery').poptrox({
  						usePopupCaption : true,
  						usePopupNav : true,
  						popupPadding : 0
  					});
  				});


  			}else {
  				var nonText = "<div class='row'>"+
  	  			"<div style='height:400px; margin:0 auto;'><p>검색 결과가 없습니다</p></div>"+
  	  			"</div>";
  	  			$("#content").html(nonText);
  			}
  			//success end
  		},
  		error:function(request, error) {
		console.log("fail");
		alert("error:"+error);
  		}
  	});//ajax end
 }//else end
	
}//function end