<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>        
<!DOCTYPE html>
<html>
<head>
<%@include file="../common/head.jsp" %>

 <style type="text/css">
 .form-control{
     margin: 10px 10px 10px 0px;
 }
 img {
	max-width: 250px;
    max-height: 250px;
    margin: auto;
    display: flex;
}
 
 </style> 

 
</head>
<body>
<%@include file="../common/nav.jsp" %>



<h3 style="text-align: center;margin-top: 50px;">✨${vo.rest_name }✨</h3>

<div class="container mt-3" style=" border-radius: 0 0 40px 0;width: 60%; border: 5px solid;background: white;	padding:40px;">
<div id="map" style="width:80%;height:300px;"></div>
	<h5  style="text-align: center;margin-top: 10px;">${vo.address_road }</h5>
	<div style="border: 1px dotted; border-radius: 10px;max-width: 80%;margin: auto;padding: 20px; ">
	 ${vo.memo }<br>
	
	<c:if test="${!empty vo.file_name}">
	 <img src="/resources/photo/${vo.file_name}">
	</c:if>
	</div>
  <div style="direction: rtl;margin: 10px 50px 0px 10px;">	 
  	<input class="btn btn-primary" type="button" value="수정">
  	<input class="btn btn-secondary" type="button" value="삭제">
  	<input class="btn btn-secondary" type="button" value="목록" onclick="location.href='/yummy/restList2'">
  </div>
</div>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=bebf62e8f89264348cad27549d1893c1&libraries=services"></script>
	<script>
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = { 
	        center: new kakao.maps.LatLng("${vo.lat}","${vo.lng}"), // 지도의 중심좌표
	        level: 2 // 지도의 확대 레벨
	    };
	
	var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
	
	// 마커가 표시될 위치입니다 
	var markerPosition  = new kakao.maps.LatLng("${vo.lat}", "${vo.lng}"); 
	
	// 마커를 생성합니다
	var marker = new kakao.maps.Marker({
	    position: markerPosition
	});
	
	// 마커가 지도 위에 표시되도록 설정합니다
	marker.setMap(map);
	
	var iwContent = '<div style="padding:10px;display:inline-block;width:200px;text-align: center;">${vo.rest_name} <br><a href="https://map.kakao.com/link/to/${vo.rest_name},${vo.lat},${vo.lng}" style="color:orange" target="_blank">길찾기</a></div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
	iwPosition = new kakao.maps.LatLng("${vo.lat}", "${vo.lng}"); //인포윈도우 표시 위치입니다
	iwRemoveable = true; 
	//인포윈도우를 생성합니다
	var infowindow = new kakao.maps.InfoWindow({
	position : iwPosition, 
	content : iwContent,
	removable : iwRemoveable
	});
	infowindow.open(map, marker); 
	// 아래 코드는 지도 위의 마커를 제거하는 코드입니다
	// marker.setMap(null);    
	</script>

</body>
</html>