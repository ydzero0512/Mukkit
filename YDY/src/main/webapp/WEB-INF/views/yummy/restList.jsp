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
<style type="text/css">
.btn-light{margin: 5px;}
#box{
	background: white;
    width: 20%;
    margin-top: 60px;
    margin-right: 20px;
    border-radius:40px;
    box-shadow: -2px 5px 10px 1px rgba(0,0,0,.15);
    height: 220px;
    padding: 20px;}
#title{color: #DF742D;}  
.localbox{
    background: white;
    padding: 20px;
    border-radius: 8px;
    margin-right: 50px;
    box-shadow: -2px 5px 10px 1px rgba(0,0,0,.15);
    overflow: scroll;
    overflow-x: hidden;
    height: 420px;
     }
</style>


<%@include file="../common/head.jsp" %>
  
</head>
<body>
<%@include file="../common/nav.jsp" %>


<div style="width: 1000px;margin-left: 350px;margin-top: 50px;">
<button class="btn btn-light" onclick="panTo(37.566826, 126.9786567,8);" id="seoul">서울</button>
<button class="btn btn-light" onclick="panTo(37.444009295,126.697055772,8);" id="incheon">인천</button>
<button class="btn btn-light" onclick="panTo(36.34802330,127.3907935,8);" id="daejeon">대전</button>
<button class="btn btn-light" onclick="panTo(35.174466931, 129.1042376206,8);" id="busan">부산</button>
<button class="btn btn-light" onclick="panTo(35.54122627,129.35462351,8);" id="ulsan">울산</button>
<button class="btn btn-light" onclick="panTo(35.8726128, 128.59491264,8);" id="daegu">대구</button>
<button class="btn btn-light" onclick="panTo(35.1594772, 126.8567896,8);" id="gwangju">광주</button>
<button class="btn btn-light" onclick="panTo(36.49982732, 127.29940367,8);" id="sejong">세종</button><br>
<button class="btn btn-light" onclick="panTo(33.4717004, 126.5384342,10);" id="jeju">제주</button>
<button class="btn btn-light" onclick="panTo(37.3472788, 127.51150303,10);" id="gyeonggi">경기</button>
<button class="btn btn-light" onclick="panTo(36.5591202, 126.7141518,10);" id="chungnam">충남</button>
<button class="btn btn-light" onclick="panTo(36.8650598, 127.75086261,10);" id="chungbuk">충북</button>
<button class="btn btn-light" onclick="panTo(35.44017124, 128.212460177,11);" id="gyeongnam">경남</button>
<button class="btn btn-light" onclick="panTo(36.38180657, 128.89375118,11);" id="gyeongbuk">경북</button>
<button class="btn btn-light" onclick="panTo(34.91669032, 127.0323263,10);" id="jeonnam">전남</button>
<button class="btn btn-light" onclick="panTo(35.73459564, 127.13735720,10);" id="jeonbuk">전북</button>
<button class="btn btn-light" onclick="panTo(37.62460806, 128.7682673,11);" id="gangwon">강원</button>
<button class="btn btn-secondary" onclick="panTo(36.3873629,  128.14738245,13);" id="all">한눈에</button>
</div>

<div style="display: flex;flex-direction: row;">
<div id="map" style="width:50%;height:350px; margin-top: 60px;"></div>
<!-- <div id="box" style="width: 20%;margin-right: auto;"></div>클릭된 식당 정보box -->
<!-- 지역별 맛집 목록 list box -->
<div class="localbox" id="busanbox">
	<h3 style="color: gray;">내가 저장한 맛집 | <span style="color:black;">부산</span></h3>
	
	<c:forEach var="vo" items="${restList}" >
	   <c:if test="${vo.city =='부산' }">
		<h4 style="color: #DF742D;cursor: pointer;" onclick="location.href='/yummy/restRead?rest_id=${vo.rest_id}'">${vo.rest_name }
			<c:if test="${vo.visit == 0 }">
				<span class='novisit' style="font-size: 15px;">방문경험 없음</span>
			</c:if>
			<c:if test="${vo.visit == 1 }">
				<span class='yesvisit'style="font-size: 15px;">방문경험 있음</span>
			</c:if>
		</h4>
		<h5>${vo.address_road}</h5>
		<hr>
		</c:if>
	</c:forEach>

</div>
<!-- 지역별 맛집 목록 list box -->
</div>
<div>마커를 클릭하시면 상세보기 창이 나타납니다.</div>


<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=bebf62e8f89264348cad27549d1893c1&libraries=services"></script>
<script>

$(document).ready(function () {
	$('#box').hide();
	$('#busanbox').hide();
	$('#busan').click(function() {
		$('#busanbox').show();
	});
	
	
});


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
        	memo :"${vo.memo}",
        	address : "${vo.address_road}",
            title: "${vo.rest_name}",
            visit: "${vo.visit}",
            latlng: new kakao.maps.LatLng("${vo.lat}","${vo.lng}")
        }<c:if test="${not status.last}">,</c:if>
    </c:forEach>
];



// 마커 이미지의 이미지 주소입니다
var imageSrc = "https://cdn-icons-png.flaticon.com/128/10740/10740584.png"; 
    
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
    kakao.maps.event.addListener(marker, 'click', makeClickListener(marker, positions[i].latlng, positions[i].address,positions[i].title,positions[i].memo));
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

function makeClickListener(marker, latlng, address, title, memo) {
	  return function() {
	    var lat = latlng.getLat();
	    var lng = latlng.getLng();
		var moveLatLon = new kakao.maps.LatLng(lat, lng);
	    map.setLevel(2);
	    map.panTo(moveLatLon); 
	    $('#box').show();
	    $('#box').html("<h4 id='title'>"+title+"</h4>"+
	    			   "<span style='color:gray;'>"+address+"</span><hr>"+
	    			   "<span>"+memo+"</span>");
	   
	  };
}


</script>
</body>
</html>