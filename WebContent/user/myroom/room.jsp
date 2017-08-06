<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/common/template/head_include.jsp"%>
<link rel="stylesheet" href="/akcord_project/user/group/css/list.css">
<link rel="stylesheet" href="/akcord_project/user/myroom/css/myroom.css">
<%@include file="/common/template/nav.jsp"%>
<script type="text/javascript">
$(document).ready(function() {
	$('#listBtn').click(function() {
		$(location).attr('href', "${root}/myroom/myroomlist.akcord?user_id=1&ch=1&myroomId=");
	});
});
</script>
<div class="container-fluid">
	<div class="row">
		<div class="col-sm-2">
			<button id="listBtn" name="listBtn" value="myroomList">버튼</button>
		</div>
	</div>
</div>
</body>
</html>