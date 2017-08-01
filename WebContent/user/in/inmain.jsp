<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="/common/template/head_include.jsp"%>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<%@ include file="/common/template/nav.jsp" %>
<style>
.media-heading { display: inline-block; white-space: nowrap; overflow: hidden; text-overflow: ellipsis; }


</style>
<script>
$(document).ready(function() {
	$('#questionBtn').click(function() {
		//joinmove();
		$(location).attr('href', '${root}/in/question.akcord');	});
	$('.link_board_03').click(function() {
		//alert("글보기 번호1 : " + $(this).parent().parent().children().eq(0).text());
		//alert("글보기 번호2 : " + $(this).parents('tr').children('.bseq').text());
		//alert("글보기 번호3 : " + $(this).attr('data-seq'));
		
		$('#qna_id').val($(this).attr('data-seq'));
		$('#commonForm').attr('action', '${root}/in/qna.akcord').submit();
	});
});
</script>	

	<div class="container" style="margin-top: 10pt;">
	<div class="row">


	<!-- 왼쪽 카테고리 -->
	<div class="col-sm-2 form-group" >
		<h5 class="col-sm-12">전공분야</h5>
		<div class="col-sm-12 form-group " style="width: 100%;" >
			<button id="questionBtn" class="btn btn-danger" style="width: 100%;">Q질문하기</button>
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
		<c:forEach var="inDto" items="${inlist}">
		<div class="media">
			<a  href="#" class="link_board_03" data-seq="#{inDto.qna_id}">
			<dt class="media-heading col-sm-6" ><p overflow: hidden;>${inDto.subject }</p></dt>
			<dt class="media-heading col-sm-2"></dt>
			<dt class="media-heading col-sm-2">아이디 : ${inDto.user_id }</dt>
			<p class="media-body col-sm-10" style="height: 50px; width: 100%;">${inDto.content }</p>
			<dt class ="col-sm-4">${inDto.reg_date}</dt>
			<dt class ="col-sm-3">답글수 : 0</dt>
			<dt class ="col-sm-3">조회수 : ${inDto.hit }</dt>
			</a>
		</div>
		<hr>
		</c:forEach>
	
		
  	</div>
	
	</div>
	

</body>
</html>