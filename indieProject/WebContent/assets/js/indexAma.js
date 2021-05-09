/**
 * 
 */

$.ajax({
	url:contextPath+"/amaMovie/MainAmaMovieLoadOk.ama",
	type:"get",
	dataType:"text",
	success: function(result){
		var poster = JSON.parse(result);
		var slide = $("#amaMovieSlide");
		
		var str = "";
		for(let i = 0; i < poster.length; i++){
			
			str = "<article><a href='"+contextPath+"/images/amaMovie/"+poster[i].fileName+"' class='image'><img src='"+contextPath+"/images/amaMovie/"+poster[i].fileName+"' alt='' title='"+poster[i].amaTitleKor+"' /></a></article>";
			
			slide.append(str);
		}
		
		$(function() {
			$(slide).poptrox({
				baseZIndex: 100001,
				useBodyOverflow: false,
				usePopupEasyClose: false,
				overlayColor: '#000000',
				overlayOpacity: 0.75,
				usePopupDefaultStyling: false,
				popupLoaderText: '',
				usePopupNav: true,
				usePopupCaption: true
			});
		});

	},
	error:function(){//통신 오류 시
		console.log("오류");
	}
});
/*
$.ajax({
	url:contextPath+"/proMovie/MainProMovieLoadAction.pro",
	type:"get",
	dataType:"text",
	success: function(result){
		var poster = JSON.parse(result);
		var slide = document.getElementById("proMovieSlide");
		
		var str = "";
		for(let i = 0; i < poster.length; i++){
			
			str += "<article><a href='"+poster[i].img+"' class='image'><img src='"+poster[i].img+"' alt='' title='"+poster[i].title+"' /></a></article>";
			
		}
		$(function() {
			$(slide).poptrox({
				baseZIndex: 100001,
				useBodyOverflow: false,
				usePopupEasyClose: false,
				overlayColor: '#000000',
				overlayOpacity: 0.75,
				usePopupDefaultStyling: false,
				popupLoaderText: '',
				usePopupNav: true,
				usePopupCaption: true
			});
		});

		slide.innerHTML = str;
	},
	error:function(){//통신 오류 시
		console.log("오류");
	}
});
*/