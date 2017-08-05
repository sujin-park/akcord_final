<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/common/template/head_include.jsp" %>
<script src='${root}/common/css/main.css' charset="utf-8"></script>
<%@ include file="/common/template/nav.jsp" %>
<!-- 메인 페이지 꾸미고 include 해주면 될듯..ㅎ.. -->
</div>
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
     <div class="row text-left">
	        <div class="col-md-3">
	          <div class="card my-1 card-primary">
	            <div class="card-block text-center card-primary">
	              <p class="lead">그룹방 랭킹</p>
	            </div>
	            <ul class="list-group list-group-flush">
	              <li class="list-group-item"><i class="mx-auto fa d-inline fa-clock-o"></i>&nbsp;1&nbsp;<b>JAVA 공부방</b></li>
	              <li class="list-group-item"><i class="mx-auto fa d-inline fa-clock-o"></i>&nbsp;2&nbsp;<b>JAVA 공부방</b></li>
	              <li class="list-group-item"><i class="mx-auto fa d-inline fa-clock-o"></i>&nbsp;3&nbsp;<b>JAVA 공부방</b></li>
	              <li class="list-group-item"><i class="mx-auto fa d-inline fa-clock-o"></i>&nbsp;4&nbsp;<b>JAVA 공부방</b></li>
	              <li class="list-group-item"><i class="mx-auto fa d-inline fa-clock-o"></i>&nbsp;5&nbsp;<b>JAVA 공부방</b></li>
	            </ul>
	          </div>
	        </div>
	        <div class="col-md-3">
	          <div class="card my-1 card-primary">
	            <div class="card-block text-center card-primary">
	              <p class="lead">MY ROOM 랭킹</p>
	            </div>
	            <ul class="list-group list-group-flush">
	              <li class="list-group-item"><i class="mx-auto fa d-inline fa-clock-o"></i>&nbsp;1&nbsp;<b>JAVA 공부방</b></li>
	              <li class="list-group-item"><i class="mx-auto fa d-inline fa-clock-o"></i>&nbsp;2&nbsp;<b>JAVA 공부방</b></li>
	              <li class="list-group-item"><i class="mx-auto fa d-inline fa-clock-o"></i>&nbsp;3&nbsp;<b>JAVA 공부방</b></li>
	              <li class="list-group-item"><i class="mx-auto fa d-inline fa-clock-o"></i>&nbsp;4&nbsp;<b>JAVA 공부방</b></li>
	              <li class="list-group-item"><i class="mx-auto fa d-inline fa-clock-o"></i>&nbsp;5&nbsp;<b>JAVA 공부방</b></li>
	            </ul>
	          </div>
	        </div>
	        <div class="col-md-3">
	          <div class="card my-1 card-primary">
	            <div class="card-block text-center">
	              <p class="lead">지식인 조회수 랭킹</p>
	            </div>
	            <ul class="list-group list-group-flush">
	               <li class="list-group-item"><i class="mx-auto fa d-inline fa-clock-o"></i>&nbsp;1&nbsp;<b>JAVA 공부방</b></li>
	              <li class="list-group-item"><i class="mx-auto fa d-inline fa-clock-o"></i>&nbsp;2&nbsp;<b>JAVA 공부방</b></li>
	              <li class="list-group-item"><i class="mx-auto fa d-inline fa-clock-o"></i>&nbsp;3&nbsp;<b>JAVA 공부방</b></li>
	              <li class="list-group-item"><i class="mx-auto fa d-inline fa-clock-o"></i>&nbsp;4&nbsp;<b>JAVA 공부방</b></li>
	              <li class="list-group-item"><i class="mx-auto fa d-inline fa-clock-o"></i>&nbsp;5&nbsp;<b>JAVA 공부방</b></li>
	            </ul>
	          </div>
	        </div>
	        <div class="col-md-3">
	          <div class="card my-1 card-primary">
	            <div class="card-block text-center">
	              <p class="lead">설문조사</p>
	            </div>
	            <ul class="list-group list-group-flush">
	               <li class="list-group-item"><i class="mx-auto fa d-inline fa-clock-o"></i>&nbsp;1&nbsp;<b>JAVA 공부방</b></li>
	              <li class="list-group-item"><i class="mx-auto fa d-inline fa-clock-o"></i>&nbsp;2&nbsp;<b>JAVA 공부방</b></li>
	              <li class="list-group-item"><i class="mx-auto fa d-inline fa-clock-o"></i>&nbsp;3&nbsp;<b>JAVA 공부방</b></li>
	              <li class="list-group-item"><i class="mx-auto fa d-inline fa-clock-o"></i>&nbsp;4&nbsp;<b>JAVA 공부방</b></li>
	              <li class="list-group-item"><i class="mx-auto fa d-inline fa-clock-o"></i>&nbsp;5&nbsp;<b>JAVA 공부방</b></li>
	            </ul>
	          </div>
	        </div>
     </div>
     
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