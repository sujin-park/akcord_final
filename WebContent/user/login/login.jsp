<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />

<script>
$(document).ready(function(){

	$('#loginBtn2').click(function(){
		logincheck();
	});
	
});

function logincheck(){
	//if($('#id')).val() == "")
	if(document.getElementById("id").value=""){
		alert("아이디를 입력해주세요!");
		return;
	} else if(document.getElementById("password").value=""){
		alert("비밀번호를 입력해주세요!");
		return;
	} else {
		document.loginform.action = "${root}/user/login.akcord";
		document.loginform.submit();
	}
		
}


function joinmove(){
	document.location.href="${root}/user/join.akcord";
}
</script>

	<!-- 로그인 Modal-->
	<div class="modal fade" id="loginBtnModal" role="dialog" data-backdrop="static" data-keyboard="true">
	<div class="modal-dialog" style="width: 20%;" >

			<!-- Modal content-->			
				
				<div class="row">
				
				<div class="modal-content" >
				<div class="modal-header">
					<h4 class="modal-title"><img src="${root}/doc/img/login.jpg" style="width: 100%"></h4>
				</div>
				<form  name="loginform" class="form-horizontal" action="" method="post">
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
								<input type="password" id="password" name="password" class="form-control">
							</div>
				</div>		
				<div class="col-sm-12 control-label">
					<button id="loginBtn2" style="width:100%;" type="button" class="btn btn-danger" data-dismiss="modal" >&nbsp;로그인&nbsp;</button>	
				</div>
				
				<div class="col-sm-12 control-label">
					<button id="closeBtn" style="width:100%;" type="button" class="btn btn-danger" data-dismiss="modal" >&nbsp;취소&nbsp;</button>
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