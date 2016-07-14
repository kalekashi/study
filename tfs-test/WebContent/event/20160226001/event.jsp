<%@ page contentType="text/html; charset=UTF-8" errorPage="/m/mall/error/error.jsp"%>
<%@ page import="java.util.*,
			com.efusioni.stone.utils.*,
			com.efusioni.stone.common.*,
			com.efusioni.stone.exception.*,
			com.thefaceshop.front.service.event.*,
			com.thefaceshop.front.common.*" %>
<%
	out.clear();

	String cdnURL = "http://image.ethefaceshop.com/tfsshopWebSrc/event/20160226001";
	String rootURL = "http://image.ethefaceshop.com/tfsshopWebSrc/event";
	String actionURL = "https://" + request.getServerName() + ":343/m/event/20160226001/entry.jsp";
	if (request.getServerName().equals("dev.thefaceshop.com")) {
		cdnURL = "/event/20160226001";
		rootURL = "/event";
		actionURL = "/m/event/20160226001/entry.jsp";
	} else {
		response.setHeader("Access-Control-Allow-Origin", "https://www.thefaceshop.com:343/");		
	}

	// 이벤트 종료처리
	String today = Utils.getTimeStampString("yyyyMMdd");
	String endday = "20160307";

	boolean eventEndDay = false;
	if (today.compareTo(endday) > 0){
		eventEndDay = true;
	}



	// 디바이스 확인
	String userAgent=request.getHeader("User-Agent").toLowerCase();

	boolean isMobile = (userAgent.matches(".*(android|avantgo|blackberry|blazer|compal|elaine|fennec|hiptop|iemobile|ip(hone|od)|iris|kindle|lge |maemo|midp|mmp|opera m(ob|in)i|palm( os)?|phone|p(ixi|re)\\/|plucker|pocket|psp|symbian|treo|up\\.(browser|link)|vodafone|wap|windows (ce|phone)|xda|xiino).*")||userAgent.substring(0,4).matches("1207|6310|6590|3gso|4thp|50[1-6]i|770s|802s|a wa|abac|ac(er|oo|s\\-)|ai(ko|rn)|al(av|ca|co)|amoi|an(ex|ny|yw)|aptu|ar(ch|go)|as(te|us)|attw|au(di|\\-m|r |s )|avan|be(ck|ll|nq)|bi(lb|rd)|bl(ac|az)|br(e|v)w|bumb|bw\\-(n|u)|c55\\/|capi|ccwa|cdm\\-|cell|chtm|cldc|cmd\\-|co(mp|nd)|craw|da(it|ll|ng)|dbte|dc\\-s|devi|dica|dmob|do(c|p)o|ds(12|\\-d)|el(49|ai)|em(l2|ul)|er(ic|k0)|esl8|ez([4-7]0|os|wa|ze)|fetc|fly(\\-|_)|g1 u|g560|gene|gf\\-5|g\\-mo|go(\\.w|od)|gr(ad|un)|haie|hcit|hd\\-(m|p|t)|hei\\-|hi(pt|ta)|hp( i|ip)|hs\\-c|ht(c(\\-| |_|a|g|p|s|t)|tp)|hu(aw|tc)|i\\-(20|go|ma)|i230|iac( |\\-|\\/)|ibro|idea|ig01|ikom|im1k|inno|ipaq|iris|ja(t|v)a|jbro|jemu|jigs|kddi|keji|kgt( |\\/)|klon|kpt |kwc\\-|kyo(c|k)|le(no|xi)|lg( g|\\/(k|l|u)|50|54|e\\-|e\\/|\\-[a-w])|libw|lynx|m1\\-w|m3ga|m50\\/|ma(te|ui|xo)|mc(01|21|ca)|m\\-cr|me(di|rc|ri)|mi(o8|oa|ts)|mmef|mo(01|02|bi|de|do|t(\\-| |o|v)|zz)|mt(50|p1|v )|mwbp|mywa|n10[0-2]|n20[2-3]|n30(0|2)|n50(0|2|5)|n7(0(0|1)|10)|ne((c|m)\\-|on|tf|wf|wg|wt)|nok(6|i)|nzph|o2im|op(ti|wv)|oran|owg1|p800|pan(a|d|t)|pdxg|pg(13|\\-([1-8]|c))|phil|pire|pl(ay|uc)|pn\\-2|po(ck|rt|se)|prox|psio|pt\\-g|qa\\-a|qc(07|12|21|32|60|\\-[2-7]|i\\-)|qtek|r380|r600|raks|rim9|ro(ve|zo)|s55\\/|sa(ge|ma|mm|ms|ny|va)|sc(01|h\\-|oo|p\\-)|sdk\\/|se(c(\\-|0|1)|47|mc|nd|ri)|sgh\\-|shar|sie(\\-|m)|sk\\-0|sl(45|id)|sm(al|ar|b3|it|t5)|so(ft|ny)|sp(01|h\\-|v\\-|v )|sy(01|mb)|t2(18|50)|t6(00|10|18)|ta(gt|lk)|tcl\\-|tdg\\-|tel(i|m)|tim\\-|t\\-mo|to(pl|sh)|ts(70|m\\-|m3|m5)|tx\\-9|up(\\.b|g1|si)|utst|v400|v750|veri|vi(rg|te)|vk(40|5[0-3]|\\-v)|vm40|voda|vulc|vx(52|53|60|61|70|80|81|83|85|98)|w3c(\\-| )|webc|whit|wi(g |nc|nw)|wmlb|wonu|x700|xda(\\-|2|g)|yas\\-|your|zeto|zte\\-"));

	
	//ios 관련 브라우저 확인 'iPhone|iPad|iPod
	boolean isNoticeBrowser = false;
	String mobileDeviceFlag = "";
	userAgent = userAgent.toUpperCase();
	if (userAgent.indexOf("IPHONE")> 0 || userAgent.indexOf("IPOD")> 0 || userAgent.indexOf("IPAD")> 0) {
		mobileDeviceFlag = "ios";
	} else if (userAgent.indexOf("ANDROID")> 0) {
		mobileDeviceFlag = "android";
	}	

%><!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<meta property="og:url" content="http://www.thefaceshop.com/event/redirectEvent.jsp?utm_source=kakaostory&utm_medium=share&utm_campaign=inkJelStick&eventId=20160226001&eventCode=134" />
<meta property="og:title" content="예뻐지는 뷰티 모의고사" />
<meta property="og:description" content="아는 만큼 예뻐지는 뷰티 모의고사 응시생 모집중! 무려 3,000명에게 부드럽게 슬~라이딩되는 잉크 젤스틱 증정! 지금 잉크 젤스틱으로 입술에 봄을 불러보아요~ Chu♥" />
<meta property="og:image" content="http://www.thefaceshop.com/event/20160226001/images/kakaostory.jpg" />  
<title>더페이스샵</title>
<script type="text/javascript" src="<%=rootURL%>/js/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="<%=rootURL%>/js/jquery.shy4blue.placeholder.js"></script>
<script type="text/javascript" src="<%=rootURL%>/js/jquery.form.js"></script>
<script type="text/javascript" src="<%=rootURL%>/js/jquery.validate.min.js"></script>
<script type="text/javascript" src="/m/event/20160226001/js/store.js"></script>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script type="text/javascript">
var channel = 'web';
var cdnURL = '<%=cdnURL%>';
var isMobile = <%=isMobile%>;
var isInapp = false;
var eventEndDay = <%=eventEndDay%>;
var mobileDeviceFlag = '<%=mobileDeviceFlag%>';
</script>
<script type="text/javascript" src="/event/js/commonSNS.js"></script>
<script type="text/javascript" src="/event/js/jquery.jjung.googleAnalytics.js"></script>
<script type="text/javascript" src="/m/event/20160226001/js/controller.js"></script>
<script type="text/javascript">
// 레이어팝업 열기
function openPop(param) {
  var wrapH = $('#wrap').height();
  $('#png_bg').css('height', wrapH);
  $('#png_bg').show();
  $('#' + param).show();
  parent.$('html, body').animate({ scrollTop: 0 });
}

// 레이어팝업 닫기
function closePop(param){
	$('#png_bg').hide();
	$('#'+param).hide();
}

// 개인정보 수집방침 팝업
function pop_privacy(flag) {
	//logAction('개인정보 수집방침');
	window.open('policy' + flag + '.jsp', 'pop_privacy' + flag, 'width=660, height=720, location=yes, scrollbars=no');
}


$(document).ready(function(){
 //체크박스제어
	var $chkArea = $('.js-chk-area'); // 체크박스 영역
	
	/* 체크박스 클릭시 이미지 변경 */
	 $chkArea.each(function(){
		$(this).on('click',function(){
			var agree_id = $(this).attr("id");
			var chkbox_id = "chkbox_"+agree_id;

			if($('#'+chkbox_id).prop("checked") == true){
//        alert("Checkbox is checked.");
				$("#chk_"+agree_id).attr("src","<%=cdnURL%>/images/pop/form/chk_off.png");
				$('#'+chkbox_id).prop("checked",false);
			}
			else if($('#'+chkbox_id).prop("checked") == false){
//        alert("Checkbox is unchecked.");
				$("#chk_"+agree_id).attr("src","<%=cdnURL%>/images/pop/form/chk_on.png");
				$('#'+chkbox_id).prop("checked",true);
			}
		});
	 });

	var $rdArea = $('.js-rd-area input'); // 라디오버튼 영역
	$rdArea.each(function () {
		$(this).on('click', function () {
			var answer = $(this).parent().attr('data-value');
			var questionNum = answer.substring(0,1);

			$('.quest' + questionNum).attr("src", "<%=cdnURL%>/images/pop/rd_off.png");
			$('.inputRadio').prop("checked", false);

			$('#rd_select' + answer).attr("src", "<%=cdnURL%>/images/pop/rd_on.png");
			$('#select' + answer).prop("checked", true);

			$(document).data('answer_' + questionNum, $(this).val());
		});
	});

});

$(document).ready(function(){
//	체크박스초기화
	$('.js-chkbox').prop("checked",false);
});

$(function () {
	//연락처 placeholder
	$('.ph_phone').placeholder({ 
		type: 'background', 
		background: '<%=cdnURL%>/images/pop/form/ph_phone.png'
	}); 
	$('.ph_phone').css('background-position', '10px 20px');
});

</script>
<!-- End Analytics -->
<style type="text/css">
html{width:100%; height:100%;}
body{width:100%; height:100%; margin:0; padding:0; font-size:12px; color:#666; font-family:'맑은 고딕','Malgun Gothic','Gothic','sans-serif';}
img{border:0; line-height:0; vertical-align:top; margin:0; padding:0;}
ul{margin:0; padding:0; list-style:none;}
ul li{margin:0; padding:0;}
h1{margin:0; padding:0; width:0; height:0; line-height:0; font-size:0;}
h2{margin:0; padding:0; line-height:0; font-size:0;}
h3,h4{margin:0; padding:0;}
dl,dt,dd{margin:0; padding:0;}
form{padding:0;margin:0;}
p{padding:0;margin:0;}
.skip{display:none; line-height:0; width:0; height:0; font-size:0;}
a:link{font-size:11px; color:#898989; text-decoration:none; line-height:13px;}
a:active{font-size:11px; color:#898989; text-decoration:none; line-height:13px;}
a:visited{font-size:11px; color:#898989; text-decoration:none; line-height:13px;}
a:hover{font-size:11px; color:#898989; text-decoration:none; line-height:13px;}
caption{display:none;}

.on{display:block;}
.hidetext{position:absolute; left:-9999em;}

#wrap{width:900px;height:auto;position:relative; margin:0 auto;}
.event_wrap{width:900px;}
.event_wrap .event_top{position:relative; width:900px; height:731px; background:#fff url('<%=cdnURL%>/images/bg_event_top.jpg') top center no-repeat; text-align:center;}
.event_wrap .event_top .logo{position:absolute; top:15px; right:20px; z-index:5;}
.event_wrap .event_top .flag{padding:92px 16px 8px 0px;}
.event_wrap .event_top h2{width:473px; margin:0 auto; padding:0 0 0 8px;}
.event_wrap .event_top .btn{width:373px; margin:0 auto; padding:34px 18px 0 0px;}

.event_wrap .info_cont{width:900px; height:742px; background:#fff url('<%=cdnURL%>/images/bg_info_cont.jpg') top center no-repeat;}
.event_wrap .info_cont h3{width:549px; margin:0 auto; padding:66px 0 29px 0;}

.event_wrap .info_cont ul.step{width:760px; margin:0 auto; overflow:hidden;}
.event_wrap .info_cont ul.step li{float:left;}

.event_wrap .info_cont ul.info{width:420px; margin:42px 0 0 410px; overflow:hidden;}
.event_wrap .info_cont ul.info li{float:left; width:420px; margin-bottom:13px;}
.event_wrap .info_cont ul.info li dl{overflow:hidden;}
.event_wrap .info_cont ul.info li dl dt{float:left; width:127px; vertical-align:top;}
.event_wrap .info_cont ul.info li dl dd{float:left; vertical-align:top;}
.event_wrap .info_cont ul.info li dl dd{}


.event_wrap .prod_cont{width:900px; height:1026px; background:#fff url('<%=cdnURL%>/images/bg_prod_cont.jpg') top center no-repeat;}
.event_wrap .prod_cont h3{width:694px; margin:0 auto; padding:56px 0 0 29px;}
.event_wrap .prod_cont ul{width:900px; overflow:hidden;}
.event_wrap .prod_cont ul li.prod_usage{float:left; padding:47px 0 0 57px;}
.event_wrap .prod_cont ul li.prod_explain{float:left; padding:297px 0 0 224px;}
.event_wrap .prod_cont .prod_color{width:814px; margin:0 auto; padding-top:33px;}

.event_wrap .event_bottom{width:900px; height:336px; background:#ffdee9;}
.event_wrap .event_bottom ul{width:800px; margin:0 auto; padding-top:55px; overflow:hidden;}
.event_wrap .event_bottom ul li{float:left;}
.event_wrap .event_bottom ul li dl{padding-left:20px; overflow:hidden;}
.event_wrap .event_bottom ul li dl dt{margin:0 0 11px 7px;}
.event_wrap .event_bottom ul li dl dd{margin-bottom:31px;}

/* 팝업:딤드처리*/
#png_bg{position:absolute; top:0; left:0; width:100%; height:100%; filter:alpha(opacity=70); opacity:0.70; background-color:#000; z-index:98;}

/* 팝업:퀴즈 */
#pop_quiz{position:absolute; top:50px; left:50%; margin-left:-320px; width:640px; height:2593px; z-index:99; background:#fdf7f9 url('<%=cdnURL%>/images/pop/bg_pop_quiz.jpg') top center no-repeat;}
#pop_quiz .btn_close{position:absolute; top:20px; right:20px; z-index:999;}
#pop_quiz .pop_header{width:640px; margin:0 auto; }
#pop_quiz .pop_header .tl{width:503px; margin:0 auto; padding:71px 0 78px 0;}
#pop_quiz .pop_header .txt{width:393px; margin:0 auto;}
#pop_quiz .pop_cont{width:640px; position:relative; overflow:hidden;}
#pop_quiz .pop_cont .product_img{width:640px; margin:0 auto;}
#pop_quiz .pop_cont .product_img .img{width:640px; margin:0 auto;}
#pop_quiz .pop_cont .product_img .btn{position:absolute; top:323px; right:70px;}

#pop_quiz .pop_cont ul{width:540px; margin:0 auto; overflow:hidden;}
#pop_quiz .pop_cont ul li{float:left;}
#pop_quiz .pop_cont ul li .tl{}
#pop_quiz .pop_cont ul li .quiz-select{position:relative; width:530px; padding-left:10px; overflow:hidden;}
#pop_quiz .pop_cont ul li .quiz-select .select-area{float:left; margin:30px 0 0 0;}
#pop_quiz .pop_cont ul li .quiz-select .select-area .js-rd-area{cursor:pointer;}
#pop_quiz .pop_cont ul li .quiz-select .select-area .js-rd-area label.js-agree {display:block; cursor:pointer;}
#pop_quiz .pop_cont ul li .quiz-select .select-area .js-rd-area label.js-agree img.rdbox{padding-right:19px;}
#pop_quiz .pop_cont ul li .quiz-select .select-area .js-rd-area label.js-agree span img{padding-top:8px;}
#pop_quiz .pop_cont ul li .quiz-select .select-area .js-rd-area input{position:absolute; top:68px; left:0; width:0; height:0; border:0; visibility:hidden; margin:0; padding:0;}

#pop_quiz .pop_cont ul li.quiz2 .tl{margin-top:49px;}
#pop_quiz .pop_cont ul li.quiz3 .tl{margin-top:58px;}

#pop_quiz .pop_footer{width:640px; padding-top:145px;}
#pop_quiz .pop_footer .btn{width:347px; margin:0 auto;}



/* 팝업:개인정보입력 */
#pop_entry{position:absolute; top:50px; left:50%; margin-left:-320px; width:640px; height:1475px; z-index:99; background:#fbf5f7 url('<%=cdnURL%>/images/pop/bg_pop.jpg') top center no-repeat;}
#pop_entry .btn_close{position:absolute; top:21px; right:21px; z-index:999;}
#pop_entry .pop_header{width:640px; height:274px; margin:0 auto; }
#pop_entry .pop_header .tl{width:370px; margin:0 auto; padding:40px 0 38px 0;}
#pop_entry .pop_header .txt{width:541px; margin:0 auto;}
#pop_entry .pop_cont{width:640px; margin:0 auto; padding:70px 0 51px 0;}
#pop_entry .pop_cont .form_box{width:540px; margin:0 auto;}
#pop_entry .pop_cont .form_box dl{width:540px; margin:0 auto; margin-bottom:24px; overflow:hidden;}
#pop_entry .pop_cont .form_box dl dt{float:left; width:106px;}
#pop_entry .pop_cont .form_box dl dt img{padding-top:21px; vertical-align:middle;}
#pop_entry .pop_cont .form_box dl dd{float:left; width:432px;}
#pop_entry .pop_cont .form_box dl dd input{font-weight:bold; border:1px solid #f3d5df; background:#fff; color:#939393; font-family:'맑은 고딕','Malgun Gothic','Gothic','sans-serif';
-webkit-border-radius: 10px;
-moz-border-radius: 10px;
-ms-border-radius: 10px;
-o-border-radius: 10px;
border-radius: 10px;
}
#pop_entry .pop_cont .form_box dl dd select{width:430px; height:66px; padding:14px 10px; line-height:62px; font-size:26px; font-weight:bold; border:1px solid #f3d5df; background:#fff; color:#939393;; margin-bottom:10px; font-family:'맑은 고딕','Malgun Gothic','Gothic','sans-serif';
-webkit-border-radius: 10px;
-moz-border-radius: 10px;
-ms-border-radius: 10px;
-o-border-radius: 10px;
border-radius: 10px;
}
#pop_entry .pop_cont .form_box dl.input_name dd input{width:410px; height:64px; padding:0 10px; line-height:62px; font-size:26px; vertical-align:middle;}
#pop_entry .pop_cont .form_box dl.input_phone dd input{width:410px; height:64px; padding:0 10px; line-height:62px; font-size:26px; vertical-align:middle;}
#pop_entry .pop_cont .form_box dl.input_post{margin-bottom:10px;}
#pop_entry .pop_cont .form_box dl.input_post dd input{width:260px; height:64px; margin:0 14px 0 0; padding:0 10px; line-height:62px ; font-size:26px; vertical-align:middle;}
#pop_entry .pop_cont .form_box dl.input_post dd img{cursor:pointer;}

#pop_entry .pop_cont .form_box dl.input_shop{margin-bottom:0;}
#pop_entry .pop_cont .form_box dl.input_shop dd select#region{margin:0 15px 10px 0; width:275px;}
#pop_entry .pop_cont .form_box dl.input_shop dd a.btn_search{cursor:pointer;}
#pop_entry .pop_cont .form_box dl.input_shop dd.search_shop{margin-left:106px;}

#pop_entry .pop_cont .agree_policy{position:relative; width:540px; margin:0 auto;}
#pop_entry .pop_cont .agree_policy .agree-area{width:540px; overflow:hidden; padding:35px 0 0 0;}
#pop_entry .pop_cont .agree_policy .agree-area .js-chk-area{float:left; width:377px; height:56px; cursor:pointer;}
#pop_entry .pop_cont .agree_policy .agree-area .js-chk-area input.chkBox {position: absolute; top:22px; left:12px; }
#pop_entry .pop_cont .agree_policy .agree-area .js-chk-area label.js-agree {cursor:pointer; display:block; padding-top:10px;}
#pop_entry .pop_cont .agree_policy .agree-area .js-chk-area span img{padding:8px 0 0 16px;}
#pop_entry .pop_cont .agree_policy .agree-area .js-chk-area input{width:0; height:0; border:0; visibility:hidden;}
#pop_entry .pop_cont .agree_policy .agree-first{padding:72px 0 0 0;}
#pop_entry .pop_cont .agree_policy .agree-area .btn-area{float:right; display:inline;}
#pop_entry .pop_cont .btn{position:relative; text-align:center; margin-top:90px;}
#pop_entry .pop_cont .btn .loading{position:absolute; top:0; left:156px; width:327px; height:87px; text-align:center; filter:alpha(opacity=60); opacity:0.60; background-color:#000; overflow:hidden;}
#pop_entry .pop_cont .btn .loading img{padding-top:19px;}

#pop_entry .pop_footer{width:640px;}



/* 팝업:sns공유 */
#pop_sns{position:absolute; top:50px; left:50%; margin-left:-320px; width:640px; height:1368px; z-index:99; background:#fbf5f7 url('<%=cdnURL%>/images/pop/bg_pop.jpg') top center no-repeat;}
#pop_sns .btn_close{position:absolute; top:20px; right:20px; z-index:999;}
#pop_sns .pop_header{width:640px; height:291px; margin:0 auto; }
#pop_sns .pop_header{width:640px; height:274px; margin:0 auto; }
#pop_sns .pop_header .tl{width:370px; margin:0 auto; padding:40px 0 38px 0;}
#pop_sns .pop_header .txt{width:138px; margin:0 auto;}
#pop_sns .pop_cont{width:640px;}
#pop_sns .pop_cont .txt{width:439px; margin:0 auto;}
#pop_sns .pop_footer {position:relative; width:640px;}
#pop_sns .pop_footer ul{width:256px; margin:0 auto; overflow:hidden; padding:39px 0 49px 0;}
#pop_sns .pop_footer ul li{width:112px; float:left; margin:0 8px;}
#pop_sns .pop_footer .loading{position:absolute; top:39px; left:192px; width:256px; height:115px; text-align:center; filter:alpha(opacity=60); opacity:0.60; background-color:#000; overflow:hidden;}
#pop_sns .pop_footer .loading img{padding-top:32px;}
#pop_sns .pop_footer .btn{width:327px; margin:0 auto;}

</style>
</head>
<body>
<div id="fb-root"></div>
<script>
window.fbAsyncInit = function () {
	FB.init({
		appId: '203116659844406',
		status: true, // check login status
		cookie: true, // enable cookies to allow the server to access the session
		xfbml: false  // parse XFBML
	});

	//팝업방지..
	FB.getLoginStatus(function (response) { });

};
(function (d, debug) {
	var js, id = 'facebook-jssdk', ref = d.getElementsByTagName('script')[0];
	if (d.getElementById(id)) { return; }
	js = d.createElement('script'); js.id = id; js.async = true;
	js.src = "//connect.facebook.net/ko_KR/all" + (debug ? "/debug" : "") + ".js";
	ref.parentNode.insertBefore(js, ref);
}(document, /*debug*/false));
</script>
<div id="wrap">
	<div style="position:absolute; top:0; left:0; z-index:999;display:none;">
		<input type="button" value="퀴즈" onclick="openPop('pop_quiz');">
		<input type="button" value="개인정보 입력" onclick="openPop('pop_entry');">
		<input type="button" value="sns공유" onclick="openPop('pop_sns');">
	</div>

	<div class="event_wrap">

		<div class="event_top">
			<div class="logo"><a href="http://www.thefaceshop.com/" target="_blank"><img src="<%=cdnURL%>/images/tfs_logo.png" alt="THE FACE SHOP"></a></div>
			<div class="flag"><img src="<%=cdnURL%>/images/flag_event_top.png" alt="뷰티응시생 3,000명 모집!"></div>
			<h2><img src="<%=cdnURL%>/images/tl_event_top.png" alt="예뻐지는 뷰티 모의고사"></h2>
			<div class="btn"><a href="javascript:goEvent()" class="ga-event" data-action="뷰티모의고사 응시하기"><img src="<%=cdnURL%>/images/btn_enter.png" alt="뷰티 모의고사 응시하기"></a></div>
		</div><!-- event_top -->


		<div class="info_cont">
			<h3><img src="<%=cdnURL%>/images/tl_info_cont.png" alt="아는 만큼 예뻐진다! 뷰티 모의고사 응시 안내"></h3>
			<ul class="step">
				<li><img src="<%=cdnURL%>/images/step1.png" alt="step1 응시하기 버튼 클릭 후 모의고사 문제풀기"></li>
				<li><img src="<%=cdnURL%>/images/step2.png" alt="step2 답안지 제출 후 개인정보 및 제품 수령매장 선택"></li>
				<li><img src="<%=cdnURL%>/images/step3.png" alt="step3 합격자는 입력한 연락처로 모바일 쿠폰 받기"></li>
				<li><img src="<%=cdnURL%>/images/step4.png" alt="step4 선택한 매장 방문 후 잉크젤스틱 12종 중 택1(컬러 랜덤)"></li>
			</ul>
			<ul class="info">
				<li>
					<dl>
						<dt><img src="<%=cdnURL%>/images/tl_info_list1.png" alt="답안지 제출기간"></dt>
						<dd><img src="<%=cdnURL%>/images/txt_info_list1.png" alt="2016. 02. 26 ~ 03. 06"></dd>
					</dl>
				</li>
				<li>
					<dl>
						<dt><img src="<%=cdnURL%>/images/tl_info_list2.png" alt="합격자 발표"></dt>
						<dd><img src="<%=cdnURL%>/images/txt_info_list2.png" alt="2016. 03. 11 (당첨자 개별 문자 발송)"></dd>
					</dl>
				</li>
				<li>
					<dl>
						<dt><img src="<%=cdnURL%>/images/tl_info_list3.png" alt="합격 선물"></dt>
						<dd><img src="<%=cdnURL%>/images/txt_info_list3.png" alt="잉크 젤스틱 12종 중 택 1"></dd>

					</dl>
				</li>
				<li>
					<dl>
						<dt><img src="<%=cdnURL%>/images/tl_info_list4.png" alt="매장 수령기간"></dt>
						<dd><img src="<%=cdnURL%>/images/txt_info_list4.png" alt="2016. 03. 08 ~ 03. 14"></dd>
					</dl>
				</li>
				<li>
					<dl>
						<dt><img src="<%=cdnURL%>/images/tl_info_list5.png" alt="합격 인원"></dt>
						<dd><img src="<%=cdnURL%>/images/txt_info_list5.png" alt="3,000명"></dd>
					</dl>
				</li>
			</ul>
		</div>
		<!-- //info_cont -->


		<div class="prod_cont">
			<h3><img src="<%=cdnURL%>/images/tl_prod_cont.png" alt="한번의 슬라이딩 터치로 선명하게 각인되는 더페이스샵 NEW 잉크 젤스틱"></h3>
			<ul>
				<li class="prod_usage"><img src="<%=cdnURL%>/images/img_prod_usage.png" alt="제품 사용"></li>
				<li class="prod_explain"><img src="<%=cdnURL%>/images/img_prod_explain.png" alt="제품 효과"></li>
			</ul>
			<div class="prod_color"><img src="<%=cdnURL%>/images/img_prod_color.png" alt="색상표"></div>
		</div>


		<div class="event_bottom">
			<ul>
				<li class="event_notice1">
					<dl>
						<dt><img src="<%=cdnURL%>/images/tit_event_bottom1.png" alt="이벤트 유의사항"></dt>
						<dd><img src="<%=cdnURL%>/images/txt_event_bottom1.png" alt="이벤트 유의사항 내용"></dd>
					</dl>
				</li>
				<li class="event_notice2">
					<dl>
						<dt><img src="<%=cdnURL%>/images/tit_event_bottom2.png" alt="제품 수령 유의사항"></dt>
						<dd><img src="<%=cdnURL%>/images/txt_event_bottom2.png" alt="제품 수령 유의사항 내용"></dd>
					</dl>
				</li>
			</ul>
		</div>
	</div><!-- event_wrap -->



	<!-- 팝업:딤드처리 -->
	<div id="png_bg" style="display:none;"></div>


	<!-- 팝업:퀴즈 -->
	<div id="pop_quiz" style="display:none;">
		<div class="btn_close"><a href="javascript:closePop('pop_quiz');"><img src="<%=cdnURL%>/images/pop/btn_close.png" alt="닫기"></a></div>
		<div class="pop_header">
			<div class="tl"><img src="<%=cdnURL%>/images/pop/tl_pop_quiz.png" alt="예뻐지는 뷰티 모의고사 "></div>
			<div class="txt"><img src="<%=cdnURL%>/images/pop/txt_pop_quiz.png" alt="아래 문제를 읽고 정답에 체크하세요."></div>
		</div>
		<div class="pop_cont">
			<div class="product_img">
				<div class="img"><img src="<%=cdnURL%>/images/pop/pop_img_gelstick.png" alt="잉크젤스틱 이미지"></div>
				<div class="btn"><a href="http://www.thefaceshop.com/mall/product/product-view.jsp?dpid=AF004272" target="_blank" class="ga-event" data-action="힌트보기"><img src="<%=cdnURL%>/images/pop/btn_hint.png" alt="힌트보기"></a></div>
			</div>
			<ul class="quiz_area">
				<li class="quiz1">
					<div class="tl"><img src="<%=cdnURL%>/images/pop/tl_quiz1.png" alt="Q1 수지는 오늘 오랜만에 친구들을 만났는데 입술이 너무 예뻐 보인다며 무엇을 했냐고 물었다. 수지는 무엇을 했을까?"></div>
					<!-- radio button -->
					<div class="quiz-select">
						<div class="select-area rdbox">
							<div class="js-rd-area" id="sel1_1" data-value="1_1">
								<input class="js-radio inputRadio" id="select1_1" type="radio" name="quiz1" value="1">
								<label class="js-agree" for="select1_1"><img src="<%=cdnURL%>/images/pop/rd_off.png" alt="" class="chkImg rdbox quest1" id="rd_select1_1" ><span><img src="<%=cdnURL%>/images/pop/rd_select1_1.png" alt="매트한 립스틱을 발라서 입술 각질이 부각되었다. "></span></label>
							</div>
						</div>
						<div class="select-area rdbox">
							<div class="js-rd-area" id="sel1_2" data-value="1_2">
								<input class="js-radio inputRadio" id="select1_2" type="radio" name="quiz1" value="2">
								<label class="js-agree" for="select1_2"><img src="<%=cdnURL%>/images/pop/rd_off.png" alt="" class="chkImg rdbox quest1" id="rd_select1_2" ><span><img src="<%=cdnURL%>/images/pop/rd_select1_2.png" alt="건조한 립스틱을 사용해서 요플레 현상이 생겼다.  "></span></label>
							</div>
						</div>
						<div class="select-area rdbox">
							<div class="js-rd-area" id="sel1_3" data-value="1_3">
								<input class="js-radio inputRadio" id="select1_3" type="radio" name="quiz1" value="3">
								<label class="js-agree" for="select1_3"><img src="<%=cdnURL%>/images/pop/rd_off.png" alt="" class="chkImg rdbox quest1" id="rd_select1_3" ><span><img src="<%=cdnURL%>/images/pop/rd_select1_3.png" alt="부드럽게 밀착되는 잉크 젤스틱으로 매끈한 입술을 완성했다. "></span></label>
							</div>
						</div>
					</div>
					<!-- // radio button -->
				</li>
				<!-- //quiz1 -->

				<li class="quiz2">
					<div class="tl"><img src="<%=cdnURL%>/images/pop/tl_quiz2.png" alt="Q2 썸남과 치킨을 먹으러 온 수지! 예뻐보이고 싶은 수지는 립스틱이 지워질까 걱정인데... 이때 수지의 해결책은?"></div>
					<!-- radio button -->
					<div class="quiz-select">
						<div class="select-area rdbox">
							<div class="js-rd-area" id="sel2_1" data-value="2_1">
								<input class="js-radio inputRadio" id="select2_1" type="radio" name="quiz2" value="1">
								<label class="js-agree" for="select2_1"><img src="<%=cdnURL%>/images/pop/rd_off.png" alt="" class="chkImg rdbox quest2" id="rd_select2_1" ><span><img src="<%=cdnURL%>/images/pop/rd_select2_1.png" alt="뛰어난 컬러 지속력을 가진 잉크 젤스틱을 바른다. "></span></label>
							</div>
						</div>
						<div class="select-area rdbox">
							<div class="js-rd-area" id="sel2_2" data-value="2_2">
								<input class="js-radio inputRadio" id="select2_2" type="radio" name="quiz2" value="2">
								<label class="js-agree" for="select2_2"><img src="<%=cdnURL%>/images/pop/rd_off.png" alt="" class="chkImg rdbox quest2" id="rd_select2_2" ><span><img src="<%=cdnURL%>/images/pop/rd_select2_2.png" alt="치킨을 눈앞에 두고 먹지 않는다."></span></label>
							</div>
						</div>
						<div class="select-area rdbox">
							<div class="js-rd-area" id="sel2_3" data-value="2_3">
								<input class="js-radio inputRadio" id="select2_3" type="radio" name="quiz2" value="3">
								<label class="js-agree" for="select2_3"><img src="<%=cdnURL%>/images/pop/rd_off.png" alt="" class="chkImg rdbox quest2" id="rd_select2_3" ><span><img src="<%=cdnURL%>/images/pop/rd_select2_3.png" alt="립스틱을 수시로 여러 번 덧바른다."></span></label>
							</div>
						</div>
					</div>
					<!-- // radio button -->
				</li>
				<!-- //quiz2 -->

				<li class="quiz3">
					<div class="tl"><img src="<%=cdnURL%>/images/pop/tl_quiz3.png" alt="Q3 주말에 더페이스샵 매장에서 잉크 젤스틱을 구매한 수지. 우측 이미지처럼 립스틱 표면이 단면화 되어있는 이유는? "></div>
					<!-- radio button -->
					<div class="quiz-select">
						<div class="select-area rdbox">
							<div class="js-rd-area" id="sel3_1" data-value="3_1">
								<input class="js-radio inputRadio" id="select3_1" type="radio" name="quiz3" value="1">
								<label class="js-agree" for="select3_1"><img src="<%=cdnURL%>/images/pop/rd_off.png" alt="" class="chkImg rdbox quest3" id="rd_select3_1" ><span><img src="<%=cdnURL%>/images/pop/rd_select3_1.png" alt="각질을 부각시키기 위해 일부러 커팅하였다."></span></label>
							</div>
						</div>
						<div class="select-area rdbox">
							<div class="js-rd-area" id="sel3_2" data-value="3_2">
								<input class="js-radio inputRadio" id="select3_2" type="radio" name="quiz3" value="2">
								<label class="js-agree" for="select3_2"><img src="<%=cdnURL%>/images/pop/rd_off.png" alt="" class="chkImg rdbox quest3" id="rd_select3_2" ><span><img src="<%=cdnURL%>/images/pop/rd_select3_2.png" alt="발림성을 뻑뻑하게 만들기 위해 커팅하였다"></span></label>
							</div>
						</div>
						<div class="select-area rdbox">
							<div class="js-rd-area" id="sel3_3" data-value="3_3">
								<input class="js-radio inputRadio" id="select3_3" type="radio" name="quiz3" value="3">
								<label class="js-agree" for="select3_3"><img src="<%=cdnURL%>/images/pop/rd_off.png" alt="" class="chkImg rdbox quest3" id="rd_select3_3" ><span><img src="<%=cdnURL%>/images/pop/rd_select3_3.png" alt="부드러운 사용감을 극대화 하기 위해 핸드 커팅하였다."></span></label>
							</div>
						</div>
					</div>
					<!-- // radio button -->
				</li>
				<!-- //quiz3 -->
			</ul>
		</div>
		<!-- //pop_cont -->

		<div class="pop_footer">
			<div class="btn"><a href="javascript:;" id="answerSubmit" class="ga-event" data-action="답안지 제출하기"><img src="<%=cdnURL%>/images/pop/btn_submit.png" alt="답안지 제출하기"></a></div>
		</div>
	</div>
	<!-- //팝업:퀴즈 -->



	<!-- 팝업:개인정보입력 -->
	<div id="pop_entry" style="display:none;">
		<div class="btn_close"><a href="javascript:closePop('pop_entry');"><img src="<%=cdnURL%>/images/pop/btn_close2.png" alt="닫기"></a></div>
		<div class="pop_header">
			<div class="tl"><img src="<%=cdnURL%>/images/pop/tl_pop.png" alt="예뻐지는 뷰티모의고사"></div>
			<div class="txt"><img src="<%=cdnURL%>/images/pop/txt_pop_entry.png" alt="합격 시 제품을 수령할 매장을 선택하세요."></div>
		</div>
		<div class="pop_cont">
			<form name="frm" id="frm" method="post" action="<%=actionURL%>" class="ga-event" data-action="응시완료">
				<input type="hidden" name="channel" value="web"/>
				<input type="hidden" name="storeCode" id="storeCode" value=""/>
				<div class="form_box">
					<dl class="input_name">
						<dt><img src="<%=cdnURL%>/images/pop/form/input_name.png" alt="이름"></dt>
						<dd><input type="text" name="name" id="name" maxlength="5" class="ph_name"></dd>
					</dl>
					<dl class="input_phone">
						<dt><img src="<%=cdnURL%>/images/pop/form/input_phone.png" alt="연락처"></dt>
						<dd><input type="tel" name="mobile" id="mobile" class="ph_phone" maxlength="11"></dd>
					</dl>
					<dl class="input_shop">
						<dt><img src="<%=cdnURL%>/images/pop/form/input_shop.png" alt="수령매장" /></dt>
						<dd>
							<select id="region" name="region">
								<option value="" selected>지역</option>
								<option value="강원" >강원</option>
								<option value="경기" >경기</option>
								<option value="경남" >경남</option>
								<option value="경북" >경북</option>
								<option value="광주" >광주</option>
								<option value="대구" >대구</option>
								<option value="대전" >대전</option>
								<option value="부산" >부산</option>
								<option value="서울" >서울</option>
								<option value="세종" >세종</option>
								<option value="울산" >울산</option>
								<option value="인천" >인천</option>
								<option value="전남" >전남</option>
								<option value="전북" >전북</option>
								<option value="제주" >제주</option>
								<option value="충남" >충남</option>
								<option value="충북" >충북</option>
							</select>
							<a class="btn_search" href="http://www.thefaceshop.com/brand/store/list.jsp" target="_blank"><img src="<%=cdnURL%>/images/pop/form/btn_search.png" alt="매장정보" /></a>
						</dd>
						<dd class="search_shop">
							<select id="city" name="city" class="select_shop">
								<option value="" selected>시/ 군/ 구</option>
							</select>
							<select id="store" name="store" class="select_shop">
								<option value="" selected>매장을 선택하세요.</option>
							</select>
						</dd>
					</dl>
				</div>
				<div class="agree_policy">
					<div class="agree-area agree-first">
						<div class="js-chk-area chk-area" id="agree1">
							<input class="js-chkbox chkBox" id="chkbox_agree1" type="checkbox" name="chkbox_agree1"  value="Y">
							<label class="js-agree" for="chkbox_agree1"><img src="<%=cdnURL%>/images/pop/form/chk_off.png" alt=" " id="chk_agree1" class="agreeImg"><span><img src="<%=cdnURL%>/images/pop/form/policy_txt01.png" alt="개인정보 수집 이용에 대한 동의"></span></label>
						</div>
						<div class="btn-area"><a href="javascript:pop_privacy('1')"><img src="<%=cdnURL%>/images/pop/form/btn_policy.png" alt="자세히 보기"></a></div>
					</div>
					<div class="agree-area ">
						<div class="js-chk-area chk-area" id="agree2">
							<input class="js-chkbox chkBox" id="chkbox_agree2" type="checkbox" name="chkbox_agree2"  value="Y">
							<label class="js-agree" for="chkbox_agree2"><img src="<%=cdnURL%>/images/pop/form/chk_off.png" alt=" " id="chk_agree2" class="agreeImg"><span><img src="<%=cdnURL%>/images/pop/form/policy_txt02.png" alt="개인정보 취급 위탁 동의"></span></label>
						</div>
						<div class="btn-area"><a href="javascript:pop_privacy('2')"><img src="<%=cdnURL%>/images/pop/form/btn_policy.png" alt="자세히 보기"></a></div>
					</div>
					<div class="agree-area ">
						<div class="js-chk-area chk-area" id="agree3">
							<input class="js-chkbox chkBox" id="chkbox_agree3" type="checkbox" name="chkbox_agree3"  value="Y">
							<label class="js-agree" for="chkbox_agree3"><img src="<%=cdnURL%>/images/pop/form/chk_off.png" alt=" " id="chk_agree3" class="agreeImg"><span><img src="<%=cdnURL%>/images/pop/form/policy_txt03.png" alt="광고성 정보 전송 동의"></span></label>
						</div>
						<div class="btn-area"><a href="javascript:pop_privacy('3')"><img src="<%=cdnURL%>/images/pop/form/btn_policy.png" alt="자세히 보기"></a></div>
					</div>
				</div>
				<div class="btn">
					<input type="image" src="<%=cdnURL%>/images/pop/form/btn_entry.png" name="" alt="응시완료">
					<div class="loading" style="display:none;"><img src="<%=cdnURL%>/images/pop/loading.gif" alt="loading"></div>
				</div>
			</form>
		</div>
		<div class="pop_footer">
			<div class="notice"><img src="<%=cdnURL%>/images/pop/notice_pop_entry.png" alt="입력하신 개인정보는 경품 배송 및 수령을 위한 용도로만 사용됩니다./ 응모 시 입력한 정보 및 주소지는 변경 불가합니다. / 배송정보 불일치로 인한 오배송은 책임지지 않습니다."></a></div>
		</div>
	</div>
	<!-- //팝업:개인정보입력 -->



	<!-- 팝업:sns공유 -->
	<div id="pop_sns" style="display:none;">
		<div class="btn_close"><a href="javascript:closePop('pop_sns');"><img src="<%=cdnURL%>/images/pop/btn_close2.png" alt="닫기"></a></div>
		<div class="pop_header">
			<div class="tl"><img src="<%=cdnURL%>/images/pop/tl_pop.png" alt="예뻐지는 뷰티모의고사"></div>
			<div class="txt"><img src="<%=cdnURL%>/images/pop/txt_pop_sns.png" alt="응시 완료"></div>
		</div>
		<div class="pop_cont">
			<div><img src="<%=cdnURL%>/images/pop/pop_img_gelstick2.png" alt="잉크젤스틱 이미지"></div>
			<div class="txt"><img src="<%=cdnURL%>/images/pop/txt_pass_notice.png" alt="합격자 발표는 3월 11일이며, 합격하신 분들께는 참여하신 휴대폰번호로 모바일쿠폰이 발송됩니다."></div>
			
		</div> 
		<div class="pop_footer">
			<ul>
				<li><a href="javascript:shareKS();"  class="ga-event" data-action="카카오스토리"><img src="<%=cdnURL%>/images/pop/sns_kakaostory.png" alt="카카오스토리"></a></li>
				<li><a href="javascript:shareF();"  class="ga-event" data-action="페이스북"><img src="<%=cdnURL%>/images/pop/sns_facebook.png" alt="페이스북"></a></li>
			</ul>
			<div class="loading" style="display:none;"><img src="<%=cdnURL%>/images/pop/loading.gif" alt="loading"></div>
			<div class="btn"><a href="javascript:closePop('pop_sns');" class="ga-event" data-action="스크랩팝업 확인"><img src="<%=cdnURL%>/images/pop/btn_signup.png" alt="확인"></a></div>
		</div>
	</div>
	<!-- //팝업:sns공유 -->





</div><!-- // wrap -->
</body>
</html>