<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/template/head_include.jsp"%>
<%@ include file="/common/template/nav.jsp"%>
<%@ include file="/common/public.jsp" %>
<!--  <style>
.media-heading { display: inline-block; white-space: nowrap; overflow: hidden; text-overflow: ellipsis; }

</style>-->
<script>
$(document).ready(function() {
	$('#questionBtn').click(function() {
		$(location).attr('href', '${root}/in/question.akcord');
	}); //질문하기 버튼을 누르면 질문페이지로간다

	$('.link_board_03').click(function() {
		$('#qna_id').val($(this).attr('data-seq'));
		$('#inmainform').attr('action', '${root}/in/clicklist.akcord').submit();
	});
	
	$('#firstBtn').click(function(){
		$('#pg').val('1');
		$('#major_id').val('${queryString.major_id}');
		$('#commonForm').attr('action', '${root}/in/list.akcord').submit();
	});
	
	$('.pagemove').click(function(){
		$('#pg').val($(this).attr('data-page'));
		$('#major_id').val('${queryString.major_id}');
		$('#commonForm').attr('action', '${root}/in/list.akcord').submit();
	});
	
	$('#lastBtn').click(function(){
		$('#pg').val($(this).attr('data-last'));
		$('#major_id').val('${queryString.major_id}');
		$('#commonForm').attr('action', '${root}/in/list.akcord').submit();
	});
});
</script>
<style>
body {
	text-decoration:none;
}
</style>
	<div class="container akcord">
		<div class="col-sm-12">
				<div class="page-header titleinfo">
					    <h2 id="container"><i class="fa fa-question-circle-o"></i>  &nbsp;<b>RECORDER</b></h2><h5>전공별로 궁금증을 해결할 수 있습니다.</h5>
				</div>
		<!-- 왼쪽 카테고리 -->
		<div class="col-sm-2 form-group">
			<div class="col-sm-12 form-group " style="width: 100%;">
				<button id="questionBtn" class="btn btn-danger" style="width: 100%;">Q질문하기</button>
				<hr>
			</div>
			<c:forEach var="majorlist" items="${majorlist}">
				<a id="${majorlist.majorId}" class="category" href="${root}/in/list.akcord?major_id=${majorlist.majorId}&pg=1">${majorlist.majorName}</a>
				<hr>
			</c:forEach>
			<!-- 		<a id="0" href="#">인문계열</a><hr>
			<a id="1" href="#">사회계열</a><hr>
			<a id="2" href="#">교육계열</a><hr>
			<a id="3" href="#">공학계열</a><hr>
			<a id="4" href="#">자연계열</a><hr>
			<a id="5" href="#">의약계열</a><hr>
			<a id="6" href="#">예체능계열</a><hr> -->
		</div>

		<!-- 지식인 게시판 헤더부분 -->
		<form class="inmainform" id="inmainform" name="inmainform" action="" method="">
			<input type="hidden" id="qna_id" name="qna_id">
			<div class="col-sm-10 form-group">
				<!-- 검색바부분 -->
				<form action="/action_page.php">
					<div class="input-group">
						<input id="insearch" type="text" class="form-control" placeholder="Search" name="search">
						<div class="input-group-btn">
							<button class="btn btn-default" type="submit">
								<i class="glyphicon glyphicon-search"></i>
							</button>
						</div>
					</div>
				</form>
			</div>

			<!-- 답변수, 조회수 정렬 -->
			<div class="col-xs-10 form-group">
				<a href="" class="col-sm-2" style="height: 10px; font-size: 12px;">답변수</a>
				<a href="" class="col-sm-2" style="height: 10px; font-size: 12px;">조회수</a>
			</div>

			<!-- 리스트 -->
			<div class="col-sm-10 form-group" style="text-decoration:none;">
				<hr>
				<c:if test="${inlist != null}">
					<c:forEach var="inDto" items="${inlist}">
						<a href="#" id="qna_id" name="qna_id" class="link_board_03" data-seq="${inDto.qna_id}">
							<div class="media col-sm-10">
								<label class="media-heading col-sm-6" style="font-size: 15px;">
									<p overflow:hidden;>${inDto.subject}</p></label>
								<label class="media-heading col-sm-3" style="font-size: 15px;">&nbsp;</label>
								<label class="media-heading col-sm-3" style="font-size: 15px;">아이디 : ${user.id }</label><br>
								<div class="col-sm-12" style="height: 40px; width: 100%; text-overflow: ellipsis; font-size: 10px;">
									<p class="media-body">${inDto.content}</p>
								</div>
							</div>
							<div class="media-heading col-sm-10" style="font-size: 15px;">
								<label class="col-sm-6">${inDto.reg_date}</label>
								<label class="col-sm-3">답글수 : ${inDto.commentcnt}</label>
								<label class="col-sm-3">조회수 : ${inDto.hit}</label>
							</div>
							<hr class="col-sm-11">
						</a>
					</c:forEach>
				</c:if>

				<c:if test="${inlist == null}">
					<div class="media" align="center">
						<p class="media-body col-sm-10" style="height: 50px; width: 100%;">게시글이 없습니다.</p>
						<hr>
					</div>
				</c:if>
				<div align="center" class="col-sm-12" style="clear:both;">
					${navigator.navigator}
				</div>
			</div>
		</form>
	</div>
</div>
<%@include file="/common/template/footer.jsp"%>
