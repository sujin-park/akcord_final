<%@include file="/common/template/head_include.jsp"%>
<%@ include file="/common/template/nav.jsp"%>
<%@ include file="/common/public.jsp" %>

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
		$('#pg').val('1');
		$('#commonForm').attr('action', '${root}/in/list.akcord').submit();
	});

	$('#resetBtn').click(function() {
		//joinmove();
		$('.note-editable').empty();
	});
	
	$('#updateBtn').click(function() {
		$('form[name=questionForm]').attr('method','post').attr('action','${root}/in/updateQuestion.akcord').submit();
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

<!-- 회원 고유코드, 제목, 내용, 작성날짜(sysdate), 카테고리 고유번호  -->
<div class="container col-sm-12 form-group" style="padding-top:60px;">
	<form id="questionForm" name="questionForm" class="form-horizontal" method="" action="">
	<input type="hidden" class="qna_id" name="qna_id" data-qna_id="${question.qna_id}" value="${question.qna_id}">
	<input type="hidden" name="hit" value="1">
	
		<fieldset>
			<div class="form-group">
				<label class="col-sm-2 control-label"></label>
				<div class="col-sm-2">
					
					<select class="form-control" id="sel1" name="major_id">
							<option value="0" ${question.majorName == "인문계열"?'selected="selected"':''}>인문계열</option>
							<option value="1" ${question.majorName == "사회계열"?'selected="selected"':''}>사회계열</option>
							<option value="2" ${question.majorName == "교육계열"?'selected="selected"':''}>교육계열</option>
							<option value="3" ${question.majorName == "공학계열"?'selected="selected"':''}>공학계열</option>
							<option value="4" ${question.majorName == "자연계열"?'selected="selected"':''}>자연계열</option>
							<option value="5" ${question.majorName == "의약계열"?'selected="selected"':''}>의약계열</option>
							<option value="6" ${question.majorName == "예체능계열"?'selected="selected"':''}>예체능계열</option>
					</select>
					
				</div>
				<div class="col-sm-6" >
					<input type="text" class="form-control" id="subject" name="subject"
						placeholder="제목을 입력해주세요" value="${question.subject }">
				</div>

			</div>

			<div class="form-group">
				<label class="col-sm-2 control-label"></label>
				<div class="col-sm-8">
					    <div class="form-group">
           			
           	 <textarea name="content" id="content" class="form-control" placeholder="내용을 입력해주세요">${question.content }
           	 </textarea></div>
       
			
					<button type="button" class="btn btn-danger col-sm-1 btn-lg"
						id="cancelBtn">취소</button>
					<div class="col-sm-9"></div>
					<div>
						<button type="button" class="btn btn-danger col-sm-1 btn-lg"
							id="resetBtn">재작성</button>

						<button type="button" class="btn btn-danger col-sm-1 btn-lg" id="updateBtn">수정</button>
					</div>
				</div>

			</div>

		</fieldset>

	
	</form>
</div>

</body>
</html>