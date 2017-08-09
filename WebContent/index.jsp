<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/common/template/head_include.jsp" %>
<link rel="stylesheet" type="text/css" href="${root}/common/css/main.css">
<%@ include file="/common/template/nav.jsp" %>
<!-- 메인 페이지 꾸미고 include 해주면 될듯..ㅎ.. -->
<div class="jumbotron" style="height:150px;">
          <div class="col-sm-8 col-sm-offset-2">
	            <h2 align="center">Akashic records</h2>
	            <div class="input-group">
				      <input type="text" class="form-control" placeholder="검색어를 입력해주세요">
				      <span class="input-group-btn">
				        <button class="btn btn-danger" type="button">SEARCH</button>
				      </span>
	          </div>
	  </div>
</div>
<div class="container">
	<div class="rank">
		<div class="row">
	        <div class="col-sm-12">
	          <h2 align="center">Ranking</h2>
	        </div>
	   </div>
	</div>
<%@include file="/common/template/rankbar.jsp" %>
     
    <div id="myCarousel" class="carousel slide" data-ride="carousel">
  <!-- Indicators -->
  		<ol class="carousel-indicators">
		    <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
		    <li data-target="#myCarousel" data-slide-to="1"></li>
		    <li data-target="#myCarousel" data-slide-to="2"></li>
  		</ol>

  <!-- Wrapper for slides -->
		  <div class="carousel-inner">
			    <div class="item active">
			      <img src="${root}/doc/img/IMG_2757.jpg" alt="Los Angeles">
			    </div>
		
			    <div class="item">
			      <img src="${root}/doc/img/harry_potter_11-wallpaper-1920x1080.jpg" alt="Chicago">
			    </div>
		
			    <div class="item">
			      <img src="${root}/doc/img/IMG_2757.jpg" alt="New York">
			    </div>
		  </div>

  <!-- Left and right controls -->
		  <a class="left carousel-control" href="#myCarousel" data-slide="prev">
		    <span class="glyphicon glyphicon-chevron-left"></span>
		    <span class="sr-only">Previous</span>
		  </a>
		  <a class="right carousel-control" href="#myCarousel" data-slide="next">
		    <span class="glyphicon glyphicon-chevron-right"></span>
		    <span class="sr-only">Next</span>
		  </a>
	</div>
 </div>
 <%@include file="/common/template/footer.jsp"%>