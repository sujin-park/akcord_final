<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/common/template/head_include.jsp"%>
<link rel="stylesheet" href="/akcord/css/group.css">
<%@include file="/common/template/nav.jsp"%>
<link rel="stylesheet" href="/akcord/css/group.css">
<title>GROUP LIST</title>
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
					<div class="row">
						<div class="table-container table-responsive" style="margin-left: 20px; margin-right: 20px">
							<table class="table table-filter" id="extable">
								<tbody>
									<tr align="center">
										<td width="15%">요청일</td>
										<td width="15%">전공</td>
										<td width="20%">그룹방명</td>
										<td width="20%">그룹방내용</td>
										<td width="15%">리더</td>
										<td width="15%">CANCEL</td>
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
											<p data-placement="top" data-toggle="tooltip" title="Delete" align="center">
												<button class="btn-danger btn-sm" data-title="Delete" data-toggle="modal" data-target="#delete" >
													<span class="glyphicon glyphicon-remove">
													</span>
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
</body>
</html>