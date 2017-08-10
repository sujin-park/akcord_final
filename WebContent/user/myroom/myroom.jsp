<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/template/head_include.jsp"%>
<link rel="stylesheet" href="/akcord_project/user/myroom/css/myroom.css">

<!-- SummerNote -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.4/jquery.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>

<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.1/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.1/summernote.js"></script>

<%@ include file="/common/template/nav.jsp"%>
<%@ include file="/common/public.jsp" %>
<style type="text/css">
select {
	width: 100px;
	height: 30px;
	font-size: 18px;
	color: #d34e4c;
	border: 1px solid #d34e4c;
	border-radius: 3px;
	align: right;
}
</style>

<script>
$(document).ready(function() {
	$('#content').summernote({
		height : 445, // 기본 높이값
		minHeight : null, // 최소 높이값(null은 제한 없음)
		maxHeight : null, // 최대 높이값(null은 제한 없음)
		focus : false, // 페이지가 열릴때 포커스를 지정함
		lang : 'ko-KR'
	});

	$('#btnMouse').mouseleave(function() {
		$('#btnMouseDiv').hide();
	});

	$('#btnMouse').mouseenter(function() {
		$('#btnMouseDiv').show();
	});
		
	$('#listBtn').click(function() {
		$('#pg').val('1');
		$('#key').val('${query.key}');
		$('#word').val('${query.word}');
		$('#myroomId').val('${query.myroomId}');
		$('#ch').val('2');
		$('#num').val('${query.num}');
		$('#commonForm').attr('action', '${root}/myroom/myroomlist.akcord').submit();
	});
	
	$('#resetBtn').click(function() {
		var myroomId = $('.myroomId1').val();
		$(location).attr('href', "${root}/myroom/myroomlist.akcord?ch=2&myroomId=${query.myroomId1}&pg=1");
	});
		
	$('#registerBtn').click(function() {
		$('#pageform').attr('action', '${root}/myroom/write.akcord?num=100').submit();
	});
	
	$('#modifyBtn').click(function() {
		if('${query.myroomId1}' != null && '${query.myroomId1}' != "")
			$('#pageform').attr('action', '${root}/myroom/write.akcord?num=${query.num}&myroomId=${query.myroomId1}').submit();
		else
			$('#pageform').attr('action', '${root}/myroom/write.akcord?num=${query.num}&myroomId=${query.myroomId}').submit();
	});
	
	$('#deleteBtn').click(function() {
		$('#pg').val('1');
		$('#key').val('${query.key}');
		$('#word').val('${query.word}');
		$('#ch').val('2');
		$('#myroomId').val($('.myroomId1').val());
		$('#myroomNextId').val($('.myroomNextId1').val());
		$('#commonForm').attr('action', '${root}/myroom/delete.akcord').submit();
	});
});
</script>
<div class="container-fluid" style="padding-top: 60px;">
	<div class="row">
		<div class="col-sm-2"></div>
		<form id="searchform" name="form" method="post" action="" style="">
			<div class="col-sm-1 center-menu" style="padding-top: 20px;">
				<div class="row">
					<div class="input-group">
						<select id="search" name="search">
							<option>전체</option>
							<c:forEach var="myroomDto" items="${sectionList}">
							<option class="sectionId" value="${myroomDto.myroomId}" style="font-size: 14px;">${myroomDto.subject}</option>
							</c:forEach>
						</select>&nbsp;
					</div>
					<div class="input-group">
						<input type="text" id="searchText" size="11">
						<img src="/akcord_project/doc/img/search1.png" id="searchBtn" width="25" height="25">
					</div>
					<ul style="display: inline;">
					<c:forEach var="myroomDto" items="${sectionList}">
						<li><a href="${root}/myroom/myroomlist.akcord?ch=2&myroomId=${myroomDto.myroomId}&pg=1"><i class="glyphicon glyphicon-chevron-right"></i>${myroomDto.subject}</a></li>
					</c:forEach>
				</ul>
				</div>
			</div>
		</form>
		<div class="col-sm-9" style="padding-top: 20px;">
			<div class="col-sm-1"></div>
			<form id="pageform" name="pageform" method="POST" action="" style="">
				<input type="hidden" class="myroomId1" id="myroomId1" name="myroomId1" value="${myroomId}">
				<input type="hidden" class="myroomNextId1" id="myroomNextId1" name="myroomNextId1" value="${myroomNextId}">
				<div class="col-sm-10" style="float: left;" id="btnMouse">
					<div class="row">
					<input type="button" class="btn btn-danger" style="width: 80px; font-size: 16px; float: right;"  id="listBtn" value="목록">
						<div class="form-group" style="padding-top: 30px;">
							<label for="subject" >SUBJECT</label>
							<input type="text" id="subject" name="subject" class="form-control" value="${myroomNextDto.subject}" required>
						</div>
						<div class="form-group">
							<label for="content">CONTENT</label>
							<textarea id="content" name="content" class="form-control" required>${myroomNextDto.content}
							</textarea>
						</div>
					</div>
					<div class="row">
						<div align="right">
							<select id="isShare" name="isShare">
								<option value="0" style="font-size: 14px;" ${myroomNextDto.isShare == "0"?'selected="selected"':''}>비공개</option>
								<option value="1" style="font-size: 14px;" ${myroomNextDto.isShare == "1"?'selected="selected"':''}>공개</option>
							</select>
							<select id="groupId" name="groupId">
								<option value="0">----------</option>
								<c:set var="groupId" value="${myroomNextDto.groupId}" />
								<c:forEach var="grouproomDto" items="${groupNameList}">
									<option value="${grouproomDto.groupId}" ${groupId == grouproomDto.groupId?'selected="selected"':''}>${grouproomDto.groupName}</option>
								</c:forEach>
							</select>
						</div>
						<div align="center" id="btnMouseDiv">
						<c:if test="${query.num == 100}">
							<input type="submit" class="btn btn-danger" style="width: 80px; font-size: 16px;" id="registerBtn" value="등록">
						</c:if>
						<c:if test="${query.num == 200}">
							<input type="submit" class="btn btn-danger" style="width: 80px; font-size: 16px;" id="modifyBtn" value="수정">
						</c:if>
							<input type="reset" class="btn btn-danger" style="width: 80px; font-size: 16px;" id="resetBtn" value="취소">
							&nbsp;<input type="button" class="btn btn-danger" style="width: 80px; font-size: 16px;" id="deleteBtn" value="삭제">
						</div>
					</div>
				</div>
			</form>
		</div>
		<!-- End Listing-->
	</div>
</div>
</body>
</html>