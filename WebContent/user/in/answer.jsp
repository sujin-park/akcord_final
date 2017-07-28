<%@include file="/common/template/head_include.jsp"%>
<%@ include file="/common/template/nav.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<script>
	$(document).ready(function() {
		$('#cancelBtn').click(function() {
			$(location).attr('href', '${root}/in/qna.akcord');

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
<div class="container col-sm-12 form-group">
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
	
	</div>

	<div class="col-sm-12">
		<label class="col-sm-1"></label>
		<div class="col-sm-10">
			<hr style="border: solid 0.5px gray;">
		</div>
	</div>


	<br>
	<div class="col-sm-1"></div>
	<div class="col-sm-10" style="border: 1px solid; color: gray">
		<br> <br> <label for="comment" class="col-sm-1">아이디
			: </label> <label class="col-sm-1">id</label> <label class="col-sm-8">님 답변을 작성하세요</label> <label for="comment" class="col-sm-1">작성일: </label> <label
			class="col-sm-1">sysdate</label> <label class="col-sm-12"><hr></label>


		<label for="comment" class="col-sm-12">Answer : </label>
		<textarea class="form-control" rows="15" id="comment"></textarea>

		<label class="col-sm-10"></label>
		<button type="button" class="btn btn-danger col-sm-1 btn-md"
			id="cancelBtn">Cancel</button>
		<button type="button" class="btn btn-danger col-sm-1 btn-md"
			id="saveBtn">Save</button>
	</div>


	<div class="col-sm-12">
		<label class="col-sm-1"></label>
		<div class="col-sm-10">
			<hr>
		</div>

	</div>
</div>
</body>
</html>
