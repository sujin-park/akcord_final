<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/common/template/head_include.jsp" %>
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.4/jquery.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.1/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.1/summernote.js"></script>
<script>
$(document).ready(function() {
   $('#content').summernote({
      height: 500,          // 기본 높이값
       minHeight: null,      // 최소 높이값(null은 제한 없음)
       maxHeight: null,      // 최대 높이값(null은 제한 없음)
       focus: false,          // 페이지가 열릴때 포커스를 지정함
       lang: 'ko-KR' 
   });
   $('#registerBtn').click(function(){

		document.noticeWriteform.action = "${root}/notice/noticewrite.akcord";
		document.noticeWriteform.submit(); 
   });
});
</script>
<%@ include file="/common/template/nav.jsp" %>
<div class="container-fluid">
	<div class="row">
	<div class="col-sm-3" ></div>
	<div class="col-sm-6" >
         <div class="form-group">
         	<h2>공지사항 글쓰기</h2>
         	</div>
	<form name ="noticeWriteform" method="post" action="">
            <label for="title">SUBJECT</label>
            <input type="text" name="subject" class="form-control" id="subject" value="">
         
         <div class="form-group">
            <label for="content">CONTENT</label>
            <textarea name="content" id="content" class="form-control" required>
            </textarea>
         </div>
         <div align="center">
           <button type="button" class="btn btn-sm" id="registerBtn">
				등록
			</button>
			<button type="button" class="btn btn-sm">
				취소
			</button>
			</div>
			</form>
      </div>
      	<div class="col-sm-3" ></div>
      	
      </div>
      
</div>
</body>
</html>