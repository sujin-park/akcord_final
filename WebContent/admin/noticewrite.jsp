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
<script>
$(document).ready(function() {
$('#content').summernote({
			height : 500, // 기본 높이값
			minHeight : null, // 최소 높이값(null은 제한 없음)
			maxHeight : null, // 최대 높이값(null은 제한 없음)
			focus : false, // 페이지가 열릴때 포커스를 지정함
			lang : 'ko-KR'
	});

	$('#registerBtn').click(function() {
	 var str= $('#content').val();
		if($('#subject').val()==""){
			alert("제목을입력해주세요");
			return;
		}if(str.length<=5){
			alert("내용을입력해주세요");
			return;
		}
		$('input:checkbox[name=is_notice]:checked').each(function() {
			$(this).attr("value","1");
			document.noticeWriteform.action = "${root}/notice/noticewrite.akcord";
			document.noticeWriteform.submit();
		
	});
		
		document.noticeWriteform.action = "${root}/notice/noticewrite.akcord";
		document.noticeWriteform.submit();
	});
});
</script>
<%@ include file="/common/template/nav.jsp"%>
<div class="container-fluid">
	<div class="row">
		<div class="col-sm-3"></div>
		<div class="col-sm-6">

			<form name="noticeWriteform" method="post" action="">
				<div class="form-group">
					<h2>공지사항 글쓰기</h2>
				
				<div class="form-group">
					<div class="col-sm-8"><label for="title">SUBJECT</label> </div>
					<div class="col-sm-4" align="right"><input type="checkbox" id="is_notice" name="is_notice" value="0">공개</div>
				<input type="text" name="subject" class="form-control" id="subject" value="">
				</div>
				</div>
				<div class="form-group">
					<label for="content">CONTENT</label>
					<textarea name="content" id="content" class="form-control" cols="67" rows="25">
					</textarea>                              
				</div>
				<div align="center">

					<button type="button" class="btn btn-sm" id="registerBtn">
						등록</button>
					<button type="button" class="btn btn-sm">취소</button>

				</div>
			</form>
		</div>
		<div class="col-sm-3"></div>

	</div>

</div>
</body>
</html>