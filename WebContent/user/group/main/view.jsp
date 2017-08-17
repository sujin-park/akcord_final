<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/common/template/head_include.jsp"%>
<link rel="stylesheet" href="/akcord/user/group/css/list.css">
<%@ include file="/common/template/nav.jsp" %>
<script>
	$(document).ready(function(){
		$('#scrapBtn').on('click', function(){
			$(location).attr('href','${root}/groupmain/scrap.akcord?groupId=${groupId}&articleseq=${articleseq}');
		});
		
	});
		
		
</script>

   <div class="container akcord" style="padding-top:60px;">
     <div class="col-sm-12">
     <div id="property-listings">
       <div class="row">
          <div class="page-header titleinfo" style="padding-bottom:10px;">
           <h2 id="container"><i class="fa fa-edit"></i>&nbsp; <b>GROUP HOMEWORK</b></h2>
                <p>그룹방에 공유 된 과제입니다.</p>
         </div>
       </div>
		<div class="panel-body" style="border:1px solid #ededed;">
			<div class="row">
					<div class="table-responsive">
						<table class="table table-bordered">
							<tr>
								<th colspan="4">
									<span class="title" style="font-size: 1.9rem;">${groupHwDto.mysubject}</span>&nbsp;&nbsp;
								</th>
							</tr>
							<tr align="center">
								<td width="25%"><strong>전공</strong></td>
								<td width="25%">컴퓨터공학과</td>
								<td width="25%"><strong>작성일</strong></td>
								<td width="25%">2017.07.23</td>
							</tr>
							<tr align="center">
								<td><strong>아이디</strong></td>
								<td colspan="3">${groupHwDto.id}</td>
							</tr>
							<tr align="center">
								<td><strong>이름</strong></td>
								<td colspan="3">${groupHwDto.name}</td>
							</tr>
							<tr align="center">
								<td><strong>내용</strong></td>
								<td colspan="3" >${groupHwDto.mycontent}</td>
	                            <td></td>
							</tr>
						</table>
						<button id="scrapBtn" type="button" class="btn btn-danger pull-right">스크랩</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	</div>
