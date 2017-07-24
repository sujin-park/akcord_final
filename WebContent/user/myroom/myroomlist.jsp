<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/template/head_include.jsp"%>
<link rel="stylesheet" href="/akcord_project/user/group/css/list.css">
<link rel="stylesheet" href="/akcord_project/user/myroom/css/myroom.css">
<%@include file="/common/template/nav.jsp"%>
<style>
.btn {
	background-color: #346969;
	color: white;
}
</style>
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
		<div class="col-sm-9">
			<div class="col-sm-1"></div>
			<div class="col-sm-10" style="padding-bottom:10px;">
				<h1>My Room List</h1>
				<%
					for (int i = 0; i < 4; i++) {
				%>
				<div class="row">
					<div class="col-sm-6">
						<div class="brdr bgc-fff pad-10 box-shad btm-mrg-20 property-listing">
							<div class="media">
								<div class="media-body fnt-smaller">
									<a href="#" target="_parent"></a>
									
									<h4 class="media-heading">
										<a href="#" target="_parent">JAVA 공부하기
										<small class="pull-right">2017.07.20</small></a>
									</h4>
									<span class="list-inline mrg-0 btm-mrg-10 clr-535353">박수진</span>
									<p class="hidden-xs">이번에는 java로 간단한 이미지속 방해 요소를 지워보는 방법을
									알아보고자... 그럼 이러한 특징을 java에서 일어내려면 어떻게 하는 것이 좋을까요? 바로 타겟...</p>
								</div>
							</div>
						</div>
					</div>
					<!-- End Listing-->
					<div class="col-sm-6">
						<!-- Begin Listing: 1220-32 N HOWARD ST-->
						<div class="brdr bgc-fff pad-10 box-shad btm-mrg-20 property-listing">
							<div class="media">
								<a class="pull-left" href="#" target="_parent">
									<div class="clearfix visible-sm"></div>
									
									<div class="media-body fnt-smaller">
										<a href="#" target="_parent"></a>

										<h4 class="media-heading">
											<a href="#" target="_parent">JAVA 공부하기
											<small class="pull-right">2017.07.20</small></a>
										</h4>
										<span class="list-inline mrg-0 btm-mrg-10 clr-535353">황혜정</span>
										<p class="hidden-xs">이번에는 java로 간단한 이미지속 방해 요소를 지워보는 방법을
										알아보고자... 그럼 이러한 특징을 java에서 일어내려면 어떻게 하는 것이 좋을까요? 바로 타겟...</p>
										<span class="fnt-smaller fnt-lighter fnt-arial"> ORACLE</span>
									</div>
							</div>
						</div>
					</div>
				</div>
				<%
					}
				%>
			</div>
		<!-- End Listing-->
		</div>
	</div>
</div>
</body>
</html>