<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/common/template/head_include.jsp"%>
<link rel="stylesheet" href="/akcord_project/user/group/css/group.css">
<%@ include file="/common/template/nav.jsp" %>
<script type="text/javascript">

	function deleteM(seq) {
	if (${isInvite!= null}) {
		alert("그룹방에 초대 되었습니다.	");
	}
		if (confirm("승인을 거절하시겠습니까?")) {
			document.location.href = "${root}/groupmain/reject.akcord?seq="+seq;
		}
	}
	

	function plusMember() {
		var div = document.getElementById("tbodyselect");
		div.innerHTML='<tr align="center"><td colspan="4">초대할 사람을 검색하세요.</td></tr>';
		$('#plusmember').modal({
			show : true
		});

	}
	function acceptM(seq) {
		if (confirm("승인하시겠습니까?")) {
			document.location.href = "${root}/groupmain/accept.akcord?seq="+seq;
		}
	}
	
	function searchMember() {
 		var selectname = $("#memberselect").val();
 		if(selectname=="") {
 			alert("검색할 아이디를 입력하세요");
 		} else {
 				$.get("${root}/groupmain/search.akcord?sid="+selectname, 
 						function(data, status){
 						var div = document.getElementById("tbodyselect");
 						div.innerHTML=data;
 						});
 						$("#memberselect").val('');
 		}
 	}
	
	function invite(seq) {
		if (confirm("그룹방에 초대하시겠습니까?")) {
			var groupid = $('#groupid').val();
			document.location.href = "${root}/groupmain/invite.akcord?seq="+seq +"&groupid="+groupid;
		}
	}
	
</script>
		<section class="content page-top row">
			<div class="col-sm-10 col-sm-push-1" style="padding-top: 60px;">
				<div class="col-sm-10">
					<h3>그룹원 관리</h3>
				</div>
				<div class="panel panel-default">
					<div class="tabbable" id="tabs-630325" align="left" style="width: 90%;">
						<ul class="nav nav-tabs">
							<li class="active">
								<a href="#panel-822060" data-toggle="tab">대기 리스트</a>
							</li>
							<li>
								<a href="#panel-822061" data-toggle="tab">그룹 리스트</a>
							</li>
						</ul>
						<div class="tab-content">
							<div class="tab-pane" id="panel-822060">
							</div>
							<div class="tab-pane" id="panel-822061">
						</div>
					</div>
				</div>
					<div class="panel-body">
						<div class="row" style="padding-bottom:10px;">
							<div class="col-sm-6 pull-left">
								<button type="button" class="btn btn-md btn-danger" onclick="javascript:plusMember();">
									<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
								</button>
								<span>그룹원 추가</span>
							</div>
							<div class="row">
								<div class="form-group form-inline">
									<div class="col-sm-6 pull-right">
										<div class="col-sm-3"></div>
										<div class="col-sm-9">
											<select class="form-control" name="key">
												<option value="title">아이디</option>
												<option value="name">전공명</option>
											</select>
												<input type="text" class="form-control" name="word" placeholder="검색어 입력" size="25">
												<button type="button" class="btn btn-sm btn-danger">SEARCH</button>
										</div>
									</div>
								</div>
							</div>
						</div>
							<div class="row">
								<div class="table-container table-responsive" style="margin-left: 20px; margin-right: 20px">
									<table class="table table-filter" id="extable">
										<tbody>
											<tr class="primary" align="center">
												<td width="10%">
													<div class="ckbox">
														<input type="checkbox" id="checkedAll">
														<label for="checkedAll"></label>
													</div>
												</td>
												<td width="15%">가입일</td>
												<td width="15%">전공</td>
												<td width="20%">아이디</td>
												<td width="20%">이름</td>
												<td width="10%">ACCEPT</td>
												<td width="10%">DELETE</td>
											</tr>
										<c:forEach var="listDto" items="${glist}">
											<input type="hidden" id="groupid" value="${listDto.groupId}">
											<tr class="Wlist">
												<td>
													<div class="ckbox">
														<input type="checkbox" class="checkthis" id="checkbox" name ="checkbox" value=""> <label
															for="checkbox"></label>
													</div>
												</td>
												<td>
													<div class="media">
														<p class="media-meta" id="waitDate">${listDto.regDate}</p>
													</div>
												</td>
												<td>
													<div class="media">
														<p class="media-meta" id="waitMajor">${listDto.majorName}</p>
													</div>
												</td>
												<td>
													<div class="media">
														<div class="media-meta" id="waitId">${listDto.userId}</div>
													</div>
												</td>
												<td>
													<div class="media">
														<span class="media-meta" id="waitName">${listDto.name}</span>
													</div>
												</td>
												<td align="center">
													<button type="button" class="btn btn-sm btn-danger" id="acceptG"
													onclick="javascript:acceptM(${listDto.seq})">
										    			<span class="glyphicon glyphicon-heart"></span>
										    		</button>
											    </td>
												<td align="center">
													<button type="button" class="btn btn-sm btn-default" id="deleteM"
													onclick="javascript:deleteM(${listDto.seq})">
										    			<span class="glyphicon glyphicon-remove"></span>
										    		</button>
											    </td>
											</tr>
										</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
					</div>
				</div>
			</div>
		</section>
<%@include file="/user/group/plusmember.jsp"%>
	</body>
</html>