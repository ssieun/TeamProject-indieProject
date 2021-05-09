/**
 * 
 */

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

$(".datepicker").datepicker();

function search(){
	var date1 = document.getElementById("date1").value.toString();
	var date2 = document.getElementById("date2").value.toString();
	var newDate1 = new Date(date1);
	var newDate2 = new Date(date2);
	if(date1 == "" || date2 == ""){
		alert("기간이 올바르지 않습니다.");
		return false;
	}
	else if(newDate2.getTime() <= newDate1.getTime()){
		alert("기간이 올바르지 않습니다.");
		return false;
	}
	else{
		
		$.ajax({
			url: contextPath + "/member/MemberMyPopcornDateSearchAction.me",
		    type: "POST",
			data: {"date1" : date1,"date2" :date2},
			dataType: "text",
			success:function(result){
				var table = document.getElementById("table");	
				
				if(result.trim() != ""){
					var k = 1;
					if(table.rows.length > 1){
						while(table.rows.length > 1){
							table.deleteRow(-1);
						}
					}
					var cnt = 0;
					for(let i = 0; i < result.length; i++){
						var popCorn = result.trim().split(",");
						cnt++;
						if(cnt >= 6){
							return false;
						}
						var row = table.insertRow(i+1);
						
						var popCornEl;
						for (let j = 0; j < popCorn[i].length; j++) {
							popCornEl = popCorn[i].split("+");
							

							

						}
						  var cell1 = row.insertCell(0);
						  var cell2 = row.insertCell(1);
						  var cell3 = row.insertCell(2);
						  var cell4 = row.insertCell(3);
						  var cell5 = row.insertCell(4);
						  var cell6 = row.insertCell(5);
						  cell1.innerHTML = k;
						  cell2.innerHTML = popCornEl[0];
						  cell3.innerHTML = popCornEl[1];
						  cell4.innerHTML = popCornEl[2] * 1000;
						  cell5.innerHTML = popCornEl[3];
						  cell6.innerHTML = popCornEl[4];
						k++;
					}
				}else if(result.trim() == ""){
					if(table.rows.length > 1){
						while(table.rows.length > 1){
							table.deleteRow(-1);
						}
					}
					var row = table.insertRow(1);
					var cell1 = row.insertCell(0);
					  var cell2 = row.insertCell(1);
					  var cell3 = row.insertCell(2);
					  var cell4 = row.insertCell(3);
					  var cell5 = row.insertCell(4);
					  var cell6 = row.insertCell(5);
					  row.colspan = "6";
					 
					  
					  

				}//end else
			},
			error:function(data){
		    	  console.log(data);
		    	console.log("기간 조회 오류");
		    }
		});
	}
	
}

$("#check_module1").click(function () {
	var IMP = window.IMP; // 생략가능
	IMP.init('imp35108939');
	// 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
	// i'mport 관리자 페이지 -> 내정보 -> 가맹점식별코드
	IMP.request_pay({
		pg: 'inicis', // version 1.1.0부터 지원.
		/*
		'kakao':카카오페이,
		html5_inicis':이니시스(웹표준결제)
		'nice':나이스페이
		'jtnet':제이티넷
		'uplus':LG유플러스
		'danal':다날
		'payco':페이코
		'syrup':시럽페이
		'paypal':페이팔
		*/
		pay_method: 'card',
		/*
		'samsung':삼성페이,
		'card':신용카드,
		'trans':실시간계좌이체,
		'vbank':가상계좌,
		'phone':휴대폰소액결제
		*/
		merchant_uid: 'merchant_' + new Date().getTime(),
		/*
		merchant_uid에 경우
		https://docs.iamport.kr/implementation/payment
		위에 url에 따라가시면 넣을 수 있는 방법이 있습니다.
		참고하세요.
		나중에 포스팅 해볼게요.
		*/
		name: '주문명:팝콘결제',
		//결제창에서 보여질 이름
		amount: 100,
		//가격
		buyer_email: 'iamport@siot.do',
		buyer_name: '구매자이름',
		buyer_tel: '010-1234-5678',
		buyer_addr: '서울특별시 강남구 삼성동',
		buyer_postcode: '123-456',
		m_redirect_url: 'https://www.yourdomain.com/payments/complete'
	/*
	모바일 결제시,
	결제가 끝나고 랜딩되는 URL을 지정
	(카카오페이, 페이코, 다날의 경우는 필요없음. PC와 마찬가지로 callback함수로 결과가 떨어짐)
	*/
	}, function (rsp) {
			if (rsp.success) {
				var msg = '결제가 완료되었습니다.';
				alert(msg);
				$.ajax({
					url: contextPath + "/member/MemberMyPopcornChargeAction.me?popcorn="+100,
				    type: "get",
					dataType: "text",
					success:function(result){
						if(result.trim() == "success"){
							location.href = contextPath + "/member/memberMyPopcorn.me";
						}
						else{
							alert("팝콘 충전 오류");
						}
					},
					error:function(data){
				    	console.log("팝콘 충전 오류");
				    }
				});
			} else {
			var msg = rsp.error_msg;
		alert(msg);
	}
		
	});
});
$("#check_module2").click(function () {
	var IMP = window.IMP; // 생략가능
	IMP.init('imp35108939');
	// 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
	// i'mport 관리자 페이지 -> 내정보 -> 가맹점식별코드
	IMP.request_pay({
		pg: 'inicis', // version 1.1.0부터 지원.
		/*
		'kakao':카카오페이,
		html5_inicis':이니시스(웹표준결제)
		'nice':나이스페이
		'jtnet':제이티넷
		'uplus':LG유플러스
		'danal':다날
		'payco':페이코
		'syrup':시럽페이
		'paypal':페이팔
		*/
		pay_method: 'card',
		/*
		'samsung':삼성페이,
		'card':신용카드,
		'trans':실시간계좌이체,
		'vbank':가상계좌,
		'phone':휴대폰소액결제
		*/
		merchant_uid: 'merchant_' + new Date().getTime(),
		/*
		merchant_uid에 경우
		https://docs.iamport.kr/implementation/payment
		위에 url에 따라가시면 넣을 수 있는 방법이 있습니다.
		참고하세요.
		나중에 포스팅 해볼게요.
		*/
		name: '주문명:결제테스트',
		//결제창에서 보여질 이름
		amount: 5000,
		//가격
		buyer_email: 'iamport@siot.do',
		buyer_name: '구매자이름',
		buyer_tel: '010-1234-5678',
		buyer_addr: '서울특별시 강남구 삼성동',
		buyer_postcode: '123-456',
		m_redirect_url: 'https://www.yourdomain.com/payments/complete'
	/*
	모바일 결제시,
	결제가 끝나고 랜딩되는 URL을 지정
	(카카오페이, 페이코, 다날의 경우는 필요없음. PC와 마찬가지로 callback함수로 결과가 떨어짐)
	*/
	}, function (rsp) {
			if (rsp.success) {
			var msg = '결제가 완료되었습니다.';
			
			} else {
			var msg = '결제에 실패하였습니다.';
		msg += '에러내용 : ' + rsp.error_msg;
	}
		alert(msg);
	});
});
$("#check_module3").click(function () {
	var IMP = window.IMP; // 생략가능
	IMP.init('imp35108939');
	// 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
	// i'mport 관리자 페이지 -> 내정보 -> 가맹점식별코드
	IMP.request_pay({
		pg: 'inicis', // version 1.1.0부터 지원.
		/*
		'kakao':카카오페이,
		html5_inicis':이니시스(웹표준결제)
		'nice':나이스페이
		'jtnet':제이티넷
		'uplus':LG유플러스
		'danal':다날
		'payco':페이코
		'syrup':시럽페이
		'paypal':페이팔
		*/
		pay_method: 'card',
		/*
		'samsung':삼성페이,
		'card':신용카드,
		'trans':실시간계좌이체,
		'vbank':가상계좌,
		'phone':휴대폰소액결제
		*/
		merchant_uid: 'merchant_' + new Date().getTime(),
		/*
		merchant_uid에 경우
		https://docs.iamport.kr/implementation/payment
		위에 url에 따라가시면 넣을 수 있는 방법이 있습니다.
		참고하세요.
		나중에 포스팅 해볼게요.
		*/
		name: '주문명:결제테스트',
		//결제창에서 보여질 이름
		amount: 10000,
		//가격
		buyer_email: 'iamport@siot.do',
		buyer_name: '구매자이름',
		buyer_tel: '010-1234-5678',
		buyer_addr: '서울특별시 강남구 삼성동',
		buyer_postcode: '123-456',
		m_redirect_url: 'https://www.yourdomain.com/payments/complete'
	/*
	모바일 결제시,
	결제가 끝나고 랜딩되는 URL을 지정
	(카카오페이, 페이코, 다날의 경우는 필요없음. PC와 마찬가지로 callback함수로 결과가 떨어짐)
	*/
	}, function (rsp) {
			if (rsp.success) {
			var msg = '결제가 완료되었습니다.';
			
			} else {
			var msg = '결제에 실패하였습니다.';
		msg += '에러내용 : ' + rsp.error_msg;
	}
		alert(msg);
	});
});
$("#check_module4").click(function () {
	var IMP = window.IMP; // 생략가능
	IMP.init('imp35108939');
	// 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
	// i'mport 관리자 페이지 -> 내정보 -> 가맹점식별코드
	IMP.request_pay({
		pg: 'inicis', // version 1.1.0부터 지원.
		/*
		'kakao':카카오페이,
		html5_inicis':이니시스(웹표준결제)
		'nice':나이스페이
		'jtnet':제이티넷
		'uplus':LG유플러스
		'danal':다날
		'payco':페이코
		'syrup':시럽페이
		'paypal':페이팔
		*/
		pay_method: 'card',
		/*
		'samsung':삼성페이,
		'card':신용카드,
		'trans':실시간계좌이체,
		'vbank':가상계좌,
		'phone':휴대폰소액결제
		*/
		merchant_uid: 'merchant_' + new Date().getTime(),
		/*
		merchant_uid에 경우
		https://docs.iamport.kr/implementation/payment
		위에 url에 따라가시면 넣을 수 있는 방법이 있습니다.
		참고하세요.
		나중에 포스팅 해볼게요.
		*/
		name: '주문명:결제테스트',
		//결제창에서 보여질 이름
		amount: 50000,
		//가격
		buyer_email: 'iamport@siot.do',
		buyer_name: '구매자이름',
		buyer_tel: '010-1234-5678',
		buyer_addr: '서울특별시 강남구 삼성동',
		buyer_postcode: '123-456',
		m_redirect_url: 'https://www.yourdomain.com/payments/complete'
	/*
	모바일 결제시,
	결제가 끝나고 랜딩되는 URL을 지정
	(카카오페이, 페이코, 다날의 경우는 필요없음. PC와 마찬가지로 callback함수로 결과가 떨어짐)
	*/
	}, function (rsp) {
			if (rsp.success) {
			var msg = '결제가 완료되었습니다.';
			
			} else {
			var msg = '결제에 실패하였습니다.';
		msg += '에러내용 : ' + rsp.error_msg;
	}
		alert(msg);
	});
});

function goExchange(){
	//계좌등록확인
	$.ajax({
		url: contextPath+"/member/MemberCheckAccountOk.me",
		type:"get",
		dataType:"text",
		success:function(result){
			if(result.trim() == "ok"){
				exchange();
			}else{
				accountRegister();
			}					
		},
		error : function(){
			console.log("에러");
		}
	});
}
function accountRegister(){
	var _width = 380;
	var _height = 500;
	
	var _left = Math.ceil(( window.screen.width - _width )/2);
    var _top = Math.ceil(( window.screen.height - _height )/2);
    
	var accountRegisterFrame = window.open(contextPath+"/member/accountRegister.me", 
			"popup","width=380px, height=500px, left="+_left+", top="+_top+", resizable=no, scrollbars=no");
	
	accountRegisterFrame.onbeforeunload = function(){
		window.location.reload();
	}
}

function exchange(){
	var checkAccount = false;
	var memberId=sessionStorage.getItem('session_id'); 
	var changePopcorn=$("input[name='change_popcorn']").val();
	//ajax로 받은 팝콘갯수 가져오기 
	//그래서 환전 할려는 갯수랑 비교하기

	if(changePopcorn==""){
		alert("환전할 팝콘 개수를 적어주세요.");
		return false;
	}
	if(!Number.isInteger(Number(changePopcorn))){
		alert("숫자만 입력해주세요.");
		return false;
	}
	if(myReceivedPopcornNum < changePopcorn){
		alert("내가 받은 팝콘개수보다 많은 양을 환전할 수 없습니다.");
		return false;
	}
	if(changePopcorn<100){
		alert("팝콘은 100개 이상부터 환전이 가능합니다.");
		return false;
	}
	
	
	$.ajax({
		url: contextPath+"/member/MemberExchangePopcornOk.me",
		type:"post",
		data:{"changePopcorn":changePopcorn, "memberId":memberId},
		dataType:"text",
		success:function(result){
			if(result.trim() == "ok"){
				alert("환전신청이 완료되었습니다.");
				window.location.reload();
			}else{
				alert("환전신청에 실패했습니다. 잠시 후 다시 신청해주세요.");
				window.location.reload();
			}
		},
		error : function(){
			console.log("에러");
		}
	});
	
}