<%@include file="/common/template/head_include.jsp"%>
<%@ include file="/common/template/nav.jsp"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!-- include libraries(jQuery, bootstrap) -->


<!-- include summernote css/js-->
<link
	href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.6/summernote.css"
	rel="stylesheet">
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.6/summernote.js"></script>

<script>
	$(document).ready(function() {
		$('#summernote').summernote({
			height : 500,
			codemirror : { // codemirror options
				theme : 'monokai'
			}
		});
		$('#cancelBtn').click(function() {
			//joinmove();
			$(location).attr('href', '${root}/in/inmain.akcord');
		});

		$('#resetBtn').click(function() {
			//joinmove();
			$('.note-editable').empty();
		});
		$('#saveBtn').click(function() {
			
			$('form[name=questionFrom]').attr('method','post').attr('action','${root}/in/inmain.akcord').submit();
		
				
		});
		 $('#content').summernote({
		      height: 500,          // 기본 높이값
		       minHeight: null,      // 최소 높이값(null은 제한 없음)
		       maxHeight: null,      // 최대 높이값(null은 제한 없음)
		       focus: false,          // 페이지가 열릴때 포커스를 지정함
		       lang: 'ko-KR' 
		   });

	});
</script>
<title>Insert title here</title>



<!-- 회원 고유코드, 제목, 내용, 작성날짜(sysdate), 카테고리 고유번호  -->
<div class="container col-sm-12 form-group" style="padding-top:60px;">
	<form id="questionFrom" name="questionFrom" class="form-horizontal" action="">
	<input type="hidden" name="hit" value="1">
	
		<fieldset>
			<div class="form-group">
				<label class="col-sm-2 control-label"></label>
				<div class="col-sm-1">
					
					<select class="form-control" id="sel1" name="major_id">
							<option value="1">CSS</option>
							<option value="2">HTML</option>
							<option value="3">C++</option>
							<option value="4">JAVA</option>
					</select>
					
				</div>
				<div class="col-sm-7" >
					<input type="text" class="form-control" id="usr" name="subject"
						placeholder="제목을 입력해주세요">
				</div>

			</div>

			<div class="form-group">
				<label class="col-sm-2 control-label"></label>
				<div class="col-sm-8">
					    <div class="form-group">
           			
           	 				<textarea name="content" id="content" class="form-control" placeholder="내용을 입력해주세요" required>
            			</textarea>
         				</div>
       
			
					<button type="button" class="btn btn-danger col-sm-1 btn-lg"
						id="cancelBtn">cancel</button>
					<div class="col-sm-9"></div>
					<div>
						<button type="button" class="btn btn-danger col-sm-1 btn-lg"
							id="resetBtn">reset</button>

						<button type="button" class="btn btn-danger col-sm-1 btn-lg" id="saveBtn">Save</button>
					</div>
				</div>

			</div>

		</fieldset>

	
	</form>
</div>

</body>
</html>