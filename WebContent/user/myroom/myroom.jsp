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
<style type="text/css">
select {
	width: 100px;
	height: 30px;
	font-size: 18px;
	color: #006fff;
	border: 1px solid #006fff;
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

		$('#java2').mouseleave(function() {
			$('#Btn').hide();
		});

		$('#java2').mouseenter(function() {
			$('#Btn').show();
		});
	});
</script>
<div class="container-fluid">
	<div class="row">
		<div class="col-sm-2"></div>
		<form id="searchform" name="form" method="post" action="" style="">
			<div class="col-sm-1 center-menu" style="padding-top: 20px;">
				<div class="row">
					<div class="input-group">
						<select id="searh">
							<option>------------</option>
							<option style="font-size: 14px;">컴퓨터공학</option>
						</select>&nbsp;
					</div>
					<div class="input-group">
						<input type="text" size="15">&nbsp;
						<img src="/akcord/doc/img/search.png" width="30" height="30">
					</div>
					<ul style="display: inline;">
						<li><a href=""><i class="glyphicon glyphicon-chevron-right"></i>JAVA </a></li>
						<li><a href=""><i class="glyphicon glyphicon-chevron-right"></i>ORACLE </a></li>
						<li><a href=""><i class="glyphicon glyphicon-chevron-right"></i>SPRING</a></li>
						<li><a href=""><i class="glyphicon glyphicon-chevron-right"></i>MYBATIS</a></li>
						<li><a href=""><i class="glyphicon glyphicon-chevron-right"></i>IBATIS</a></li>
						<li><a href=""><i class="glyphicon glyphicon-chevron-right"></i>컴퓨터공학과 공학부 키트리 공학</a></li>
						<li><a href=""><i class="glyphicon glyphicon-chevron-right"></i>
							<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
						</a></li>
					</ul>
				</div>
			</div>
		</form>
		<div class="col-sm-9" style="padding-top: 20px;">
			<div class="col-sm-1"></div>
			<form id="pageform" name="form" method="post" action="" style="">
				<div class="col-sm-10" style="float: left;" id="java2">
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
								<option style="font-size: 14px;">비공개</option>
								<option style="font-size: 14px;">공개</option>
							</select> <select id="sel2">
								<option>----------</option>
							</select>
						</div>
						<div align="center">
							<input type="submit" class="btn" style="background-color: #346969; color: white; width: 80px; font-size: 16px;" id="Btn" value="등록">
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