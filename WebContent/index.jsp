<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/common/template/searchbar.jsp" %>
<link rel="stylesheet" type="text/css" href="${root}/common/css/menuresponse.css">
<div class="container">
	<div class="rank">
	        <div class="col-sm-12 page-header">
	          <h2 align="center" id="titleinfo"><b>Ranking</b></h2>
	        </div>
	</div>
<%@include file="/common/template/rankbar.jsp" %>

    <div id="myCarousel" class="carousel slide container" data-ride="carousel" style="margin-bottom:20px;">
  <!-- Indicators -->
  		<ol class="carousel-indicators">
		    <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
		    <li data-target="#myCarousel" data-slide-to="1"></li>
		    <li data-target="#myCarousel" data-slide-to="2"></li>
		    <li data-target="#myCarousel" data-slide-to="3"></li>
		    <li data-target="#myCarousel" data-slide-to="4"></li>
  		</ol>

  <!-- Wrapper for slides -->
		  <div class="carousel-inner">
			    <div class="item active">
			      <img src="${root}/doc/img/search.jpg"  style="width:100%; height:250px;">
			    </div>
		
			    <div class="item">
			      <img src="${root}/doc/img/grouproom.jpg"  style="width:100%; height:250px;">
			    </div>
		
			    <div class="item">
			      <img src="${root}/doc/img/myroom.jpg" style="width:100%; height:250px;">
			    </div>
			    <div class="item">
			      <img src="${root}/doc/img/recorder.jpg"  style="width:100%; height:250px;">
			    </div>
			    <div class="item">
			      <img src="${root}/doc/img/studycafe.jpg"  style="width:100%; height:250px;">
			    </div>
		  </div>

  <!-- Left and right controls -->
		  <a class="left carousel-control" href="#myCarousel" data-slide="prev" style="background-image:none;">
		    <span class="glyphicon glyphicon-chevron-left"></span>
		    <span class="sr-only">Previous</span>
		  </a>
		  <a class="right carousel-control" href="#myCarousel" data-slide="next" style="background-image:none;">
		    <span class="glyphicon glyphicon-chevron-right"></span>
		    <span class="sr-only">Next</span>
		  </a>
	</div>
 </div>
 <%@include file="/common/template/footer.jsp"%>
 <script src="${root}/common/js/common.js"></script>