<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<%@include file="../common/head.jsp" %>

 <style type="text/css">
 .form-control{
     margin: 10px 10px 10px 0px;
 }
 
 </style> 

 
</head>
<body>
<%@include file="../common/nav.jsp" %>


<h3 style="text-align: center;margin-top: 50px;">먹킷리스트 등록😋</h3>

<div class="container mt-3" style=" border-radius: 0 0 40px 0;width: 60%; border: 5px solid;background: white;	padding:40px;">

  
  <form action=""method="post">
  <input type="hidden" id="lng" name="lng">
  <input type="hidden" id="lat" name="lat">
  <input type="hidden" id="address" name="address" class="form-control">
  <input type="hidden" id="city" name="city" class="form-control">
  

  <input type="text" id="rest_name" name="rest_name" class="form-control" readonly="readonly" placeholder="클릭시 검색이 가능합니다." data-bs-toggle="modal" data-bs-target="#myModal">
  <input type="text" id="address_road" name="address_road" class="form-control" readonly="readonly" placeholder="도로명 주소(검색시 자동입력)">

  <textarea rows="" cols=""class="form-control" name="memo"></textarea>
  <input type="file" name="ori_name" class="form-control">
  <input type="file" name="file_2" class="form-control">
  <h5><label for="visit" style="color: gray;"><input type="checkbox" value="1" name="visit" id="visit">방문했던 곳이예요.</label></h5>
   <div>별점매기기</div>
  <input class="btn btn-primary" type="submit" value="등록하기">
  </form>	
</div>

<!-- The Modal -->
<div class="modal" id="myModal">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">

      <!-- Modal body -->
      <div class="modal-body">
       <%@include file="insertRes.jsp" %>
      </div>

      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
      </div>

    </div>
  </div>
</div>




</body>
</html>