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
		$(document).ready(function() {
		    $(window).trigger('resize');
		});
	},
	error:function(){//통신 오류 시
		console.log("오류");
	}
});