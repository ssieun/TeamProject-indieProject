/**
 * proMovie js파일
 */
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
      
      if(window.matchMedia('(max-width: 736px)').matches){}
      
      
   
      //poptrox
      $(function() {
         $('#gallery').poptrox({
            usePopupCaption : true,
            usePopupNav : true,
            popupPadding : 0
         });
      });
      
      // 지난 상영, 현재 상영, 상영 예정 버튼
      function past(){
         $("#pastBtn").attr('style','color: white !important; background:#4fc2cd; box-shadow:none;');
         $("#presBtn").attr('style', 'background-color:transparent; box-shadow:inset 0 0 0 2px rgb(144 144 144 / 25%); color:#616161 !important');
         $("#futureBtn").attr('style', 'background-color:transparent; box-shadow:inset 0 0 0 2px rgb(144 144 144 / 25%); color:#616161 !important');
      }
      
      function present(){
         $("#pastBtn").attr('style', 'background-color:transparent; box-shadow:inset 0 0 0 2px rgb(144 144 144 / 25%); color:#616161 !important');
         $("#presBtn").attr('style','color: white !important; background:#4fc2cd; box-shadow:none;');
         $("#futureBtn").attr('style', 'background-color:transparent; box-shadow:inset 0 0 0 2px rgb(144 144 144 / 25%); color:#616161 !important');
         window.location.href=contextPath + "/proMovie/ProMovie.pro";
      }
      
      function future(){
         $("#pastBtn").attr('style', 'background-color:transparent; box-shadow:inset 0 0 0 2px rgb(144 144 144 / 25%); color:#616161 !important');
         $("#presBtn").attr('style', 'background-color:transparent; box-shadow:inset 0 0 0 2px rgb(144 144 144 / 25%); color:#616161 !important');
         $("#futureBtn").attr('style','color: white !important; background:#4fc2cd; box-shadow:none;');
      }