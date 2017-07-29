<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/common/template/head_include.jsp"%>
<link rel="stylesheet" href="/akcord_project/user/group/css/group.css">
<%@ include file="/common/template/nav.jsp" %>
<script type="text/javascript">
	function creategroup() {
	      $('#myModal').modal({
	    	show : true  
	      });
	}


	function plusMember() {
		$('#plusmember').modal({
			show : true
		});

	}
	$(document).ready(function() {
		$('#deleteM').click(function(){
			var joinseq = $('#joinseq').val();
			$(location).attr('href', '${root}/group/join.akcord?seq='+joinseq);
		});
	});

	function deleteM(id) {
		//var valueArr = new Array();
		//$("input[name=checkbox]:checked").each(function() {
		//	valueArr.push($(this).val());
		//});
		//if (valueArr == "") {
		//	alert("");
		
		if (confirm("승인을 거절하시겠습니까?")) {
				alert(id);			
				document.location.href = "${root}/groupmain/delete.akcord?id="+id;
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
												<td>
													<p align="center" data-placement="top" data-toggle="tooltip" title="Edit">
														<button type="button" class="btn btn-sm btn-danger" id="acceptG">
											    			<span class="glyphicon glyphicon-heart"></span>
											    		</button>
											    	</p>
											    </td>
												<td align="center">
													<button type="button" class="btn btn-sm btn-default" id="deleteM" 
															onclick="javascript:deleteM(${listDto.userId});">
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
		<nav>
			<div align="center">
				  <ul class="pagination">
				    <li>
				      <a href="#" aria-label="Previous">
				        <span aria-hidden="true">&laquo;</span>
				      </a>
				    </li>
				    <li><a href="#">1</a></li>
				    <li><a href="#">2</a></li>
				    <li><a href="#">3</a></li>
				    <li><a href="#">4</a></li>
				    <li><a href="#">5</a></li>
				    <li>
				      <a href="#" aria-label="Next">
				        <span aria-hidden="true">&raquo;</span>
				      </a>
				    </li>
				  	</ul>
			  </div>
		</nav>
<%@include file="/user/group/plusmember.jsp"%>
	</body>
</html>