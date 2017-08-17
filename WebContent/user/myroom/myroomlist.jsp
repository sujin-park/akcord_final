<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/template/head_include.jsp"%>
<link rel="stylesheet" href="/akcord_project/user/group/css/list.css">
<link rel="stylesheet" href="/akcord_project/user/myroom/css/myroom.css">
<%@include file="/common/template/nav.jsp"%>
<%@include file="/user/myroom/category.jsp"%>
<%@ include file="/common/public.jsp" %>
<style type="text/css">
select {
	width: 100px;
	height: 30px;
	font-size: 18px;
	color: #d34e4c;
	border: 1px solid #d34e4c;
	border-radius: 3px;
}
</style>
<script>
$(document).ready(function() {
	
	$('#writeBtn').click(function() {
		$('#pg').val('1');
		$('#key').val('${query.key}');
		$('#word').val('');
		$('#myroomId').val('${query.myroomId}');
		$('#num').val('100');
		$('#commonForm').attr('action', '${root}/myroom/write.akcord').submit();
		//$(location).attr('href', "${root}/myroom/write.akcord?myroomId=" + myroomId + "&num=100");
	});

	$(document).on('click', '#sModal', function() {
		$('#sectionM').addClass('active');
		$('#sectionModal').modal();
	});
	
	$('#firstBtn').click(function(){
		$('#pg').val('1');
		$('#key').val('${query.key}');
		$('#word').val('${query.word}');
		$('#myroomId').val('${query.myroomId}');
		$('#commonForm').attr('action', '${root}/myroom/myroomlist.akcord').submit();
	});
	
	$('.pagemove').click(function(){
		$('#pg').val($(this).attr('data-page'));
		$('#key').val('${query.key}');
		$('#word').val('${query.word}');
		$('#ch').val('${query.ch}');
		$('#myroomId').val('${query.myroomId}');
		$('#commonForm').attr('action', '${root}/myroom/myroomlist.akcord').submit();
	});
	
	$('#lastBtn').click(function(){
		$('#pg').val($(this).attr('data-last'));
		$('#key').val('${query.key}');
		$('#word').val('${query.word}');
		$('#myroomId').val('${query.myroomId}');
		$('#commonForm').attr('action', '${root}/myroom/myroomlist.akcord').submit();
	});
	
	$('.sectionBtn').click(function(){
		var sBtn = $("ul > li");
		sBtn.removeClass("active");
		$(this).parent().addClass("active");
		$('#pg').val('1');
		$('#key').val('${query.key}');
		$('#word').val('');
		$('#ch').val('2');
		$('#myroomId').val($(this).attr('data-myroomId'));
		$('#commonForm').attr('action', '${root}/myroom/myroomlist.akcord').submit();
	});
	
	$('.articleBtn').click(function(){
		$('#pg').val('1');
		$('#key').val('${query.key}');
		$('#word').val('');
		$('#num').val('200');
		$('#ch').val('2');
		$('#myroomId').val($(this).attr('data-myroomId2'));
		$('#myroomNextId').val($(this).attr('data-myroomNextId'));
		$('#commonForm').attr('action', '${root}/myroom/write.akcord').submit();
	});
	
	$('#searchBtn').click(function() {
		$('#pg').val('1');
		var key = $('#key').val($("#search option:selected").val());
		$('#word').val($.trim($('#searchText').val()));
		$('#ch').val('1');
		$('#commonForm').attr('action', '${root}/myroom/searchlist.akcord').submit();
		
		//$('.searchDiv').show();
		//searchDiv.append('<font color="black">' + $.trim($('#searchText').val()) + '</font> 로 검색한 결과입니다.');
	});
});
</script>
<div class="container-fluid" style="padding-top: 60px;">
	<div class="row">
		<div class="col-sm-2"></div>
		<form id="searchform" name="form" method="post" action="" style="">
			<div class="col-sm-1 center-menu" style="padding-top: 20px;">
				<div class="row">
					<div class="input-group">
						<select id="search">
							<option>전체</option>
							<c:forEach var="myroomDto" items="${sectionList}">
								<option class="sectionId${myroomDto.myroomId}" value="${myroomDto.myroomId}" style="font-size: 14px;">${myroomDto.subject}</option>
							</c:forEach>
						</select>&nbsp;
					</div>
					<div class="input-group">
						<input type="text" id="searchText" size="11"><a href="#" id="searchBtn" class="searchBtn"><img src="/akcord_project/doc/img/search1.png" width="25" height="25"></a>
					</div>
					<ul style="display: inline;">
						<c:forEach var="myroomDto" items="${sectionList}">
							<li>
								<!-- <a href="${root}/myroom/myroomlist.akcord?ch=2&myroomId=${myroomDto.myroomId}&pg=1"> -->
								<a href="#" class="sectionBtn" data-myroomId="${myroomDto.myroomId}">
									<i class="glyphicon glyphicon-chevron-right"></i>${myroomDto.subject}
								</a>
							</li>
						</c:forEach>
						<li id="sectionM">
							<a href="#">
							<img id="sModal" data-toggle="modal" data-backdrop="static" data-target="#sectionModal" data-keyboard="true" src="/akcord_project/doc/img/setting.PNG" width="25" height="25"></a>
						</li>
					</ul>
				</div>
			</div>
		</form>
		<div class="col-sm-9">
			<div class="col-sm-1"></div>
			<div class="col-sm-10" style="padding-bottom: 10px;">
				<h1>My Room List</h1>
				<div class="col-sm-12" align="right" style="padding-bottom: 10px;">
					<c:if test="${query.ch != 1}">
						<input type="button" id="writeBtn" name="writeBtn" class=" btn btn-danger" value="글작성">
					</c:if>
				</div>
				<c:forEach var="myroomNextDto" items="${myroomList}" varStatus="i">
					<c:if test="${i.index%2 == 0}">
						<div class="row">
					</c:if>
					<div class="col-sm-6">
						<div class="brdr bgc-fff pad-10 box-shad btm-mrg-20 property-listing">
							<div class="media">
								<div class="media-body fnt-smaller">
									<a href="#" target="_parent"></a>
									<h4 class="media-heading">
										<!-- <a href="${root}/myroom/write.akcord?num=200&myroomId=${myroomNextDto.myroomId}&myroomNextId=${myroomNextDto.myroomNextId}" target="_parent">${myroomNextDto.subject} -->
										<a href="#" class="articleBtn" data-myroomNextId="${myroomNextDto.myroomNextId}" data-myroomId2="${myroomNextDto.myroomId}" target="_parent">${myroomNextDto.subject}
											<small class="pull-right">${myroomNextDto.update_date}</small>
										</a>
									</h4>
									<p class="hidden-xs">${myroomNextDto.content}</p>
								</div>
							</div>
						</div>
					</div>
					<!-- End Listing-->
					<c:if test="${i.index%2 != 0}">
						</div>
					</c:if>
				</c:forEach>
			</div>
			<div align="center" style="clear:both;">
			${navigator.navigator}
			</div>
			<div class="col-md-6"></div>
		</div>
	</div>
</div>
</body>
</html>