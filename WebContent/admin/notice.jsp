<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/common/template/head_include.jsp" %>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>akcord-notxice-page</title>

    <meta name="description" content="Source code generated using layoutit.com">
    <meta name="author" content="LayoutIt!">

<%@ include file="/common/template/nav.jsp" %>

<style>
.btn {
	background-color: ;
	color: white;
}
</style>
<section class="content page-top row">
			<div class="col-sm-10 col-sm-push-1" style="padding-top: 60px;">
			
				<div class="col-sm-10 col-sm-push-1">
					<h2>공지사항 목록</h2>
				</div>
				<div class="panel panel-default" style="padding:30px;">
            <div class="btn-group" >  
				
					<select class="form-control" id="membersort" name="membersort">
								<option>글정렬</option>
                                <option>최신순</option>
                                <option>조회순</option>
                    </select>
			</div> 

			<table class="table">
				<thead>
					<tr>
						<th>
							<input type="checkbox" name="ck_1" value="1">
						</th>
						<th>공지 제목</th>
						<th>등록일</th>
						<th>조회수</th>
						<th>공개여부</th>
					</tr>
				</thead>
				<tbody>
					<%
						for (int i=0; i<5; i++) {
					%>		
					<tr>
						<td>
							<input type="checkbox" name="ck_1" value="1">
						</td>
						<td>공지제목입니다~!!!!!</td>
						<td>1/04/2012</td>
						<td>Default</td>
						<td>비공개</td>
					</tr>
					<%
					}
					%>
					</tbody>
			</table> 
			<div align="right">
			<button type="button" class="btn btn-sm" onclick="javascript:write();">
				새글쓰기
			</button>
			<button type="button" class="btn btn-sm">
				삭제하기
			</button>
			<button type="button" class="btn btn-sm">
				공개하기
			</button>
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
  </body>
</html>