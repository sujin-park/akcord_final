<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/template/head_include.jsp"%>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<%@ include file="/common/template/nav.jsp" %>
	
	<div class="container" style="margin-top: 10pt;">
	<div class="row">


	<!-- 왼쪽 카테고리 -->
	<div class="col-sm-2 form-group" >
		<h5 class="col-sm-12">전공분야</h5>
		<div class="col-sm-12 form-group " style="width: 100%;" >
			<button id="question" class="btn btn-default" style="width: 100%;">Q질문하기</button>
			<hr>
		</div>
			<a id="c1" href="">인문계열</a><hr>
			<a id="c2" href="">사회계열</a><hr>
			<a id="c3" href="">교육계열</a><hr>
			<a id="c4" href="">공학계열</a><hr>
			<a id="c5" href="">자연계열</a><hr>
			<a id="c6" href="">의약계열</a><hr>
			<a id="c8" href="">예체능계열</a><hr>
	</div>
	
	<!-- 지식인 게시판 헤더부분 -->
	
		<div class="col-sm-10 form-group" >
		<h5 class="col-sm-8">지식인 게시판</h5> 
		

		<!-- 검색바부분 -->
		<form action="/action_page.php">
   			<div class="input-group">
      			<input id="insearch" type="text" class="form-control" placeholder="Search" name="search">
      		<div class="input-group-btn">
        		<button class="btn btn-default" type="submit"><i class="glyphicon glyphicon-search"></i></button>
      		</div>
    		</div>
 		 </form>

		</div>
		
		 <!-- 답변수, 조회수 정렬 -->
		<div class="col-xs-10 form-group">
		<a href="" class="col-sm-2" style="height: 10px;">답변수</a>
		<a href="" class="col-sm-2" style="height: 10px;">조회수</a>
		</div>

			
	<!-- 리스트 -->		
	<div class="col-sm-10 form-group">
		<hr>

		<div class="media">
			<dt class="media-heading col-sm-6">글제목</dt>
			<p class="media-body col-sm-10" style="height: 50px; width: 100%;">글 내용이 나오는 공간입니다.최대3줄 </p>
			<dt class ="col-sm-4">2017.07.21</dt>
			<dt class ="col-sm-3">답글수 : 0</dt>
			<dt class ="col-sm-3">조회수 : 0</dt>
		</div>
		<hr>
		
		<div class="media">
			<dt class="media-heading col-sm-6">글제목</dt>
			<p class="media-body col-sm-10" style="height: 50px; width: 100%;">글 내용이 나오는 공간입니다.최대3줄 </p>
			<dt class ="col-sm-4">2017.07.21</dt>
			<dt class ="col-sm-3">답글수 : 0</dt>
			<dt class ="col-sm-3">조회수 : 0</dt>
		</div>
		<hr>
		
		<div class="media">
			<dt class="media-heading col-sm-6">글제목</dt>
			<p class="media-body col-sm-10" style="height: 50px; width: 100%;">글 내용이 나오는 공간입니다.최대3줄 </p>
			<dt class ="col-sm-4">2017.07.21</dt>
			<dt class ="col-sm-3">답글수 : 0</dt>
			<dt class ="col-sm-3">조회수 : 0</dt>
		</div>
		<hr>
		
		<div class="media">
			<dt class="media-heading col-sm-6">글제목</dt>
			<p class="media-body col-sm-10" style="height: 50px; width: 100%;">글 내용이 나오는 공간입니다.최대3줄 </p>
			<dt class ="col-sm-4">2017.07.21</dt>
			<dt class ="col-sm-3">답글수 : 0</dt>
			<dt class ="col-sm-3">조회수 : 0</dt>
		</div>
		<hr>
		
  	</div>
	
	</div>
	

</body>
</html>