<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">
<head>
<title>Bootstrap Example</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<body>

	<!-- 로그인 Modal-->
	<div class="modal fade" id="loginBtnModal" role="dialog" data-backdrop="static" data-keyboard="true">
	<div class="modal-dialog" style="width: 20%;" >

			<!-- Modal content-->			
				
				<div class="row">
				
				<div class="modal-content" >
				<div class="modal-header">
					<h4 class="modal-title"><img src="${root}/doc/img/login.jpg" style="width: 100%"></h4>
				</div>
				<form class="form-horizontal" action="">
				<fieldset>
				<div class="modal-body">
				
				<div class="form-group">
							<label class="col-sm-3 control-label">아이디</label>
							<div class="col-sm-8">
								<input type="text" id="id" name="id" class="form-control">
							</div>
				</div>
						
				<div class="form-group">
							<label class="col-sm-3 control-label">비밀번호</label>
							<div class="col-sm-8">
								<input type="password" id="pw" name="pw" class="form-control">
							</div>
				</div>		
				<div class="col-sm-12 control-label">
					<button id="loginBtn" style="width:100%;" type="button" class="btn btn-danger" data-dismiss="modal" >&nbsp;로그인&nbsp;</button>	
				</div>
				
				<div class="col-sm-12 control-label">
					<button id="loginBtn" style="width:100%;" type="button" class="btn btn-danger" data-dismiss="modal" >&nbsp;취소&nbsp;</button>
				</div>
				
				<div class="modal-footer">
				</div>
				</div>
			</div>
			</div>	
			</form>
			<fieldset>

		</div>
		</div>
</body>
</html>