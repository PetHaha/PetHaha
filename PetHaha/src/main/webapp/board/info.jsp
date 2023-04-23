<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>

<div id="map" style="width:600px;height:400px; margin:0 auto; margin-top: 30px; margin-bottom: 30px;"></div>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=398cf426a92226b11bd88e91ba34d09e"></script>

 
<script>
    var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
        mapOption = {
            center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
            level: 3 // 지도의 확대 레벨
        };
 
    var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
 
    // 마커가 표시될 위치
    var markerPosition = new kakao.maps.LatLng(33.450701, 126.570667);
 
    // 마커를 생성합니다
    var marker = new kakao.maps.Marker({
        position: markerPosition
    });
 
    // 마커가 지도 위에 표시되도록 설정합니다
    marker.setMap(map);
</script>




<%@ include file="../footer.jsp"%>