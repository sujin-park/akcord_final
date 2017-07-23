<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/template/head_include.jsp"%>
<link rel="stylesheet" href="/akcord/user/css/myroom.css">
<style type="text/css">
select {
    width: 100px;
    height: 30px;
    font-size: 18px;
    color: #006fff;
    border: 1px solid #006fff;
    border-radius: 3px;
    align : right;
}
</style>
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
	$('#java2').mouseleave (function(){
			$('#aaa').hide();
	});
	
	$('#java2').mouseenter(function(){
		$('#aaa').show();
});
});

</script>
<%@ include file="/common/template/nav.jsp" %>
	<div class="col-sm-3 center-menu" style="padding-left: 70px; padding-right: 5px">
		<div class="row">
			<div class="input-group">
      			<select id="searh">
        			<option> ---------- </option>
      			</select>&nbsp;
				<input type="text" size="15">&nbsp;
				<img src="/akcord/doc/img/search.png" width="30" height="30">
			</div>
		</div>
	</div>
	<div class="col-sm-1 center-menu" style="clear: both;">
		<ul>
			<li><a href=""><i class="glyphicon glyphicon-chevron-right"></i>JAVA </a></li>
			<li><a href=""><i class="glyphicon glyphicon-chevron-right"></i>ORACLE </a></li>
			<li><a href=""><i class="glyphicon glyphicon-chevron-right"></i>MENU TITLE </a></li>
			<li><a href=""><i class="glyphicon glyphicon-chevron-right"></i>MENU TITLE </a></li>
			<li><a href=""><i class="glyphicon glyphicon-chevron-right"></i>MENU TITLE </a></li>
			<li><a href=""><i class="glyphicon glyphicon-chevron-right"></i>MENU TITLE </a></li>
			<li><a href=""><i class="glyphicon glyphicon-chevron-right"></i>
				<span class="glyphicon glyphicon-plus" aria-hidden="true"></span></a>
			</li>
		</ul>
	</div>
	<div class="col-sm-2 center-menu" style="float: left;">
		<ul>
			<li><a href=""><i class="glyphicon glyphicon-chevron-right"></i>JAVA </a></li>
			<li><a href=""><i class="glyphicon glyphicon-chevron-right"></i>ORACLE </a></li>
			<li><a href=""><i class="glyphicon glyphicon-chevron-right"></i>MENU TITLE </a></li>
			<li><a href=""><i class="glyphicon glyphicon-chevron-right"></i>MENU TITLE </a></li>
			<li><a href=""><i class="glyphicon glyphicon-chevron-right"></i>MENU TITLE </a></li>
			<li><a href=""><i class="glyphicon glyphicon-chevron-right"></i>MENU TITLE </a></li>
			<li><a href=""><i class="glyphicon glyphicon-chevron-right"></i>MENU TITLE </a></li>
			<li><a href=""><i class="glyphicon glyphicon-chevron-right"></i>
				<span class="glyphicon glyphicon-plus" aria-hidden="true"></span></a></li>
		</ul>
	</div>
	<form id="form" name="form" method="post" action="" style="">
	<div class="col-sm-8" style="padding-top: 30px; float: left;" id="java2">
		<div class="row">
			<div class="form-group">
				<label for="title">SUBJECT</label>
				<input type="text" name="title" class="form-control" id="title" required>
			</div>
			<div class="form-group">
				<label for="content">CONTENT</label>
				<textarea name="content" id="content" class="form-control" required></textarea>
			</div>
		</div>
		<div class="row">
			<div align="right">
				<select id="sel1">
        			<option>비공개</option>
        			<option>공개</option>
      			</select>
      			<select id="sel2">
        			<option> ---------- </option>
      			</select>
			</div>
			<div align="center">
				<button type="submit" class="btn btn-danger" id="aaa">등록</button>
			</div>
		</div>
	</div>
	</form>
</body>
</html>