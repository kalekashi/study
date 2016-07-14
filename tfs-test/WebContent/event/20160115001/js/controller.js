$(function () {

	Kakao.init('39feb0dc6029c36ee8b6fb117a157061');

	// 인앱 팝업열기
	if (inappFlag && isMobile) {
		openPop2('pop_browser');
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

	
	$("form[name=frm]").validate({
		rules: {
			name: "required",
			mobile: {
				required: true,
				digits: true,
				minlength: 10
			},
			zipcode:{
				required: true
			},
			address: {
				required: true
			},
			address2: {
				required: true
			},
			chkbox_agree1: "required",
			chkbox_agree2: "required"
		},
		messages: {
			name: "이름을 입력해주세요",
			mobile: {
				required: "연락처를 입력해주세요",
				digits: "연락처는 숫자만 입력 가능합니다",
				minlength: "연락처를 확인해주세요"
			},
			zipcode:{
				required: "우편번호를 입력해주세요"
			},
			address: {
				required: "주소를 입력해주세요"
			},
			address2: {
				required: "상세 주소를 입력해주세요"
			},
			chkbox_agree1: "개인정보 수집/이용에 대한 동의를 선택해주세요",
			chkbox_agree2: "개인정보의 취급 위탁 동의를 선택해주세요"
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
			var $chk = $("#chkbox_agree1");
			if($chk.is(":checked") == false) {
				alert("개인정보 수집/이용에 대한 동의를 선택해주세요");
				$chk.focus();
				return;
			}
			$chk = $("#chkbox_agree2");
			if($chk.is(":checked") == false) {
				alert("개인정보의 취급 위탁 동의를 선택해주세요");
				$chk.focus();
				return;
			}
			$('.loading').show();
			$('#frm').xSubmit({
				success: function(data) {
					alert(data.message);
					if (data.result){
						$('#frm').resetForm();
						closePop('pop_entry');

						setPlaceholder();
					} 
					$('.loading').hide();
				},
				error: function() {
					alert('일시적인 장애가 발생했습니다.');
					$('.loading').hide();
				},
				timeout: 3000
			});
			return false;

			/*
			$.ajax({
				url: actionURL,
				dataType: 'json',
				async: false,
				method: 'post',
				cache: false,
				data: {
					"mobile": $("input[name=mobile]").val()
				},
				beforeSend: function() {
					$(".loading").show();
				},
				complete: function() {
					$(".loading").hide();
				},
				success: function (data) {
					alert(data);
					if (data.result) {
						
						$('#frm').resetForm();
						closePop('pop_entry');

						setPlaceholder();
					} else {
						//
						alert(data.message);
					}
				},
				error: function () {
				}
			});
			

			
			$('#frm').ajaxSubmit({
				beforeSend: function() {
					$('.loading').show();
					$(window).data('isLoading', true);
				},
				complete: function() {
					$('.loading').hide();
					$(window).data('isLoading', false);
				},
				type: 'post',
				url: actionURL, 
				cache: false,
				async: false,
				dataType: 'json',
				success: function(data) {					
					alert(data.message);
					if (data.result) {
						$('#frm').resetForm();
						closePop('pop_entry');

						setPlaceholder();
					} 
				},
				error: function(jqXHR, textStatus, errorThrown) {
					console.log(jqXHR +":"+ textStatus +":"+ errorThrown);
					if (textStatus != 'abort'){
						alert('일시적인 장애가 발생했습니다. 잠시후 다시 시도해주세요. (' + textStatus + ')');
						$('.loading').hide();
					}
					return;
				}
			});	
			*/
		}
	});

	
});

function getProduct(){
	
	$('.loading').show();
	$(window).data('isLoading', true);
	
	$.ajax({
		dataType: 'json',
		url: '/event/20160115001/getProduct.jsp', 
		data: {
			num: new Date().getTime()
		},
		cache: false,
		async: false,
		success: function(data) {			
			if(data.result){
				$('#product').val(data.product);
				$('#productImg').attr('src', cdnURL + '/images/' + data.productImg + '.jpg');
				$('#productDetailImg').attr('src', cdnURL + '/images/' + data.productDetailImg + '.jpg');
				$('#productURL').attr('href', $('#productURL').attr('url-data') + data.productURL); 
				$('#productURLImg').attr('src', cdnURL + '/images/' + data.productURLImg + '.png');

				setTimeout(function(){
					$('.loading').hide();
					$(window).data('isLoading', false);
					closePop('pop_fortune');
					openPop('pop_result');
				}, 2000);
			} else {
				alert(data.message);
			}

		},
		error: function() {
			$('.loading').hide();
			$(window).data('isLoading', false);

			alert('페이스북 로그인 확인 중 오류가 발생하였습니다. 다시 시도하여 주십시오.');
		}
	});
	
	
}

function dataInit(){
	$('.agreeImg').attr("src", cdnURL + "/images/chk_off.png");
	$('.chkBox').prop("checked",false);
}

function removePlaceholder(){
	$('.ph_address').css('background-position', '1000px 1000px');
}

function goEntry(){
	dataInit();
	closePop('pop_result');
	openPop('pop_entry');
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

// 공유하기 ***********************************


//공유 - 페이스북
function shareF() {
	$('.loading').show();
	//$('.sharingBtn').prop('disabled', true);
    var data = {};
    data.link = 'http://www.thefaceshop.com/event/redirectEvent.jsp?utm_source=facebook&utm_medium=share&utm_campaign=happyNewFace&eventId=20160115001&eventCode=' + eventCode;
    data.picture = 'http://www.thefaceshop.com/event/20160115001/images/facebook.jpg';
    data.name = '2016년을 부탁해!';
    data.description = '여러분 ~! 2016년에도 더페이스샵 TOP3 크림과 함께 더 예뻐질 준비 되셨나요? 더욱 예뻐질 당신의 한 해를 확인해보세요 ♥';
    data.display = 'popup';
    
	if (isMobile) {
        data.display = 'touch';
    }
	
    facebookShare(data, function (userId, userName, scrapURL) {

		$('#facebook').val(scrapURL);

        if (isMobile) {
            $('meta[name=viewport]').attr('content', 'width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0'); 
        }
		alert('공유되었습니다.');
		$('.loading').hide();
    }, function () {
        //$('.sharingBtn').prop('disabled', false);
        alert("페이스북 인증 후 사용 가능합니다.");
		$('.loading').hide();

        if (isMobile) {
            $('meta[name=viewport]').attr('content', 'width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0');
        }
    });

}



//공유 - 카카오톡
function shareKT() {
	var data = {};
    data.label = '2016년을 부탁해!\r\n여러분 ~! 2016년에도 더페이스샵 TOP3 크림과 \r\n함께 예뻐질 준비 되셨나요?\r\n더욱 예뻐질 당신의 한 해를 확인해보세요 ♥\r\n';
    data.btnText = '2016년 운세 확인하기';
    data.link = 'http://www.thefaceshop.com/event/redirectEvent.jsp?utm_source=kakaotalk&utm_medium=share&utm_campaign=happyNewFace&eventId=20160115001&eventCode=' + eventCode;
    data.image = 'http://www.thefaceshop.com/event/20160115001/images/kakaotalk.jpg';
    kakakotalkShare(data, function () {
		setTimeout(function() {
			$('#kakaotalk').val('kakaotalk');
		}, 500);

    }, function () {
        alert('카카오톡 설치 가능한 모바일기기에서만 사용 가능합니다.');
    });

}

//공유 - 카카오스토리
function shareKS() {
	$('.loading').show();
	var data = {};
    data.url = 'http://www.thefaceshop.com/event/redirectEvent.jsp?utm_source=kakaostory&utm_medium=share&utm_campaign=happyNewFace&eventId=20160115001&eventCode=' + eventCode ;
    data.content = '2016년을 부탁해!\r\n\r\n여러분 ~! 2016년에도 더페이스샵 TOP3 크림과 \r\n함께 예뻐질 준비 되셨나요?\r\n더욱 예뻐질 당신의 한 해를 확인해보세요 ♥\r\n > http://goo.gl/LfNneB';
    kakaostoryShareLink(data, function (userId, userName, scrapURL) {
    	$('#kakaostory').val(scrapURL);
		alert('공유되었습니다.');
		$('.loading').hide();
    }, function (error) {
        alert(error);
		$('.loading').hide();
    });
}

