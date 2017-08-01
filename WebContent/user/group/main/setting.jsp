<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/common/template/head_include.jsp"%>
<link rel="stylesheet" href="/akcord_project/user/group/css/group.css">
<%@ include file="/common/template/nav.jsp" %>
<%@ include file="/common/public.jsp" %>
<script type="text/javascript">

	function deleteM(seq) {
		if (confirm("조원을 강퇴시키겠습니까?")) {
			document.location.href = "${root}/groupmain/reject.akcord?seq="+seq+"&state=1&groupId=${groupId}";
		}
	}

	function exitM(seq) {
		if (confirm("승인을 거절하시겠습니까?")) {
			document.location.href = "${root}/groupmain/reject.akcord?seq="+seq+"&state=2&groupId=${groupId}";
		}
	}
	function plusMember() {
		var div = document.getElementById("tbodyselect");
		div.innerHTML='<tr align="center"><td colspan="4">초대할 사람을 검색하세요.</td></tr>';
		$('#plusmember').modal({
			show : true
		});
	}
	function acceptM(seq) {
		if (confirm("승인하시겠습니까?")) {
			document.location.href = "${root}/groupmain/accept.akcord?seq="+seq +"&groupId=${groupId}";
		}
	}
	
	function searchMember() {
 		var selectname = $("#memberselect").val();
 		if(selectname=="") {
 			alert("검색할 아이디를 입력하세요");
 		} else {
 				$.get("${root}/groupmain/search.akcord?sid="+selectname, 
 						function(data, status){
 						var div = document.getElementById("tbodyselect");
 						div.innerHTML=data;
 						});
 						$("#memberselect").val('');
 		}
 	}
	
	function invite(seq) {
		if (confirm("그룹방에 초대하시겠습니까?")) {
			var groupid = $('#groupid').val();
			document.location.href = "${root}/groupmain/invite.akcord?seq="+seq +"&groupId=${groupId}";
		}
	}
	
	$(document).ready(function(){
		$('#g').on('click', function(){
			$.get("${root}/groupmain/grouplist.akcord?groupId=${groupId}", 
						function(data, status){
						var div = document.getElementById('groupReal');
						div.innerHTML=data;
						});
		});
		
		$('#searchBtn').click(function(){
			$('#pg').val('1');
			$('#key').val($('#skey').val());
			$('#word').val($('#sword').val());
			$('#commonForm').attr('action', '${root}/groupmain/group.akcord').submit();
		});
	});

</script>
		<section class="content page-top row">
			<div class="col-sm-10 col-sm-push-1" style="padding-top: 60px;">
				<div class="col-sm-10">
					<h3>그룹원 관리</h3>
				</div>
				<div class="panel panel-default">
					<div class="tabbable" id="tabs-630325" align="left" style="width: 100%; clear:both;">
						<ul class="nav nav-tabs">
							<li class="active">
								<a href="#waiting" data-toggle="tab">대기 리스트</a>
							</li>
							<li>
								<a href="#groupReal" data-toggle="tab" id="g">그룹 리스트</a>
							</li>
						</ul>
						<div class="tab-content">
							<div class="tab-pane active" id="waiting">
								<%@include file="/user/group/main/waitinggroup.jsp"%>
							</div>
							<div class="tab-pane" id="groupReal">
								<!-- <%@include file="/user/group/main/origingroup.jsp" %> -->
							</div>
						</div>
		</section>
<%@include file="/user/group/main/plusmember.jsp"%>
	</body>
</html>