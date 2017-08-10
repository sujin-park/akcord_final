<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/common/template/head_include.jsp"%>
<link rel="stylesheet" href="/akcord/user/group/css/list.css">
<%@ include file="/common/template/nav.jsp" %>
   <div class="container" style="padding-top:60px;">
     <div class="container container-pad" id="property-listings">
       <div class="row">
         <div class="col-sm-12  style="padding-bottom:50px;">
           <h1>GROUP HOMEWORK</h1>
                <p>2017/07/19 ~ 2017/07/26</p>
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
								<td colspan="2">${groupHwDto.id}</td>
								<td></td>
							</tr>
							<tr align="center">
								<td><strong>이름</strong></td>
								<td colspan="2">${groupHwDto.name}</td>
								<td></td>
							</tr>
							<tr align="center">
								<td><strong>내용</strong></td>
								<td colspan="3">${groupHwDto.mycontent}</td>
	                            <td></td>
							</tr>
						</table>
					</div>
				</div>
				<div class="pull-right">
					<button type="button" class="btn btn-md btn-danger">수정</button>
					<button type="button" class="btn btn-md btn-default">삭제</button>
				</div>
			</div>
		</div>
	</div>
 <%@include file="/common/template/footer.jsp"%>