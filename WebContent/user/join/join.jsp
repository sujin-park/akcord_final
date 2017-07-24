<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


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
				<form class="form-horizontal" action="">
					<fieldset>
						<div class="form-group">
							<label class="col-sm-3 control-label">이름</label>
							<div class="col-sm-8">
								<input type="text" id="name" name="name" class="form-control">
							</div>
						</div>

						<div class="form-group">
							<label class="col-sm-3 control-label">아이디</label>
							<div class="col-sm-5">
								<input type="text" id="id" name="id" class="form-control">
							</div>
							<div class="col-sm-4">
							<button id="idcheck" name="idcheck" class="btn btn-danger" value="">중복체크확인</button>
							</div>
						</div>
						
						<div class="form-group">
							<label class="col-sm-3 control-label">비밀번호</label>
							<div class="col-sm-8">
								<input type="password" id="pw" name="pw" class="form-control">
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
				<button type="button" class="btn btn-danger" data-dismiss="modal">회원등록</button>
				<button type="button" class="btn btn-danger" data-dismiss="modal">등록취소</button>
			</div>
						
						
					</fieldset>
				</form>
			</div>
		</div>
	</div>
</div>