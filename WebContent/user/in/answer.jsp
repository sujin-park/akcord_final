<%@include file="/common/template/head_include.jsp"%>
<%@ include file="/common/template/nav.jsp"%>
<%@ include file="/common/public.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- include summernote css/js-->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.6/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.6/summernote.js"></script>

<script>
$(document).ready(function() {
	$('#summernote').summernote({
		height : 400,
		width: 980,
		codemirror : { // codemirror options
			theme : 'monokai'
		}
	});
	
	$('#qna_comment').summernote({
		height: 300,   
		width: 980,// 기본 높이값
		minHeight: null,      // 최소 높이값(null은 제한 없음)
		maxHeight: null,      // 최대 높이값(null은 제한 없음)
		focus: false,          // 페이지가 열릴때 포커스를 지정함
		lang: 'ko-KR' 
	});
	
	$('#cancelBtn').click(function() {
		$('#replyForm').attr('action', '${root}/in/clicklist.akcord').submit();
	});
	
	$('#saveBtn').click(function() {
		$('#replyForm').attr('method','post').attr('action','${root}/in/answerSave.akcord').submit();			
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
	<form id="replyForm" name="replyForm" class="form-horizontal" method="" action="">
	<input type="hidden" id="qna_id" name="qna_id" class="qna_id" value="${qnaview.qna_id}">
	<br>
	<div class="col-sm-1"></div>
	<div class="col-sm-10" style="border: 1px solid; color: gray">
		<br> <br>
		<label for="comment" class="col-sm-1">아이디 : </label> <label class="col-sm-1">${qnaview.id}</label>
		<label for="comment" class="col-sm-1">카테고리: </label> <label class="col-sm-1">${qnaview.majorName}</label>
		<label class="col-sm-4"></label>
		<label for="comment" class="col-sm-1">작성일: </label> <label class="col-sm-2">${qnaview.reg_date}</label>
		<label class="col-sm-1"></label>
		
		<div class="col-sm-12">
			<hr>
		</div>

		<div class="col-sm-12" row="25"
			style="border: 1px solid; color: gray; height: 250px;">${qnaview.content}</div>
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
		<br> <br> 
		<label for="comment" class="col-sm-12">아이디 : ${qnaview.id} 님 </label> 
		<label class="col-sm-12"><hr></label>
		<label for="comment" class="col-sm-12">Answer : </label> 
		<div class="col-sm-10" >
			<input type="text" class="form-control" id="qna_subject" name="qna_subject" placeholder="제목을 입력해주세요">
		</div>        			
		<div class="col-sm-10">
           	 <textarea name="qna_comment" id="qna_comment" class="form-control" placeholder="내용을 입력해주세요"></textarea>
		</div>
		<label class="col-sm-10"></label>
		<button type="button" class="btn btn-danger col-sm-1 btn-md" id="cancelBtn">Cancel</button>
		<button type="button" class="btn btn-danger col-sm-1 btn-md" id="saveBtn">Save</button>
	</div>

	<div class="col-sm-12">
		<label class="col-sm-1"></label>
		<div class="col-sm-10">
			<hr>
		</div>
	</div>
	</form>
</div>
</body>
</html>
