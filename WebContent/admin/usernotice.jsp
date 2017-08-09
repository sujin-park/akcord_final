<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<%@include file="/common/template/head_include.jsp" %>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="Source code generated using layoutit.com">
    <meta name="author" content="LayoutIt!">
<%@ include file="/common/public.jsp" %>

<%@ include file="/common/template/nav.jsp" %>
<script type="text/javascript">

$(document).ready(function (){
	
	  $("#noticesort").change(function () {   
		    
	      $("#noticesort option:selected").each(function () {   
	    	 var str =$(this).val();
     		 $(location).attr('href','${root}/notice/userNoticelist.akcord?str='+str+'&word=&pg=1');
	      });
 		});
	
		   $('#searchBtn').click(function(){
				$('#pg').val('1');
				$('#word').val($('#sword').val());
				$('#commonForm').attr('action','${root}/notice/userNoticelist.akcord').submit();		
			});  	  
			$('#firstBtn').click(function(){
				$('#pg').val('1');
				$('#word').val('${query.word}');
				$('#commonForm').attr('action', '${root}/notice/userNoticelist.akcord').submit();
			});
			$('.pagemove').click(function(){
				$('#pg').val($(this).attr('data-page'));
				$('#word').val('${query.word}');
				$('#commonForm').attr('action', '${root}/notice/userNoticelist.akcord').submit();
			});
			$('#lastBtn').click(function(){
				$('#pg').val($(this).attr('data-last'));
				$('#word').val('${query.word}');
				$('#commonForm').attr('action', '${root}/notice/userNoticelist.akcord').submit();
			});
});
</script>
<style>
th {
	text-align:center !important;
}

</style>
<section class="content page-top row"  style="padding-top: 60px;">
			<div class="container" style="padding-top: 60px;">
			
				<div class="col-sm-10 col-sm-push-1">
					<h2>공지사항 목록</h2>
				</div>
				<form name ="noticeform" method="post" action="">
				<div class="panel panel-default" style="padding:30px;">
				<div class="row">
     			<div class="form-group form-inline">
									<div class="col-sm-6 pull-right">
										<div class="col-sm-1"></div>
								
										<div class="col-sm-11" align="left">
											<select class="form-control"id="noticesort" name="noticesort">
												<option>글정렬</option>
												<option id=str value="1">등록일순</option>
												<option id=str value="2">조회순</option>
											</select>
												<input type="text" class="form-control" id="sword" name="sword" placeholder="검색어 입력" size="20">
												<button type="button" class="btn btn-sm btn-danger" id="searchBtn">SEARCH</button>
										</div>
									</div>
								</div>	
							</div>	
			<table class="table">
				<thead text-align="center">
				<tr>
					<th align="center" >번호</th>
					<th >공지 제목</th>
					<th >등록일</th>
					<th>조회수</th>
				</tr>
				</thead>
				<tbody>
				<c:forEach var="notice" items="${noticeList}">
					<tr align="center"> 
						<td >${notice.notice_id }</td>
						<td ><a href="${root }/notice/noticemodify.akcord?nid=${notice.notice_id}">${notice.subject }</a></td>
						<td >${notice.reg_date }</td>
						<td >${notice.hit }</td>
					</tr>
					</c:forEach>
					</tbody>
			</table> 
			</div>
			</form>
			</div>
		<div align="center" style="clear:both;">
			${navigator.navigator}
			</div>
			<div class="col-md-6"></div>
</section>
		
  </body>
</html>