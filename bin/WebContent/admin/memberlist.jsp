<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/common/template/head_include.jsp" %>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="Source code generated using layoutit.com">
<meta name="author" content="LayoutIt!">
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/style.css" rel="stylesheet">
<%@ include file="/common/template/nav.jsp" %>
   <div class="container-fluid">
	<div class="row">
		<div class="col-sm-12">
		<h3 class="text-center">
				회원관리
			</h3>
			<div class="tabbable" id="tabs-630325">
				<ul class="nav nav-tabs">
					<li class="active">
						<a href="#panel-822060" data-toggle="tab">회원목록</a>
					</li>
					<li>
						<a href="#panel-822061" data-toggle="tab">블랙리스트</a>
					</li>
				</ul>
				<div class="tab-content">
					<div class="tab-pane" id="panel-822060">
					</div>
					<div class="tab-pane" id="panel-822061">
					</div>
					<div class="tab-pane active" id="panel-368017">
					</div>
				</div>
			</div>
			
				<form class="navbar-form navbar-left" role="search">
						<div class="form-group">
							<select class="form-control" id="membersort" name="membersort">
								<option>회원정렬</option>
                                <option>가입일</option>
                                <option>이름</option>
                             </select>
                        <button type="submit" class="btn btn-default">
							검색
						</button>
						<select class="form-control" id="status" name="status">
                                <option>회원검색</option>
                                <option>아이디검색</option>
                                <option>번호검색</option>
                         </select>
							<input type="text" class="form-control" />
						</div> 
						<button type="submit" class="btn btn-default">
							Submit
						</button>
					</form>
					  <div class="text-right">
					<button style="right" id="modal-947726"
					 href="#modal-container-947726" role="button" class="btn" data-toggle="modal">
							전공추가
					</button>
					</div>
					
			<table class="table table-bordered table-hover table-condensed">
				<thead>
					<tr>
						<th>
							#
						</th>
						<th>
							회원ID
						</th>
						<th>
							이름
						</th>
						<th>
							휴대폰번호
						</th>
						<th>
							성벌
						</th>
						<th>
							전공
						</th>
                        <th>
							가입일
						</th>
						<th>
							블랙리스트처리
						</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>
							1
						</td>
						<td>
							TB - Monthly
						</td>
						<th>
							황혜정
						</th>
						<td>
							0102558474
						</td>
						<td>
							여
						</td>
						<td>
							major
						</td>
                        <td>
							01/04/2012
						</td>
						<td>
								<button type="button" class="btn btn-sm">
				Default
			</button>
						</td>
					</tr>
					<tr class="active">
						<td>
							1
						</td>
						<td>
							TB - Monthly
						</td>
						<th>
							김도영
						</th>
						<td>
							0102558474
						</td>
						<td>
							여
						</td>
						<td>
							major
						</td>
                        <td>
							01/04/2012
						</td>
						<td>
						<button type="button" class="btn btn-sm">
				Default
			</button>
						</td>
					</tr>
					<tr class="success">
						<td>
							2
						</td>
						<td>
							TB - Monthly
						</td>
						<th>
							박수진
						</th>
						<td>
							0102558474
						</td>
						<td>
							여
						</td>
						<td>
							major
						</td>
                        <td>
							01/04/2012
						</td>
						<td>
								<button type="button" class="btn btn-sm">
				Default
			</button>
						</td>
					</tr>
					<tr class="warning">
						<td>
							3
						</td>
						<td>
							TB - Monthly
						</td>
						<th>
							박영주
						</th>
						<td>
							0102558474
						</td>
						<td>
							여
						</td>
						<td>
							major
						</td>
                        <td>
							01/04/2012
						</td>
						<td>
								<button type="button" class="btn btn-sm">
				Default
			</button>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</div>
<div class="modal fade" id="modal-container-947726" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog" style="width:30%">
					<div class="modal-content">
						<div class="modal-header">
							 
							<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
								×
							</button>
			
							<h4 class="modal-title" id="myModalLabel">
								전공을 입력하세요
							</h4>
						</div>
						<div class="modal-body">
						&nbsp;&nbsp;&nbsp;<select>
		 <option value="">전공목록</option>
  		 <option value="com">컴퓨터</option>
 		 <option value="elec">전자</option>
 		 <option value="manage">경영</option>
		</select>&nbsp;
							전공이름 <input type="text" name="major" value="">
						</div>
						<div class="modal-footer">
							 
							<button type="button" class="btn btn-default" data-dismiss="modal">
								Close
							</button> 
							<button type="button" class="btn btn-primary">
								Save changes
							</button>
						</div>
					</div>
					
				</div>
				
			</div>
			
		</div>
	</div>
</div>
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/scripts.js"></script>
  </body>
</html>