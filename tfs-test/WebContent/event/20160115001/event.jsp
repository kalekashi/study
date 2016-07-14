<%@ page contentType="text/html; charset=UTF-8" errorPage="/m/mall/error/error.jsp"%>
<%@ page import="java.util.*,
			com.efusioni.stone.utils.*,
			com.efusioni.stone.common.*,
			com.efusioni.stone.exception.*,
			com.thefaceshop.front.service.event.*,
			com.thefaceshop.front.common.*" %>
<%
	out.clear();

	String cdnURL = "http://image.ethefaceshop.com/tfsshopWebSrc/event/20160115001";
	String rootURL = "http://image.ethefaceshop.com/tfsshopWebSrc/event";
	String actionURL = "https://" + request.getServerName() + ":343/event/20160115001/entry.jsp";
	String eventCode = "";
	if (request.getServerName().equals("dev.thefaceshop.com")) {
		cdnURL = "/event/20160115001";
		rootURL = "/event";
		actionURL = "http://" + request.getServerName() + "/event/20160115001/entry.jsp";
		eventCode = "72";
	} else {
		//response.setHeader("Access-Control-Allow-Origin", "https://www.thefaceshop.com:343/");
		// test
		eventCode = "20";
	}
	
	// 디바이스 확인
	String userAgent=request.getHeader("User-Agent").toLowerCase();

	boolean isMobile = (userAgent.matches(".*(android|avantgo|blackberry|blazer|compal|elaine|fennec|hiptop|iemobile|ip(hone|od)|iris|kindle|lge |maemo|midp|mmp|opera m(ob|in)i|palm( os)?|phone|p(ixi|re)\\/|plucker|pocket|psp|symbian|treo|up\\.(browser|link)|vodafone|wap|windows (ce|phone)|xda|xiino).*")||userAgent.substring(0,4).matches("1207|6310|6590|3gso|4thp|50[1-6]i|770s|802s|a wa|abac|ac(er|oo|s\\-)|ai(ko|rn)|al(av|ca|co)|amoi|an(ex|ny|yw)|aptu|ar(ch|go)|as(te|us)|attw|au(di|\\-m|r |s )|avan|be(ck|ll|nq)|bi(lb|rd)|bl(ac|az)|br(e|v)w|bumb|bw\\-(n|u)|c55\\/|capi|ccwa|cdm\\-|cell|chtm|cldc|cmd\\-|co(mp|nd)|craw|da(it|ll|ng)|dbte|dc\\-s|devi|dica|dmob|do(c|p)o|ds(12|\\-d)|el(49|ai)|em(l2|ul)|er(ic|k0)|esl8|ez([4-7]0|os|wa|ze)|fetc|fly(\\-|_)|g1 u|g560|gene|gf\\-5|g\\-mo|go(\\.w|od)|gr(ad|un)|haie|hcit|hd\\-(m|p|t)|hei\\-|hi(pt|ta)|hp( i|ip)|hs\\-c|ht(c(\\-| |_|a|g|p|s|t)|tp)|hu(aw|tc)|i\\-(20|go|ma)|i230|iac( |\\-|\\/)|ibro|idea|ig01|ikom|im1k|inno|ipaq|iris|ja(t|v)a|jbro|jemu|jigs|kddi|keji|kgt( |\\/)|klon|kpt |kwc\\-|kyo(c|k)|le(no|xi)|lg( g|\\/(k|l|u)|50|54|e\\-|e\\/|\\-[a-w])|libw|lynx|m1\\-w|m3ga|m50\\/|ma(te|ui|xo)|mc(01|21|ca)|m\\-cr|me(di|rc|ri)|mi(o8|oa|ts)|mmef|mo(01|02|bi|de|do|t(\\-| |o|v)|zz)|mt(50|p1|v )|mwbp|mywa|n10[0-2]|n20[2-3]|n30(0|2)|n50(0|2|5)|n7(0(0|1)|10)|ne((c|m)\\-|on|tf|wf|wg|wt)|nok(6|i)|nzph|o2im|op(ti|wv)|oran|owg1|p800|pan(a|d|t)|pdxg|pg(13|\\-([1-8]|c))|phil|pire|pl(ay|uc)|pn\\-2|po(ck|rt|se)|prox|psio|pt\\-g|qa\\-a|qc(07|12|21|32|60|\\-[2-7]|i\\-)|qtek|r380|r600|raks|rim9|ro(ve|zo)|s55\\/|sa(ge|ma|mm|ms|ny|va)|sc(01|h\\-|oo|p\\-)|sdk\\/|se(c(\\-|0|1)|47|mc|nd|ri)|sgh\\-|shar|sie(\\-|m)|sk\\-0|sl(45|id)|sm(al|ar|b3|it|t5)|so(ft|ny)|sp(01|h\\-|v\\-|v )|sy(01|mb)|t2(18|50)|t6(00|10|18)|ta(gt|lk)|tcl\\-|tdg\\-|tel(i|m)|tim\\-|t\\-mo|to(pl|sh)|ts(70|m\\-|m3|m5)|tx\\-9|up(\\.b|g1|si)|utst|v400|v750|veri|vi(rg|te)|vk(40|5[0-3]|\\-v)|vm40|voda|vulc|vx(52|53|60|61|70|80|81|83|85|98)|w3c(\\-| )|webc|whit|wi(g |nc|nw)|wmlb|wonu|x700|xda(\\-|2|g)|yas\\-|your|zeto|zte\\-"));

	
	//ios 관련 브라우저 확인 'iPhone|iPad|iPod
	boolean isNoticeBrowser = false;
	boolean isFbBrowser = false;
	String noticePop = "";
	userAgent = userAgent.toUpperCase();
	if (userAgent.indexOf("IPHONE")> 0 || userAgent.indexOf("IPOD")> 0 || userAgent.indexOf("IPAD")> 0) {
		noticePop = "ios";
	} else if (userAgent.indexOf("ANDROID")> 0) {
		noticePop = "android";
	}	
	if (userAgent.indexOf("FACEBOOK")> 0 || userAgent.indexOf("FB")> 0) {
		isFbBrowser = true;
	}	

	if(noticePop == "ios" && isFbBrowser ) {
		isNoticeBrowser = true;
	}
	

	// 이벤트 종료처리
	String today = Utils.getTimeStampString("yyyyMMdd");
	String endday = "20160131";

	boolean eventEndDay = false;
	if (today.compareTo(endday) > 0){
		eventEndDay = true;
	}

%><!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<meta property="og:url" content="http://www.thefaceshop.com/event/redirectEvent.jsp?utm_source=kakaostory&utm_medium=share&utm_campaign=happyNewFace&eventId=20160115001&eventCode=<%=eventCode%>" />
<meta property="og:title" content="2016년을 부탁해" />
<meta property="og:description" content="여러분 ~! 2016년에도 더페이스샵 TOP3 크림과 함께 예뻐질 준비 되셨나요? 더욱 예뻐질 당신의 한 해를 확인해보세요 ♥" />
<meta property="og:image" content="http://www.thefaceshop.com/event/20160115001/images/kakaostory.jpg" />   
<title>더페이스샵</title>
<script type="text/javascript" src="<%=rootURL%>/js/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="<%=rootURL%>/js/jquery-ui-1.10.3.min.js"></script>
<script type="text/javascript" src="<%=rootURL%>/js/jquery.form.js"></script>
<script type="text/javascript" src="<%=rootURL%>/js/jquery.validate.min.js"></script>
<script type="text/javascript" src="<%=rootURL%>/js/commonSNS.js"></script>
<script type="text/javascript" src="/event/20160115001/js/controller.js?<%=new java.util.Date().getTime()%>"></script>
<script type="text/javascript" src="<%=rootURL%>/js/jquery.shy4blue.placeholder.js"></script>
<script type="text/javascript" src="<%=rootURL%>/js/jquery.shy4blue.xSubmit.js?<%=new java.util.Date().getTime()%>"></script>
<script type="text/javascript" src="<%=rootURL%>/js/json2.js"></script>
<script type="text/javascript" src="<%=rootURL%>/js/jquery.jjung.googleAnalytics.js"></script>
<script type="text/javascript" src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>

<script type="text/javascript">
var channel = 'web';
var actionURL = '<%=actionURL%>';
var cdnURL = '<%=cdnURL%>';
var eventCode = '<%=eventCode%>';

var isMobile = <%=isMobile%>;
var mobileDeviceFlag = '<%=noticePop%>'; //ios, android
var inappFlag = <%=isNoticeBrowser%>; //true/false
var eventEndDay = <%=eventEndDay%>;

// 개인정보 수집방침 팝업
function pop_privacy(flag) {
	//logAction('개인정보 수집방침');
	window.open('policy' + flag + '.jsp', 'pop_privacy' + flag, 'width=660, height=720, location=yes, scrollbars=no');
}

// 이벤트 시작
function eventFortune() {
    var wrapH = $('#wrap').height();
    $('#png_bg').css('height', wrapH);
    $('#png_bg').show();
    $('#pop_fortune').show();
    parent.$('html, body').animate({ scrollTop: 556 });
}

// 레이어팝업 열기
function openPop(param) {
    var wrapH = $('#wrap').height();
    $('#png_bg').css('height', wrapH);
    $('#png_bg').show();
    $('#' + param).show();
    parent.$('html, body').animate({ scrollTop: 556 });
}

// 레이어팝업 닫기
function closePop(param){
	$('#png_bg').hide();
	$('#'+param).hide();
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
//                alert("Checkbox is checked.");
				$("#chk_"+agree_id).attr("src","<%=cdnURL%>/images/chk_off.png");
				$('#'+chkbox_id).prop("checked",false);
			}
			else if($('#'+chkbox_id).prop("checked") == false){
//                alert("Checkbox is unchecked.");
				$("#chk_"+agree_id).attr("src","<%=cdnURL%>/images/chk_on.png");
				$('#'+chkbox_id).prop("checked",true);
			}
		});
	 });
});

$(document).ready(function(){
//	체크박스초기화
	$('.js-chkbox').prop("checked",false);
});


//placeholder
$(function () {
	setPlaceholder();

	$.ga('UA-31551710-3'); 
	$('.ga-event').tracking('tfsXkakaoEvent');
});

function setPlaceholder(){
	//연락처 placeholder
	$('.ph_phone').placeholder({ 
		type: 'background', 
		background: '<%=cdnURL%>/images/ph_phone.png'
	}); 
	$('.ph_phone').css('background-position', '10px 20px');

	//주소 placeholder
	$('.ph_address').placeholder({ 
		type: 'background', 
		background: '<%=cdnURL%>/images/ph_address.png'
	}); 
	$('.ph_address').css('background-position', '10px 20px');
	$('.ph_address2').placeholder({ 
		type: 'background', 
		background: '<%=cdnURL%>/images/ph_address2.png'
	}); 
	$('.ph_address2').css('background-position', '10px 20px');
}

// init
var movWidth = 809;
var movHeight = 500;

// ===========================================================================
// 유튜브제어(공통부분)
// ===========================================================================
var tag = document.createElement('script');
tag.src = "//www.youtube.com/iframe_api";
var firstScriptTag = document.getElementsByTagName('script')[0];
firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);
var done = 1;
var player;
var videoID = 'su6C-v4IbPM'; //비디오 아이디 첫번째영상 세팅

function onYouTubeIframeAPIReady() {
    setTimeout(function () {
    player = new YT.Player('movPlay', {
        height: movHeight,
        width: movWidth,
        videoId: videoID,
            playerVars: { 'showinfo': 0, 'rel': 0, 'wmode': 'opaque', 'disablekb': 1}
    });
    }, 1000);
}
// 정지
function movStop() {
    player.seekTo(0);
    player.stopVideo();
}

//재생시간10초후 이벤트참여가능
function start_event() {
    if (eventEndDay) {
        alert('이벤트가 종료되었습니다.');
        return;
    }

    var p_time = player.getCurrentTime();
    if (p_time>= 10) {
        $('.btn_block').hide();
        $('.btn_block').removeClass('on');
        $('.btn_participate').show();
        $('.btn_participate').addClass('on');
        movStop();
        eventFortune();
    } else {
        $('.btn_participate').hide();
        $('.btn_participate').removeClass('on');
        $('.btn_block').show();
        $('.btn_block').addClass('on');
        alert('영상을 10초 이상 시청 후 참여가 가능합니다.');
    }
}
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
.event_wrap .event_top{position:relative; width:900px; height:1207px; background:#fff url('<%=cdnURL%>/images/bg_event_top.jpg') top center no-repeat; text-align:center;}
.event_wrap .event_top .logo{position:absolute; top:20px; right:20px; z-index:5;}
.event_wrap .event_top .event_top_area{width:900px; position:relative;}
.event_wrap .event_top .event_top_area .flag{padding-left:183px;}
.event_wrap .event_top .event_top_area h2{margin:-47px 0 0 13px;}
.event_wrap .event_top .event_top_area .txt{padding:22px 0 0 0;}

.event_wrap .event_top .event_top_area .mov_area{width:809px; margin:0 auto; padding-top:27px; position:relative;}
.event_wrap .event_top .event_top_area .mov_area .mov_cont{position:relative;}
.event_wrap .event_top .event_top_area .mov_area #mov_cover{position:absolute; top:27px; left:0;}

.event_wrap .event_top .event_top_area .btn_block{margin:53px 0 0 0;}
.event_wrap .event_top .event_top_area .btn_participate{margin:53px 0 0 0;}

.event_wrap .event_cont1{width:900px; height:402px; background:#fff url('<%=cdnURL%>/images/bg_event_cont1.jpg') top center no-repeat;}
.event_wrap .event_cont1 ul{width:780px; margin:0 auto; overflow:hidden;}
.event_wrap .event_cont1 ul li{float:left; width:780px;}
.event_wrap .event_cont1 ul li dl{overflow:hidden;}
.event_wrap .event_cont1 ul li dl dt{float:left; padding:0 23px 0 0; vertical-align:top;}
.event_wrap .event_cont1 ul li dl dd{float:left; vertical-align:top;}
.event_wrap .event_cont1 ul li dl dd{}
.event_wrap .event_cont1 ul li.cont1_list1{padding:0 0 35px 0;}
.event_wrap .event_cont1 ul li.cont1_list1 dl{}
.event_wrap .event_cont1 ul li.cont1_list1 dl dt{padding:7px 21px 0 0;}
.event_wrap .event_cont1 ul li.cont1_list1 dl dd{padding-top:0px;}

.event_wrap .event_cont1 ul li.cont1_list2{padding:0 0 18px 0;}
.event_wrap .event_cont1 ul li.cont1_list2 dl{}
.event_wrap .event_cont1 ul li.cont1_list2 dl dt{padding:0 23px 0 0;}
.event_wrap .event_cont1 ul li.cont1_list2 dl dd{}

.event_wrap .event_cont1 ul li.cont1_list3{padding:0 0 18px 0;}
.event_wrap .event_cont1 ul li.cont1_list3 dl{}
.event_wrap .event_cont1 ul li.cont1_list3 dl dt{}
.event_wrap .event_cont1 ul li.cont1_list3 dl dd{}

.event_wrap .event_cont2{width:900px; height:808px; background:#fff url('<%=cdnURL%>/images/bg_event_cont2.jpg') top center no-repeat;}
.event_wrap .event_cont2 h3{width:556px; margin:0 auto; padding-top:68px;}
.event_wrap .event_cont2 ul{width:820px; margin:0 auto; overflow:hidden;}
.event_wrap .event_cont2 ul li{float:left;}
.event_wrap .event_cont2 ul li dl{margin-left:29px; overflow:hidden;}
.event_wrap .event_cont2 ul li dl dt{}
.event_wrap .event_cont2 ul li dl dd{padding-top:23px;}

.event_wrap .event_cont2 ul li.top_prod1{width:273px;}
.event_wrap .event_cont2 ul li.top_prod1 dl{}
.event_wrap .event_cont2 ul li.top_prod1 dl dt{}
.event_wrap .event_cont2 ul li.top_prod1 dl dd.txt{padding-right:9px;}
.event_wrap .event_cont2 ul li.top_prod1 dl dd.btn_detail{padding:20px 9px 0 0;}

.event_wrap .event_cont2 ul li.top_prod2{width:274px;}
.event_wrap .event_cont2 ul li.top_prod2 dl{}
.event_wrap .event_cont2 ul li.top_prod2 dl dt{}
.event_wrap .event_cont2 ul li.top_prod2 dl dd.txt{padding-right:3px;}
.event_wrap .event_cont2 ul li.top_prod2 dl dd.btn_detail{padding:21px 2px 0 0;}

.event_wrap .event_cont2 ul li.top_prod3{width:273px;}
.event_wrap .event_cont2 ul li.top_prod3 dl{}
.event_wrap .event_cont2 ul li.top_prod3 dl dt{}
.event_wrap .event_cont2 ul li.top_prod3 dl dd.txt{padding-left:7px;}
.event_wrap .event_cont2 ul li.top_prod3 dl dd.btn_detail{padding:22px 0px 0 8px;}


.event_wrap .event_bottom{width:900px; height:238px; background:#e6e8f3;}
.event_wrap .event_bottom ul{width:820px; margin:0 auto; padding-top:47px; overflow:hidden;}
.event_wrap .event_bottom ul li{float:left;}
.event_wrap .event_bottom ul li dl{width:390px; padding-left:20px; overflow:hidden;}
.event_wrap .event_bottom ul li dl dt{margin:0 0 12px 8px;}
.event_wrap .event_bottom ul li dl dd{}

/* 팝업:딤드처리*/
#png_bg{position:absolute; top:0; left:0; width:100%; height:100%; filter:alpha(opacity=70); opacity:0.70; background-color:#000; z-index:98;}

/* 팝업:운세확인하기 */
#pop_fortune{position:absolute; top:50px; left:50%; margin-left:-320px; width:640px; height:960px; z-index:99; background:url('<%=cdnURL%>/images/bg_pop_fortune.jpg') top center no-repeat;}
#pop_fortune .btn_close{position:absolute; top:20px; right:20px; z-index:999;}
#pop_fortune .pop_header{width:640px; margin:0 auto; }
#pop_fortune .pop_header .flag{width:338px; margin:0 auto; padding-top:67px;}
#pop_fortune .pop_header .tl{width:533px; margin:0 auto; padding-top:16px;}
#pop_fortune .pop_header .txt{width:419px; margin:0 auto; padding:20px 0 0 0;}
#pop_fortune .pop_cont{width:640px; height:712px; position:relative; overflow:hidden;}
#pop_fortune .pop_cont .btn_area{position:relative; margin:286px 0 0 45px;}
#pop_fortune .pop_cont .btn_area .btn{}
#pop_fortune .pop_cont .btn_area .loading{position:absolute; top:0; left:0; width:422px; height:99px; text-align:center; filter:alpha(opacity=60); opacity:0.60; background-color:#000; overflow:hidden;}
#pop_fortune .pop_cont .btn_area .loading img{padding-top:19px;}


/* 팝업:결과 */
#pop_result{position:absolute; top:50px; left:50%; margin-left:-320px; width:640px; height:1413px; z-index:99; background:#f5f7fa url('<%=cdnURL%>/images/bg_pop.jpg') top center repeat;}
#pop_result .btn_close{position:absolute; top:20px; right:20px; z-index:999;}
#pop_result .pop_header{width:640px; height:291px; margin:0 auto; }
#pop_result .pop_header .flag{width:338px; margin:0 auto; padding-top:67px;}
#pop_result .pop_header .tl{width:533px; margin:0 auto; padding-top:16px;}
#pop_result .pop_header .txt{width:504px; margin:0 auto; padding:20px 0 0 0;}

#pop_result .pop_cont{width:640px;}
#pop_result .pop_cont .txt_area{position:relative; width:640px; margin:0 auto;}
#pop_result .pop_cont .txt_area .btn{position:absolute; top:180px; left:224px;}
#pop_result .pop_footer {width:640px; text-align:center; overflow:hidden;}
#pop_result .pop_footer {width:640px; padding:47px 0 0 0;}
#pop_result .pop_footer ul{width:238px; margin:0 auto; overflow:hidden; padding-bottom:47px;}
#pop_result .pop_footer ul li{width:103px; float:left; margin:0 8px;}
#pop_result .pop_footer p{width:406px; margin:0 auto;}
#pop_result .pop_footer .btn{width:322px; margin:0 auto;padding:25px 0 0 0;}



/* 팝업:개인정보입력 */
#pop_entry{position:absolute; top:50px; left:50%; margin-left:-320px; width:640px; height:1480px; z-index:99; background:#f5f7fa url('<%=cdnURL%>/images/bg_pop.jpg') top center repeat;}
#pop_entry .btn_close{position:absolute; top:21px; right:21px; z-index:999;}
#pop_entry .pop_header{width:640px; height:291px; margin:0 auto; }
#pop_entry .pop_header .flag{width:338px; margin:0 auto; padding-top:67px;}
#pop_entry .pop_header .tl{width:533px; margin:0 auto; padding-top:16px;}
#pop_entry .pop_header .txt{width:455px; margin:0 auto; padding:20px 0 0 0;}
#pop_entry .pop_cont{width:640px; margin:0 auto; padding-top:44px;}
#pop_entry .pop_cont .form_box{width:541px; margin:0 auto;}
#pop_entry .pop_cont .form_box dl{width:541px; margin:0 auto; margin-bottom:25px; overflow:hidden;}
#pop_entry .pop_cont .form_box dl dt{float:left; width:106px;}
#pop_entry .pop_cont .form_box dl dt img{padding-top:21px; vertical-align:middle;}
#pop_entry .pop_cont .form_box dl dd{float:left; width:433px;}
#pop_entry .pop_cont .form_box dl dd input{font-weight:bold; border:1px solid #e6e7f4; background:#fff; color:#939393;}
#pop_entry .pop_cont .form_box dl.input_name dd input{width:411px; height:64px; padding:0 10px; line-height:62px; font-size:26px; vertical-align:middle;}
#pop_entry .pop_cont .form_box dl.input_phone dd input{width:411px; height:64px; padding:0 10px; line-height:62px; font-size:26px; vertical-align:middle;}
#pop_entry .pop_cont .form_box dl.input_post{margin-bottom:10px;}
#pop_entry .pop_cont .form_box dl.input_post dd input{width:260px; height:64px; margin:0 14px 0 0; padding:0 10px;  line-height:62px ; font-size:26px; vertical-align:middle;}
#pop_entry .pop_cont .form_box dl.input_post dd img{cursor:pointer;}
#pop_entry .pop_cont .form_box dl.input_address{margin-bottom:49px;}
#pop_entry .pop_cont .form_box dl.input_address dd input{width:411px; height:64px; margin:0 0 10px 0; padding:0 10px; line-height:62px; font-size:26px; vertical-align:middle;}
#pop_entry .pop_cont .form_box dl.input_address dd.notice{width:106px; padding:6px 0 0 106px; }

#pop_entry .pop_cont .agree_policy{position:relative; width:541px; margin:0 auto;}
#pop_entry .pop_cont .agree_policy .agree-area{width:541px; overflow:hidden; margin:34px 0 0 0;}
#pop_entry .pop_cont .agree_policy .agree-area .js-chk-area{float:left; width:377px; height:56px; cursor:pointer;}
#pop_entry .pop_cont .agree_policy .agree-area .js-chk-area input.chkBox {position: absolute; top:22px; left:12px; }
#pop_entry .pop_cont .agree_policy .agree-area .js-chk-area label.js-agree {cursor:pointer; display:block; padding-top:10px;}
#pop_entry .pop_cont .agree_policy .agree-area .js-chk-area span img{padding:8px 0 0 16px;}
#pop_entry .pop_cont .agree_policy .agree-area .js-chk-area input{width:0; height:0; border:0; visibility:hidden;}
#pop_entry .pop_cont .agree_policy .agree-first{margin:58px 0 0 0;}
#pop_entry .pop_cont .agree_policy .agree-area .btn-area{float:right; display:inline;}
#pop_entry .btn{position:relative; text-align:center; margin:99px 0 69px 0;}
#pop_entry .btn .loading{position:absolute; top:0; left:157px; width:323px; height:84px; text-align:center; filter:alpha(opacity=60); opacity:0.60; background-color:#000; overflow:hidden;}
#pop_entry .btn .loading img{padding-top:19px;}
</style>
</head>
<body>
<div id="fb-root"></div>
<script>
 window.fbAsyncInit = function () {
        FB.init({
            //appId: '438085719594851', // App ID
			appId: '203116659844406',
            channelUrl: '//www.thefaceshop.com/channel.php', // Channel File
            status: true, // check login status
            cookie: true, // enable cookies to allow the server to access the session
            xfbml: false  // parse XFBML
        });
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
	<div style="position:absolute; top:0; left:0; z-index:999; display:none;">
		<input type="button" value="운세확인하기" onclick="openPop('pop_fortune');">
		<input type="button" value="결과" onclick="openPop('pop_result');">
		<input type="button" value="개인정보 입력" onclick="openPop('pop_entry');">
	</div>
	<div class="event_wrap">
		<div class="event_top">
			<div class="logo"><a href="http://www.thefaceshop.com/" target="_blank"><img src="<%=cdnURL%>/images/tfs_logo.png" alt="THE FACE SHOP"></a></div>
			<div class="event_top_area">
				<div class="flag"><img src="<%=cdnURL%>/images/flag_event_top.png" alt="HAPPY NEW FACE"></div>
				<h2><img src="<%=cdnURL%>/images/tit_event_top.png" alt="2016년을 부탁해"></h2>
				<div class="txt"><img src="<%=cdnURL%>/images/txt_event_top.png" alt="2016년 나의 피부는? 수지의 새해 영상보고, 한 해 운세를 확인해보세요.2016년에도 더페이스샵 top3크림과 함께 더 예뻐지세요!"></div>
				<div class="mov_area">
                    <div class="mov_cont">
                        <div id="movPlay"></div>
                    </div>
                </div>
                <div class="btn_block on"><a href="javascript:start_event();" class="ga-event" data-action="[메인]2016년 운세확인하기"><img src="<%=cdnURL%>/images/btn_event_participate.png" alt="2016년 운세 확인하기"></a></div>
                <div class="btn_participate" style="display:none;"><a href="javascript:eventFortune()" class="ga-event" data-action="[메인]2016년 운세확인하기"><img src="<%=cdnURL%>/images/btn_event_participate.png" alt="2016년 운세 확인하기"></a></div>
			</div>
		</div><!-- event_top -->
		<div class="event_cont1">
			<ul>
				<li class="cont1_list1">
					<dl>
						<dt><img src="<%=cdnURL%>/images/cont1_list_tit1.png" alt="참여방법"></dt>
						<dd><img src="<%=cdnURL%>/images/cont1_list_txt1.png" alt="SETP1 영상을 플레이 후 운세 확인하기 버튼 클릭> STEP2 운세 확인 후 TOP3크림 신청하기> STEP3 개인정보 입력 후 참여완료"></dd>
					</dl>
				</li>
				<li class="cont1_list2">
					<dl>
						<dt><img src="<%=cdnURL%>/images/cont1_list_tit2.png" alt="참여기간"></dt>
						<dd><img src="<%=cdnURL%>/images/cont1_list_txt2.png" alt="2016. 1. 15(금) ~ 1. 31(일)"></dd>
					</dl>
				</li>
				<li class="cont1_list3">
					<dl>
						<dt><img src="<%=cdnURL%>/images/cont1_list_tit3.png" alt="당첨발표"></dt>
						<dd><img src="<%=cdnURL%>/images/cont1_list_txt3.png" alt="2016. 2. 5(금), 개별문자발송"></dd>

					</dl>
				</li>
				<li class="cont1_list4">
					<dl>
						<dt><img src="<%=cdnURL%>/images/cont1_list_tit4.png" alt="당첨선물"></dt>
						<dd><img src="<%=cdnURL%>/images/cont1_list_txt4.png" alt="더페이스샵 top3크림 300명 (각 100명) 더테라피 오일블렌딩크림/치아씨드 피지잡는 수분크림 인텐스/망고씨드 볼륨 버터"></dd>
					</dl>
				</li>
			</ul>
		</div>
		<div class="event_cont2">
			<h3><img src="<%=cdnURL%>/images/tit_event_cont2.png" alt="2016년도에도 함께할 인생템 더페이스샵 TOP3크림"></h3>
			<ul class="prod_area">
				<li class="top_prod1">
					<div class="prod_img"><img src="<%=cdnURL%>/images/img_top_prod1.png" alt="더테라피 크림"></div>
					<dl>
						<dt><img src="<%=cdnURL%>/images/tl_top_prod1.png" alt="안티에이징 크림 TOP"></dt>
						<dd class="txt"><img src="<%=cdnURL%>/images/txt_top_prod1.png" alt="더테라피 로얄메이드 오일 블렌딩 크림"></dd>
						<dd class="btn_detail"><a href="http://www.thefaceshop.com/mall/product/product-view.jsp?dpid=AF004020" target="_blank"><img src="<%=cdnURL%>/images/btn_detail.png" alt="자세히보기"></a></dd>
					</dl>
				</li>
				<li class="top_prod2">
					<div class="prod_img"><img src="<%=cdnURL%>/images/img_top_prod2.png" alt="치아 씨드 크림"></div>
					<dl>
						<dt><img src="<%=cdnURL%>/images/tl_top_prod2.png" alt="수분 크림 TOP"></dt>
						<dd class="txt"><img src="<%=cdnURL%>/images/txt_top_prod2.png" alt="치아씨드 피지잡는 수분크림 인텐스"></dd>
						<dd class="btn_detail"><a href="http://www.thefaceshop.com/mall/product/product-view.jsp?dpid=AF004021" target="_blank"><img src="<%=cdnURL%>/images/btn_detail.png" alt="자세히보기"></a></dd>
					</dl>
				</li>
				<li class="top_prod3">
					<div class="prod_img"><img src="<%=cdnURL%>/images/img_top_prod3.png" alt="망고 씨드 크림"></div>
					<dl>
						<dt><img src="<%=cdnURL%>/images/tl_top_prod3.png" alt="보습 크림 TOP"></dt>
						<dd class="txt"><img src="<%=cdnURL%>/images/txt_top_prod3.png" alt="망고씨드 페이셜/볼륨버터"></dd>
						<dd class="btn_detail"><a href="http://www.thefaceshop.com/mall/product/product-view.jsp?dpid=AF003113" target="_blank"><img src="<%=cdnURL%>/images/btn_detail.png" alt="자세히보기"></a></dd>
					</dl>
				</li>
			</ul>
			
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

	<!-- 팝업:운세확인하기 -->
	<div id="pop_fortune" style="display:none;">
		<div class="btn_close"><a href="javascript:closePop('pop_fortune');"><img src="<%=cdnURL%>/images/btn_close.png" alt="닫기"></a></div>
		<div class="pop_header">
			<div class="flag"><img src="<%=cdnURL%>/images/flag_pop.png" alt="HAPPY NEW FACE"></div>
			<div class="tl"><img src="<%=cdnURL%>/images/tl_pop.png" alt="2016년을 부탁해"></div>
			<div class="txt"><img src="<%=cdnURL%>/images/txt_pop_fortune.png" alt="당신의 2016년 한 해 운세를 확인해주세요."></div>
		</div>
		<div class="pop_cont">
			<div class="btn_area">
				<div class="btn"><a href="javascript:getProduct();" class="ga-event" data-action="[운세확인팝업]2016년 운세확인하기"><img src="<%=cdnURL%>/images/btn_fortune.png" alt="2016년 운세 확인하기"></a></div>
				<div class="loading" style="display:none;"><img src="<%=cdnURL%>/images/loading.gif" alt="loading"></div>
			</div>
		</div>
	</div>
	
	<!-- 팝업:결과 -->
	<div id="pop_result" style="display:none;">
		<div class="btn_close"><a href="javascript:closePop('pop_result');"><img src="<%=cdnURL%>/images/btn_close.png" alt="닫기"></a></div>
		<div class="pop_header">
			<div class="flag"><img src="<%=cdnURL%>/images/flag_pop.png" alt="HAPPY NEW FACE"></div>
			<div class="tl"><img src="<%=cdnURL%>/images/tl_pop.png" alt="2016년을 부탁해"></div>
			<div class="txt"><img src="<%=cdnURL%>/images/txt_pop_reslut.png" alt="더페이스샵 TOP3크림과 함께 새해엔 더 예뻐지세요."></div>
		</div>
		<div class="pop_cont">
			<div><img src="<%=cdnURL%>/images/result_chia1.jpg" alt="상품이미지" id="productImg"></div>
			<div class="txt_area">
				<div><img src="<%=cdnURL%>/images/result_chia_txt.jpg" alt="상품텍스트" id="productDetailImg"></div>
				<div class="btn"><a href="#" url-data="http://www.thefaceshop.com/mall/product/product-view.jsp?dpid=" id="productURL" target="_blank"  class="ga-event" data-action="[운세결과팝업]자세히보기"><img src="<%=cdnURL%>/images/btn_detail_chia.png" alt="자세히보기" id="productURLImg"></a></div>
			</div>
		</div> 
		<div class="pop_footer">
			<ul>
<!-- 				<li><a href="javascript:shareKT();"><img src="<%=cdnURL%>/images/sns_kakaotalk.png" alt="카카오톡"></a></li> -->
				<li><a href="javascript:shareKS();" class="ga-event" data-action="[운세결과팝업]kakaostory"><img src="<%=cdnURL%>/images/sns_kakaostory.png" alt="카카오스토리"></a></li>
				<li><a href="javascript:shareF();" class="ga-event" data-action="[운세결과팝업]facebook"><img src="<%=cdnURL%>/images/sns_facebook.png" alt="페이스북"></a></li>
			</ul>
			<p><img src="<%=cdnURL%>/images/txt_sns.png" alt="이벤트를 SNS에 공유 시 당첨확률 UP! 됩니다"></p>
			<div class="btn"><a href="javascript:goEntry();" class="ga-event" data-action="[운세결과팝업]신청하기"><img src="<%=cdnURL%>/images/btn_signup.png" alt="확인"></a></div>
		</div>
	</div>



	<!-- 팝업:개인정보입력 -->
	<div id="pop_entry" style="display:none;">
		<div class="btn_close"><a href="javascript:closePop('pop_entry');"><img src="<%=cdnURL%>/images/btn_close.png" alt="닫기"></a></div>
		<div class="pop_header">
			<div class="flag"><img src="<%=cdnURL%>/images/flag_pop.png" alt="HAPPY NEW FACE"></div>
			<div class="tl"><img src="<%=cdnURL%>/images/tl_pop.png" alt="2016년을 부탁해"></div>
			<div class="txt"><img src="<%=cdnURL%>/images/txt_pop_entry.png" alt="당신의 2016년 한 해 운세를 확인해주세요."></div>
		</div>
		<div class="pop_cont">
			<form name="frm" id="frm" method="post" action="<%=actionURL%>"  class="ga-event" data-action="[개인정보팝업]신청완료">
			<input type="hidden" name="channel" id="channel" value="web"/>
			<input type="hidden" name="product" id="product" value="1"/>
			<input type="hidden" name="facebook" id="facebook" value=""/>
			<input type="hidden" name="kakaotalk" id="kakaotalk" value=""/>
			<input type="hidden" name="kakaostory" id="kakaostory" value=""/>
			<input type="hidden" name="addressType">
			<div class="form_box">
				<dl class="input_name">
					<dt><img src="<%=cdnURL%>/images/input_name.png" alt="이름"></dt>
					<dd><input type="text" name="name" id="name" maxlength="5" class="ph_name"></dd>
				</dl>
				<dl class="input_phone">
					<dt><img src="<%=cdnURL%>/images/input_phone.png" alt="연락처"></dt>
					<dd><input type="tel" name="mobile" id="mobile" class="ph_phone" maxlength="11"></dd>
				</dl>
				<dl class="input_post">
					<dt><img src="<%=cdnURL%>/images/input_post.png" alt="우편번호"></dt>
					<dd class="input_post"><input type="text" name="zipcode" class="ph_zipcode" id="zipcode" readOnly><img class="btn_search" src="<%=cdnURL%>/images/btn_search.png" alt="검색" id="openFindzip" ></dd>
				</dl>
				<dl class="input_address">
					<dt><img src="<%=cdnURL%>/images/input_address.png" alt="주소"></dt>
					<dd><input type="text" name="address" class="ph_address" id="addr1"><br><input type="text" name="address2" class="ph_address2" id="addr2" maxlength="50"></dd>
					<dd class="notice"><img src="<%=cdnURL%>/images/txt_notice_entry.png" alt="배송정보 불일치로 인한 오배송은 책임지지 않습니다. 본인의 정보가 맞는지 다시한번 확인해주세요."></dd>
				</dl>
			</div>
			<div class="agree_policy">
				<div class="agree-area agree-first">
					<div class="js-chk-area chk-area" id="agree1">
						<input class="js-chkbox chkBox" id="chkbox_agree1" type="checkbox" name="chkbox_agree1">
						<label class="js-agree" for="chkbox_agree1"><img src="<%=cdnURL%>/images/chk_off.png" alt=" " id="chk_agree1" class="agreeImg"><span><img src="<%=cdnURL%>/images/policy_txt01.png" alt="개인정보 수집 이용에 대한 동의"></span></label>
					</div>
					<div class="btn-area"><a href="javascript:pop_privacy('1')"><img src="<%=cdnURL%>/images/btn_policy.png" alt="자세히 보기"></a></div>
				</div>
				<div class="agree-area ">
					<div class="js-chk-area chk-area" id="agree2">
						<input class="js-chkbox chkBox" id="chkbox_agree2" type="checkbox" name="chkbox_agree2">
						<label class="js-agree" for="chkbox_agree2"><img src="<%=cdnURL%>/images/chk_off.png" alt=" " id="chk_agree2" class="agreeImg"><span><img src="<%=cdnURL%>/images/policy_txt02.png" alt="개인정보 취급 위탁 동의"></span></label>
					</div>
					<div class="btn-area"><a href="javascript:pop_privacy('2')"><img src="<%=cdnURL%>/images/btn_policy.png" alt="자세히 보기"></a></div>
				</div>
				<div class="agree-area ">
					<div class="js-chk-area chk-area" id="agree3">
						<input class="js-chkbox chkBox" id="chkbox_agree3" type="checkbox" name="chkbox_agree3">
						<label class="js-agree" for="chkbox_agree3"><img src="<%=cdnURL%>/images/chk_off.png" alt=" " id="chk_agree3" class="agreeImg"><span><img src="<%=cdnURL%>/images/policy_txt03.png" alt="광고성 정보 전송 동의"></span></label>
					</div>
					<div class="btn-area"><a href="javascript:pop_privacy('3')"><img src="<%=cdnURL%>/images/btn_policy.png" alt="자세히 보기"></a></div>
				</div>
			</div>
			<div class="btn">
				<input type="image" src="<%=cdnURL%>/images/btn_entry.png" name="" alt="신청완료"></a>
				<div class="loading" style="display:none;"><img src="<%=cdnURL%>/images/loading.gif" alt="loading"></div>
			</div>
			</form>
		</div>
		<div class="pop_footer">
			<div class="notice"><img src="<%=cdnURL%>/images/notice_pop_entry.png" alt="입력하신 개인정보는 경품 배송 및 수령을 위한 용도로만 사용됩니다./ 응모 시 입력한 정보 및 주소지는 변경 불가합니다. / 배송정보 불일치로 인한 오배송은 책임지지 않습니다."></a></div>
		</div>
	</div><!-- // pop_entry -->



</div><!-- // wrap -->
</body>
</html>