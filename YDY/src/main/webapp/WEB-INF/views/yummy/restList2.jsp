<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css">
<%@include file="../common/head.jsp" %>
<meta charset="UTF-8">
<title>먹킷리스트</title>
<style type="text/css">
tr{padding-bottom: 10px;}
td{height: 50px;vertical-align: middle;}
.check{transform: scale(1.3);}
tr{cursor: pointer;}
#searchBox{width: 280px;border-radius: 5px;box-shadow: -2px 5px 10px 1px rgba(0,0,0,.15);height: 34px;padding: 5px; margin-bottom: 30px;}
.page-link{border-radius: 2px !important;}
.page-item{ margin: 0.5em;}
.icon-star{color: #f73c32 !important;}
.icon-star-empty{color: #f73c32 !important;}
</style>
</head>
<body>
<%@include file="../common/nav.jsp" %>
<!-- 페이징처리 .. where절에 city like '부산'이런식으로 해서 링크에 파라미터 걸어주고,받는걸로. (검색이랑 비슷한원리!) -->
<h3 style="text-align: center;margin-top: 50px;">먹킷리스트😋</h3>




<div style="width: 900px;margin: auto;margin-top:50px;background: white;margin-bottom:100px; padding: 20px;border-radius: 0 0 40px 0;width: 60%; border: 5px solid;height: 500px;">	
	
	<form>
	<div id="searchBox">
	<input type="text" placeholder="검색어를 입력하세요" style="border: none;width: 150px;"id="search" name="search" value="${pm.pageVO.search }">
	<button style="border: none;background: white;margin-left: 85px;"><i class="icon-search"></i></button>
	</div>
	</form>
	
	<table class="table table-hover" style="">
	  <thead>
	  <tr>
	  	<th><input type="checkbox" class="check" onclick="selectAll(this);"></th>	
	   	<th>지역</th>
	   	<th>가게명</th>
	   	<th>주소</th>
	   	<th>방문여부</th>
	   	<th>별점</th>
	  </tr>
	  
	  </thead>
	
	  <c:forEach var="vo" items="${restList}">
	  <tr onclick="location.href='/yummy/restRead?rest_id=${vo.rest_id}'">
	  	<td><input type="checkbox" class="check" name="rowCheck" value="${vo.rest_id }" onclick="event.stopPropagation();"></td>	
	   	<td>${vo.city }</td>
	   	<td>${vo.rest_name }</td>
	   	<td>${vo.address_road }</td>
	
	   	<c:choose>
	   	<c:when test="${vo.visit == 1 }">
	   	<td>⭕</td>
	   	</c:when>
	   	<c:otherwise>
	   	<td>❌</td>
	   	</c:otherwise>
	   	</c:choose>
	   	
	   	<c:choose>
	   	<c:when test="${vo.fav == 1 }">
	   	<td>
		   	<i class="icon-star"></i>
		   	<c:forEach begin="0" end="3">
		   		<i class="icon-star-empty"></i>
		   	</c:forEach>
	   	</td>
	   	</c:when>
	   	<c:when test="${vo.fav == 2 }">
	   	<td>
		   	<c:forEach begin="0" end="1">
		   		<i class="icon-star"></i>
		   	</c:forEach>
		   	<c:forEach begin="0" end="2">
		   		<i class="icon-star-empty"></i>
		   	</c:forEach>
	   	</td>
	   	</c:when>
	   	<c:when test="${vo.fav == 3 }">
	   	<td>
		   	<c:forEach begin="0" end="2">
		   		<i class="icon-star"></i>
		   	</c:forEach>
		   	<c:forEach begin="0" end="1">
		   		<i class="icon-star-empty"></i>
		   	</c:forEach>
	   	</td>
	   	</c:when>
	   	<c:when test="${vo.fav == 4 }">
	   	<td>
		    <c:forEach begin="0" end="3">
		   		<i class="icon-star"></i>
		   	</c:forEach>
		   	<i class="icon-star-empty"></i>
	   	</td>
	   	</c:when>
	   	<c:when test="${vo.fav == 5 }">
	   	<td>
	   		<c:forEach begin="0" end="4">
		   		<i class="icon-star"></i>
		   	</c:forEach>
	   	</td>
	   	</c:when>
	   	<c:otherwise>
	   	<td></td>
	   	</c:otherwise>		   		   		   	
	   	</c:choose>
	   	
	  </tr>
	  
	  </c:forEach>
	
	</table>
	<input type="button" class="btn btn-danger" onclick="deleteList();" value="삭제">
	
					<div>
					<ul class="pagination" style="justify-content: center;">
						<c:if test="${pm.prev }">
						<li class="page-item"><a class="page-link" href="/yummy/restList2?page=${pm.startPage -1}">이전</a></li>
						</c:if>
						<c:forEach begin="${pm.startPage }" end="${pm.endPage }" step="1" var="i" >
						<li class="page-item ${pm.pageVO.page == i?'active':''}"><a class="page-link" href="/yummy/restList2?page=${i}&search=${pm.pageVO.search}">${i }</a></li>
						</c:forEach>
						<c:if test="${pm.next && pm.endPage > 0 }">
						<li class="page-item"><a class="page-link" href="/yummy/restList2?page=${pm.endPage+1 }">다음</a></li>
						</c:if>
					</ul>
				</div>
	
	<script type="text/javascript">

	 function selectAll(selectAll)  {
		  const checkboxes 
		       = document.getElementsByName('rowCheck');
		  
		  checkboxes.forEach((checkbox) => {
		    checkbox.checked = selectAll.checked;
		  })
		}
	 
	 
	 function deleteList() {
		var valArr = new Array();
		var list = $("input[name='rowCheck']");
		
		for(var i=0; i<list.length;i++){
			if(list[i].checked){
			valArr.push(list[i].value);
		  }	
		}//체크박스 체크 된 것만 배열에 넣기

		if(valArr.length == 0){
	    	Swal.fire("선택된 목록이 없습니다.")
	     
		}else{
	      	Swal.fire({
	            title: "목록을 삭제하겠습니까?",
	            text: "선택된 목록 수 :"+valArr.length,
				icon: "warning",
	              
	           	   showCancelButton: true, // cancel버튼 보이기. 기본은 원래 없음
	           	   confirmButtonColor: '#3085d6', // confrim 버튼 색깔 지정
	           	   cancelButtonColor: '#d33', // cancel 버튼 색깔 지정
	           	   confirmButtonText: '예', // confirm 버튼 텍스트 지정
	           	   cancelButtonText: '아니오', // cancel 버튼 텍스트 지정
	           	   
	            }).then(result => {
	                if (result.isConfirmed) { // 만약 모달창에서 confirm 버튼을 눌렀다면
	          		  $.ajax({
	    				  url : "/yummy/deleteList",
	    				  type : 'POST',
	    				  traditional : true,
	    				  data: {
	    					  valArr : valArr
	    				  },
	    				  success:function(){
	    						 Swal.fire({
	    				                title: "삭제가 완료되었습니다.",
	    				                text: "",
	    				                icon: "success"
	    				              }).then(function() {
	    				            	  location.reload()
	    				              
	    				              });
	    					 
	    					 
	    					  
	    				  }//success 
	    			  });// ajax
	            	    
	                } else if (result.isDismissed) { // 만약 모달창에서 cancel 버튼을 눌렀다면
	                	// ...실행
	                }
	            });
			
		}
	}// 입고취소
	
	
	</script>
	
</div>	
</body>
</html>