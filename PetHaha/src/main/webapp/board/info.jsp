<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<div id="borderlist">
	<h2 class="subjectt">&nbsp;지도</h2>
</div>

<div id="map" style="width:850px;height:600px; margin:0 auto; margin-top: 30px; margin-bottom: 30px;"></div>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=398cf426a92226b11bd88e91ba34d09e"></script>

<script>
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
		mapOption = { 
		    center: new kakao.maps.LatLng(37.63734896938491, 126.83220084329795), // 지도의 중심좌표
		    level: 4 // 지도의 확대 레벨
		};
	
	var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
	
	//마커를 표시할 위치와 내용을 가지고 있는 객체 배열입니다 
	var positions = [
		{
		    content: '<div>화정종합동물병원</div><div>Tel: 031-962-0075</div>', 
		    latlng: new kakao.maps.LatLng(37.64149834079854, 126.83244077880963),

		},
		{
		    content: '<div>센트럴동물병원</div><div>Tel: 031-967-8275</div>', 
		    latlng: new kakao.maps.LatLng(37.638161138062536, 126.8331054054044)
		},
		{
		    content: '<div>FM동물메디컬센터</div><div>Tel: 031-979-7975</div>', 
		    latlng: new kakao.maps.LatLng(37.63391020163886, 126.83114079784416)
		},
		{
		    content: '<div>탑케어동물병원</div><div>Tel: 1666-7501</div>',
		    latlng: new kakao.maps.LatLng( 37.63123417182662, 126.83106755120775)
		}
		];
	
	for (var i = 0; i < positions.length; i ++) {
	// 마커를 생성합니다
	var marker = new kakao.maps.Marker({
	    map: map, // 마커를 표시할 지도
	    position: positions[i].latlng // 마커의 위치
	});
	
	// 마커에 표시할 인포윈도우를 생성합니다 
	var infowindow = new kakao.maps.InfoWindow({
	    content: positions[i].content // 인포윈도우에 표시할 내용
	});
	
	// 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
	// 이벤트 리스너로는 클로저를 만들어 등록합니다 
	// for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
	kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
	kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
	}
	
	//인포윈도우를 표시하는 클로저를 만드는 함수입니다 
	function makeOverListener(map, marker, infowindow) {
	return function() {
	    infowindow.open(map, marker);
	};
	}
	
	//인포윈도우를 닫는 클로저를 만드는 함수입니다 
	function makeOutListener(infowindow) {
	return function() {
	    infowindow.close();
	};
	}
</script>


<%@ include file="../footer.jsp"%>