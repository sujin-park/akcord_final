<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"/>
 
 
<%@include file="/common/template/head_include.jsp" %>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="Source code generated using layoutit.com">
<meta name="author" content="LayoutIt!">
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/style.css" rel="stylesheet">

<%@ include file="/common/template/nav.jsp" %>
<%@ include file="/common/public.jsp" %>
<script type="text/javascript">
$(document).ready(function(){

	
	$('#majorPlusBtn').click(function (){
		var mname= $('#major_name').val();
	$(location).attr('href','${root}/usermanager/majorPlus.akcord?mname='+mname);	
	});
	
	$("#membersortb").change(function () {
	      $("#membersortb option:selected").each(function () {
	    	  var str = $(this).val();
	    	$('#pg').val('1');
		  	$('#key').val($('#skey').val());
		  	$('#word').val($('#sword').val());	
		  	$('#memberskey').val(str);
		 	$('#commonForm').attr('action','${root}/usermanager/blacklist.akcord').submit();		
      });
	});
	$('.black').find('#bUserOutBtn').click(function(){
		var user_id;
		user_id =$(this).val();
		$(location).attr('href','${root}/usermanager/blackuserOut.akcord?user_id='+user_id);	
	});
	
	$('#searchBtn').click(function (){
		$('#pg').val('1');
		$('#key').val($('#skey').val());
		$('#word').val($('#sword').val());	
		$('#commonForm').attr('action','${root}/usermanager/blacklist.akcord').submit();		
	});
	 $('#ul').click(function (){
		//$(this).parent().attr('class','active');
		$('#pg').val('1');
		$('#key').val($('#skey').val());
		$('#word').val($('#sword').val());	
		$('#commonForm').attr('action','${root}/usermanager/mvmemberlist.akcord').submit();		
	});
	
		$('#firstBtn').click(function(){
			$('#pg').val('1');
			$('#key').val('${query.key}');
			$('#word').val('${query.word}');
			$('#commonForm').attr('action', '${root}/usermanager/blacklist.akcord').submit();
		});
		
		$('.pagemove').click(function(){
			$('#pg').val($(this).attr('data-page'));
			$('#key').val('${query.key}');
			$('#word').val('${query.word}');
			$('#commonForm').attr('action', '${root}/usermanager/blacklist.akcord').submit();
		});
		
		$('#lastBtn').click(function(){
			$('#pg').val($(this).attr('data-last'));
			$('#key').val('${query.key}');
			$('#word').val('${query.word}');
			$('#commonForm').attr('action', '${root}/usermanager/blacklist.akcord').submit();
		});
	
	
});

</script>
<section class="content page-top row" style="padding-top: 60px;">
   <div class="container" >
	<div class="row">
		<div class="col-sm-10 col-sm-push-1">
					<h3>회원 관리</h3>
		</div>

		<div class="col-sm-10 col-sm-push-1" style="padding-top: 20px;">
	
		<div class="panel panel-default">
			<div class="tabbable" id="tabs-630325">
				<ul class="nav nav-tabs">
					<li>
						<a href="#userList" id="ul" data-toggle="tab">회원목록</a>
					</li>
					<li>
						<a href="#blackList" id="blackul" data-toggle="tab">블랙리스트</a>
					</li>
				</ul>
				<div class="tab-content">
<!-- 					<div class="tab-pane fade in active" id="userList">
 -->					
				<!-- 	</div>
					<div class="tab-pane" id="panel-822061">
					</div> -->
				
				<div class="tab-pane active" id="blackList">
			
				<form class="navbar-form navbar-left" role="search">
						<div class="form-group">
							<select class="form-control" id="membersortb" name="membersortb">
								<option>회원정렬</option>
                                <option id="str" value="1">가입일</option>
                                <option id="str" value="2">이름</option>
                             </select>
                     
						<select class="form-control" id="skey" name="skey">
                                <option value="">회원검색</option>
                                <option value="sname">이름검색</option>
                                <option value="sid">아이디검색</option>
                                <option value="snum">번호검색</option>
                         </select>
							<input type="text" class="form-control" id="sword"/>
						</div> 
						<button id="searchBtn" type="button" class="btn btn-default">
							Submit
						</button>
					</form>
					  <div class="text-right">
					<button style="right" id="majorBtn"
					 href="#modal-container-947726" role="button" class="btn" data-toggle="modal">
							전공추가
					</button>
					</div>
					
			<table class="table table-bordered table-hover table-condensed">
				<thead>
					<tr>
						<th>번호</th>
						<th>회원ID</th>
						<th>이름</th>
						<th>휴대폰번호</th>
						<th>성별</th>
						<th>전공</th>
                        <th>가입일</th>
						<th>탈퇴처리</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach var="blackuser" items="${blackuserList}">
					<c:if test="${blackuser.is_block==1 }">
				
				<tr class="black">
						<td>${blackuser.user_id }</td>
						<td>${blackuser.id }</td>
						<th>${blackuser.name}</th>
						<td>${blackuser.tel1 }-${blackuser.tel2}-${blackuser.tel3 }</td>
						<td>${blackuser.gender }</td>
						<td>${blackuser.major_name }</td>
                        <td>${blackuser.reg_date }</td>
						<td>
						<button type="button" class="btn btn-sm" id="bUserOutBtn" value="${blackuser.user_id }">
						확인
						</button>
						</td>
					</tr>
					</c:if>
					</c:forEach>
				</tbody>
				</table>
			
			</div>
			
			</div>
				</div>
			
			</div>
		</div>
	</div>
</div>
<div align="center" style="clear:both;">
			${navigator.navigator}
			</div>
			<div class="col-md-6"></div>
		
</section>
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
						&nbsp;&nbsp;&nbsp;
						<select>
						<option value="">전공목록</option> 
						<c:forEach var="major" items="${majorList}">
		 			 	<option>${major.major_name }</option>
 		 		 		</c:forEach>
						</select>&nbsp;
							전공이름 <input type="text" name="major_name" id="major_name" value="">
						</div>
						<div class="modal-footer">
							 
							<button type="button" class="btn btn-default" data-dismiss="modal">
								Close
							</button> 
							<button type="button" class="btn btn-primary" id="majorPlusBtn">
								Save changes
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