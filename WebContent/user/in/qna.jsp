<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/template/head_include.jsp"%>
<%@ include file="/common/template/nav.jsp"%>
<%@ include file="/common/public.jsp" %>

<script>
$(document).ready(function() {
	$('#answerBtn').click(function() {
		var qna_id = $('.qna_id').val();
		$(location).attr('href', '${root}/in/comment.akcord?qna_id='+qna_id);	
	});
		
	$('#upBtn').click(function() {
		$('form[name=answerform]').attr('action', '${root}/in/updateQuestion.akcord').submit();
	});
		
	$('#delBtn').click(function() {
		$('form[name=answerform]').attr('action', '${root}/in/deleteQuestion.akcord').submit();
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


<form class="answerform" id="answerform" name="answerform" action="" method="">
<input type="hidden" class="qna_id" name="qna_id" data-qna_id="${qnaview.qna_id}" value="${qnaview.qna_id}">
<input type="hidden" id="qna_comment_id" name="qna_comment_id" data-qna_id="${qnaview.qna_comment_id}" value="${qnaview.qna_comment_id}">
<input type="hidden" class="subject" name="subject" data-subject="${qnaview.subject}" value="${qnaview.subject}">
<input type="hidden" class="content" name="content" data-content="${qnaview.content}" value="${qnaview.content}">
<input type="hidden" class="majorName" name="majorName" data-majorName="${qnaview.majorName}" value="${qnaview.majorName}">
<input type="hidden" id="user_id" name="user_id" value="${qnaview.user_id}">
<div class="container col-sm-12 form-group">
	<br>
	<div class="col-sm-1"></div>

	<div class="col-sm-10" style="border: 1px solid; color: gray">
		<br> <br>
		<label for="comment" class="col-sm-1">아이디 : </label> <label class="col-sm-1">${qnaview.id}</label>
		<label for="comment" class="col-sm-1">카테고리: </label> <label class="col-sm-1">${qnaview.majorName}</label>
		<label class="col-sm-2"></label>
		<label for="comment" class="col-sm-1">작성일: </label> <label class="col-sm-2">${qnaview.reg_date}</label>
		<label class="col-sm-1"></label>
		<c:if test="${user.user_id == qnaview.user_id && qnaview.commentcnt == 0}">
			<input type="button" class="col-sm-1 btn btn-danger" id="upBtn" value="수정">
			<input type="button" class="col-sm-1 btn btn-danger" id="delBtn" value="삭제">
		</c:if>

		<div class="col-sm-12">
			<hr>
		</div>

		<div class="col-sm-12" row="25" style="border: 1px solid; color: gray; height: 250px;">
			${qnaview.content}
		</div>
		<label class="col-sm-11"></label>
		<button type="button" class="btn btn-danger col-sm-1 btn" id="answerBtn">Answer</button>
	</div>
	<br>

	<c:if test="${comments != null }">
		<c:forEach var="list" items="${comments}" varStatus="i">
			<div class="col-sm-1"></div>
			<div class="col-sm-10" style="border: 1px solid; color: gray">
				<br> <br>
				<label for="comment" class="col-sm-6">아이디 : ${list.id} 님의 답변입니다.</label>
				<label for="comment" class="col-sm-4">작성일: ${list.reg_date} </label>
				<button type="button" id="modifyBtn" name="modifyBtn" class="btn btn-danger">수정</button>
				<button type="button" id="deleteBtn" name="deleteBtn" class="btn btn-danger">삭제</button>

				<div class="col-sm-12">
					<hr>
				</div>
				<div class="col-sm-12">제목 : ${list.qna_subject}</div>
				<div class="col-sm-12" row="25">답변 : ${list.qna_comment}</div>
				<div class="col-sm-12">
					<hr>
				</div>
				<div class="col-sm-12">
					<label class="col-sm-12" style="text-align: right;">
						<span class="glyphicon glyphicon-thumbs-up gi-2x good${i.index }" ></span>
						&nbsp;&nbsp;&nbsp;
						<span class="glyphicon glyphicon-thumbs-down gi-2x bad${i.index }"></span>
					</label>
				</div>
				<div class="col-sm-12 form-group" style="margin-left: -15px">
					<textarea rows="5" cols="150"></textarea>
					<button type="button" class="btn btn-danger">Commend</button>
					<button type="button" id="modifyBtn" name="modifyBtn" class="btn btn-danger">수정</button>
					<button type="button" id="deleteBtn" name="deleteBtn" class="btn btn-danger">삭제</button>
				</div>
			</div>
	
			<div class="col-sm-12">
				<label class="col-sm-1"></label>
				<div class="col-sm-10">
					<hr>
				</div>
			</div>
		</c:forEach>
	</c:if>
</div>
</form>
</body>
</html>
