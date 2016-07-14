<%@ page contentType="text/html; charset=UTF-8" errorPage="/m/mall/error/error.jsp"%>
<%@ page import="java.util.*,
			com.efusioni.stone.utils.*,
			com.efusioni.stone.common.*,
			com.efusioni.stone.exception.*,
			com.thefaceshop.front.service.event.*,
			com.thefaceshop.front.common.*" %>
<%
	out.clear();

	String cdnURL = "http://image.ethefaceshop.com/tfsshopWebSrc/event/20160315001";
	String rootURL = "http://image.ethefaceshop.com/tfsshopWebSrc/event";
	String actionURL = "https://secure.thefaceshop.com:643/thefaceshop/event/test/test.jsp";
	if (request.getServerName().equals("dev.thefaceshop.com")) {
		cdnURL = "/event/20160315001";
		rootURL = "/event";
	} 
	
	response.setHeader("Access-Control-Allow-Origin", "*");		

	// �̺�Ʈ ����ó��
	String today = Utils.getTimeStampString("yyyyMMdd");
	String endday = "20160405";

	boolean eventEndDay = false;
	if (today.compareTo(endday) > 0){
		eventEndDay = true;
	}



	// ����̽� Ȯ��
	String userAgent=request.getHeader("User-Agent").toLowerCase();

	boolean isMobile = (userAgent.matches(".*(android|avantgo|blackberry|blazer|compal|elaine|fennec|hiptop|iemobile|ip(hone|od)|iris|kindle|lge |maemo|midp|mmp|opera m(ob|in)i|palm( os)?|phone|p(ixi|re)\\/|plucker|pocket|psp|symbian|treo|up\\.(browser|link)|vodafone|wap|windows (ce|phone)|xda|xiino).*")||userAgent.substring(0,4).matches("1207|6310|6590|3gso|4thp|50[1-6]i|770s|802s|a wa|abac|ac(er|oo|s\\-)|ai(ko|rn)|al(av|ca|co)|amoi|an(ex|ny|yw)|aptu|ar(ch|go)|as(te|us)|attw|au(di|\\-m|r |s )|avan|be(ck|ll|nq)|bi(lb|rd)|bl(ac|az)|br(e|v)w|bumb|bw\\-(n|u)|c55\\/|capi|ccwa|cdm\\-|cell|chtm|cldc|cmd\\-|co(mp|nd)|craw|da(it|ll|ng)|dbte|dc\\-s|devi|dica|dmob|do(c|p)o|ds(12|\\-d)|el(49|ai)|em(l2|ul)|er(ic|k0)|esl8|ez([4-7]0|os|wa|ze)|fetc|fly(\\-|_)|g1 u|g560|gene|gf\\-5|g\\-mo|go(\\.w|od)|gr(ad|un)|haie|hcit|hd\\-(m|p|t)|hei\\-|hi(pt|ta)|hp( i|ip)|hs\\-c|ht(c(\\-| |_|a|g|p|s|t)|tp)|hu(aw|tc)|i\\-(20|go|ma)|i230|iac( |\\-|\\/)|ibro|idea|ig01|ikom|im1k|inno|ipaq|iris|ja(t|v)a|jbro|jemu|jigs|kddi|keji|kgt( |\\/)|klon|kpt |kwc\\-|kyo(c|k)|le(no|xi)|lg( g|\\/(k|l|u)|50|54|e\\-|e\\/|\\-[a-w])|libw|lynx|m1\\-w|m3ga|m50\\/|ma(te|ui|xo)|mc(01|21|ca)|m\\-cr|me(di|rc|ri)|mi(o8|oa|ts)|mmef|mo(01|02|bi|de|do|t(\\-| |o|v)|zz)|mt(50|p1|v )|mwbp|mywa|n10[0-2]|n20[2-3]|n30(0|2)|n50(0|2|5)|n7(0(0|1)|10)|ne((c|m)\\-|on|tf|wf|wg|wt)|nok(6|i)|nzph|o2im|op(ti|wv)|oran|owg1|p800|pan(a|d|t)|pdxg|pg(13|\\-([1-8]|c))|phil|pire|pl(ay|uc)|pn\\-2|po(ck|rt|se)|prox|psio|pt\\-g|qa\\-a|qc(07|12|21|32|60|\\-[2-7]|i\\-)|qtek|r380|r600|raks|rim9|ro(ve|zo)|s55\\/|sa(ge|ma|mm|ms|ny|va)|sc(01|h\\-|oo|p\\-)|sdk\\/|se(c(\\-|0|1)|47|mc|nd|ri)|sgh\\-|shar|sie(\\-|m)|sk\\-0|sl(45|id)|sm(al|ar|b3|it|t5)|so(ft|ny)|sp(01|h\\-|v\\-|v )|sy(01|mb)|t2(18|50)|t6(00|10|18)|ta(gt|lk)|tcl\\-|tdg\\-|tel(i|m)|tim\\-|t\\-mo|to(pl|sh)|ts(70|m\\-|m3|m5)|tx\\-9|up(\\.b|g1|si)|utst|v400|v750|veri|vi(rg|te)|vk(40|5[0-3]|\\-v)|vm40|voda|vulc|vx(52|53|60|61|70|80|81|83|85|98)|w3c(\\-| )|webc|whit|wi(g |nc|nw)|wmlb|wonu|x700|xda(\\-|2|g)|yas\\-|your|zeto|zte\\-"));

	
	//ios ��� ������ Ȯ�� 'iPhone|iPad|iPod
	boolean isNoticeBrowser = false;
	String mobileDeviceFlag = "";
	userAgent = userAgent.toUpperCase();
	if (userAgent.indexOf("IPHONE")> 0 || userAgent.indexOf("IPOD")> 0 || userAgent.indexOf("IPAD")> 0) {
		mobileDeviceFlag = "ios";
	} else if (userAgent.indexOf("ANDROID")> 0) {
		mobileDeviceFlag = "android";
	}	

%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr" />
<meta property="og:url" content="http://www.thefaceshop.com/event/redirectEvent.jsp?utm_source=kakaostory&utm_medium=share&utm_campaign=tfsXkakao&eventId=20160315001&eventCode=161" />
<meta property="og:title" content="" />
<meta property="og:description" content="" />
<meta property="og:image" content="http://www.thefaceshop.com/event/20160315001/images/kakaostory.jpg" />  
<!-- cache -->
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta http-equiv="Expires" content="-1" />
<meta http-equiv="Pragma" content="no-cache" />
<meta http-equiv="Cache-Control" content="No-Cache" />
<!-- //cache -->

<title>�����̽���</title>

<script type="text/javascript" src="<%=rootURL%>/js/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="<%=rootURL%>/js/jquery.validate.min.js"></script>
<script type="text/javascript" src="<%=rootURL%>/js/jquery.form.js"></script>
<script type="text/javascript" src="<%=rootURL%>/js/jquery.shy4blue.placeholder.js"></script>
<script type="text/javascript" src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script type="text/javascript" src="/event/js/jquery.jjung.googleAnalytics.js"></script>
<script type="text/javascript" src="/event/js/commonSNS.js"></script>
<script type="text/javascript" src="<%=rootURL%>/js/jquery.shy4blue.xSubmit.js?<%=new java.util.Date().getTime()%>"></script>
<script type="text/javascript" src="<%=rootURL%>/js/json2.js"></script>
<script type="text/javascript" src="<%=rootURL%>/js/jquery.xdomainrequest.min.js"></script>
<!-- bxslider -->
<script src="<%=rootURL%>/20160315001/js/jquery.bxslider.js"></script>
<link href="<%=rootURL%>/20160315001/css/jquery.bxslider.css" rel="stylesheet" />
<script type="text/javascript">
var channel = 'web';
var cdnURL = '<%=cdnURL%>';
var isMobile = <%=isMobile%>;
var isInapp = false;
var eventEndDay = <%=eventEndDay%>;
var mobileDeviceFlag = '<%=mobileDeviceFlag%>';
var slider = null;
</script>
<script type="text/javascript" src="/event/20160315001/js/controller2.js"></script>
<script type="text/javascript">
// ���̾��˾� ����
function openPop(param) {
  var wrapH = $('#wrap').height();
  $('#png_bg').css('height', wrapH);
  $('#png_bg').show();
  $('#' + param).show();
  parent.$('html, body').animate({ scrollTop: 0 });
  if (param == 'pop_game') {
	// bxslider ��
	slider = $('.bxslider').bxSlider({
		autoControls: true,
		pager: false,
		minSlides: 3,
		maxSlides: 3,
		slideWidth: 150,
		slideMargin: 5
	});
  }
}

// ���̾��˾� �ݱ�
function closePop(param){
	$('#png_bg').hide();
	$('#'+param).hide();
	//bxslider �ı�
	//slider = $('.bxslider').bxSlider();
	if (slider){
		slider.destroySlider();
	}
}

// �������� �����ħ �˾�
function pop_privacy(flag) {
	//logAction('�������� �����ħ');
	window.open('policy' + flag + '.jsp', 'pop_privacy' + flag, 'width=660, height=720, location=yes, scrollbars=no');
}

// �˾�:���� �����̵� ����
function change_prod(param){
	$('.prod_img img').attr("src", "<%=cdnURL%>/images/pop/game_prod" + param + ".jpg");
	$('.slider ul li img').each(function () {
		this.src = this.src.replace('on.png', '.png');
	});

//	$('#prod' + param).attr("src", "<%=cdnURL%>/images/pop/game_btn" + param  + "on.png");
	$('.production' + param).attr("src", "<%=cdnURL%>/images/pop/game_btn" + param  + "on.png");

	$('input[name=product]').val(param);
}

$(document).ready(function(){
 //üũ�ڽ�����
	var $chkArea = $('.js-chk-area'); // üũ�ڽ� ����
	
	/* üũ�ڽ� Ŭ���� �̹��� ���� */
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

	var $rdArea = $('.js-rd-area input'); // ������ư ����
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
//	üũ�ڽ��ʱ�ȭ
	$('.js-chkbox').prop("checked",false);
});

$(function () {
	//����ó placeholder
	$('.ph_phone').placeholder({ 
		type: 'background', 
		background: '<%=cdnURL%>/images/pop/form/ph_phone.png'
	}); 
	$('.ph_phone').css('background-position', '20px 20px');
	//�ּ� placeholder
	$('.ph_address').placeholder({ 
		type: 'background', 
		background: '<%=cdnURL%>/images/pop/form/ph_address.png'
	}); 
	$('.ph_address').css('background-position', '20px 20px');
	$('.ph_address2').placeholder({ 
		type: 'background', 
		background: '<%=cdnURL%>/images/pop/form/ph_address2.png'
	}); 
	$('.ph_address2').css('background-position', '20px 20px');
});
</script>
<!-- End Analytics -->
<style type="text/css">
html{width:100%; height:100%;}
body{width:100%; height:100%; margin:0; padding:0; font-size:12px; color:#666; font-family:'���� ���','Malgun Gothic','Gothic','sans-serif';}
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

#wrap{width:900px; height:auto; position:relative; margin:0 auto;}
.event_wrap{width:900px;}
.event_wrap .event_top{position:relative; width:900px; height:409px; background:#fddc2f url('<%=cdnURL%>/images/bg_event_top.jpg') top center no-repeat; text-align:center;}
.event_wrap .event_top .logo{position:absolute; top:20px; right:20px; z-index:5;}
.event_wrap .event_top .stl{padding:58px 0 30px 0px;}
.event_wrap .event_top h2{padding:0 0 22px 0;}

.event_wrap .mov_cont{width:900px; height:771px; background:#fddc2f url('<%=cdnURL%>/images/bg_mov_cont.jpg') top center no-repeat;;}
.event_wrap .mov_cont .mov_area{position:relative; width:684px; margin:0 auto;}
.event_wrap .mov_cont .mov_area .l_corner{position:absolute; top:0; left:0;}
.event_wrap .mov_cont .mov_area .r_corner{position:absolute; top:0; right:0;}
.event_wrap .mov_cont .btn{width:211px; margin:0 auto; padding-top:17px;}

.event_wrap .info_cont{width:900px; height:625px; background:#fff url('<%=cdnURL%>/images/bg_info_cont.jpg') top center no-repeat;}
.event_wrap .info_cont h3{width:447px; margin:0 auto; padding:0 0 32px 0;}
.event_wrap .info_cont ul.participation_step{width:644px; margin:0 auto; overflow:hidden;}
.event_wrap .info_cont ul.participation_step li{float:left; margin-right:52px;}
.event_wrap .info_cont ul.participation_step li.gap_none{margin:0;}

.event_wrap .info_cont ul.event_info{width:644px; margin:0 auto; margin-top:58px; overflow:hidden;}
.event_wrap .info_cont ul.event_info li{float:left; width:422px; margin-bottom:11px;}
.event_wrap .info_cont ul.event_info li dl{overflow:hidden;}
.event_wrap .info_cont ul.event_info li dl dt{float:left; width:72px; margin-right:6px; vertical-align:top;}
.event_wrap .info_cont ul.event_info li dl dd{float:left; margin-top:3px; vertical-align:top; }
.event_wrap .info_cont ul.event_info li.event_info3 dl dd{margin-top:2px;}

.event_wrap .prod_cont{width:900px; height:1695px; background:#f8f8f2 url('<%=cdnURL%>/images/bg_prod_cont.jpg') top center no-repeat; text-align:center;}
.event_wrap .prod_cont h3{padding-left:23px;}
.event_wrap .prod_cont .prod_box{position:relative; width:740px; margin:0 auto; margin-top:54px;}
.event_wrap .prod_cont .prod_box a,.event_wrap .prod_cont .prod_box img{display:block; width:100%; height:100%;}
.event_wrap .prod_cont .prod_box .prod1{position:absolute; width:333px; height:452px; top:28px; left:0;}
.event_wrap .prod_cont .prod_box .prod2{position:absolute; width:333px; height:442px; top:517px; left:0;}
.event_wrap .prod_cont .prod_box .prod3{position:absolute; width:333px; height:393px; top:991px; left:0;}
.event_wrap .prod_cont .prod_box .prod4{position:absolute; width:370px; height:382px; top:0; left:370px;}
.event_wrap .prod_cont .prod_box .prod5{position:absolute; width:370px; height:266px; top:434px; left:370px;}
.event_wrap .prod_cont .prod_box .prod6{position:absolute; width:321px; height:431px; top:743px; left:370px;}
.event_wrap .prod_cont .prod_box .prod7{position:absolute; width:370px; height:319px; top:1209px; left:370px;}


.event_wrap .event_bottom{width:900px; height:170px; background:#eee;}
.event_wrap .event_bottom ul{width:800px; margin:0 auto; padding-top:34px; overflow:hidden;}
.event_wrap .event_bottom ul li{float:left;}
.event_wrap .event_bottom ul li.event_notice1{width:496px;}
.event_wrap .event_bottom ul li dl{}
.event_wrap .event_bottom ul li dl dt{margin-bottom:13px;}
.event_wrap .event_bottom ul li dl dd{}

/* �˾�:����ó��*/
#png_bg{position:absolute; top:0; left:0; width:100%; height:100%; filter:alpha(opacity=70); opacity:0.70; background-color:#000; z-index:98;}

/* �˾�:���� */
#pop_game{position:absolute; top:50px; left:50%; margin-left:-320px; width:640px; height:1100px; z-index:99; background:#fdf7f9 url('<%=cdnURL%>/images/pop/bg_pop_game.jpg') top center no-repeat;}
#pop_game .btn_close{position:absolute; top:20px; right:20px; z-index:999;}
#pop_game .pop_header{width:640px; margin:0 auto; }
#pop_game .pop_header .tl{width:479px; margin:0 auto; padding:49px 0 30px 0;}
#pop_game .pop_header .txt{width:401px; margin:0 auto;}
#pop_game .pop_cont{width:640px; position:relative;}
#pop_game .pop_cont .prod_img{width:640px; padding-top:179px}
#pop_game .pop_cont .slider{width:480px; margin:0 auto;}
#pop_game .pop_cont .slider ul li{margin:0 5px;}
#pop_game .pop_cont .slider .bx-wrapper{max-width:480px !important; margin:0 !important;}
#pop_game .pop_cont .slider .bx-wrapper .bx-viewport{border:none; background:none; box-shadow:none; left:0;}
#pop_game .pop_cont .slider .bx-wrapper .bx-controls-direction a{margin-top:-19px; width:31px; height:38px}
#pop_game .pop_cont .slider .bx-wrapper .bx-prev{left:-42px; background:url('<%=cdnURL%>/images/pop/slide_prev.png') 0 0 no-repeat;}
#pop_game .pop_cont .slider .bx-wrapper .bx-next{right:-40px; background:url('<%=cdnURL%>/images/pop/slide_next.png') 0 0 no-repeat;}

#pop_game .pop_footer{width:640px; padding-top:30px;}
#pop_game .pop_footer .btn{width:251px; margin:0 auto;}



/* �˾�:���������Է� */
#pop_entry{position:absolute; top:50px; left:50%; margin-left:-320px; width:640px; height:1350px; z-index:99; background:#fbf5f7 url('<%=cdnURL%>/images/pop/bg_pop.jpg') top center no-repeat;}
#pop_entry .btn_close{position:absolute; top:20px; right:20px; z-index:999;}
#pop_entry .pop_header{width:640px; margin:0 auto; }
#pop_entry .pop_header .tl{width:479px; margin:0 auto; padding:49px 0 29px 0;}
#pop_entry .pop_header .txt{width:550px; margin:0 auto;}

#pop_entry .pop_cont{width:640px; margin:0 auto; padding:207px 0 47px 0;}
#pop_entry .pop_cont .form_box{width:540px; margin:0 auto;}
#pop_entry .pop_cont .form_box dl{width:540px; margin:0 auto; margin-bottom:15px; overflow:hidden;}
#pop_entry .pop_cont .form_box dl dt{float:left; width:108px;}
#pop_entry .pop_cont .form_box dl dt img{padding-top:20px; vertical-align:middle;}
#pop_entry .pop_cont .form_box dl dd{float:left; width:432px;}
#pop_entry .pop_cont .form_box dl dd input{height:66px; padding:0 10px; font-size:26px; font-weight:bold; border:none; line-height:64px; background:#fff; color:#939393; vertical-align:middle;
-webkit-border-radius:10px;
-moz-border-radius:10px;
-ms-border-radius:10px;
-o-border-radius:10px;
border-radius:10px;
}
#pop_entry .pop_cont .form_box dl.input_name dd input{width:412px;}
#pop_entry .pop_cont .form_box dl.input_phone dd input{width:412px;}
#pop_entry .pop_cont .form_box dl.input_post{margin-bottom:10px;}
#pop_entry .pop_cont .form_box dl.input_post dd input{width:260px; margin:0 10px 0 0;}
#pop_entry .pop_cont .form_box dl.input_post dd img{cursor:pointer;}
#pop_entry .pop_cont .form_box dl.input_address{margin:0;}
#pop_entry .pop_cont .form_box dl.input_address dt{text-indent:-999em;}
#pop_entry .pop_cont .form_box dl.input_address dd input{width:411px; margin:0 0 10px 0;}

#pop_entry .pop_cont .agree_policy{position:relative; width:540px; margin:0 auto;}
#pop_entry .pop_cont .agree_policy .agree-area{width:540px; overflow:hidden; padding:20px 0 0 0;}
#pop_entry .pop_cont .agree_policy .agree-area .js-chk-area{float:left; width:377px; height:46px; cursor:pointer;}
#pop_entry .pop_cont .agree_policy .agree-area .js-chk-area input.chkBox {position: absolute; top:22px; left:12px; }
#pop_entry .pop_cont .agree_policy .agree-area .js-chk-area label.js-agree {cursor:pointer; display:block; padding-top:4px;}
#pop_entry .pop_cont .agree_policy .agree-area .js-chk-area span img{padding:8px 0 0 16px;}
#pop_entry .pop_cont .agree_policy .agree-area .js-chk-area input{width:0; height:0; border:0; visibility:hidden;}
#pop_entry .pop_cont .agree_policy .agree-first{padding:26px 0 0 0;}
#pop_entry .pop_cont .agree_policy .agree-area .btn-area{float:right; display:inline;}
#pop_entry .pop_cont .btn{position:relative; text-align:center; margin-top:45px;}
#pop_entry .pop_cont .btn .loading{position:absolute; top:0; left:195px; width:251px; height:71px; text-align:center; filter:alpha(opacity=60); opacity:0.60; background-color:#000; overflow:hidden;}
#pop_entry .pop_cont .btn .loading img{padding-top:11px;}

#pop_entry .pop_footer{width:640px;}
#pop_entry .pop_footer .notice{padding:39px 0 0 46px;}


/* �˾�:sns���� */
#pop_sns{position:absolute; top:50px; left:50%; margin-left:-320px; width:640px; height:1250px; z-index:99; background:url('<%=cdnURL%>/images/pop/bg_pop_sns.jpg') top center no-repeat;}
#pop_sns .btn_close{position:absolute; top:20px; right:20px; z-index:999;}
#pop_sns .pop_header{width:640px; margin:0 auto; }
#pop_sns .pop_header .tl{width:479px; margin:0 auto; padding:49px 0 35px 0;}
#pop_sns .pop_header .txt{width:335px; margin:0 auto;}
#pop_sns .pop_cont{width:640px; padding-top:166px;}
#pop_sns .pop_cont .txt{width:439px; margin:0 auto;}
#pop_sns .pop_footer {position:relative; width:640px;}
#pop_sns .pop_footer ul{width:256px; margin:0 auto; overflow:hidden; padding:37px 0 26px 0}
#pop_sns .pop_footer ul li{width:112px; float:left; margin:0 8px;}
#pop_sns .pop_footer .loading{position:absolute; top:37px; left:192px; width:256px; height:115px; text-align:center; filter:alpha(opacity=60); opacity:0.60; background-color:#000; overflow:hidden;}
#pop_sns .pop_footer .loading img{padding-top:32px;}
#pop_sns .pop_footer .txt{text-align:center;}
#pop_sns .pop_footer .btn{width:251px; margin:0 auto; margin-top:67px;}

</style>
</head>
<body>
<div id="wrap">
	<div style="position:absolute; top:0; left:0; z-index:999;display:none;">
		<input type="button" value="����" onclick="openPop('pop_game');">
		<input type="button" value="�������� �Է�" onclick="openPop('pop_entry');">
		<input type="button" value="sns����" onclick="openPop('pop_sns');">
	</div>

	<div class="event_wrap">
 
		<div class="event_top">
			<div class="logo"><a href="http://www.thefaceshop.com/"><img src="<%=cdnURL%>/images/tfs_logo.png" alt="THE FACE SHOP"></a></div>
			<div class="stl"><img src="<%=cdnURL%>/images/stl_event_top.png" alt="��/��/��/��"></div>
			<h2><img src="<%=cdnURL%>/images/tl_event_top.png" alt="�����̽��� X īī�������� ���� PICK UP ����"></h2>
			<p class="txt"><img src="<%=cdnURL%>/images/txt_event_top.png" alt="�����̽��� x īī�������� �ݶ� ������ ���� �������� PICK UP �ϼ���!"></p>
		</div><!-- event_top -->

		<div class="mov_cont">
			<div class="mov_area">
				<div class="l_corner"><img src="<%=cdnURL%>/images/mov_l_corner.png" alt=""></div>
				<div class="r_corner"><img src="<%=cdnURL%>/images/mov_r_corner.png" alt=""></div>
				<iframe width="684" height="384" src="https://www.youtube.com/embed/3-RiOjbP55U?wmode=transparent&rel=0" frameborder="0" allowfullscreen></iframe>
			</div>
			<div class="btn"><a href="javascript:goEntry();" class="ga-event" data-action="PICK UP"><img src="<%=cdnURL%>/images/btn_pickup.png" alt="PICK UP"></a></div>
		</div>

		<div class="info_cont">
			<h3><img src="<%=cdnURL%>/images/tl_info_cont.png" alt="<���� PICK UP ����> ��ȳ�"></h3>
			<ul class="participation_step">
				<li><img src="<%=cdnURL%>/images/participation_step1.png" alt="step1 ���� �÷��� �� PICK UP ��ư Ŭ��"></li>
				<li><img src="<%=cdnURL%>/images/participation_step2.png" alt="step2 �������� ���� ������ PICK UP"></li>
				<li class="gap_none"><img src="<%=cdnURL%>/images/participation_step3.png" alt="step3 �������� �Է� �� SNS ����"></li>
			</ul>
			<ul class="event_info">
				<li>
					<dl>
						<dt><img src="<%=cdnURL%>/images/tl_event_info1.png" alt="��Ⱓ"></dt>
						<dd><img src="<%=cdnURL%>/images/txt_event_info1.png" alt="2016�� 3�� 16��(��) ~ 4�� 5��(ȭ)"></dd>
					</dl>
				</li>
				<li>
					<dl>
						<dt><img src="<%=cdnURL%>/images/tl_event_info2.png" alt="��÷��ǥ"></dt>
						<dd><img src="<%=cdnURL%>/images/txt_event_info2.png" alt="2016�� 4�� 11��(��)"></dd>
					</dl>
				</li>
				<li class="event_info3">
					<dl>
						<dt><img src="<%=cdnURL%>/images/tl_event_info3.png" alt="��÷����"></dt>
						<dd><img src="<%=cdnURL%>/images/txt_event_info3.png" alt="1�� �ݶ� ����ǰ(8��) + īī�������� ������(����) / 5��, 2�� �ݶ� 3��(����) + īī�������� �ǱԾ� 2��(����) / 10��, 3�� ���� PICK�� �ݶ� ��ǰ(�÷� ����) / 100��"></dd>
					</dl>
				</li>
			</ul>
		</div>
		<!-- //info_cont -->


		<div class="prod_cont">
			<h3><img src="<%=cdnURL%>/images/tl_prod_cont.png" alt="�����̽����� ��� īī������� �Ұ��մϴ�"></h3>
			<!-- <p><img src="<%=cdnURL%>/images/txt_prod_cont.png" alt="�����̽����� ��� īī������� �Ұ��մϴ�"></p> -->
			<div class="prod_box">
				<div class="prod1"><a href="http://www.thefaceshop.com/mall/product/product-view.jsp?dpid=AF004472" target="_blank" class="ga-event" data-action="[�ڼ�������]���� �÷� ��ũ����"><img src="<%=cdnURL%>/images/blank.gif" alt="���� �÷� ��ũ����"></a></div>
				<div class="prod2"><a href="http://www.thefaceshop.com/mall/product/product-view.jsp?dpid=AF004456" target="_blank" class="ga-event" data-action="[�ڼ�������]ĳ���� ����ũ"><img src="<%=cdnURL%>/images/blank.gif" alt="ĳ���� ����ũ"></a></div>
				<div class="prod3"><a href="http://www.thefaceshop.com/mall/product/product-view.jsp?dpid=AF004459" target="_blank" class="ga-event" data-action="[�ڼ�������]�ҿ� ���"><img src="<%=cdnURL%>/images/blank.gif" alt="�ҿ� ���"></a></div>
				<div class="prod4"><a href="javascript:alert('�غ����Դϴ�');" class="ga-event" data-action="[�ڼ�������]����� ������"><img src="<%=cdnURL%>/images/blank.gif" alt="����� ������"></a></div>
				<div class="prod5"><a href="http://www.thefaceshop.com/mall/product/product-view.jsp?dpid=AF004463" target="_blank" class="ga-event" data-action="[�ڼ�������]���Ƿ� ��� ����"><img src="<%=cdnURL%>/images/blank.gif" alt="���Ƿ� ��� ����"></a></div>
				<div class="prod6"><a href="http://www.thefaceshop.com/brand/community/event-view.jsp?seq=162" target="_blank" class="ga-event" data-action="[�ڼ�������]�� �ɾ�"><img src="<%=cdnURL%>/images/blank.gif" alt="�� �ɾ�"></a></div>
				<div class="prod7"><a href="http://www.thefaceshop.com/mall/product/product-view.jsp?dpid=AF004469" target="_blank" class="ga-event" data-action="[�ڼ�������]���ϸ� ��Ǿ �ڵ�ũ��"><img src="<%=cdnURL%>/images/blank.gif" alt="���ϸ� ��Ǿ �ڵ�ũ��"></a></div>
			<!-- 	<div class="prod8"><a href="#" class="ga-event" data-action="[�ڼ�������]���ϸ� ��Ǿ �ڵ�ũ�� 5��"><img src="<%=cdnURL%>/images/blank.gif" alt="���ϸ� ��Ǿ �ڵ�ũ�� 5��"></a></div> -->
			</div>
		</div>

		<div class="event_bottom">
			<ul>
				<li class="event_notice1">
					<dl>
						<dt><img src="<%=cdnURL%>/images/tl_event_notice1.png" alt="�̺�Ʈ ���ǻ���"></dt>
						<dd><img src="<%=cdnURL%>/images/txt_event_notice1.png" alt="�̺�Ʈ ���ǻ��� ����"></dd>
					</dl>
				</li>
				<li class="event_notice2">
					<dl>
						<dt><img src="<%=cdnURL%>/images/tl_event_notice2.png" alt="��ǰ ���� ���ǻ���"></dt>
						<dd><img src="<%=cdnURL%>/images/txt_event_notice2.png" alt="��ǰ ���� ���ǻ��� ����"></dd>
					</dl>
				</li>
			</ul>
		</div>
	</div><!-- event_wrap -->


	<!-- �˾�:����ó�� -->
	<div id="png_bg" style="display:none;"></div>


	<!-- �˾�:���� -->
	<div id="pop_game" style="display:none;">
		<div class="btn_close"><a href="javascript:closePop('pop_game');"><img src="<%=cdnURL%>/images/pop/btn_close.png" alt="�ݱ�"></a></div>
		<div class="pop_header">
			<div class="tl"><img src="<%=cdnURL%>/images/pop/tl_pop.png" alt="��/��/��/�� ���� PICK UP ����"></div>
			<div class="txt"><img src="<%=cdnURL%>/images/pop/txt_pop_game.png" alt="�������� ���� �������� PICK ���ּ���"></div>
		</div>
		<div class="pop_cont">
			<div class="prod_img"><img src="<%=cdnURL%>/images/pop/game_represent.jpg" alt="��ǰ�̹���"></div>
			<div class="slider">
				<ul class="bxslider">
					<li><a href="javascript:change_prod('1');" class="ga-event" data-action="product1 Ŭ��"><img src="<%=cdnURL%>/images/pop/game_btn1.png" alt="" class="production1"></a></li>
					<li><a href="javascript:change_prod('2');" class="ga-event" data-action="product2 Ŭ��"><img src="<%=cdnURL%>/images/pop/game_btn2.png" alt="" class="production2"></a></li>
					<li><a href="javascript:change_prod('3');" class="ga-event" data-action="product3 Ŭ��"><img src="<%=cdnURL%>/images/pop/game_btn3.png" alt="" class="production3"></a></li>
					<li><a href="javascript:change_prod('4');" class="ga-event" data-action="product4 Ŭ��"><img src="<%=cdnURL%>/images/pop/game_btn4.png" alt="" class="production4"></a></li>
					<li><a href="javascript:change_prod('5');" class="ga-event" data-action="product5 Ŭ��"><img src="<%=cdnURL%>/images/pop/game_btn5.png" alt="" class="production5"></a></li>
					<li><a href="javascript:change_prod('6');" class="ga-event" data-action="product6 Ŭ��"><img src="<%=cdnURL%>/images/pop/game_btn6.png" alt="" class="production6"></a></li>
					<li><a href="javascript:change_prod('7');" class="ga-event" data-action="product7 Ŭ��"><img src="<%=cdnURL%>/images/pop/game_btn7.png" alt="" class="production7"></a></li>
					<li><a href="javascript:change_prod('8');" class="ga-event" data-action="product8 Ŭ��"><img src="<%=cdnURL%>/images/pop/game_btn8.png" alt="" class="production8"></a></li>
				</ul>
			</div>
		</div>
		<!-- //pop_cont -->

		<div class="pop_footer">
			<div class="btn"><a href="javascript:choiceComplete();" class="ga-event" data-action="pick up �Ϸ�"><img src="<%=cdnURL%>/images/pop/btn_pickup_ok.png" alt="pick up �Ϸ�"></a></div>
		</div>
	</div>
	<!-- //�˾�:���� -->



	<!-- �˾�:���������Է� -->
	<div id="pop_entry" style="">
		<div class="btn_close"><a href="javascript:closePop('pop_entry');"><img src="<%=cdnURL%>/images/pop/btn_close.png" alt="�ݱ�"></a></div>
		<div class="pop_header">
			<div class="tl"><img src="<%=cdnURL%>/images/pop/tl_pop.png" alt="��/��/��/�� ���� PICK UP ����"></div>
			<div class="txt"><img src="<%=cdnURL%>/images/pop/txt_pop_entry.png" alt="�̺�Ʈ ��÷ �� ����� ���� ���������� �Է����ּ���."></div>
		</div>
		<div class="pop_cont">
			<form name="frm" id="frm" method="post" action="<%=actionURL%>" class="ga-event" data-action="��û�Ϸ�">
				<input type="hidden" name="channel" value="web" />
				<input type="hidden" name="addressType" />
				<input type="hidden" name="product" value="" />
				<div class="form_box">
				<dl class="input_name">
					<dt><img src="<%=cdnURL%>/images/pop/form/input_name.png" alt="�̸�"></dt>
					<dd><input type="text" name="name" id="name" maxlength="5" class="ph_name"></dd>
				</dl>
				<dl class="input_phone">
					<dt><img src="<%=cdnURL%>/images/pop/form/input_phone.png" alt="����ó"></dt>
					<dd><input type="tel" name="mobile" id="mobile" class="ph_phone" maxlength="11"></dd>
				</dl>
				<dl class="input_post">
					<dt><img src="<%=cdnURL%>/images/pop/form/input_post.png" alt="�����ȣ"></dt>
					<dd class="input_post"><input type="text" name="zipcode" class="ph_zipcode" id="zipcode" readOnly><img class="btn_search" src="<%=cdnURL%>/images/pop/form/btn_search.png" alt="�˻�"   onclick="test2()"></dd>
				</dl>
				<dl class="input_address">
					<dt>�ּ�</dt>
					<dd><input type="text" name="address" class="ph_address" id="addr1"><br><input type="text" name="address2" class="ph_address2" id="addr2" maxlength="50"></dd>
				</dl>
			</div>
				<div class="agree_policy">
					<div class="agree-area agree-first">
						<div class="js-chk-area chk-area" id="agree1">
							<input class="js-chkbox chkBox" id="chkbox_agree1" type="checkbox" name="chkbox_agree1"  value="Y">
							<label class="js-agree" for="chkbox_agree1"><img src="<%=cdnURL%>/images/pop/form/chk_off.png" alt=" " id="chk_agree1" class="agreeImg"><span><img src="<%=cdnURL%>/images/pop/form/policy_txt01.png" alt="�������� ���� �̿뿡 ���� ����"></span></label>
						</div>
						<div class="btn-area"><a href="javascript:pop_privacy('1')"><img src="<%=cdnURL%>/images/pop/form/btn_policy.png" alt="�ڼ��� ����"></a></div>
					</div>
					<div class="agree-area ">
						<div class="js-chk-area chk-area" id="agree2">
							<input class="js-chkbox chkBox" id="chkbox_agree2" type="checkbox" name="chkbox_agree2"  value="Y">
							<label class="js-agree" for="chkbox_agree2"><img src="<%=cdnURL%>/images/pop/form/chk_off.png" alt=" " id="chk_agree2" class="agreeImg"><span><img src="<%=cdnURL%>/images/pop/form/policy_txt02.png" alt="�������� ��� ��Ź ����"></span></label>
						</div>
						<div class="btn-area"><a href="javascript:pop_privacy('2')"><img src="<%=cdnURL%>/images/pop/form/btn_policy.png" alt="�ڼ��� ����"></a></div>
					</div>
					<div class="agree-area ">
						<div class="js-chk-area chk-area" id="agree3">
							<input class="js-chkbox chkBox" id="chkbox_agree3" type="checkbox" name="chkbox_agree3"  value="Y">
							<label class="js-agree" for="chkbox_agree3"><img src="<%=cdnURL%>/images/pop/form/chk_off.png" alt=" " id="chk_agree3" class="agreeImg"><span><img src="<%=cdnURL%>/images/pop/form/policy_txt03.png" alt="���? ���� ��� ����"></span></label>
						</div>
						<div class="btn-area"><a href="javascript:pop_privacy('3')"><img src="<%=cdnURL%>/images/pop/form/btn_policy.png" alt="�ڼ��� ����"></a></div>
					</div>
				</div>
				<div class="btn">
					<input type="image" src="<%=cdnURL%>/images/pop/form/btn_entry.png" name="" alt="��û�Ϸ�">
					<div class="loading" style="display:none;"><img src="<%=cdnURL%>/images/pop/loading.gif" alt="loading"></div>
				</div>
			</form>
		</div>
		<div class="pop_footer">
			<div class="notice"><img src="<%=cdnURL%>/images/pop/notice_pop_entry.png" alt="�Է��Ͻ� ���������� ��ǰ ��� �� ������ ���� �뵵�θ� ���˴ϴ�./ ���� �� �Է��� ���� �� �ּ����� ���� �Ұ��մϴ�. / ������� ����ġ�� ���� ������� å������ �ʽ��ϴ�."></a></div>
		</div>
	</div>
	<!-- //�˾�:���������Է� -->



	<!-- �˾�:sns���� -->
	<div id="pop_sns" style="display:none;">
		<div class="btn_close"><a href="javascript:closePop('pop_sns');"><img src="<%=cdnURL%>/images/pop/btn_close.png" alt="�ݱ�"></a></div>
		<div class="pop_header">
			<div class="tl"><img src="<%=cdnURL%>/images/pop/tl_pop.png" alt="��/��/��/�� ���� PICK UP ����"></div>
			<div class="txt"><img src="<%=cdnURL%>/images/pop/txt_pop_sns.png" alt="��Ϸ� ��÷���� ���Ͻ� �޴��� ��ȣ�� 4�� 11�Ͽ� ���� �ȳ��˴ϴ�."></div>
		</div>
		<div class="pop_cont">
			<div id="snsProduct"></div>
		</div> 
		<div class="pop_footer">
			<ul>
				<li><a href="javascript:shareKS();" class="ga-event" data-action="īī�����丮"><img src="<%=cdnURL%>/images/pop/sns_kakaostory.png" alt="īī�����丮"></a></li>
				<li><a href="javascript:shareF();" class="ga-event" data-action="���̽���"><img src="<%=cdnURL%>/images/pop/sns_facebook.png" alt="���̽���"></a></li>
			</ul>
			<div class="loading" style="display:none;"><img src="<%=cdnURL%>/images/pop/loading.gif" alt="loading"></div>
			<p class="txt"><img src="<%=cdnURL%>/images/pop/txt_sns_share.png" alt="SMS ������ ��÷ Ȯ���� �ö󰡿�"></p>
			<div class="btn"><a href="javascript:closePop('pop_sns');" class="ga-event" data-action="��ũ���˾� Ȯ��"><img src="<%=cdnURL%>/images/pop/btn_signup.png" alt="Ȯ��"></a></div>
		</div>
	</div>
	<!-- //�˾�:sns���� -->

</div><!-- // wrap -->
</body>
</html>