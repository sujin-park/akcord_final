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
<style>
	.form-control{ box-shadow:none; border-color:#eee;}
	.form-control:focus{ box-shadow:none; border-color:#d34e4c;}
</style>
</head>
<body>


<script type="text/javascript">
$(document).ready(function(){
    // Show the Modal on load
    $("#loginmainModal").modal("show");
   
});

</script>
	<!-- 로그인 Modal-->
	<div class="modal fade" id="loginmainModal" role="dialog" data-backdrop="static" data-keyboard="true">
	<div class="modal-dialog" style="width: 50%;" >

			<!-- Modal content-->
				
				<div class="row">

				<form class="form-horizontal" action="">
				<fieldset>
				
				<div class="modal-content img-rounded" id="img01" style="position: absolute;" >
								<img src="${root}/doc/img/loginview.jpg"
									style="width: 600px; height: 500px;">


				<div class="modal-body" style="position: absolute; top:60%; left: 35%;" >								
					<button id="loginBtn" type="button" class="btn btn-danger" data-toggle="modal" data-target="#loginBtnModal" >&nbsp;로그인&nbsp;</button>
					<button id="joinBtn" type="button" class="btn btn-danger" data-toggle="modal" data-target="#joinBtnModal">회원가입</button>		
				</div>
			</div>
			</div>	
			</form>
			<fieldset>

		</div>
	</div>
<!-- 회원가입 모달 -->
<%@ include file="/user/join/join.jsp" %>

<!-- 로그인 모달 -->
<%@ include file="/user/login/login.jsp" %>
<!--  우편번호 모달 -->
<%@ include file="/user/join/zipsearch.jsp" %>
</body>
</html>
