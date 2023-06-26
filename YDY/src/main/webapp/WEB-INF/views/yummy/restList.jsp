<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>

  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
  <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/aos/2.3.4/aos.js"></script>
<link rel="stylesheet" type="text/css" href="/resources/css.css">
<meta charset="UTF-8">
<title>Insert title here</title>



<%@include file="../common/head.jsp" %>
  
</head>
<body>
<%@include file="../common/nav.jsp" %>


<div class="container" style="width: 500px;">
<button class="btn btn-light" onclick="panTo(37.566826, 126.9786567,8);">서울</button>
<button class="btn btn-light" onclick="panTo(37.444009295,126.697055772,8);">인천</button>
<button class="btn btn-light" onclick="panTo(36.34802330,127.3907935,8);">대전</button>
<button class="btn btn-light" onclick="panTo(35.174466931, 129.1042376206,8);">부산</button>
<button class="btn btn-light" onclick="panTo(35.54122627,129.35462351,8);">울산</button>
<button class="btn btn-light" onclick="panTo(35.8726128, 128.59491264,8);">대구</button>
<button class="btn btn-light" onclick="panTo(35.1594772, 126.8567896,8);">광주</button>
<button class="btn btn-light" onclick="panTo(36.49982732, 127.29940367,8);">세종</button>
<button class="btn btn-light" onclick="panTo(33.4717004, 126.5384342,10);">제주</button>
<button class="btn btn-light" onclick="panTo(37.3472788, 127.51150303,10);">경기</button>
<button class="btn btn-light" onclick="panTo(36.5591202, 126.7141518,10);">충남</button>
<button class="btn btn-light" onclick="panTo(36.8650598, 127.75086261,10);">충북</button>
<button class="btn btn-light" onclick="panTo(35.44017124, 128.212460177,11);">경남</button>
<button class="btn btn-light" onclick="panTo(36.38180657, 128.89375118,11);">경북</button>
<button class="btn btn-light" onclick="panTo(34.91669032, 127.0323263,10);">전남</button>
<button class="btn btn-light" onclick="panTo(35.73459564, 127.13735720,10);">전북</button>
<button class="btn btn-light" onclick="panTo(37.62460806, 128.7682673,11);">강원</button>
<button class="btn btn-secondary" onclick="panTo(36.3873629,  128.14738245,13);">한눈에</button>
</div>

<div id="map" style="width:50%;height:350px; margin-top: 60px;"></div>
<div>마커를 클릭하시면 상세보기 창이 나타납니다.</div>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=bebf62e8f89264348cad27549d1893c1&libraries=services"></script>
<script>



var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
    mapOption = { 
        center: new kakao.maps.LatLng(36.3873629,  128.14738245), // 지도의 중심좌표
        level: 13// 지도의 확대 레벨
    };

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

//이동할 위경도 생성


function panTo(x,y,level) {
	var moveLatLon = new kakao.maps.LatLng(x, y);
    map.setLevel(level);
    map.panTo(moveLatLon);            
}   


//마커를 표시할 위치와 title 객체 배열입니다 

var positions = [
    <c:forEach items="${restList}" var="vo" varStatus="status">
        {
            title: "${vo.rest_name}",
            visit: "${vo.visit}",
            latlng: new kakao.maps.LatLng("${vo.lat}","${vo.lng}")
        }<c:if test="${not status.last}">,</c:if>
    </c:forEach>
];



// 마커 이미지의 이미지 주소입니다
var imageSrc = "https://cdn-icons-png.flaticon.com/128/5750/5750255.png"; 
    
for (var i = 0; i < positions.length; i ++) {
    
    // 마커 이미지의 이미지 크기 입니다
    var imageSize = new kakao.maps.Size(24, 35); 
    
    // 마커 이미지를 생성합니다    
    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
    
    // 마커를 생성합니다
    var marker = new kakao.maps.Marker({
        map: map, // 마커를 표시할 지도
        position: positions[i].latlng, // 마커를 표시할 위치
        title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
        image : markerImage // 마커 이미지 
    });
    
    var visit = "";
    
    if(positions[i].visit == 0){
    	visit = "<span class='novisit'>방문경험 없음</span>";
    }else{
    	visit = "<span class='yesvisit'>방문경험 있음</span>";
    }
    
   	var content = "<div class='container' id='detail'>"+positions[i].title+"<br>"+visit+"</div>";
   
 // 마커에 표시할 인포윈도우를 생성합니다 
    var infowindow = new kakao.maps.InfoWindow({
        content: content // 인포윈도우에 표시할 내용
    });

    // 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
    // 이벤트 리스너로는 클로저를 만들어 등록합니다 
    // for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
    kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
    kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
}

// 인포윈도우를 표시하는 클로저를 만드는 함수입니다 
function makeOverListener(map, marker, infowindow) {
    return function() {
        infowindow.open(map, marker);
    };
}

// 인포윈도우를 닫는 클로저를 만드는 함수입니다 
function makeOutListener(infowindow) {
    return function() {
        infowindow.close();
    };
    
    
    
}




</script>
</body>
</html>