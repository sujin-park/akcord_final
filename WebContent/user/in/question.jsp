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
			
			$('form[name=questionFrom]').attr('action','${root}/in/inmain.akcord');
			$('form[name=questionFrom]').submit();
				
		});

	});
</script>
<title>Insert title here</title>


<!-- 회원 고유코드, 제목, 내용, 작성날짜(sysdate), 카테고리 고유번호  -->
<div class="container col-sm-12 form-group">
	<form id="questionFrom" name="questionFrom" class="form-horizontal" action="">
	
		<fieldset>
			<div class="form-group">
				<label class="col-sm-2 control-label"></label>
				<div class="col-sm-1">
					
					<select
							class="form-control" id="sel1">
							<option >CSS</option>
							<option>HTML</option>
							<option>C++</option>
							<option>JAVA</option>
						</select>
					
				</div>
				<div class="col-sm-7">
					<input type="text" class="form-control" id="usr"
						placeholder="제목을 입력해주세요">
				</div>

			</div>

			<div class="form-group">
				<label class="col-sm-2 control-label"></label>
				<div class="col-sm-8">
					<div id="summernote">내용을 입력해주세요.</div>
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