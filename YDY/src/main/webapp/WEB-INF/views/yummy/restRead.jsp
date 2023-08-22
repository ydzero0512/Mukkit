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
<script src="https://t1.kakaocdn.net/kakao_js_sdk/2.3.0/kakao.min.js"
  integrity="sha384-70k0rrouSYPWJt7q9rSTKpiTfX6USlMYjZUtr1Du+9o4cGvhPAWxngdtVZDdErlh" crossorigin="anonymous"></script>
<script>
  Kakao.init('bebf62e8f89264348cad27549d1893c1'); // 사용하려는 앱의 JavaScript 키 입력
</script>


<script>
  function shareMessage() {
    Kakao.Share.sendDefault({
      objectType: 'location',
      address: '${vo.address_road }',
      addressTitle: '${vo.rest_name}',
      content: {
        title: '${vo.rest_name}',
        description: '${vo.address_road }',
        imageUrl:
          '',
        link: {
          // [내 애플리케이션] > [플랫폼] 에서 등록한 사이트 도메인과 일치해야 함
          mobileWebUrl: 'https://developers.kakao.com',
          webUrl: 'https://developers.kakao.com',
        },
      },
    
      buttons: [
        {
          title: '웹으로 보기',
          link: {
            mobileWebUrl: 'https://developers.kakao.com',
            webUrl: 'http://localhost:8088/yummy/restRead?rest_id=${vo.rest_id}',
          },
        },
      ],
    });
  }
</script>


<h3 style="text-align: center;margin-top: 50px;">✨${vo.rest_name }✨</h3>

<div class="container mt-3" style=" border-radius: 0 0 40px 0;width: 60%; border: 5px solid;background: white;	padding:40px;margin-bottom: 50px;">
	<h5 style="direction: rtl;margin-right: 60px;">
		<a id="kakaotalk-sharing-btn" href="javascript:shareMessage()" style="text-decoration: none;">
		<span style="color: #4A3F14;">공유하기</span> <i class="icon-comment" style="color: #978155;"></i>
		</a>
	</h5>
<!-- 지도 -->
<div id="map" style="width:80%;height:300px;"></div>
<!-- 지도 -->
	<h5  style="text-align: center;margin-top: 10px;">${vo.address_road }</h5>
	<div style="border: 1px dotted; border-radius: 10px;max-width: 80%;margin: auto;padding: 20px; ">
	 ${vo.memo }<br>
	
	<c:if test="${!empty vo.file_name}">
	 <img src="/resources/photo/${vo.file_name}">
	</c:if>
	</div>
  <div style="direction: rtl;margin: 10px 50px 0px 10px;">	
  	<input class="btn btn-primary" type="button" value="수정" onclick="location.href='/yummy/modifyRes?rest_id=${vo.rest_id}'">
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