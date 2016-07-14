<%@ page contentType="text/html; charset=UTF-8" %>
<%%>
<!DOCTYPE html>
<html lang="ko">
<head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>샘플 코드</title>
        
</head>
<body>
<script type="text/javascript" src="http://openapi.map.naver.com/openapi/v2/maps.js?clientId=y4l7lqHP9nZPgSyiqQm2"></script>
<script src="/event/js/jquery-1.11.1.min.js"></script>
<script>
	$(function(){
		$('.store').click(function(e){
			e.preventDefault();

			var storeNum = $(this).attr('data-store');
			var storeMapName = 'store' + storeNum + 'Map';
			$('.storeMap').show();
			$('.storeMap').empty();
			$('#' + storeMapName + 'Area').append('<div id="'+storeMapName+'" style="border:1px solid #000;;display:none;"></div>');
			makeMap(storeMapName);
			
			$('#' + storeMapName).slideDown("slow");

		});
	});

</script>
<div class="store" id="store1" data-store="1">매장1</div><br />
<div class="storeMap" id="store1MapArea" style="display:none;"></div><br /><br />
<div class="store" id="store2"  data-store="2">매장2</div><br />
<div class="storeMap" id="store2MapArea" style="display:none;"></div><br /><br />
<div class="store" id="store3"  data-store="3">매장3</div><br />
<div class="storeMap" id="store3MapArea" style="display:none;"></div><br /><br />
<div class="store" id="store4"  data-store="4">매장4</div><br />
<div class="storeMap" id="store4MapArea" style="display:none;"></div><br /><br />
<div class="store" id="store5"  data-store="5">매장5</div><br />
<div class="storeMap"  id="store5MapArea" style="display:none;"></div><br /><br />
<div class="store" id="store6"  data-store="6">매장6</div><br /><div class="storeMap"  id="store6MapArea" style="display:none;"></div><br /><br />
<div class="store" id="store7"  data-store="7">매장7</div><br /><div class="storeMap"  id="store7MapArea" style="display:none;"></div><br /><br />
<div class="store" id="store8"  data-store="8">매장8</div><br /><div class="storeMap"  id="store8MapArea" style="display:none;"></div><br /><br />
<div class="store" id="store9"  data-store="9">매장9</div><br /><div class="storeMap"  id="store9MapArea" style="display:none;"></div><br /><br />
<div class="store" id="store10"  data-store="10">매장10</div><br /><div class="storeMap"  id="store10MapArea" style="display:none;"></div><br /><br />
<div class="store" id="store11"  data-store="11">매장11</div><br /><div class="storeMap"  id="store11MapArea" style="display:none;"></div><br /><br />
<div class="store" id="store12"  data-store="12">매장12</div><br /><div class="storeMap"  id="store12MapArea" style="display:none;"></div><br /><br />
<div class="store" id="store13"  data-store="13">매장13</div><br /><div class="storeMap"  id="store13MapArea" style="display:none;"></div><br /><br />


<script type="text/javascript">
	function makeMap(mapId){
		var oSeoulCityPoint = new nhn.api.map.LatLng(37.5675451, 126.9773356);
		var defaultLevel = 11;
		var oMap = new nhn.api.map.Map(document.getElementById(mapId), { 
										point : oSeoulCityPoint,
										zoom : defaultLevel,
										enableWheelZoom : true,
										enableDragPan : true,
										enableDblClickZoom : false,
										mapMode : 0,
										activateTrafficMap : false,
										activateBicycleMap : false,
										minMaxLevel : [ 1, 14 ],
										size : new nhn.api.map.Size(800, 480)           });
		var oSlider = new nhn.api.map.ZoomControl();
		oMap.addControl(oSlider);
		oSlider.setPosition({
				top : 10,
				left : 10
		});

		var oMapTypeBtn = new nhn.api.map.MapTypeBtn();
		oMap.addControl(oMapTypeBtn);
		oMapTypeBtn.setPosition({
				bottom : 10,
				right : 80
		});
		
		var oThemeMapBtn = new nhn.api.map.ThemeMapBtn();
		oThemeMapBtn.setPosition({
				bottom : 10,
				right : 10
		});
		oMap.addControl(oThemeMapBtn);

		var oBicycleGuide = new nhn.api.map.BicycleGuide(); // - 자전거 범례 선언
		oBicycleGuide.setPosition({
				top : 10,
				right : 10
		}); // - 자전거 범례 위치 지정
		oMap.addControl(oBicycleGuide);// - 자전거 범례를 지도에 추가.

		var oTrafficGuide = new nhn.api.map.TrafficGuide(); // - 교통 범례 선언
		oTrafficGuide.setPosition({
				bottom : 30,
				left : 10
		});  // - 교통 범례 위치 지정.
		oMap.addControl(oTrafficGuide); // - 교통 범례를 지도에 추가.

		var trafficButton = new nhn.api.map.TrafficMapBtn(); // - 실시간 교통 지도 버튼 선언
		trafficButton.setPosition({
				bottom:10, 
				right:150
		}); // - 실시간 교통 지도 버튼 위치 지정
		oMap.addControl(trafficButton);

		var oSize = new nhn.api.map.Size(28, 37);
		var oOffset = new nhn.api.map.Size(14, 37);
		var oIcon = new nhn.api.map.Icon('http://static.naver.com/maps2/icons/pin_spot2.png', oSize, oOffset);

		var oInfoWnd = new nhn.api.map.InfoWindow();
		oInfoWnd.setVisible(false);
		oMap.addOverlay(oInfoWnd);

		oInfoWnd.setPosition({
				top : 20,
				left :20
		});

		var oLabel = new nhn.api.map.MarkerLabel(); // - 마커 라벨 선언.
		oMap.addOverlay(oLabel); // - 마커 라벨 지도에 추가. 기본은 라벨이 보이지 않는 상태로 추가됨.

		oInfoWnd.attach('changeVisible', function(oCustomEvent) {
				if (oCustomEvent.visible) {
						oLabel.setVisible(false);
				}
		});
		
		var oPolyline = new nhn.api.map.Polyline([], {
				strokeColor : '#f00', // - 선의 색깔
				strokeWidth : 5, // - 선의 두께
				strokeOpacity : 0.5 // - 선의 투명도
		}); // - polyline 선언, 첫번째 인자는 선이 그려질 점의 위치. 현재는 없음.
		oMap.addOverlay(oPolyline); // - 지도에 선을 추가함.

		oMap.attach('mouseenter', function(oCustomEvent) {

				var oTarget = oCustomEvent.target;
				// 마커위에 마우스 올라간거면
				if (oTarget instanceof nhn.api.map.Marker) {
						var oMarker = oTarget;
						oLabel.setVisible(true, oMarker); // - 특정 마커를 지정하여 해당 마커의 title을 보여준다.
				}
		});

		oMap.attach('mouseleave', function(oCustomEvent) {

				var oTarget = oCustomEvent.target;
				// 마커위에서 마우스 나간거면
				if (oTarget instanceof nhn.api.map.Marker) {
						oLabel.setVisible(false);
				}
		});

		oMap.attach('click', function(oCustomEvent) {
				var oPoint = oCustomEvent.point;
				var oTarget = oCustomEvent.target;
				oInfoWnd.setVisible(false);
				// 마커 클릭하면
				if (oTarget instanceof nhn.api.map.Marker) {
						// 겹침 마커 클릭한거면
						if (oCustomEvent.clickCoveredMarker) {
								return;
						}
						// - InfoWindow에 들어갈 내용은 setContent로 자유롭게 넣을 수 있습니다. 외부 css를 이용할 수 있으며, 
						// - 외부 css에 선언된 class를 이용하면 해당 class의 스타일을 바로 적용할 수 있습니다.
						// - 단, DIV의 position style은 absolute가 되면 안되며, 
						// - absolute의 경우 autoPosition이 동작하지 않습니다. 
						oInfoWnd.setContent('<DIV style="border-top:1px solid; border-bottom:2px groove black; border-left:1px solid; border-right:2px groove black;margin-bottom:1px;color:black;background-color:white; width:auto; height:auto;">'+
								'<span style="color: #000000 !important;display: inline-block;font-size: 12px !important;font-weight: bold !important;letter-spacing: -1px !important;white-space: nowrap !important; padding: 2px 5px 2px 2px !important">' + 
								'Hello World <br /> ' + oTarget.getPoint()
								+'<span></div>');
						oInfoWnd.setPoint(oTarget.getPoint());
						oInfoWnd.setPosition({right : 15, top : 30});
						oInfoWnd.setVisible(true);
						oInfoWnd.autoPosition();
						return;
				}
				var oMarker = new nhn.api.map.Marker(oIcon, { title : '마커 : ' + oPoint.toString() });
				oMarker.setPoint(oPoint);
				oMap.addOverlay(oMarker);

				var aPoints = oPolyline.getPoints(); // - 현재 폴리라인을 이루는 점을 가져와서 배열에 저장.
				aPoints.push(oPoint); // - 추가하고자 하는 점을 추가하여 배열로 저장함.
				oPolyline.setPoints(aPoints); // - 해당 폴리라인에 배열에 저장된 점을 추가함
		});
	}
</script>

</body>
</html>