$(function () {

	$.ga('UA-31551710-3'); 
	$('.ga-event').tracking('tfsXkakaoEvent['+channel+']');

	Kakao.init('39feb0dc6029c36ee8b6fb117a157061');

	// 인앱 팝업열기
	if (isInapp && isMobile) {
		openInapp();
	}


	//제품 등록 우편번호
	$('#openFindzip').on('click', function (e) {
		e.preventDefault();
		//if (isMobile.any()) {
		if (isMobile) {
			findzipShow();
			/*
			setTimeout(function () {
				var id = $(document).find('iframe').parent().attr('id');
				$('#' + id).css('margin', '0 auto');
			}, 500);
			*/
			var currentScroll = Math.max(document.body.scrollTop, document.documentElement.scrollTop);
			new daum.Postcode({
				oncomplete: function (data) {
					findzipHide();

					// 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

					// 각 주소의 노출 규칙에 따라 주소를 조합한다.
					// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
					var fullAddr = data.address; // 최종 주소 변수
					var extraAddr = ''; // 조합형 주소 변수

					// 기본 주소가 도로명 타입일때 조합한다.
					if(data.addressType === 'R'){
						//법정동명이 있을 경우 추가한다.
						if(data.bname !== ''){
							extraAddr += data.bname;
						}
						// 건물명이 있을 경우 추가한다.
						if(data.buildingName !== ''){
							extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
						}
						// 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
						fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
					}

					// 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
					// 우편번호와 주소 및 영문주소 정보를 해당 필드에 넣는다.
					var form = $('#frm');
					form.find('input[name=addressType]').val(data.addressType); //R(도로명), J(지번)
					form.find('input[name=zipcode]').val(data.zonecode);
					form.find('input[name=address]').val(fullAddr);
					form.find('input[name=address2]').focus();

					removePlaceholder();

					document.body.scrollTop = currentScroll;
				},
				width: '640',
				height: '3969'
			}).embed(document.getElementById('popZip'));
		} else {
			new daum.Postcode({
				oncomplete: function (data) {
					// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

					// 각 주소의 노출 규칙에 따라 주소를 조합한다.
					// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
					var fullAddr = ''; // 최종 주소 변수
					var extraAddr = ''; // 조합형 주소 변수

					// 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
					if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
						fullAddr = data.roadAddress;

					} else { // 사용자가 지번 주소를 선택했을 경우(J)
						fullAddr = data.jibunAddress;
					}

					// 사용자가 선택한 주소가 도로명 타입일때 조합한다.
					if(data.userSelectedType === 'R'){
						//법정동명이 있을 경우 추가한다.
						if(data.bname !== ''){
							extraAddr += data.bname;
						}
						// 건물명이 있을 경우 추가한다.
						if(data.buildingName !== ''){
							extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
						}
						// 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
						fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
					}

					var form = $('#frm');
					form.find('input[name=addressType]').val(data.userSelectedType); //R(도로명), J(지번)
					form.find('input[name=zipcode]').val(data.zonecode);
					form.find('input[name=address]').val(fullAddr);
					form.find('input[name=address2]').focus();

					removePlaceholder();
				}
			}).open();		            
		}
	});

	$.support.cors = true;
	$("form[name=frm]").validate({
		rules: {
		
		},
		messages: {
			
		},
		showErrors: function(errorMap, errorList) {
			for(var i in errorMap) {
				alert(errorMap[i]);
				break;
			}
		},
		onfocusout: false,
		onkeyup: false,
		onclick: false,
		submitHandler: function(form) {
			
			$.ajax({
				type : 'post',
				url : $('#frm').attr('action'),
				cache : false,
				data : $('#frm').serialize(),
				dataType: 'json',
				success: function(data) {
					alert(data.message);

					$('.loading').hide();
				},
				error : function(err){
					$('.loadin').hide();
				}
			});

		}
	});

	
});

function test(){
	$.ajax({
		type : 'post',
		url : $('#frm').attr('action'),
		cache : false,
		data : $('#frm').serialize(),
		dataType: 'json',
		success: function(data) {
			alert(data.message);

			$('.loading').hide();
		},
		error : function(err){
			$('.loadin').hide();
		}
	});
}

function test2(){
	$.ajax({
	  //url: 'http://frozen-woodland-5503.herokuapp.com/cors.json',
	  url: 'https://www.thefaceshop.com:343/m/event/20160226001/entry.jsp',
	  data: 'this is data being posted to the server',
	  type: 'POST',
	  dataType: 'json'
	}).done(function(data) {
		alert(data.message);
	});
}

function removePlaceholder(){
	$('.ph_address').css('background-position', '1000px 1000px');
}

// <!-- 우편번호 검색 -->
function findzipShow() {
	$('#pop_entry').hide();
	$('#popZip').show();
}
function findzipHide() {
	$('#popZip').hide();
	$('#pop_entry').show();
}

function goEntry(){

	if (eventEndDay){
		alert('이벤트가 종료되었습니다. 감사합니다.');
		return;
	}
	dataInit();
	openPop('pop_game')
}


function choiceComplete(){
	var product = $('input[name=product]').val();
	$(document).data('pid', product);
	if ( product == '') {
		alert('데려가고 싶은 심쿵템을 PICK 해주세요~');
		return;
	}	

	$('#snsProduct').html('<img src=\"' + cdnURL + '/images/pop/sns_prod' + product + '.jpg\" alt=\"제품 이미지\" >');

	closePop('pop_game');
	openPop('pop_entry');
}

// 데이터 초기화
function dataInit(){

	$('#frm').resetForm();

	//연락처 placeholder
	$('.ph_phone').placeholder({ 
		type: 'background', 
		background: cdnURL + '/images/pop/form/ph_phone.png'
	}); 
	$('.ph_phone').css('background-position', '20px 20px');
	//주소 placeholder
	$('.ph_address').placeholder({ 
		type: 'background', 
		background: cdnURL + '/images/pop/form/ph_address.png'
	}); 
	$('.ph_address').css('background-position', '20px 20px');
	$('.ph_address2').placeholder({ 
		type: 'background', 
		background: cdnURL + '/images/pop/form/ph_address2.png'
	}); 
	$('.ph_address2').css('background-position', '20px 20px');

	$('.agreeImg').attr('src', cdnURL + '/images/pop/form/chk_off.png');
	$('.chkBox').prop('checked',false);

	$(document).data("eventSeq", '');
	$('#product').val('');
	$('#snsProduct').html('');
	$(document).data('pid', '');

	$('.loading').hide();

	$('.prod_img img').attr("src", cdnURL + '/images/pop/game_represent.jpg');
	$('.slider ul li img').each(function () {
		this.src = this.src.replace('on.png', '.png');
	});
}

// 공유하기 ***********************************

// 공유하기 ***********************************


//공유 - 페이스북
function shareF() {
	if (channel == 'mobile'){

		var scrapURL = encodeURIComponent('http://www.thefaceshop.com/event/redirectEvent.jsp?utm_source=facebook&utm_medium=share&utm_campaign=tfsXkakao&eventId=20160315001&eventCode=161');
		var scrapLandingURL = encodeURIComponent('http://www.thefaceshop.com/m/event/20160315001/event.jsp?seq=' + $(document).data('eventSeq') + '&pid=' + $(document).data('pid'));
		var fbURL = "https://www.facebook.com/dialog/share?app_id=203116659844406&display=popup&href=" + scrapURL + "&redirect_uri=" + scrapLandingURL;
		window.open(fbURL);

	} else {
	
		var scrapURL = encodeURIComponent('http://www.thefaceshop.com/event/redirectEvent.jsp?utm_source=facebook&utm_medium=share&utm_campaign=tfsXkakao&eventId=20160315001&eventCode=161');
		var fbURL = "https://www.facebook.com/dialog/share?app_id=203116659844406&display=popup&href=" + scrapURL;
		window.open(fbURL, "pop", "width=600, height=700");

		/*
		$('.loading').show();
		//$('.sharingBtn').prop('disabled', true);
		var data = {};
		data.link = 'http://www.thefaceshop.com/event/redirectEvent.jsp?utm_source=facebook&utm_medium=share&utm_campaign=tfsXkakao&eventId=20160315001&eventCode=161';
		data.picture = 'http://www.thefaceshop.com/event/20160315001/images/facebook.jpg';
		data.name = '[주심/쿵/주/의/  나를 PICK UP 해줘]';
		data.description = '너 때문에 가슴이 두근두근 뛰잖아 ♥ 지금 당신의 심쿵템을 픽업하세요~ 픽미 픽미 픽미업! ';
		data.display = 'touch';
		
		facebookShare(data, function (userId, userName, scrapURL) {

			if (channel == 'mobile') {
				$('meta[name=viewport]').attr('content', 'width=640, user-scalable=no, target-densitydpi=device-dpi"');
			}


			$(document).data('snsId', userId);
			$(document).data('snsName', userName);
			$(document).data('snsType', 'facebook');
			$(document).data('scrapURL', scrapURL);
			
			shareEntry();
			alert('공유되었습니다.');
			$('.loading').hide();
		}, function () {
			$(document).data('snsType', 'facebook');
			$(document).data('scrapURL', '-');
			shareEntry();
			//$('.sharingBtn').prop('disabled', false);
			//alert("페이스북 인증 후 사용 가능합니다.");
			$('.loading').hide();

			if (channel == 'mobile') {
				$('meta[name=viewport]').attr('content', 'width=640, user-scalable=no, target-densitydpi=device-dpi"');
			}
		});
		*/

	}

	$(document).data('snsId', '');
	$(document).data('snsName', '');
	$(document).data('snsType', 'facebook');
	$(document).data('scrapURL', '-');
	
	shareEntry();
}



//공유 - 카카오톡
function shareKT() {
	var data = {};
    data.label = '헬로 베이비들~ \r\n심쿵할 준비되셨나요~?\r\n\r\n지금 당신의 심쿵템을 클릭하세요!\r\n픽미 픽미 픽미업!\r\n';
    data.btnText = 'PICK UP 하기';
    data.link = 'http://www.thefaceshop.com/event/redirectEvent.jsp?utm_source=kakaotalk&utm_medium=share&utm_campaign=tfsXkakao&eventId=20160315001&eventCode=161';
    data.image = 'http://www.thefaceshop.com/event/20160315001/images/kakaotalk.jpg';
    kakakotalkShare(data, function () {
		setTimeout(function() {
			$(document).data('snsType', 'kakaotalk');
			$(document).data('scrapURL', '-');
			shareEntry();
		}, 500);

    }, function () {
        alert('카카오톡 설치 가능한 모바일기기에서만 사용 가능합니다.');
    });

}

//공유 - 카카오스토리
function shareKS() {
	$('.loading').show();
	var data = {};
    data.url = 'http://www.thefaceshop.com/event/redirectEvent.jsp?utm_source=kakaostory&utm_medium=share&utm_campaign=tfsXkakao&eventId=20160315001&eventCode=161';
    data.content = '헬로 베이비들~ \r\n심쿵할 준비되셨나요~?\r\n\r\n지금 당신의 심쿵템을 클릭하세요!\r\n픽미 픽미 픽미업! \r\n\r\nhttp://goo.gl/c8KVDq';
    kakaostoryShareLink(data, function (userId, userName, scrapURL) {
		$(document).data('snsId', userId);
		$(document).data('snsName', userName);
		$(document).data('snsType', 'kakaostory');
		$(document).data('scrapURL', scrapURL);
		shareEntry();
		alert('공유되었습니다.');
		$('.loading').hide();
    }, function (error) {
        alert(error);
		$('.loading').hide();
    });
}

// 공유 저장
function shareEntry(){
	$.ajax({
		dataType: 'json',
		url: '/event/20160315001/share.jsp', 
		data: {
			eventSeq: $(document).data('eventSeq'),
			snsType: $(document).data('snsType'),
			snsId: $(document).data('snsId'),
			snsName: $(document).data('snsName'),
			scrapURL : $(document).data('scrapURL')
		},
		cache: false,
		async: false,
		success: function(data) {
			
		},
		error: function() {
			alert('오류가 발생했습니다. 관리자에게 문의해주세요.');
		}
	});
}

