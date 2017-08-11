<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/template/head_include.jsp"%>
<link
	href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css"
	rel="stylesheet">
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.4/jquery.js"></script>
<script
	src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>
<link
	href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.1/summernote.css"
	rel="stylesheet">
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.1/summernote.js"></script>

<%@ include file="/common/template/nav.jsp"%>
<script type="text/javascript">

$(document).ready(function(){
	$('#listBtn').click(function(){
			 $(location).attr('href','${root }/notice/userNoticelist.akcord?pg=1&key=&word=&order=');
	});
});


</script>
	<div class="container akcord">
		<div class="col-sm-12">
				<div class="page-header titleinfo">
					    <h2 id="container"><i class="fa fa-comments"></i>  &nbsp;<b>공지사항</b></h2><h5>AKCORD 공지사항입니다.</h5>
				</div>
			<div class="col-sm-12">
			<div class="form-group">
			</div>
			<form name="noticeModifyform" method="post" action="">
				<input type="hidden" name="notice_id" value="${notice.notice_id }">
				<%-- <input type="hidden" name="is_notice" value="${notice.is_notice }">
				<input type="hidden" name="reg_date" value="${notice.reg_date }">
				<input type="hidden" name="hit" value="${notice.hit }"> --%>
				
				<label for="title">글 제목</label>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;  &nbsp;  &nbsp; 
			 	<span style="text-align: right">등록일 :${notice.reg_date }&nbsp; 조회수: ${notice.hit }</span>
				<input type="text" name="subject"
					class="form-control" id="subject" value="${notice.subject }" disabled="disabled">

				<div class="form-group">
					<label for="content">글 내용</label>
					<textarea name="content" id="content" cols="67" rows="25"
						class="form-control" required disabled="disabled">${notice.content }</textarea>
				</div>
				<div align="center">
					<button type="button" class="btn btn-sm" id="listBtn">
						확인</button>
				</div>
			</form>
		</div>
		</div>
	</div>
<%@include file="/common/template/footer.jsp"%>