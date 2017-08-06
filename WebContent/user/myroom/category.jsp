<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	$('#createBtn').click(function() {
		var id = $(this).val();
		if($('#categoryText').val() == "") {
			alert("카테고리명을 입력하세요.");
			return;
		} else {
			var subject = $('#categoryText').val();
			$.ajax({
				type : 'GET',
				dataType : 'json',
				url : '${root}/myroom/addC.akcord',
				data : {'subject':subject}
			});
			var myroomId = $('#myroomId').val();
			var inp = $('<div class="col-sm-8">').append('<input type="text" name="category" class="form-control" value="' + $('#categoryText').val() +'">');
			//var saveBtn = $('<div class="col-sm-2">').append('<button type="button" id="categoryUpdateBtn" class="btn btn-danger" value=' + myroomId + '>수정</button>');
			var deleteBtn = $('<div class="col-sm-3">').append('<button type="button" id="categoryDeleteBtn" class="btn btn-danger">삭제</button>');
			$('#categoryText').val('');
			$(inp).appendTo('#sectionC');
			//$(saveBtn).appendTo('#sectionC');
			$(deleteBtn).appendTo('#sectionC');
		}
	});
	
	$(document).on('click', '#categoryDeleteBtn', function() {
		var myroomId = $(this).val();
		$.ajax({
			type : 'GET',
			dataType : 'json',
			url : '${root}/myroom/deleteC.akcord',
			data : {'myroomId' : myroomId}
		});
		$(this).parent().prev().remove();
		$(this).parent().remove();
		$('#categoryText').val('');
	});
		//$(this).parents('#section1').remove();
		//$(this).parents('#section2').remove();
		//$(this).parents('#section3').remove();
		//answerCount--;
	
	$('#closeBtn').click(function() {
		$(location).attr('href', "${root}/myroom/myroomlist.akcord?ch=1&myroomId=&pg=1");
	});
	
});
</script>
	<div id="sectionModal" class="modal fade" role="dialog">
	<div class="modal-dialog" style="width: 30%;">
	    <!-- Modal content-->
	    <div class="modal-content">
	    	<div class="modal-header">
	        	<button type="button" class="close" data-dismiss="modal">&times;</button>
	        	<h4 class="modal-title">카테고리 설정</h4>
	      	</div>
	      	<div class="modal-body">
			    <form class="form-horizontal" action="#">
	                <div class="form-group" id="form-group">
						<div id="sectionC" align="center">
	                    	<c:forEach var="myroomDto" items="${sectionList}">
	                    	<div id="section1" class="col-sm-8" align="center">
	                        	<input type="text" id="category" name="category" class="form-control" value="${myroomDto.subject}">
	                    	</div>
	                    	<div id="section3" class="col-sm-3" align="center">
	                     	   <button type="button" id="categoryDeleteBtn" class="btn btn-danger" value="${myroomDto.myroomId}">삭제</button>
	                    	</div>
							</c:forEach>
	                    </div>
	                    <div id="createText" class="col-sm-10" align="center" style="margin-top: 30px;">
	                        <input type="text" id="categoryText" name="categoryText" class="form-control">
	                    </div>
	                    <div id="createDiv" class="col-sm-2" align="center" style="margin-top: 30px;">
	                    	<button type="button" id="createBtn" class="btn btn-danger">추가</button>                 	
	                    </div>
	                </div>
			    </form>
			</div>
	      	<div class="modal-footer">
	        	<button type="button" id="closeBtn" class="btn btn-default" data-dismiss="modal">Close</button>
	      	</div>
	    </div>
	</div>
</div>
</body>
</html>