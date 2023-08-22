<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>

<%@include file="../common/head.jsp" %>
	<script type="text/javascript">
	$(document).ready(function () {
		$('.rate').hide();
		$('#visit').click(function() {
			if($('#visit').is(':checked')){
				$('.rate').show();
			}else{
				$('.rate').hide();
			}
			
		});
	});

</script>
 <style type="text/css">
 .form-control{
     margin: 10px 10px 10px 0px;
     
 }
.rate { display: inline-block;border: 0;margin-right: 15px;border: 1px solid #ced4da; border-radius: 5px; padding: 3px;margin-bottom: 15px;}
.rate > input {display: none;}
.rate > label {float: right;color: #ddd}
.rate > label:before {display: inline-block;font-size: 1.3rem;padding: .3rem .2rem;margin: 0;cursor: pointer;font-family: FontAwesome;content: "\f005 ";}
.rate input:checked ~ label, 
.rate label:hover,.rate label:hover ~ label { color: #f73c32 !important;  } 
.rate input:checked + .rate label:hover,
.rate input input:checked ~ label:hover,
.rate input:checked ~ .rate label:hover ~ label,  
.rate label:hover ~ input:checked ~ label { color: #f73c32 !important;  } 

 </style> 

 
</head>
<body>
<%@include file="../common/nav.jsp" %>


<h3 style="text-align: center;margin-top: 50px;">먹킷리스트 등록😋</h3>

<div class="container mt-3" style=" border-radius: 0 0 40px 0;width: 60%; border: 5px solid;background: white;	padding:40px;">

  
  <form action=""method="post"enctype="multipart/form-data">
  
  <input type="text" id="rest_name" name="rest_name" class="form-control" readonly="readonly" value="${vo.rest_name }">
  <input type="text" id="address_road" name="address_road" class="form-control" readonly="readonly" value="${vo.address_road }">

  <textarea class="form-control" name="memo" style="height: 120px;">${vo.memo }</textarea>
  <input type="file" name="upload" class="form-control" >
  <h5><label for="visit" style="color: gray;"><input type="checkbox" value="1" name="visit" id="visit">방문했던 곳이예요.</label></h5>
	

	  <fieldset class="rate">
	    <input type="radio" id="rating5" name="fav" value="5"><label for="rating5" title="5점"></label>
	    <input type="radio" id="rating4" name="fav" value="4"><label for="rating4" title="4점"></label>
	    <input type="radio" id="rating3" name="fav" value="3"><label for="rating3" title="3점"></label>
	    <input type="radio" id="rating2" name="fav" value="2"><label for="rating2" title="2점"></label>
	    <input type="radio" id="rating1" name="fav" value="1"><label for="rating1" title="1점"></label>
	  </fieldset>
	
	<br>
  <input class="btn btn-primary" type="submit" value="수정하기">
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