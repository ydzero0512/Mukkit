# 😋나만의 맛집을 저장하고, 기록하고, 공유할 수 있는 맛집지도 사이트
## 메인화면
![image](https://github.com/ydzero0512/Mukkit/assets/129407050/98163c4f-4244-4689-a54e-44400e9501f6)
## 🔨개발환경
* Java
* JavaScript
* HTML5
* CSS3
* JQuery
* Spring FrameWork
* MyBatis
* MySQL
* Apache Tomcat
## 📃주요기능
* 검색한 식당의 tilte,좌표정보 가져와서 DB에 저장
* 식당이름 검색 후, 해당 장소 좌표정보 -> 주소로 바꿈
'console.log("     getAddr(lat,lng);
            	function getAddr(lat,lng){
            	    let geocoder = new kakao.maps.services.Geocoder();
            	    let coord = new kakao.maps.LatLng(lat, lng);
            	    let callback = function(result, status) {
            	        if (status === kakao.maps.services.Status.OK) {
            	        	document.getElementById("address").value = result[0].address.address_name;
            	        	document.getElementById("address_road").value = result[0].road_address.address_name;
            	        	document.getElementById("city").value = result[0].road_address.region_1depth_name;
            	        }
            	    }
            	    geocoder.coord2Address(coord.getLng(), coord.getLat(), callback);
            	} 
            	//마커의 좌표를 주소로 변환
            	
            	document.getElementById("rest_name").value = title;
            	document.getElementById("lng").value = lng;
            	document.getElementById("lat").value = lat;
            	window.parent.closeModal()
              };")'

  
