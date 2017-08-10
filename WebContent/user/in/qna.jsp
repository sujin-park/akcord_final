<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/template/head_include.jsp"%>
<%@ include file="/common/template/nav.jsp"%>
<%@ include file="/common/public.jsp" %>

<script>
//$.ajax({
//	type : 'GET',
//	dataType : 'json',
//	url : '${root}/in/replyList.akcord',
//	data : {'qna_id' : '${qnaview.qna_id}'},
//	success : function(data) {
//		makeReplyList(data);
//	}
//});

$(document).ready(function() {
	
	$('.good').text($('.good').attr('data-gValue'));
	$('#answerBtn').click(function() {
		var qna_id = $('.qna_id').val();
		$(location).attr('href', '${root}/in/comment.akcord?qna_id='+qna_id + '&qna_comment_id=' + $(this).attr('data-good'));	
	});
		
	$('#questionModifyBtn').click(function() {
		$('form[name=answerform]').attr('action', '${root}/in/updateQuestion.akcord').submit();
	});
		
	$('#questionDeleteBtn').click(function() {
		$('form[name=answerform]').attr('action', '${root}/in/deleteQuestion.akcord').submit();
	});
	
	$(document).on('click', '.good', function() {
		var qna_id = $('.qna_id').val();
		var qna_comment_id = $('.good').attr('data-good');
		var good_or_bad = $(this).attr('data-gCnt');
		
		$.ajax({
			type : 'POST',
			dataType : 'json',
			url : '${root}/in/good_or_bad.akcord',
			data : {'qna_comment_id':qna_comment_id, 'gob':good_or_bad},
			success : function(data) {
				if(data.list.qna_comment_id==qna_id) {					
					$('.good').text("");
					$('.good').text(data.list.goodCount);
				}
			}
		});
		//$(location).attr('href', '${root}/in/good_or_bad.akcord?qna_id='+ qna_id +'&qna_comment_id='+qna_comment_id + '&gob=' + good_or_bad);
	});
	
	$(document).on('click', '.bad', function() {
		var qna_id = $('.qna_id').val();
		var qna_comment_id = $('.bad').attr('data-bad');
		var good_or_bad = $(this).attr('data-bCnt');
		
		$.ajax({
			type : 'GET',
			dataType : 'json',
			url : '${root}/in/good_or_bad.akcord',
			data : {'qna_comment_id':qna_comment_id, 'gob':good_or_bad},
			success : function(data) {
				$('.bad').text("");
				$('.bad').text(data.list.goodCount);
			}
		});
		//$(location).attr('href', '${root}/in/good_or_bad.akcord?qna_id='+ qna_id +'&qna_comment_id='+qna_comment_id + '&gob=' + good_or_bad);
	});
	
	$(document).on('click', '.commendBtn', function() {
		var qna_comment_id = $(this).attr('data-commend');
		var content = $(this).parent().children('.replyText').val();
		$.ajax({
			type : 'POST',
			dataType : 'json',
			url : '${root}/in/replyWrite.akcord',
			data : {'qna_comment_id':qna_comment_id, 're_comment' : content},
			success : function(data) {
				alert("왜 성공 안돼");
				alert(data.replyDto);
				alert(data.replyDto.id);
				alert(data.replyDto.re_comment)
				$('<div id="replyView" class="col-sm-12 replyView">').append('<tr class="replytr">');
				$('<tr class="replytr">').append('<td class="bg_board_title_02 col-sm-1" height="1" width="10%" style="overflow: hidden;" data-add_id="">'+data.replyDto.id+'</td>');
				$('<td class="bg_board_title_02 col-sm-1" height="1" width="10%" style="overflow: hidden;" data-add_id="">'+data.replyDto.id+'</td>').append('<td class="bg_board_title_02 col-sm-8" height="1" width="70%" style="overflow: hidden;" data-add_re_comment="">'+data.replyDto.re_comment+'</td>');
				$('<td class="bg_board_title_02 col-sm-8" height="1" width="70%" style="overflow: hidden;" data-add_re_comment="">'+data.replyDto.re_comment+'</td>').append('<td class="bg_board_title_02" height="1" width="10%" style="overflow: hidden; padding: 0px">');
				$('<td class="bg_board_title_02" height="1" width="10%" style="overflow: hidden; padding: 0px">').append('<div align="right">');
				$('<div align="right">').append('<button type="button" id="replyModifyBtn" name="replyModifyBtn" class="btn btn-danger replyModifyBtn">수정</button>');
				$('<button type="button" id="replyModifyBtn" name="replyModifyBtn" class="btn btn-danger replyModifyBtn">수정</button>').append('<button type="button" id="replyDeleteBtn" name="replyDeleteBtn" class="btn btn-danger replyDeleteBtn">삭제</button>');
				$('</div>');
			}
		});
	});

	//$(document).on('click', '.bad', function() {
	//	var qna_comment_id = $(this).attr('data-good');
	//	var good_or_bad = $(this).attr('data-bCnt');
	//	var qna_id = $('.qna_id').val();
	//	$(location).attr('href', '${root}/in/good_or_bad.akcord?qna_id='+ qna_id +'&qna_comment_id='+qna_comment_id + '&gob=' + good_or_bad);
	//});
	
	/* $(document).on('click', '.commendBtn', function() {
		var qna_comment_id = $(this).attr('data-commend');
		var content = $(this).parent().children('.replyText').val();
		if(content != '') {
			$.ajax({
				type : 'POST',
				dataType : 'json',
				url : '${root}/in/replyWrite.akcord',
				data : {'qna_comment_id':qna_comment_id, 're_comment' : content},
				success : function(data) {
					alert("zzzzzzzzzzzzzzzzzzzzzzz");
					$(this).parent().children('.replyText').val('');
					var output = '';
					var len = data.replyList.length;
					for(var i=0; i<len; i++) {
						alert(len);
						alert("aaaaaaaaaaaaaaaaaaaaaa");
						//if(data.replyList[i].qna_comment_id == $('.commendBtn').attr('data-commend')) {
						//	output += '	<table width="100%" cellpadding="0" cellspacing="0" border="0">';
						//	output += '		<div id="replyView" class="col-sm-12">';
						//	output += '			<tr>';
						//	output += '			<td class="bg_board_title_02 col-sm-1" height="1" width="10%" style="overflow: hidden; padding: 0px">'+ data.replyList[i].id +'</td>';
						//	output += '			<td class="bg_board_title_02 col-sm-8" height="1" width="70%" style="overflow: hidden; padding: 0px">'+ data.replyList[i].re_comment +'</td>';
						//	output += '			<td class="bg_board_title_02 col-sm-1" height="1" width="10%" style="overflow: hidden; padding: 0px">'+ data.replyList[i].reg_date +'</td>';
						//	output += '			<td class="bg_board_title_02" height="1" width="10%" style="overflow: hidden; padding: 0px">';
						//	output += '				<div align="right">';
						//	output += '				<c:if test="${user.id == data.replyList[i].id} ">';
						//	output += '					<a href="#" class="replyModifyBtn" data-mseq="' + data.replyList[i].qna_comment_id +'">수정</a>';
						//	output += '					<a href="#" class="replyDeleteBtn" data-mseq="' + data.replyList[i].qna_comment_id +'">삭제</a>';
						//	output += '				</c:if>';
						//	output += '			</td>';
						//	output += '			</tr>';
						//	output += '		</div>';
						//	output += '<tr>';
						//	output += '	<td colspan="4" width="100%">';
						//	output += '		<div id="modifyDiv'+ data.replyList[i].qna_comment_id +'" style="display: none;">';
						//	output += '		<table width="100%">';
						//	output += '		<tr>';
						//	output += '			<td><textarea id="mcontent'+ data.memolist[i].mseq +'" name="mcontent" style="width: 100%; height: 80px;">'+ data.replyList[i].re_comment +'</textarea></td>';
						//	output += '			<td><input type="button" class="replyModifyBtn" data-qna_comment_id="'+ data.replyList[i].qna_comment_id +'" value="수정"></td>';
						//	output += '			<td><input type="button" class="replyDeleteBtn" data-qna_comment_id="'+ data.replyList[i].qna_comment_id +'" value="취소"></td>';
						//	output += '		</tr>';
						//	output += '		</table>';
						//	output += '		</div>';
						//	output += '	</table>';
						//}
					}
					$('#replyBbody').empty();
					$('#replyBbody').append(output);
				}
			});
		}
	}); */
});

function makeReplyList(data) {
	var output = '';
	var len = data.replyList.length;
	for(var i=0; i<len; i++) {
		alert("aaaaaaaaaaaaaaaaaaaaaa");
		if(data.replyList[i].qna_comment_id == $('.commendBtn').attr('data-commend')) {
			output += '	<table width="100%" cellpadding="0" cellspacing="0" border="0">';
			output += '		<div id="replyView" class="col-sm-12">';
			output += '			<tr>';
			output += '			<td class="bg_board_title_02 col-sm-1" height="1" width="10%" style="overflow: hidden; padding: 0px">'+ data.replyList[i].id +'</td>';
			output += '			<td class="bg_board_title_02 col-sm-8" height="1" width="70%" style="overflow: hidden; padding: 0px">'+ data.replyList[i].re_comment +'</td>';
			output += '			<td class="bg_board_title_02 col-sm-1" height="1" width="10%" style="overflow: hidden; padding: 0px">'+ data.replyList[i].reg_date +'</td>';
			output += '			<td class="bg_board_title_02" height="1" width="10%" style="overflow: hidden; padding: 0px">';
			output += '				<div align="right">';
			output += '				<c:if test="${user.id == data.replyList[i].id} ">';
			output += '					<a href="#" class="replyModifyBtn" data-mseq="' + data.replyList[i].qna_comment_id +'">수정</a>';
			output += '					<a href="#" class="replyDeleteBtn" data-mseq="' + data.replyList[i].qna_comment_id +'">삭제</a>';
			output += '				</c:if>';
			output += '			</td>';
			output += '			</tr>';
			output += '		</div>';
			output += '<tr>';
			output += '	<td colspan="4" width="100%">';
			output += '		<div id="modifyDiv'+ data.replyList[i].qna_comment_id +'" style="display: none;">';
			output += '		<table width="100%">';
			output += '		<tr>';
			output += '			<td><textarea id="mcontent'+ data.memolist[i].mseq +'" name="mcontent" style="width: 100%; height: 80px;">'+ data.replyList[i].re_comment +'</textarea></td>';
			output += '			<td><input type="button" class="replyModifyBtn" data-qna_comment_id="'+ data.replyList[i].qna_comment_id +'" value="수정"></td>';
			output += '			<td><input type="button" class="replyDeleteBtn" data-qna_comment_id="'+ data.replyList[i].qna_comment_id +'" value="취소"></td>';
			output += '		</tr>';
			output += '		</table>';
			output += '		</div>';
			output += '	</table>';
		}
	}
	$('#replyBbody').empty();
	$('#replyBbody').append(output);
}


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
<input type="hidden" id="qna_comment_id" name="qna_comment_id" data-qna_comment_id="${qnaview.qna_comment_id}" value="${qnaview.qna_comment_id}">
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
			<input type="button" class="col-sm-1 btn btn-danger" id="questionModifyBtn" name="questionModifyBtn" value="수정">
			<input type="button" class="col-sm-1 btn btn-danger" id="questionDeleteBtn" name="questionModifyBtn" value="삭제">
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

		<c:forEach var="list" items="${comments}">
		<input type="hidden" id="qna_comment_id1" name="qna_comment_id1" data-qna_id="${list.qna_comment_id}" value="${list.qna_comment_id}">
			<div class="col-sm-1"></div>
			<div class="col-sm-10" style="border: 1px solid; color: gray">
				<br> <br>
				<label for="comment" class="col-sm-6">아이디 : ${list.id} 님의 답변입니다.</label>
				<label for="comment" class="col-sm-4">작성일: ${list.reg_date} </label>
				<div class="col-sm-2" align="right">
					<button type="button" id="commentModifyBtn" name="commentModifyBtn" class="btn btn-danger">수정</button>
					<button type="button" id="commentDeleteBtn" name="commentDeleteBtn" class="btn btn-danger">삭제</button>
				</div>

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
						<a href="#"><span class="glyphicon glyphicon-thumbs-up gi-2x good"  data-good="${list.qna_comment_id}" data-gCnt="1" data-gValue="${list.goodCount}"></span></a>
						&nbsp;&nbsp;&nbsp;
						<a href="#"><span class="glyphicon glyphicon-thumbs-down gi-2x bad" data-bad="${list.qna_comment_id}" data-bCnt="2">${list.badCount }</span></a>
					</label>
				</div>
				<div class="col-sm-12 form-group" style="margin-left: -15px;">
					<textarea rows="5" cols="160" data-reply="" class="replyText"></textarea>
					<button type="button" id="commendBtn" name="commendBtn" class="btn btn-danger commendBtn" data-commend="${list.qna_comment_id}">Commend</button>
				</div>
				<c:forEach var="reply" items="${replyList}">
					<c:if test="${list.qna_comment_id == reply.qna_comment_id }">
						<table width="100%" cellpadding="0" cellspacing="0" border="0">
							<div id="replyView" class="col-sm-12 replyView">
								<tr class="replytr">
									<td class="bg_board_title_02 col-sm-1" height="1" width="10%" style="overflow: hidden;" data-add_id="${reply.qna_comment_id }">${reply.id }</td>
									<td class="bg_board_title_02 col-sm-8" height="1" width="70%" style="overflow: hidden;" data-add_re_comment="${reply.qna_comment_id }">${reply.re_comment }</td>
									<td class="bg_board_title_02" height="1" width="10%" style="overflow: hidden; padding: 0px">
										<div align="right">
										<c:if test="${user.user_id == reply.user_id }">
											<button type="button" id="replyModifyBtn" name="replyModifyBtn" class="btn btn-danger replyModifyBtn">수정</button>
											<button type="button" id="replyDeleteBtn" name="replyDeleteBtn" class="btn btn-danger replyDeleteBtn">삭제</button>
										</c:if>
										</div>
									</td>
								</tr>
							</div>
						</table>
					</c:if>
				</c:forEach>
			</div>
	
			<div class="col-sm-12">
				<label class="col-sm-1"></label>
				<div class="col-sm-10">
					<hr>
				</div>
			</div>
		</c:forEach>
</div>
</form>
</body>
</html>
