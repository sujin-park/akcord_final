<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/common/template/head_include.jsp" %>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>poll-page</title>

    <meta name="description" content="Source code generated using layoutit.com">
    <meta name="author" content="LayoutIt!">

    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">
<%@ include file="/common/template/nav.jsp" %>
<div class="container-fluid">
	<div class="row">
		
			<h1>
				온라인 투표
			</h1>
			<br>
			<div class="col-sm-11" align="right">
			<button type= "button" class="btn btn-sm">
				투표생성
			</button>
			</div>
		<div class="col-sm-12">
			<table class="table">
				<thead>
					<tr>
						<th width="10%">
							번호
						</th>
						<th width="40%">
							투표주제
						</th>
						<th width="20%">
							마감일
						</th>
						<th width="10%">
							참여수
						</th>
						<th width="30%">
							비고
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
			<button type="button" class="btn btn-sm" >
				결과보기
			</button>
			<button type="button" class="btn btn-sm">
				수정
			</button>
			<button type="button" class="btn btn-sm">
				마감하기
			</button>
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
			</div>
		
	</div>
</div>

    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/scripts.js"></script>
  </body>
</html>