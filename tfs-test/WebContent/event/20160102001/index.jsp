<%@ page contentType="text/html; charset=UTF-8" errorPage="/m/mall/error/error.jsp"%>
<%@ page import="java.util.*,
		com.efusioni.stone.utils.*,
			com.efusioni.stone.utils.*,
			com.efusioni.stone.common.*,
			com.efusioni.stone.exception.*,
			com.thefaceshop.front.service.event.*,
			com.thefaceshop.front.common.*" %>
<%
	out.clear();

	String cdnURL = "http://image.ethefaceshop.com/tfsshopWebSrc/event/20160102001";
	String rootURL = "http://image.ethefaceshop.com/tfsshopWebSrc/event";
	if (request.getServerName().equals("dev.thefaceshop.com")) {
		cdnURL = "/event/20160102001";
		rootURL = "/event";
	}

	String today = Utils.getTimeStampString("yyyyMMdd");
	String endday = "20160107";

	boolean saleEndDay = false;
	if (today.compareTo(endday) >= 0){
		saleEndDay = true;
	}


%><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<title>THEFACESHOP</title>
<script type="text/javascript" src="<%=rootURL%>/js/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="<%=rootURL%>/js/jquery.jjung.googleAnalytics.js"></script>
	
<script type="text/javascript">

// 화면제어
function goPosition(flag){
	// 아이프레임 부모페이지 스크롤제어
	var scrollTop = $(window).scrollTop();
	parent.$('html, body').animate({scrollTop:flag});
}

function openPop(flag){
	$('#png_bg').show();
	$('#'+flag).show();
	goPosition(3815);
}
function closePop(flag){
	$('#png_bg').hide();
	$('#'+flag).hide();
}

$(function() {

	$.ga('UA-31551710-3'); 
	$('.ga-event').tracking('20160102001-sale');

	// 세일 마지막날
	if (<%=saleEndDay%>){
		
		$('.top_area').css('background','url(<%=cdnURL%>/images/event_img1_2.jpg) 0 0 no-repeat');
	}
	
	var hashCode = document.location.hash;
	if (hashCode == '#salePop'){
		goPage('goBonus');
	}
});


var prodUrl1 = 'http://www.thefaceshop.com/mall/product/product-view.jsp?dpid=AF00';

function goPage(flag){

	$.ga.logAction('20160102001-sale', flag);

	if( flag == 'thefaceshop'){
		var pop = window.open('/index.jsp');
	}else if( flag == 'brandSite'){
		var pop = window.open('/index.jsp');
	}else if( flag == 'goFacebook'){
		var pop = window.open('https://www.facebook.com/thefaceshop.official');
		pop.focus();
	}else if( flag == 'goKAKAO'){
		alert('카카오톡에서 더페이스샵과 플러스 친구 맺고,\n 다양한 이벤트를 만나보세요!');
	}else if( flag == 'goSale'){
		var pop = window.open('/index.jsp');
		pop.focus();
	}else if( flag == 'searchStore'){
		var pop = window.open('/brand/store/list.jsp');
		pop.focus();
	}else if( flag == 'goBonus'){
		openPop('pop_view');
	}else if( flag == 'hotDealDetail'){
		var pop = window.open('http://www.thefaceshop.com/mall/etc/search.jsp?topSearchType=s_keyword&searchWord=janhotdeal', 'event');
		pop.focus();
	}else if( flag == 'product1_1'){
		var pop = window.open(prodUrl1+'3113'); // 숫자만 바꿔주세요
		pop.focus();
	}else if( flag == 'product1_2'){
		var pop = window.open(prodUrl1+'2266');
		pop.focus();
	}else if( flag == 'product1_3'){
		var pop = window.open(prodUrl1+'2476');
		pop.focus();
	}else if( flag == 'product1_4'){
		var pop = window.open(prodUrl1+'2697');
		pop.focus();
	}else if( flag == 'product2_1'){
		var pop = window.open(prodUrl1+'2738');
		pop.focus();
	}else if( flag == 'product2_2'){
		var pop = window.open(prodUrl1+'2749');
		pop.focus();
	}else if( flag == 'product3_1'){
		var pop = window.open(prodUrl1+'3761');
		pop.focus();
	}else if( flag == 'product3_2'){
		var pop = window.open(prodUrl1+'3743');
		pop.focus();
	}else if( flag == 'product3_3'){
		alert('준비중입니다.');
		//var pop = window.open(prodUrl1+'');
		//pop.focus();
	}else if( flag == 'product3_4'){
		var pop = window.open(prodUrl1+'3762');
		pop.focus();
	}else if( flag == 'product3_5'){
		var pop = window.open(prodUrl1+'3736');
		pop.focus();
	}else if( flag == 'product3_6'){
		var pop = window.open(prodUrl1+'3763');
		pop.focus();
	}else if( flag == 'product3_7'){
		var pop = window.open(prodUrl1+'3764');
		pop.focus();
	}else if( flag == 'product3_8'){
		var pop = window.open(prodUrl1+'3726');
		pop.focus();
	}else if( flag == 'product4_1'){
		var pop = window.open(prodUrl1+'2270');
		pop.focus();
	}else if( flag == 'product4_2'){
		var pop = window.open(prodUrl1+'2269');
		pop.focus();
	}else if( flag == 'product4_3'){
		var pop = window.open(prodUrl1+'2272');
		pop.focus();
	}else if( flag == 'product4_4'){
		var pop = window.open(prodUrl1+'2252');
		pop.focus();
	}else if( flag == 'product5_1'){
		var pop = window.open(prodUrl1+'3109');
		pop.focus();
	}else if( flag == 'product5_2'){
		var pop = window.open(prodUrl1+'2469');
		pop.focus();
	}else if( flag == 'product5_3'){
		var pop = window.open(prodUrl1+'2520');
		pop.focus();
	}else if( flag == 'product5_4'){
		var pop = window.open(prodUrl1+'2528');
		pop.focus();
	}else if( flag == 'product6_1'){
		var pop = window.open(prodUrl1+'2768');
		pop.focus();
	}else if( flag == 'product6_2'){
		var pop = window.open(prodUrl1+'2755');
		pop.focus();
	}else if( flag == 'product6_3'){
		var pop = window.open(prodUrl1+'3411');
		pop.focus();
	}else if( flag == 'product7_1'){
		var pop = window.open(prodUrl1+'34200742');
		pop.focus();
	}else if( flag == 'product7_2'){
		var pop = window.open(prodUrl1+'34200751');
		pop.focus();
	}else if( flag == 'product7_3'){
		alert('준비중입니다.');
	}else if( flag == 'product8_1'){
		var pop = window.open(prodUrl1+'3758');
		pop.focus();
	}else if( flag == 'product8_2'){
		var pop = window.open(prodUrl1+'3759');
		pop.focus();
	}else if( flag == 'product8_3'){
		var pop = window.open(prodUrl1+'3648');
		pop.focus();
	}else if( flag == 'product8_4'){
		var pop = window.open(prodUrl1+'3649');
		pop.focus();
	}else if( flag == 'product8_5'){
		var pop = window.open(prodUrl1+'3651');
		pop.focus();
	}else if( flag == 'product8_6'){
		var pop = window.open(prodUrl1+'3652');
		pop.focus();
	}
}

// test
function pubTest(){
	$('.product_area img').css('opacity','0.35');
	$('.product_area img:even').css('background-color','red');
	$('.product_area img:odd').css('background-color','green');

	$('.product_area2 img').css('opacity','0.35');
	$('.product_area2 img:even').css('background-color','red');
	$('.product_area2 img:odd').css('background-color','green');
}

</script>
<!-- End Analytics -->
<style type="text/css">
/* common */
img{border:0px;  line-height:0px; vertical-align:top; font-size:0;}
form, div, ul, li, form, input, table, th, tr, td, img, p, dl, dt, dd, a{margin:0; padding:0;}
ul, li{list-style:none;}
h1, h2{display:none; width:0; height:0; margin:0; padding:0; line-height:0; font-size:0;}
.skip{display:none; width:0; height:0; font-size:0; line-height:0;}

body{margin:0; padding:0; font-size:11px; background:#d9dce8; font-family:'Dotum';}

.body_bg{position:relative; width:auto; height:5300px; margin:0 auto; background:#d9dce8 url('<%=cdnURL%>/images/event_bg.jpg') center top no-repeat;}
.body_bg .notice_wrap{position:relative; width:1000px; height:100%; margin:0 auto;}

.body_bg .notice_wrap .top_area{position:relative; width:100%; height:634px; background:url('<%=cdnURL%>/images/event_img1.jpg') 0 0 no-repeat; overflow:hidden;}
.body_bg .notice_wrap .top_area .btn_logo{position:absolute; top:8px; left:-7px; z-index:5;}
.body_bg .notice_wrap .top_area .btn_logo img{width:148px; height:34px;}
.body_bg .notice_wrap .top_area .btn_group{position:absolute; top:9px; right:0px; z-index:5;}
.body_bg .notice_wrap .top_area .btn_group ul{}
.body_bg .notice_wrap .top_area .btn_group ul li{float:left; width:40px; text-align:center; margin:0 0 0 12px;}
.body_bg .notice_wrap .top_area .btn_sale{position:absolute; top:404px; left:146px; z-index:5;}
.body_bg .notice_wrap .top_area .btn_sale img{width:264px; height:63px;}

.body_bg .notice_wrap .banner_area{position:relative; width:100%; height:340px; background:url('<%=cdnURL%>/images/event_banner.jpg') -1px 0 no-repeat; overflow:hidden;}
.body_bg .notice_wrap .banner_area .btn_event{position:absolute; top:0px; left:0px; z-index:5;}
.body_bg .notice_wrap .banner_area .btn_event img{width:1000px; height:310px;}

.body_bg .notice_wrap .product_area{position:relative; width:100%; height:2633px; background:url('<%=cdnURL%>/images/event_img2.jpg') -1px 0 no-repeat; overflow:hidden;}
.body_bg .notice_wrap .product_area img{}
.body_bg .notice_wrap .product_area div{float:left;}
.body_bg .notice_wrap .product_area a{float:left;}

.body_bg .notice_wrap .product_area .group1{position:absolute; top:107px; left:0px; width:1000px; height:275px; z-index:5;}
.body_bg .notice_wrap .product_area .group1 img{width:250px; height:275px;}

.body_bg .notice_wrap .product_area .group2{position:absolute; top:422px; left:250px; width:750px; height:283px; z-index:5;}
.body_bg .notice_wrap .product_area .group2 img{width:375px; height:283px;}

.body_bg .notice_wrap .product_area .group3{position:absolute; top:840px; left:0; width:1000px; height:315px; z-index:5;}
.body_bg .notice_wrap .product_area .group3 img{width:250px; height:315px;}

.body_bg .notice_wrap .product_area .group4{position:absolute; top:1585px; left:0; width:1000px; height:283px; z-index:5;}
.body_bg .notice_wrap .product_area .group4 img{width:250px; height:275px;}

.body_bg .notice_wrap .product_area .group5{position:absolute; top:1995px; left:0; width:1000px; height:318px; z-index:5;}
.body_bg .notice_wrap .product_area .group5 img{width:250px; height:275px;}

.body_bg .notice_wrap .product_area .group6{position:absolute; top:2310px; left:250px; width:750px; height:293px; z-index:5;}
.body_bg .notice_wrap .product_area .group6 img{width:250px; height:284px;}

.body_bg .notice_wrap .product_area .group7{position:absolute; top:2436px; left:250px; width:1000px; height:300px; z-index:5;}
.body_bg .notice_wrap .product_area .group7 img{width:250px; height:278px;}
.body_bg .notice_wrap .product_area .group7 .product7_1{padding-top:30px;}
.body_bg .notice_wrap .product_area .group7 .product7_1 img{height:248px;}
.body_bg .notice_wrap .product_area .group7 .product7_2{padding-top:30px;}
.body_bg .notice_wrap .product_area .group7 .product7_2 img{height:248px;}

.body_bg .notice_wrap .product_area2{position:relative; width:100%; height:700px; background:url('<%=cdnURL%>/images/event_img3.jpg') 0 0 no-repeat; overflow:hidden;}
.body_bg .notice_wrap .product_area2 img{}
.body_bg .notice_wrap .product_area2 div{float:left;}
.body_bg .notice_wrap .product_area2 a{float:left;}

.body_bg .notice_wrap .product_area2 .group8{position:absolute; top:90px; left:0px; width:1000px; height:1366px; z-index:5;}
.body_bg .notice_wrap .product_area2 .group8 img{width:190px; height:162px;}
.body_bg .notice_wrap .product_area2 .group8 .product8_1 img{width:1000px; height:410px;}
.body_bg .notice_wrap .product_area2 .group8 .product8_2 img{width:190px;}
.body_bg .notice_wrap .product_area2 .group8 .product8_3 img{width:190px;}
.body_bg .notice_wrap .product_area2 .group8 .product8_4 img{width:200px;}
.body_bg .notice_wrap .product_area2 .group8 .product8_5 img{width:205px;}
.body_bg .notice_wrap .product_area2 .group8 .product8_6 img{width:215px;}


.body_bg .notice_wrap .coupon_area{position:relative; width:100%; height:666px; background:url('<%=cdnURL%>/images/event_img4.jpg') 0 0 no-repeat; overflow:hidden;}
.body_bg .notice_wrap .coupon_area .btn_coupon{position:absolute; top:181px; left:655px; z-index:5;}
.body_bg .notice_wrap .coupon_area .btn_coupon img{width:285px; height:38px;}


.body_bg .notice_wrap .bottom_area{position:relative; width:100%; height:327px; background:url('<%=cdnURL%>/images/event_img5.jpg') 0 0 no-repeat; overflow:hidden;}
.body_bg .notice_wrap .bottom_area .btn_store{position:absolute; top:60px; left:828px; z-index:5;}
.body_bg .notice_wrap .bottom_area .btn_store img{width:142px; height:40px;}
.body_bg .notice_wrap .bottom_area .btn_fb{position:absolute; top:245px; left:829px; z-index:5;}
.body_bg .notice_wrap .bottom_area .btn_fb img{width:159px; height:40px;}


.body_bg #png_bg{position:absolute; top:0px; left:0px; width:100%; height:100%; filter:alpha(opacity=75); opacity:0.75; background-color:#000; z-index:10;}
.body_bg #pop_view{position:absolute; top:3940px; left:50%; margin-left:-274px; width:585px; height:768px; z-index:20;}
.body_bg #pop_view .btn_close{position:absolute; top:148px; right:0px; z-index:30;}

</style>
</head>
<body>
<h1>12월 SALE</h1>
<div class="body_bg">
	<div class="notice_wrap">
		<div class="top_area">
			<div class="btn_logo"><a href="javascript:goPage('thefaceshop'); "><img src="<%=cdnURL%>/images/blank.gif" alt="THEFACESHOP" /></a></div>
			<div class="btn_group">
				<ul>
					<li><a href="javascript:goPage('goFacebook');"><img src="<%=cdnURL%>/images/icon_f.png" alt="facebook" /></a></li>
					<li><a href="javascript:goPage('goKAKAO');"><img src="<%=cdnURL%>/images/icon_kakao.png" alt="KAKAO TALK" /></a></li>
					<li><a href="javascript:goPage('brandSite');"><img src="<%=cdnURL%>/images/icon_home.png" alt="HOME" /></a></li>
				</ul>
			</div>
			<div class="btn_sale"><a href="javascript:goPage('goSale');"><img src="<%=cdnURL%>/images/blank.gif" alt="SALE 자세히 보기" /></a></div>
		</div>
		<div class="banner_area">
			<div class="btn_event"><a href="javascript:goPage('hotDealDetail');"><img src="<%=cdnURL%>/images/blank.gif" alt="신청하기" /></a></div>
		</div>
		
		<div class="product_area">
			<div class="group1">
				<div class="product1_1"><a href="javascript:goPage('product1_1');"><img src="<%=cdnURL%>/images/blank.gif" alt="자세히 보기" /></a></div>
				<div class="product1_2"><a href="javascript:goPage('product1_2');"><img src="<%=cdnURL%>/images/blank.gif" alt="자세히 보기" /></a></div>
				<div class="product1_3"><a href="javascript:goPage('product1_3');"><img src="<%=cdnURL%>/images/blank.gif" alt="자세히 보기" /></a></div>
				<div class="product1_4"><a href="javascript:goPage('product1_4');"><img src="<%=cdnURL%>/images/blank.gif" alt="자세히 보기" /></a></div>
			</div>
			<div class="group2">
				<div class="product2_1"><a href="javascript:goPage('product2_1');"><img src="<%=cdnURL%>/images/blank.gif" alt="자세히 보기" /></a></div>
				<div class="product2_2"><a href="javascript:goPage('product2_2');"><img src="<%=cdnURL%>/images/blank.gif" alt="자세히 보기" /></a></div>
			</div>
			<div class="group3">
				<div class="product3_1"><a href="javascript:goPage('product3_1');"><img src="<%=cdnURL%>/images/blank.gif" alt="자세히 보기" /></a></div>
				<div class="product3_2"><a href="javascript:goPage('product3_2');"><img src="<%=cdnURL%>/images/blank.gif" alt="자세히 보기" /></a></div>
				<div class="product3_3"><a href="javascript:goPage('product3_3');"><img src="<%=cdnURL%>/images/blank.gif" alt="자세히 보기" /></a></div>
				<div class="product3_4"><a href="javascript:goPage('product3_4');"><img src="<%=cdnURL%>/images/blank.gif" alt="자세히 보기" /></a></div>
				<div class="product3_5"><a href="javascript:goPage('product3_5');"><img src="<%=cdnURL%>/images/blank.gif" alt="자세히 보기" /></a></div>
				<div class="product3_6"><a href="javascript:goPage('product3_6');"><img src="<%=cdnURL%>/images/blank.gif" alt="자세히 보기" /></a></div>
				<div class="product3_7"><a href="javascript:goPage('product3_7');"><img src="<%=cdnURL%>/images/blank.gif" alt="자세히 보기" /></a></div>
				<div class="product3_8"><a href="javascript:goPage('product3_8');"><img src="<%=cdnURL%>/images/blank.gif" alt="자세히 보기" /></a></div>
			</div>
			<div class="group4">
				<div class="product4_1"><a href="javascript:goPage('product4_1');"><img src="<%=cdnURL%>/images/blank.gif" alt="자세히 보기" /></a></div>
				<div class="product4_2"><a href="javascript:goPage('product4_2');"><img src="<%=cdnURL%>/images/blank.gif" alt="자세히 보기" /></a></div>
				<div class="product4_3"><a href="javascript:goPage('product4_3');"><img src="<%=cdnURL%>/images/blank.gif" alt="자세히 보기" /></a></div>
				<div class="product4_4"><a href="javascript:goPage('product4_4');"><img src="<%=cdnURL%>/images/blank.gif" alt="자세히 보기" /></a></div>
			</div>
			<div class="group5">
				<div class="product5_1"><a href="javascript:goPage('product5_1');"><img src="<%=cdnURL%>/images/blank.gif" alt="자세히 보기" /></a></div>
				<div class="product5_2"><a href="javascript:goPage('product5_2');"><img src="<%=cdnURL%>/images/blank.gif" alt="자세히 보기" /></a></div>
				<div class="product5_3"><a href="javascript:goPage('product5_3');"><img src="<%=cdnURL%>/images/blank.gif" alt="자세히 보기" /></a></div>
				<div class="product5_4"><a href="javascript:goPage('product5_4');"><img src="<%=cdnURL%>/images/blank.gif" alt="자세히 보기" /></a></div>
			</div>
			<div class="group6">
				<div class="product6_1"><a href="javascript:goPage('product6_1');"><img src="<%=cdnURL%>/images/blank.gif" alt="자세히 보기" /></a></div>
				<div class="product6_2"><a href="javascript:goPage('product6_2');"><img src="<%=cdnURL%>/images/blank.gif" alt="자세히 보기" /></a></div>
				<div class="product6_3"><a href="javascript:goPage('product6_3');"><img src="<%=cdnURL%>/images/blank.gif" alt="자세히 보기" /></a></div>
			</div>
			<!-- <div class="group7">
				<div class="product7_1"><a href="javascript:goPage('product7_1');"><img src="<%=cdnURL%>/images/blank.gif" alt="자세히 보기" /></a></div>
				<div class="product7_2"><a href="javascript:goPage('product7_2');"><img src="<%=cdnURL%>/images/blank.gif" alt="자세히 보기" /></a></div>
				<div class="product7_3"><a href="javascript:goPage('product7_3');"><img src="<%=cdnURL%>/images/blank.gif" alt="자세히 보기" /></a></div>
			</div> -->
		</div>
		<div class="product_area2">
			<div class="group8">
				<div class="product8_1"><a href="javascript:goPage('product8_1');"><img src="<%=cdnURL%>/images/blank.gif" alt="자세히 보기" /></a></div>
				<div class="product8_2"><a href="javascript:goPage('product8_2');"><img src="<%=cdnURL%>/images/blank.gif" alt="자세히 보기" /></a></div>
				<div class="product8_3"><a href="javascript:goPage('product8_3');"><img src="<%=cdnURL%>/images/blank.gif" alt="자세히 보기" /></a></div>
				<div class="product8_4"><a href="javascript:goPage('product8_4');"><img src="<%=cdnURL%>/images/blank.gif" alt="자세히 보기" /></a></div>
				<div class="product8_5"><a href="javascript:goPage('product8_5');"><img src="<%=cdnURL%>/images/blank.gif" alt="자세히 보기" /></a></div>
				<div class="product8_6"><a href="javascript:goPage('product8_6');"><img src="<%=cdnURL%>/images/blank.gif" alt="자세히 보기" /></a></div>
			</div>
		</div>
		<div class="coupon_area">
			<div class="btn_coupon"><a href="javascript:goPage('goBonus');"><img src="<%=cdnURL%>/images/blank.gif" alt="쿠폰 사용 방법 확인" /></a></div>
		</div>
		<div class="bottom_area">
			<div class="btn_store"><a href="javascript:goPage('searchStore');"><img src="<%=cdnURL%>/images/blank.gif" alt="매장 찾기" /></a></div>
			<div class="btn_fb"><a href="javascript:goPage('goFacebook');"><img src="<%=cdnURL%>/images/blank.gif" alt="facebook 바로가기" /></a></div>
		</div>
	</div>
	
	<!-- popup group -->
	<div id="png_bg" style="display:none"></div>
	<div id="pop_view" style="display:none">
		<div class="btn_close"><a href="javascript:closePop('pop_view')"><img src="<%=cdnURL%>/images/btn_close.png" alt="닫기" /></a></div>
		<div class="cont_view"><img src="<%=cdnURL%>/images/pop_gift.png" alt="" /></div>
	</div>
</div>
</body>
</html>