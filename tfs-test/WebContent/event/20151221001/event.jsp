<%@ page contentType="text/html; charset=UTF-8" errorPage="/mall/error/error.jsp"%>
<%@ page import="java.util.*" %>
<%
	out.clear();
	String cdnURL = "http://image.ethefaceshop.com/tfsshopWebSrc/event/20151221001";
	String rootURL = "http://image.ethefaceshop.com/tfsshopWebSrc/event";
	String entryActionURL = "https://" + request.getServerName() + ":343/event/20151221001/entry.jsp";
	String sharingSubmitURL = "https://" + request.getServerName() + ":343/event/20151221001/entry.jsp";
	if (request.getServerName().equals("dev.thefaceshop.com")) {
		cdnURL = "/event/20151221001";
		rootURL = "/event";
		entryActionURL = "/event/20151221001/entry.jsp";
	} else {
		response.setHeader("Access-Control-Allow-Origin", "https://www.thefaceshop.com:343/");
	}
%>
<!doctype html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1">
    <meta name="viewport" content="width=640, user-scalable=no">
    <meta http-equiv="Expires" content="-1">
    <meta http-equiv="Pragma" content="no-cache">
    <meta http-equiv="Cache-Control" content="No-Cache">
    <!-- cache -->
    <title>더페이스샵</title>
    <link rel="stylesheet" href="http://fonts.googleapis.com/earlyaccess/notosanskr.css">
    <script type="text/javascript" src="<%=rootURL%>/js/jquery-1.11.1.min.js"></script>
    <script type="text/javascript" src="<%=rootURL%>/js/jquery-ui-1.10.3.min.js"></script>
    <script type="text/javascript" src="<%=rootURL%>/js/jquery.validate.min.js"></script>
    <script type="text/javascript" src="<%=rootURL%>/js/jquery.form.js"></script>
    <script type="text/javascript" src="<%=rootURL%>/js/additional-methods.min.js"></script>
    <script type="text/javascript" src="<%=rootURL%>/js/jquery.shy4blue.placeholder.js"></script>
	<script type="text/javascript" src="<%=rootURL%>/js/kakao-1.0.47.min.js"></script>
    <script type="text/javascript" src="<%=rootURL%>/js/knockout-3.3.0.js"></script>
    <script type="text/javascript" src="<%=rootURL%>/js/knockout.mapping-latest.js"></script>
    <script type="text/javascript" src="<%=rootURL%>/js/common.lsr.js"></script>
    <!-- event -->
    <script src="http://cdnjs.cloudflare.com/ajax/libs/jqueryui-touch-punch/0.2.2/jquery.ui.touch-punch.min.js"></script>
    <script type="text/javascript" src="<%=cdnURL%>/js/jquery.timer.js"></script>
    <script type="text/javascript" src="<%=cdnURL%>/js/timer-demo.js"></script>
    <script type="text/javascript" src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
    <script type="text/javascript">
        // 개인정보 수집방침 팝업
        function pop_privacy(flag) {
            //logAction('개인정보 수집방침');
            window.open('policy' + flag + '.jsp', 'pop_privacy' + flag, 'width=660, height=720, location=yes, scrollbars=no');
        }

        // 레이어팝업 열기
        function openPop(param) {
            var wrapH = $('#wrap').height();
            $('#png_bg').css('height', wrapH);
            $('#png_bg').show();
            $('#' + param).show();
            $('html, body').animate({ scrollTop: 0 });
        }

        // 레이어팝업 닫기
        function closePop(param) {
            $('#png_bg').hide();
            $('#' + param).hide();
        }

        // 게임function =======================================================================================

        // 게임 페이지 초기화
        function game1init(flag) {
            if (flag == 'restart') {
                openPop('pop_drag');
            }
        }

        // start 버튼 클릭
        function start() {
            openPop('pop_drag');
        }
        // 실패시 재시작 버튼 클릭
        function restart() {
            document.location.reload();
        }

        $(function () {
            game1init('');
        });

        // 게임ui =============================================================================================

        var game_count = 0;

        $(function () {

        });

        $(document).ready(function () {
            //체크박스제어
            var $chkArea = $('.js-chk-area'); // 체크박스 영역

            /* 체크박스 클릭시 이미지 변경 */
            $chkArea.each(function () {
                $(this).on('click', function () {
                    var agree_id = $(this).attr("id");
                    var chkbox_id = "chkbox_" + agree_id;

                    if ($('#' + chkbox_id).prop("checked") == true) {
                        //                alert("Checkbox is checked.");
                        $("#chk_" + agree_id).attr("src", "<%=cdnURL%>/images/chk_off.png");
                        $('#' + chkbox_id).prop("checked", false);
                    }
                    else if ($('#' + chkbox_id).prop("checked") == false) {
                        //                alert("Checkbox is unchecked.");
                        $("#chk_" + agree_id).attr("src", "<%=cdnURL%>/images/chk_on.png");
                        $('#' + chkbox_id).prop("checked", true);
                    }
                });
            });
        });

        //placeholder
        $(function () {
            //연락처 placeholder
            $('.ph_phone').placeholder({
                type: 'background',
                background: '<%=cdnURL%>/images/ph_phone.png'
            });
            $('.ph_phone').css('background-position', '15px 15px');
            //주소 placeholder
            $('.ph_address').placeholder({
                type: 'background',
                background: '<%=cdnURL%>/images/ph_address.png'
            });
            $('.ph_address').css('background-position', '15px 15px');
            //주소 placeholder
            $('.ph_address2').placeholder({
                type: 'background',
                background: '<%=cdnURL%>/images/ph_address2.png'
            });
            $('.ph_address2').css('background-position', '15px 15px');
        });
    </script>
	<style>
		/*common*/
		html{width:100%; height:100%;}
		body{width:100%; height:100%; margin:0; padding:0; font-size:12px; color:#333333; font-family:"Malgun Gothic", "돋움", "Dotum", "Arial";}
		img{border:0; line-height:0; vertical-align:top;}
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


		#wrap{position:relative; width:900px; margin:0 auto;}
		.event_wrap {width:900px; margin:0 auto;}
		.event_wrap .event_header{position:relative; width:900px; margin:0 auto; height:905px; background:url('<%=cdnURL%>/images/bg_event_header.jpg') top center no-repeat;}
		.event_wrap .event_header .logo{position:absolute; top:22px; left:20px;}
		.event_wrap .event_header .flag{width:385px; margin:0 auto; padding-top:59px;}
		.event_wrap .event_header h3{width:519px; margin:0 auto; padding-top:29px;}
		.event_wrap .event_header .txt{width:526px; margin:0 auto; padding-top:35px;}
		.event_wrap .event_header .btn{width:331px; margin:0 auto; padding-top:383px;}
		.event_wrap .event_cont{width:900px; margin:0 auto;}
		.event_wrap .event_cont .mov_area{width:900px; margin:0 auto; height:508px;}
		.event_wrap .event_cont .mov_area h4{width:423px; margin:0 auto;}
		.event_wrap .event_cont .mov_area .mov_cont{width:900px; margin:0 auto;}
		.event_wrap .event_cont .process_area{width:900px; margin:0 auto; height:432px; background:url('<%=cdnURL%>/images/bg_process_area.jpg') top center no-repeat;}
		.event_wrap .event_cont .process_area ul{width:694px; margin:0 auto; padding-top:71px;}
		.event_wrap .event_cont .process_area ul li{margin-bottom:20px;}
		.event_wrap .event_cont .process_area ul li	dl{overflow:hidden;}
		.event_wrap .event_cont .process_area ul li	dt{float:left; width:116px;}
		.event_wrap .event_cont .process_area ul li	dd{float:left;}
		.event_wrap .event_cont .process_area ul li.process1{margin-bottom:49px;}
		.event_wrap .event_cont .process_area ul li.process1 dt{padding-top:11px;}
		.event_wrap .event_cont .process_area ul li.process2{margin-bottom:18px;}
		.event_wrap .event_cont .process_area ul li.process2 dd{margin-top:1px;}
		.event_wrap .event_cont .process_area ul li.process3{margin-bottom:18px;}
		.event_wrap .event_cont .process_area ul li.process3 dd{margin-top:1px;}
		.event_wrap .event_cont .process_area ul li.process4{}
		.event_wrap .event_cont .process_area ul li.process4 dd{margin-top:1px;}
		.event_wrap .event_footer{width:900px; height:245px; margin:0 auto; background:#ecece9;}
		.event_wrap .event_footer .notice{padding:41px 0 0 105px;}

		/* 팝업:딤드처리*/
		#png_bg{position:absolute; top:0; left:0; width:100%; height:100%; filter:alpha(opacity=70); opacity:0.70; background-color:#000; z-index:98;}

		/* 팝업 : 드래그 */
		#pop_drag{position:absolute; top:170px; left:50%; margin-left:-300px; width:600px; height:900px; z-index:99;}
		#pop_drag .btn_close{position:absolute; top:20px; right:20px; z-index:999;}
		#pop_drag .pop_header{width:600px; height:268px; margin:0 auto; background:url('<%=cdnURL%>/images/bg_pop_drag.jpg') top center no-repeat;}
		#pop_drag .pop_header .tl{width:371px; margin:0 auto; padding-top:71px;}
		#pop_drag .pop_header .txt{width:380px; margin:0 auto; padding:20px 0 0 0;}
		#pop_drag .cont{width:600px; height:712px; position:relative; text-align:center; overflow:hidden; background:url('<%=cdnURL%>/images/bg_drag_cont.jpg') top center no-repeat;}
		#pop_drag .cont .basket_area{width:346px; height:173px; position:absolute; top:334px; left:126px; z-index:998;}
		#pop_drag .cont .object_area{width:600px; height:480px; position:absolute; top:0; left:0;}
		#pop_drag .cont .object_area #draggable1{width:89px; height:90px; position:absolute; top:13px; left:18px;}
		#pop_drag .cont .object_area #draggable2{width:73px; height:74px; position:absolute; top:141px; left:30px;}
		#pop_drag .cont .object_area #draggable3{width:90px; height:90px; position:absolute; top:277px; left:11px;}
		#pop_drag .cont .object_area #draggable4{width:75px; height:78px; position:absolute; top:383px; left:48px;}
		#pop_drag .cont .object_area #draggable5{width:115px; height:114px; position:absolute; top:58px; left:107px;}
		#pop_drag .cont .object_area #draggable6{width:89px; height:90px; position:absolute; top:210px; left:101px;}
		#pop_drag .cont .object_area #draggable7{width:89px; height:90px; position:absolute; top:140px; left:205px;}
		#pop_drag .cont .object_area #draggable8{width:115px; height:114px; position:absolute; top:76px; right:183px;}
		#pop_drag .cont .object_area #draggable9{width:89px; height:90px; position:absolute; top:38px; right:19px;}
		#pop_drag .cont .object_area #draggable10{width:119px; height:114px; position:absolute; top:132px; right:69px;}
		#pop_drag .cont .object_area #draggable11{width:89px; height:90px; position:absolute; top:250px; right:32px;}
		#pop_drag .cont .object_area #draggable12{width:77px; height:74px; position:absolute; top:360px; right:42px;}
		#pop_drag .cont .object_area>div img{cursor:pointer;}
		#pop_drag .cont .object_area .draggable {z-index:999;}
		#pop_drag .cont .object_area .draged {z-index:997;}
		#pop_drag .cont .object_area .object_area .ui-widget-content{border:0; background:transparent;}
		#pop_drag .pop_drag_txt{width:514px; margin:0 auto;}
		#pop_drag .upgrade_btn{width:312px; margin:0 auto; padding-top:30px;}
		#pop_drag .upgrade_btn img{cursor:pointer;}


		/* 팝업:개인정보 입력 */
		#pop_entry{position:absolute; top:170px; left:50%; margin-left:-300px; width:600px; height:937px; z-index:99;}
		#pop_entry .btn_close{position:absolute; top:20px; right:20px; z-index:999;}
		#pop_entry .pop_header{width:600px; height:307px; margin:0 auto; background:url('<%=cdnURL%>/images/bg_pop_entry.jpg') top center no-repeat;}
		#pop_entry .pop_header .tl{width:371px; margin:0 auto; padding-top:71px;}
		#pop_entry .pop_header .txt{width:380px; margin:0 auto; padding:22px 0 0 0;}
		#pop_entry .pop_cont{width:600px; margin:0 auto; padding-top:41px; background:#f2ede4;}
		#pop_entry .pop_cont .form_box{width:477px; margin:0 auto;} 
		#pop_entry .pop_cont .form_box dl{width:477px; margin:0 auto; margin-bottom:10px; overflow:hidden;}
		#pop_entry .pop_cont .form_box dl dt{float:left; width:84px;}
		#pop_entry .pop_cont .form_box dl dt img{padding-top:14px; vertical-align:middle;}
		#pop_entry .pop_cont .form_box dl dd{float:left; width:392px; margin:0;}
		#pop_entry .pop_cont .form_box dl dd input{font-weight:bold; border:none; background:#d9cbb2; color:#91846d; font-family:'Noto Sans KR', sans-serif;}
		#pop_entry .pop_cont .form_box dl.input_name dd input{width:372px; height:50px; padding:0 10px; line-height:48px; font-size:22px; vertical-align:middle;}
		#pop_entry .pop_cont .form_box dl.input_phone dd input{width:372px; height:50px; padding:0 10px; line-height:48px; font-size:22px; vertical-align:middle;}
		#pop_entry .pop_cont .form_box dl.input_address {margin-bottom:39px;}
		#pop_entry .pop_cont .form_box dl.input_address dd.input_post input{width:270px; height:50px; margin:0 0 10px 0; padding:0 10px;  line-height:48px ; font-size:22px; vertical-align:middle;}
		#pop_entry .pop_cont .form_box dl.input_address dd.input_post img{vertical-align:top; border:0; margin:0 0 0 9px; cursor:pointer;}
		#pop_entry .pop_cont .form_box dl.input_address dd input{width:372px; height:50px; margin:0 0 10px 84px; padding:0 10px; line-height:48px; font-size:22px; vertical-align:middle;}
		#pop_entry .pop_cont .agree_policy{position:relative; width:477px; margin:0 auto; border-top:1px solid #aea89e;}
		#pop_entry .pop_cont .agree_policy .agree-area{width:477px; overflow:hidden; margin:7px 0 0 0;}
		#pop_entry .pop_cont .agree_policy .agree-area .js-chk-area{float:left; width:340px; height:35px; cursor:pointer;}
		#pop_entry .pop_cont .agree_policy .agree-area .js-chk-area input.chkBox {position: absolute; top:22px; left:12px; }
		#pop_entry .pop_cont .agree_policy .agree-area .js-chk-area label.js-agree {cursor:pointer; display:block;}
		#pop_entry .pop_cont .agree_policy .agree-area .js-chk-area span img{padding:8px 0 0 13px; vertical-align:top;}
		#pop_entry .pop_cont .agree_policy .agree-area .js-chk-area input{width:0; height:0; border:0; visibility:hidden;}
		#pop_entry .pop_cont .agree_policy .agree-first{margin:29px 0 0 0;}
		#pop_entry .pop_cont .agree_policy .agree-area .btn-area{float:right; display:inline;}
		#pop_entry .btn{position:relative; text-align:center; padding:52px 0 40px 0;}
		#pop_entry .btn .loading{position:absolute; top:52px; left:196px; width:208px; height:58px; text-align:center; filter:alpha(opacity=60); opacity:0.60; background-color:#000; overflow:hidden;}
		#pop_entry .btn .loading img{padding-top:5px;}

		#pop_entry .pop_footer{width:600px; height:156px; background:#c2b395;}
		#pop_entry .pop_footer div{padding:40px 0 0 62px;}


		/* 팝업:결과 */
		#pop_result{position:absolute; top:170px; left:50%; margin-left:-300px; width:600px; height:937px; z-index:99;}
		#pop_result .btn_close{position:absolute; top:20px; right:20px; z-index:999;}
		#pop_result .pop_header{width:600px; height:211px; margin:0 auto; background:url('<%=cdnURL%>/images/bg_pop_result.jpg') top center no-repeat; text-align:center;}
		#pop_result .pop_header .tl_t{padding-top:76px;}
		#pop_result .pop_header .tl_t img{margin:0 8px;}
		#pop_result .pop_header .tl_t span{font-weight:500; line-height:52px; color:#fff; font-size:39px; font-family:'Noto Sans KR', sans-serif; vertical-align: top; letter-spacing:-2px;}
		#pop_result .pop_header .tl_t span.username{display:inline-block; height:50px; line-height:52px; border-bottom:1px solid #f6ed63; color:#f6ed63; font-size:39px; font-family:'Noto Sans KR', sans-serif; vertical-align: top; letter-spacing:-2px;}


		#pop_result .pop_header .tl_b{padding-top:20px;}
		#pop_result .pop_cont{width:600px; background:#f2ede4;}
		#pop_result .pop_cont .result_area{width:505px; margin:0 auto; padding-top:40px;}
		#pop_result .pop_cont .prod_area{position:relative; width:600; margin:0 auto;}
		#pop_result .pop_cont .prod_area .product{}
		#pop_result .pop_cont .prod_area .btn{position:absolute; top:167px; left:309px;}
		#pop_result .pop_footer {width:600px; height:125px; background:#e2d9c7; overflow:hidden;}
		#pop_result .pop_footer .share_area{float:left; padding:25px 48px 0 58px;}
		#pop_result .pop_footer .share_area ul{overflow:hidden;}
		#pop_result .pop_footer .share_area ul li{float:left; margin:0 5px;}
		#pop_result .pop_footer .btn{ display:inline-block; float:left; padding:30px 0 0 0;}
	</style>
</head>
<body>
	<div id="fb-root"></div>
	<script>
		window.fbAsyncInit = function () {
			FB.init({
				appId: '831264976953532', // App ID
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
        <div style="position:absolute; top:0; left:0; z-index:999;">
            <input type="button" value="시작" onclick="openPop('pop_drag')">
            <input type="button" value="개인정보 입력" onclick="openPop('pop_entry');">
            <input type="button" value="결과" onclick="openPop('pop_result');">
        </div>

        <div class="event_wrap">
            <div class="event_header">
                <h2 class="logo"><a href="http://www.isaknox.co.kr/" target="_blank"><img src="<%=cdnURL%>/images/logo.png" alt="THE FACE SHOP"></a></h2>
                <div class="flag"><img src="<%=cdnURL%>/images/event_flag.png" alt="Renewal Grand Open Event"></div>
                <h3><img src="<%=cdnURL%>/images/tl_event_header.png" alt="당신의 아름다움, 자연에 모든 답이 있다 테라피를 부탁해"></h3>
				<p class="txt"><img src="<%=cdnURL%>/images/txt_event_header.png" alt="단단한 껍질 속 따가운 가시 너머까지 더 좋은 자연을 찾아내고, 세심한 손길과 정성을 더해 완성한 내추럴 테라피즘‘나’를 위해 준비된 내추럴 테라피를 찾아보세요."></p>
				<div class="btn"><a href="javascript:openPop('pop_drag');"><img src="<%=cdnURL%>/images/btn_my_therapy.png" alt="나의 테라피 찾기"></a></div>
            </div>
            <div class="event_cont">
                <div class="mov_area">
                    <div class="mov_cont"><iframe width="900" height="508" src="https://www.youtube.com/embed/LH-MVtZW7fU" frameborder="0" allowfullscreen></iframe></div>
                </div>
                <div class="process_area">
                    <ul>
                        <li class="process1">
                            <dl>
                                <dt><img src="<%=cdnURL%>/images/tl_process1.png" alt="참여방법"></dt>
                                <dd><img src="<%=cdnURL%>/images/txt_proces1.png" alt="STEP 1.피부고민 키워드를 선택해 테라피 케이스로 드래그 / STEP 2. 개인정보 입력 후 나에게 맞는 테라피 확인 / STEP 3. 당첨자에게 개별 연락 후 제품 배송"></dd>
                            </dl>
                        </li>
                        <li class="process2">
                            <dl>
                                <dt><img src="<%=cdnURL%>/images/tl_process2.png" alt="참여 기간"></dt>
                                <dd><img src="<%=cdnURL%>/images/txt_proces2.png" alt="15.12.22 (화) ~ 16.01.11 (월)"></dd>
                            </dl>
                        </li>
                        <li class="process3">
                            <dl>
                                <dt><img src="<%=cdnURL%>/images/tl_process3.png" alt="당첨 발표"></dt>
                                <dd><img src="<%=cdnURL%>/images/txt_proces3.png" alt="16.01.19 (화)"></dd>
                            </dl>
                        </li>
                        <li class="process4">
                            <dl>
                                <dt><img src="<%=cdnURL%>/images/tl_process4.png" alt="이벤트 선물"></dt>
                                <dd><img src="<%=cdnURL%>/images/txt_proces4.png" alt="자연 성분 별 대표 제품 *각 자연 성분 별 50명 (총 300명)"></dd>
                            </dl>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="event_footer">
                <div class="notice"><img src="<%=cdnURL%>/images/notice_event_footer.png" alt="이벤트 유의사항"></div>
            </div>
        </div>

        <!-- 팝업:딤드처리 -->
        <div id="png_bg" style="display:none;"></div>

        <!-- 팝업 : 드래그 -->
        <div id="pop_drag" style="display:none;">
            <div class="btn_close"><a href="javascript:closePop('pop_drag'),restart();"><img src="<%=cdnURL%>/images/btn_close.png" alt="닫기"></a></div>
            <div class="pop_header">
                <div class="tl"><img src="<%=cdnURL%>/images/tl_pop_entry.png" alt="당신의 아름다움, 자연에 모든 답이 있다 테라피를 부탁해"></div>
                <div class="txt"><img src="<%=cdnURL%>/images/txt_pop_drag.png" alt="지금 가지고 있는 피부고민을 드래그하여 나에게 필요한 테라피를 확인해보세요!"></div>
            </div>
            <div class="cont" id="dragArea">
				<!-- 		<div id="droppable" class="ui-widget-header tl_area" >
								<div><img src="<%=cdnURL%>/images/bg_dragicon.png" alt=""></div>
							</div> -->
                <div id="basket" class="basket_area">
                    <img src="<%=cdnURL%>/images/bg_dragicon.png" alt="">
                </div>
                <div class="object_area">
                    <div id="draggable1" class="ui-widget-content draggable" data-val="1" data-name="예민">
                        <img src="<%=cdnURL%>/images/drag_1.png" alt="예민">
                    </div>
                    <div id="draggable2" class="ui-widget-content  draggable" data-val="2" data-name="민감">
                        <img src="<%=cdnURL%>/images/drag_2.png" alt="민감">
                    </div>
                    <div id="draggable3" class="ui-widget-content  draggable" data-val="3" data-name="칙칙">
                        <img src="<%=cdnURL%>/images/drag_3.png" alt="칙칙">
                    </div>
                    <div id="draggable4" class="ui-widget-content  draggable" data-val="4" data-name="푸석">
                        <img src="<%=cdnURL%>/images/drag_4.png" alt="푸석">
                    </div>
                    <div id="draggable5" class="ui-widget-content  draggable" data-val="5" data-name="흔적">
                        <img src="<%=cdnURL%>/images/drag_5.png" alt="흔적">
                    </div>
                    <div id="draggable6" class="ui-widget-content  draggable" data-val="6" data-name="자국">
                        <img src="<%=cdnURL%>/images/drag_6.png" alt="자국">
                    </div>
                    <div id="draggable7" class="ui-widget-content  draggable" data-val="7" data-name="건조">
                        <img src="<%=cdnURL%>/images/drag_7.png" alt="건조">
                    </div>
                    <div id="draggable8" class="ui-widget-content  draggable" data-val="8" data-name="유분">
                        <img src="<%=cdnURL%>/images/drag_8.png" alt="유분">
                    </div>
                    <div id="draggable9" class="ui-widget-content  draggable" data-val="9" data-name="모공">
                        <img src="<%=cdnURL%>/images/drag_9.png" alt="모공">
                    </div>
                    <div id="draggable10" class="ui-widget-content  draggable" data-val="10" data-name="탄력저하">
                        <img src="<%=cdnURL%>/images/drag_10.png" alt="탄력저하">
                    </div>
                    <div id="draggable11" class="ui-widget-content  draggable" data-val="11" data-name="피지">
                        <img src="<%=cdnURL%>/images/drag_11.png" alt="피지">
                    </div>
                    <div id="draggable12" class="ui-widget-content  draggable" data-val="12" data-name="주름">
                        <img src="<%=cdnURL%>/images/drag_12.png" alt="주름">
                    </div>
                </div>
            </div>
        </div>


        <!-- 팝업:개인정보 입력 -->
        <div id="pop_entry" style="display:none;">
            <div class="btn_close"><a href="javascript:closePop('pop_entry');"><img src="<%=cdnURL%>/images/btn_close.png" alt="닫기"></a></div>
            <div class="pop_header">
                <div class="tl"><img src="<%=cdnURL%>/images/tl_pop_entry.png" alt="당신의 아름다움, 자연에 모든 답이 있다 자연에게 물어봐"></div>
                <div class="txt"><img src="<%=cdnURL%>/images/txt_pop_entry.png" alt="자연에서 다가온 내추럴 테라피 이벤트 소식 받으실 개인정보를 입력해주세요."></div>
            </div>
            <div class="pop_cont">
				<form method="post" action="<%=entryActionURL%>" data-ajax="true" data-ajax-failure="viewModel.failureEntry" data-ajax-method="jsonp" data-ajax-success="viewModel.successEntry" id="frm">
                    <input type="hidden" name="channel" value="WEB">
                    <div class="form_box">
                        <dl class="input_name">
                            <dt><img src="<%=cdnURL%>/images/input_name.png" alt="이름"></dt>
                            <dd><input type="text" name="name" id="name" maxlength="5" class="ph_name"></dd>
                        </dl>
                        <dl class="input_phone">
                            <dt><img src="<%=cdnURL%>/images/input_phone.png" alt="휴대폰번호"></dt>
                            <dd><input type="tel" name="mobile" id="mobile" class="ph_phone" maxlength="11"></dd>
                        </dl>
                        <dl class="input_address">
                            <dt><img src="<%=cdnURL%>/images/input_address.png" alt="받으실 주소"></dt>
                            <dd class="input_post"><input type="text" name="zipcode" class="ph_zipcode" id="zipcode" readOnly><img class="btn_search" src="<%=cdnURL%>/images/btn_search.png" alt="검색" id="openFindzip"></dd>
                            <dd><input type="text" name="address1" class="ph_address" id="addr1"><br><input type="text" name="address2" class="ph_address2" id="addr2" maxlength="50"></dd>
                        </dl>
                    </div>
                    <div class="agree_policy">
                        <div class="agree-area agree-first">
                            <div class="js-chk-area chk-area" id="agree1">
                                <input class="js-chkbox chkBox" id="chkbox_agree1" type="checkbox" name="agree1" value="True">
                                <label class="js-agree" for="chkbox_agree1"><img src="<%=cdnURL%>/images/chk_off.png" alt=" " id="chk_agree1" class="agreeImg"><span><img src="<%=cdnURL%>/images/policy_txt01.png" alt="개인정보 수집 이용에 대한 동의"></span></label>
                            </div>
                            <div class="btn-area"><a href="javascript:pop_privacy('1')"><img src="<%=cdnURL%>/images/btn_policy.png" alt="자세히 보기"></a></div>
                        </div>
                        <div class="agree-area">
                            <div class="js-chk-area chk-area" id="agree2">
                                <input class="js-chkbox chkBox" id="chkbox_agree2" type="checkbox" name="agree2" value="True">
                                <label class="js-agree" for="chkbox_agree2"><img src="<%=cdnURL%>/images/chk_off.png" alt=" " id="chk_agree2" class="agreeImg"><span><img src="<%=cdnURL%>/images/policy_txt02.png" alt="개인정보 취급 위탁 동의"></span></label>
                            </div>
                            <div class="btn-area"><a href="javascript:pop_privacy('2')"><img src="<%=cdnURL%>/images/btn_policy.png" alt="자세히 보기"></a></div>
                        </div>
                        <div class="agree-area">
                            <div class="js-chk-area chk-area" id="agree3">
                                <input class="js-chkbox chkBox" id="chkbox_agree3" type="checkbox" name="isAgreeAgent" value="Y">
                                <label class="js-agree" for="chkbox_agree3"><img src="<%=cdnURL%>/images/chk_off.png" alt=" " id="chk_agree3" class="agreeImg"><span><img src="<%=cdnURL%>/images/policy_txt03.png" alt="광고성 정보 전송 동의"></span></label>
                            </div>
                            <div class="btn-area"><a href="javascript:pop_privacy('3')"><img src="<%=cdnURL%>/images/btn_policy.png" alt="자세히 보기"></a></div>
                        </div>
                    </div>
                    <div class="btn">
                        <input type="image" src="<%=cdnURL%>/images/btn_entry.png" name="" alt="신청하기"></a>
                        <div class="loading" style="display:none;"><img src="<%=cdnURL%>/images/loading.gif" alt="loading"></div>
                    </div>
				</form>
			</div>            
            <div class="pop_footer">
                <div><img src="<%=cdnURL%>/images/pop_entry_notice.png" alt="* 입력하신 개인정보는 경품 배송 및 수령을 위한 용도로만 사용됩니다. / * 응모 시 입력한 정보 및 주소지는 변경 불가합니다. /*  배송정보 불일치로 인한 오배송은 책임지지 않습니다. /"></div>
            </div>
        </div><!-- // pop_entry -->



        <!-- 팝업:결과-->
        <div id="pop_result" style="display:none;">
            <div class="btn_close"><a href="javascript:closePop('pop_result');"><img src="<%=cdnURL%>/images/btn_close.png" alt="닫기"></a></div>
            <div class="pop_header">
				<div class="tl_t"><span>지금 </span><span class="username">다섯글자아</span><span class="result2"> 님에게 필요한<br />내추럴 테라피는 ?</span></div>
            </div>
            <div class="pop_cont">
                <div class="result_area"><img data-bind="attr: { src: '<%=cdnURL%>/images/result' + resultNumber() + '.png' }" src="" alt="결과"></div>
                <div class="prod_area">
                    <div class="product"><img data-bind="attr: { src: '<%=cdnURL%>/images/product' + resultNumber() + '.png' }" src="" alt="제품추천"></div>
                    <div class="btn"><a data-bind="attr: { href: resultProductDetailURL }" href="#"><img src="<%=cdnURL%>/images/btn_prod_line.png" alt="제품 라인 상세보기"></a></div>
                </div>
            </div>
            <div class="pop_footer">
                <div class="share_area">
                    <ul>
                        <li><img src="<%=cdnURL%>/images/facebook.png" alt="결과" data-sns-type="facebook" data-bind="click: shareOnSns, disable: isLoading"></li>
                        <li><img src="<%=cdnURL%>/images/kakaostory.png" alt="결과" data-sns-type="kakaostory" data-bind="click: shareOnSns, disable: isLoading"></li>
                        <li><img src="<%=cdnURL%>/images/kakaotalk.png" alt="결과" data-sns-type="kakaotalk" data-bind="click: shareOnSns, disable: isLoading"></li>
                    </ul>
                </div>
                <div class="btn"><a href="javascript:closePop('pop_result');"><img src="<%=cdnURL%>/images/btn_complete.png" alt="참여완료"></a></div>
            </div>
        </div>

    </div>

    <script type="text/javascript" src="<%=cdnURL%>/js/event.js"></script>
    <script type="text/javascript">
        var viewModel = new RenewalEventViewModel();
        ko.applyBindings(viewModel);

		$(document).ajaxStart(function () {
            $('.loading').show();
            viewModel.isLoading(true);
        });
        $(document).ajaxComplete(function () {
            $('.loading').hide();
            viewModel.isLoading(false);
        });
    </script>
</body>
</html>
