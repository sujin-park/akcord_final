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
	$('#modifyBtn').click(function(){
		 var str= $('#content').val();
			if($('#subject').val()==""){
				alert("제목을입력해주세요");
				return;
			}if(str.length<=5){
				alert("내용을입력해주세요");
				return;
			}
		document.noticeModifyform.action = "${root}/notice/noticemodify.akcord";
		document.noticeModifyform.submit();
	});
});


</script>
<div class="container-fluid">
	<div class="row">
		<div class="col-sm-3"></div>
		<div class="col-sm-6">
			<div class="form-group">
				<h2>공지사항 글쓰기</h2>
			</div>
			<form name="noticeModifyform" method="post" action="">
				<input type="hidden" name="notice_id" value="${notice.notice_id }">
				<%-- <input type="hidden" name="is_notice" value="${notice.is_notice }">
				<input type="hidden" name="reg_date" value="${notice.reg_date }">
				<input type="hidden" name="hit" value="${notice.hit }"> --%>
				
				<label for="title">SUBJECT</label> <input type="text" name="subject"
					class="form-control" id="subject" value="${notice.subject }">

				<div class="form-group">
					<label for="content">CONTENT</label>
					<textarea name="content" id="content" cols="67" rows="25"
						class="form-control" required>${notice.content }</textarea>
				</div>
				<div align="center">
					<button type="button" class="btn btn-sm" id="modifyBtn">
						수정</button>
					<button type="button" class="btn btn-sm">취소</button>
				</div>
			</form>
		</div>
		<div class="col-sm-3"></div>

	</div>

</div>
</body>
</html>