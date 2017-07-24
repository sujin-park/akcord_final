<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/common/template/head_include.jsp"%>
<link rel="stylesheet" href="/akcord/css/group.css">
<%@ include file="/common/template/nav.jsp" %>
<script type="text/javascript">
	function creategroup() {
	      $('#myModal').modal({
	    	show : true  
	      });
	}
	
	function viewlist() {
		
		
	}

	function joinGroup() {
		$('#joingroupM').modal({
			show : true
		});
		
	}
</script>
<style>
.btn {
	background-color: #346969;
	color: white;
}
</style>
		<section class="content page-top row">
			<div class="col-sm-10 col-sm-push-1" style="padding-top: 60px;">
				<div class="panel panel-default">
					<div class="panel-body">
						<div class="row" style="padding-bottom:10px;">
							<div class="col-sm-6 pull-left">
								<button type="button" class="btn btn-sm" onclick="javascript:creategroup();">그룹방 개설</button>
								<button type="button" class="btn btn-sm btn-default" onclick="javascript:viewlist();">승인 리스트</button>
							</div>
							<div class="row">
								<div class="form-group form-inline">
									<div class="col-sm-6 pull-right">
										<div class="col-sm-3"></div>
										<div class="col-sm-9">
											<select class="form-control" name="key">
												<option value="title">전공명</option>
												<option value="name">그룹방명</option>
											</select>
												<input type="text" class="form-control" name="word" placeholder="검색어 입력" size="25">
												<button type="button" class="btn btn-sm">SEARCH</button>
										</div>
									</div>
								</div>
							</div>
						</div>
							<div class="row">
								<div class="table-container table-responsive" style="margin-left: 20px; margin-right: 20px">
									<table class="table table-filter" id="extable">
										<tbody>
											<tr class="primary" align="center" >
												<td width="15%">생성일</td>
												<td width="15%">전공</td>
												<td width="20%">그룹방명</td>
												<td width="20%">그룹방내용</td>
												<td width="15%">리더</td>
												<td width="15%">JOIN</td>
											</tr>
										<%
											for (int i=0; i<5; i++) {
										%>
											<tr>
												<td>
													<div class="media">
														<p class="media-meta">2017.07.17</p>
													</div>
												</td>
												<td>
													<div class="media">
														<p class="media-meta">컴퓨터공학과</p>
													</div>
												</td>
												<td>
													<div class="media">
														<div class="media-meta">JAVA</div>
													</div>
												</td>
												<td>
													<div class="media">
														<span class="media-meta">자바 공부하기</span>
													</div>
												</td>
												<td>
													<div class="media">
														<span class="media-meta">박수진</span>
													</div>
												</td>
												<td>
													<p align="center" data-placement="top" data-toggle="tooltip" title="Edit">
														<button type="button" class="btn btn-warning" onclick="javascript:joinGroup();">
											    			<span class="glyphicon glyphicon-thumbs-up"></span>
											    		</button>
											    	</p>
											    </td>
											</tr>
										<%
											}
										%>
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
<%@include file="/WEB-INF/user/group/creategroup.jsp"%>
<%@include file="/WEB-INF/user/group/join.jsp"%>
	</body>
</html>