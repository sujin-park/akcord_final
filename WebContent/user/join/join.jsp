<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<script>

var count = 1;

$(document).ready(function (){
	$('#id').keyup(function(){
		var output = '4자이상 12자 이하로 입력해주세요.'
		var resultView = $('#result');
		var sid = $(this).val();//document.getElementById("id").value;
//		alert(sid.length);
		if(sid.length > 3 && sid.length < 13){
			$.ajax({
				type : 'GET',
				dataType : 'json',
				url : '${root}/user/idCheck.akcord',
				data : {'sid' : sid},
				success : function(data){
					if(data.count == 0){
						output = '<font color="blue">' + data.sid + '</font>는 사용가능한 아이디입니다.';
						count = 0;
					}else{
						output = '<font color="red">' + data.sid + '</font>는 사용불가능한 아이디입니다.';
					}
					resultView.empty();
					resultView.append(output);
				},
				error : function(e){
						alert("에러발생!! >>" + e)
				}
			});

		}else {
			resultView.empty();
			resultView.append(output);
		}
	});

	
	$('#joinB').click(function(){
		join();
	});
	
});

function join(){
	if(document.getElementById("id").value == "") {
		alert("아이디 입력!");
		return;
	} else if(count != 0){ 
		alert("아이디 검사!");
		return;
	}else if(document.getElementById("name").value == "") {
		alert("이름 입력!");
		return;
	} else if(document.getElementById("password").value  == "") {
		alert("비밀번호 입력!");
		return;
	} else if(document.getElementById("password").value != document.getElementById("pwcheck").value) {
		alert("비밀번호 확인!");
		return;
	} else {
		document.joinform.action = "${root}/user/join.akcord";
		document.joinform.submit();
	}
}

</script>

<!-- 회원가입 Modal-->
<div class="modal fade" id="joinBtnModal" role="dialog" >
	<div class="modal-dialog" style="width: 33%;">
		
		<div>
		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title"><img src="${root}/doc/img/join.jpg" style="width: 100%"></h4>
			</div>
			<div class="modal-body">
				<form class="form-horizontal" id="join" action="post">
					<fieldset>
						<div class="form-group">
							<label class="col-sm-3 control-label">이름</label>
							<div class="col-sm-4">
								<input type="text" id="name" name="name" class="form-control">
							</div>
														
							<label class="col-sm-2 control-label">성별</label>
						<div class="radio-inline col-sm-1 control-label">
 							<label><input type="radio" id="gender" name="optradio">남</label>
						</div>
						<div class="radio-inline col-sm-1 control-label">
  							<label><input type="radio" id="gender1" name="optradio">여</label>
						</div>
						</div>


						<div class="form-group">
							<label class="col-sm-3 control-label">아이디</label>
							<div class="col-sm-8">
								<input type="text" id="id" name="id" class="form-control" value="">
							</div>
							<div id="result" class="col-sm-11" style="text-align: center;">
							</div>
						</div>
						
						<div class="form-group">
							<label class="col-sm-3 control-label">비밀번호</label>
							<div class="col-sm-8">
						
								<input type="password" id="password" name="password" class="form-control">
							</div>
						</div>
						
						<div class="form-group">
							<label class="col-sm-3 control-label">비밀번호확인</label>
							<div class="col-sm-8">
								<input type="password" id="pwcheck" name="pwcheck" class="form-control">
							</div>
						</div>
							
						<div class="form-group">
							<label class="col-sm-3 control-label">휴대전화</label>
							<div class="col-sm-2">
								<input type="text" id="num1" name="num1"
									class="form-control" placeholder="010">								
							</div>
							
							<div class="col-sm-3">
								<input type="text" id="num2" name="num2"
									class="form-control">								
							</div>
							
							<div class="col-sm-3">
								<input type="text" id="num3" name="num3"
									class="form-control">								
							</div>
						</div>
						
						<div class="form-group">
							<label class="col-sm-3 control-label">생년월일</label>
							<div class="col-sm-3">
								<select class="form-control" id="birth1" name="birth1">
									<option value="1990">1990</option>
									<option value="1991">1991</option>
									<option value="1992">1992</option>
									<option value="1993">1993</option>
								</select>
							</div>
							<div class="col-sm-2">
								<select class="form-control" id="birth2" class="birth2">
									<option value="01">01</option>
									<option value="02">02</option>
									<option value="03">03</option>
									<option value="04">04</option>
								</select>
							</div>	
							<div class="col-sm-3">
								<select class="form-control" id="birth3" class="birth3">
									<option value="01">01</option>
									<option value="02">02</option>
									<option value="03">03</option>
									<option value="04">04</option>
								</select>
							</div>						
						</div>
						
						<div class="form-group">
							<label class="col-sm-3 control-label">전공</label>
							<div class="col-sm-8">
								<select class="form-control" id="major" class="major">
									<option value="컴퓨터공학">컴퓨터공학</option>
									<option value="디자인학과">디자인학과</option>
									<option value="경영학과">경영학과</option>
									<option value="통계학과">통계학과</option>
								</select>
							</div>						
						</div>
						
						
						<div class="form-group">
							<label class="col-sm-3 control-label">우편번호</label>
							<div class="col-sm-5">
								<input type="text" id="zipcode" name="zipcode" class="form-control">
							</div>
							<div class="col-sm-3">
							<button id="zipsearch" name="zipsearch" class="btn btn-danger" value="">우편번호검색</button>
							</div>
						</div>
						
						<div class="form-group">
							<label class="col-sm-3 control-label">주소</label>
							<div class="col-sm-8">
								<input type="text" id="addr1" name="addr1" class="form-control">
							</div>
						</div>
						
						<div class="form-group">
							<label class="col-sm-3 control-label"></label>
							<div class="col-sm-8">
								<input type="text" id="addr1" name="addr1" class="form-control" placeholder="상세주소를 적어주세요.">
							</div>
						</div>
						
						
						</div>
			<div class="modal-footer">
				<button id="joinB" type="button" class="btn btn-danger" data-dismiss="modal">회원등록</button>
				<button id="closeBtn" type="button" class="btn btn-danger" data-dismiss="modal">등록취소</button>
			</div>
						
						
					</fieldset>
				</form>
			</div>
		</div>
	</div>
</div>