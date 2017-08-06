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

    <title>akcord-notxice-pazge</title>

    <meta name="description" content="Source code generated using layoutit.com">
    <meta name="author" content="LayoutIt!">
<%@ include file="/common/public.jsp" %>

<%@ include file="/common/template/nav.jsp" %>
<script type="text/javascript">

$(document).ready(function (){
	$('#noticeWriteBtn').click(function (){
		$(location).attr('href','${root}/notice/noticewrite.akcord');	
	});

	  $('#checkAll').click(function() {
		    $('.checkbox').prop('checked', this.checked);
		  });	
	  $('#noticeDeleteBtn').click(function (){
			 var str;
			 var values = new Array();
			$('input:checkbox[name=admincheckbox]:checked').each(function () {
				values.push($(this).val());
		
			});
			/* document.noticeform.action = "${root}/admin/noticedelete.akcord?str=checkList" */
			$(location).attr('href','${root}/notice/noticedelete.akcord?str='+values);
		});	  
	
	  $('#publicBtn').click(function (){
		 	 var str;
			 var values = new Array();
			$('input:checkbox[name=admincheckbox]:checked').each(function () {
				values.push($(this).val());
			
			});
			
			$(location).attr('href','${root}/notice/noticepublic.akcord?str='+values);
		  
	  });
	  $('#publicBtn').click(function (){
		 	 var str;
			 var values = new Array();
			$('input:checkbox[name=admincheckbox]:checked').each(function () {
				values.push($(this).val());
			
			});
			
			$(location).attr('href','${root}/notice/noticepublic.akcord?str='+values);
		  
	  });
	
		   $("#noticesort").change(function () {   
		    
		      $("#noticesort option:selected").each(function () {   
		    	 var str =$(this).val();
	     		 $(location).attr('href','${root}/notice/mvnoticelist.akcord?str='+str+'&word=&pg=1');
 	      });
	 });
		   $('#searchBtn').click(function(){
				$('#pg').val('1');
				$('#word').val($('#sword').val());
				$('#commonForm').attr('action','${root}/notice/mvnoticelist.akcord').submit();		
			});  	  
		  
			$('#firstBtn').click(function(){
				$('#pg').val('1');
				$('#word').val('${query.word}');
				$('#commonForm').attr('action', '${root}/notice/mvnoticelist.akcord').submit();
			});
			
			$('.pagemove').click(function(){
				$('#pg').val($(this).attr('data-page'));
				$('#word').val('${query.word}');
				$('#commonForm').attr('action', '${root}/notice/mvnoticelist.akcord').submit();
			});
			
			$('#lastBtn').click(function(){
				$('#pg').val($(this).attr('data-last'));
				$('#word').val('${query.word}');
				$('#commonForm').attr('action', '${root}/notice/mvnoticelist.akcord').submit();
			});
	 
});


</script>
<style>
.btn {
	background-color: ;
	color: white;
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
				<thead>
				<tr  align="center">
					<th  width="5%" align="right">
					<input type="checkbox" name="checkAll" id="checkAll" value="1">
					</th>
					<th width="10%" align="center">글번호</th>
					<th width="40%"  align="center">공지 제목</th>
					<th width="15%"  align="center">등록일</th>
					<th width="10%"  align="center">조회수</th>
					<th width="15%" align="center">공개여부</th>
			
				</tr>
				</thead>
				<tbody>
				<c:if test="${user.type==1}">
				<!--회원이면 공개글만보여야함....타입이 1이고 이즈노티스가 1인것만  -->
				<c:forEach var="notice" items="${noticeList}">
				<c:choose>
				<c:when test="${notice.is_notice ==1 }">
					<tr align="center"> 
						<td align="right" >
							<input class="checkbox" type="checkbox" name="admincheckbox" id="checkbox" value="${notice.notice_id}">
						</td>
						<td align="center">${notice.notice_id }</td>
						<td align="center"><a href="${root }/notice/noticemodify.akcord?nid=${notice.notice_id}">${notice.subject }</a></td>
						<td align="center">${notice.reg_date }</td>
						<td align="center">${notice.hit }</td>
						<c:choose>
   						 <c:when test="${notice.is_notice==0}">
							<td align="center">비공개</td>
						</c:when>
						<c:otherwise>
						<td align="center">공개</td>
						</c:otherwise>
						</c:choose>
 						
					</tr>
					</c:when>  
					</c:choose>
					</c:forEach></c:if>
				<c:if test="${user.type==0}">
				<!--회원이면 공개글만보여야함....타입이 1이고 이즈노티스가 1인것만  -->
				<c:forEach var="notice" items="${noticeList}">
					<tr>
						<td>
							<input class="checkbox" type="checkbox" name="admincheckbox" id="checkbox" value="${notice.notice_id}">
						</td>
						<td>${notice.notice_id }</td>
						<td><a href="${root }/notice/noticemodify.akcord?nid=${notice.notice_id}">${notice.subject }</a></td>
						<td>${notice.reg_date }</td>
						<td>${notice.hit }</td>
						<c:choose>
   						 <c:when test="${notice.is_notice==0}">
							<td>비공개</td>
						</c:when>
						<c:otherwise>
						<td>공개</td>
						</c:otherwise>
						</c:choose>	
					</tr>
					</c:forEach>
					</c:if>
					</tbody>
			</table> 
			<div align="right">
			<button type="button" class="btn btn-sm" id="noticeWriteBtn">
				새글쓰기
			</button>
			<button type="button" class="btn btn-sm" id="noticeDeleteBtn">
				삭제하기
			</button>
			<button type="button" class="btn btn-sm" id="publicBtn">
				공개하기
			</button>
			</div>
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