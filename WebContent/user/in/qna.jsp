<%@include file="/common/template/head_include.jsp" %>
<%@ include file="/common/template/nav.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script>
	$(document).ready(function() {
		$('#answerBtn').click(function() {
			//joinmove();
			document.location.href = "question.jsp";
		});
	});
</script>
<style>
.gi-2x {
	font-size: 2em;
}

.gi-3x {
	font-size: 3em;
}

.gi-4x {
	font-size: 4em;
}

.gi-5x {
	font-size: 5em;
}
</style>

	<br>
	<div class="col-sm-1"></div>
	<div class="col-sm-10" style="border: 1px solid; color: gray">
		<br> <br> <label for="comment" class="col-sm-1">아이디
			: </label> <label class="col-sm-1">id</label> <label for="comment"
			class="col-sm-1">카테고리: </label> <label class="col-sm-1">category</label>
		<label class="col-sm-6"></label> <label for="comment" class="col-sm-1">작성일:
		</label> <label class="col-sm-1">sysdate</label>


		<div class="col-sm-12">
			<hr>
		</div>

		<div class="col-sm-12" row="25"
			style="border: 1px solid; color: gray; height: 250px;"></div>
		<label class="col-sm-11"></label>
		<button type="button" class="btn col-sm-1 btn-md" id="answerBtn">Answer</button>
	</div>

	<div class="col-sm-12">
		<label class="col-sm-1"></label>
		<div class="col-sm-10">
			<hr style="border: solid 0.5px gray;">
		</div>
	</div>
	<!--  <button type="button" class="btn btn-default btn-sm">
          <span class="glyphicon glyphicon-thumbs-up"></span> Like
        </button>
         <button type="button" class="btn btn-default btn-sm">
          <span class="glyphicon glyphicon-thumbs-down"></span> Unlike
        </button>
        
        		<button type="button" class="btn btn-danger col-sm-1 btn-md">Answer</button>
        		
        		
        		
        		
        		<button type="button" class="btn col-sm-1" data-toggle="collapse" data-target="#demo">Commend</button>
        		
        		 <div class="media">
    <div class="media-left media-top">
      <img src="img_avatar1.png" class="media-object" style="width:80px">
    </div>
    <div class="media-body">
      <h4 class="media-heading">Media Top</h4>
      <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
      <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
      <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
    </div>
  </div>
  <hr>
		
     -->

	<br>
	<div class="col-sm-1"></div>
	<div class="col-sm-10" style="border: 1px solid; color: gray">
		<br> <br> <label for="comment" class="col-sm-1">아이디
			: </label> <label class="col-sm-1">id</label> <label class="col-sm-6">님의
			답변입니다.</label> <label for="comment" class="col-sm-1">작성일: </label> <label
			class="col-sm-1">sysdate</label> <label class="col-sm-2"
			style="text-align: right"> <span
			class="glyphicon glyphicon-thumbs-up gi-2x"></span>
			&nbsp;&nbsp;&nbsp; <span
			class="glyphicon glyphicon-thumbs-down gi-2x"></span>
		</label>

		<div class="col-sm-12">
			<hr>
		</div>

		<div class="col-sm-12" row="25"
			style="border: 1px solid; color: gray; height: 250px;"></div>
		<div class="col-sm-12 form-group">
			<button type="button" class="btn col-sm-1 " data-toggle="collapse"
				data-target="#demo">Commend</button>

		</div>

		<div id="demo" class="collapse col-sm-12 ">
			<div class="media">
				<div class="media-left media-top">
					<img src="img_avatar1.png" class="media-object" style="width: 80px">
				</div>

				<div class="media-body ">
					<h4 class="media-heading">Title</h4>
					<p>test 1</p>

				</div>
			</div>
			<hr>
		</div>
	</div>


	<div class="col-sm-12">
		<label class="col-sm-1"></label>
		<div class="col-sm-10">
			<hr>
		</div>

	</div>

</body>
</html>