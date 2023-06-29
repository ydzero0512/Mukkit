<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<%@include file="../common/head.jsp" %>
<meta charset="UTF-8">
<title>먹킷리스트</title>
<style type="text/css">
tr{padding-bottom: 10px;}
td{height: 50px;vertical-align: middle;}
</style>
</head>
<body>
<%@include file="../common/nav.jsp" %>
<!-- 페이징처리 .. where절에 city like '부산'이런식으로 해서 링크에 파라미터 걸어주고,받는걸로. (검색이랑 비슷한원리!) -->
<h3 style="text-align: center;margin-top: 50px;">먹킷리스트😋</h3>
<div style="width: 900px;margin: auto;margin-top:50px;background: white;padding: 20px;border-radius: 0 0 40px 0;width: 60%; border: 5px solid;height: 500px;">	
	<table class="table table-hover" style="">
	  <thead>
	  <tr>
	  	<th><input type="checkbox"></th>	
	   	<th>지역</th>
	   	<th>가게명</th>
	   	<th>주소</th>
	   	<th>방문여부</th>
	   	<th>별점</th>
	  </tr>
	  
	  </thead>
	
	  <c:forEach var="vo" items="${restList}">
	  <tr>
	  	<td><input type="checkbox"></td>	
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
	   	
	   	<td></td>
	  </tr>
	  
	  </c:forEach>
	
	</table>
</div>	
</body>
</html>