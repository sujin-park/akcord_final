<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/common/template/head_include.jsp" %>
<html lang="en">
  <head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>akcord-notice-page</title>

    <meta name="description" content="Source code generated using layoutit.com">
    <meta name="author" content="LayoutIt!">

    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">

  </head>
  <body>
  
<%@ include file="/common/template/nav.jsp" %>
<div class="container-fluid">
	<div class="row">
		<div class="col-sm-12">
			<h1>
				공지사항 목록
			</h1>
            <div class="btn-group"> 
				
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
						<th>
							공지 제목
						</th>
						<th>
							등록일
						</th>
						<th>
							조회수
						</th>
						<th>
							공개여부
						</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>
							<input type="checkbox" name="ck_1" value="1">
						</td>
						<td>
							TB - Monthly
						</td>
						<td>
							01/04/2012
						</td>
						<td>
							Default
						</td>
						<td>
							공개
						</td>
					</tr>
					<tr class="active">
						<td>
							<input type="checkbox" name="ck_1" value="1">
						</td>
						<td>
							TB - Monthly
						</td>
						<td>
							01/04/2012
						</td>
						<td>
							Approved
						</td>
						<td>
							비공개
						</td>
					</tr>
					
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
</div>

    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/scripts.js"></script>
  </body>
</html>