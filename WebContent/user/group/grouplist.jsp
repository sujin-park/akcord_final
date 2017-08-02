<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/common/template/head_include.jsp"%>
<link rel="stylesheet" href="/akcord_project/user/group/css/group.css">
<%@ include file="/common/template/nav.jsp" %>
<%@ include file="/common/public.jsp" %>
<script type="text/javascript">
$(document).ready(function(){
	$('#create').click(function(){
		$('#myModal').modal({
	    	show : true  
	      });
	});
	
	$('#accept').click(function(){
		$(location).attr('href','${root}/group/waitinglist.akcord');
	});
	
	$('#creategroup').click(function(){
		if($('#groupName').val() == "") {
			alert("그룹방 이름을 입력해주세요.");
			return;
		} else if ($('#gCount').val() == 0) {
			alert("그룹방 최대 인원을 선택해주세요.");
			return;
		} else if ($('#content').val() == "") {
			alert("그룹방 소개를 입력해주세요.");
			return;
		} else {
		$('form[name=createG]').attr('action','${root}/group/make.akcord');
		$('form[name=createG]').submit();
		}
	});
	
	$('#joinG').click(function(){
		var joinseq = $('#joinseq').val();
		$(location).attr('href', '${root}/group/join.akcord?seq='+joinseq);
	});
	
	$('#searchBtn').click(function(){
		$('#pg').val('1');
		$('#key').val($('#skey').val());
		$('#word').val($('#sword').val());
		$('#commonForm').attr('action', '${root}/group/list.akcord').submit();
	});
	
	$('#firstBtn').click(function(){
		$('#pg').val('1');
		$('#key').val($('#skey').val());
		$('#word').val($('#sword').val());
		$('#commonForm').attr('action', '${root}/group/list.akcord').submit();
	});
	
	$('.pagemove').click(function(){
		$('#pg').val($(this).attr('data-page'));
		$('#key').val($('#skey').val());
		$('#word').val($('#sword').val());
		$('#commonForm').attr('action', '${root}/group/list.akcord').submit();
	});
	
	$('#lastBtn').click(function(){
		$('#pg').val($(this).attr('data-last'));
		$('#key').val($('#skey').val());
		$('#word').val($('#sword').val());
		$('#commonForm').attr('action', '${root}/group/list.akcord').submit();
	});
});

function joinGroup(seq) {
	var seq = $('#seq'+seq).val();
	$('#joinseq').val(seq);
	$('#major').val($('#majorName'+seq).text());
	$('#groupN').val($('#groupName'+seq).text());
	$('#Jcontent').text($('#content'+seq).text());
	$('#fullCount').text($('#gCount'+seq).val() + '명');
	$('#nowCount').text($('#nowCount'+seq).val() + '  명/');
	$('#joingroupM').modal({
		show : true
	});
}
</script>
		<section class="content page-top row">
			<div class="col-sm-10 col-sm-push-1">
			<h2>GROUP LIST</h2>
				<div class="panel panel-default">
					<div class="panel-body">
						<div class="row" style="padding-bottom:10px;">
							<div class="col-sm-6 pull-left">
								<button type="button" id="create" class="btn btn-sm btn-danger">그룹방 개설</button>
								<button type="button" id="accept" class="btn btn-sm btn-default">승인 리스트</button>
							</div>
							<div class="row">
								<div class="form-group form-inline">
									<div class="col-sm-6 pull-right">
										<div class="col-sm-3"></div>
										<div class="col-sm-9">
											<select class="form-control" name="skey" id="skey">
												<option value="majorName">전공명</option>
												<option value="groupName">그룹방명</option>
											</select>
												<input type="text" class="form-control" id="sword" name="sword" placeholder="검색어 입력" size="25">
												<button type="button" class="btn btn-sm btn-danger" id="searchBtn">SEARCH</button>
										</div>
									</div>
								</div>
							</div>
						</div>
							<div class="row">
								<div class="table-container table-responsive" style="margin-left: 20px; margin-right: 20px">
									<table class="table table-filter" id="extable">
										<tbody>
											<tr class="primary" align="center">
												<td width="15%">생성일</td>
												<td width="10%">전공</td>
												<td width="15%">그룹방명</td>
												<td width="20%">그룹방내용</td>
												<td width="15%">리더</td>
												<td width="10%">인원</td>
												<td width="15%">JOIN</td>
											</tr>
										<c:forEach var="GroupRoomDto" items="${grouplist}">
											<input type="hidden" id="seq${GroupRoomDto.groupId}" value="${GroupRoomDto.groupId}">
											<input type="hidden" id="gCount${GroupRoomDto.groupId}" value="${GroupRoomDto.gCount}">
											<input type="hidden" id="nowCount${GroupRoomDto.groupId}" value="${GroupRoomDto.nowCount}">
											<tr>
												<td>
													<div class="media">
														<p class="media-meta">${GroupRoomDto.regDate}</p>
													</div>
												</td>
												<td>
													<div class="media">
														<p class="media-meta" id="majorName${GroupRoomDto.groupId}">${GroupRoomDto.majorName}</p>
													</div>
												</td>
												<td>
													<div class="media">
														<div class="media-meta" id="groupName${GroupRoomDto.groupId}">${GroupRoomDto.groupName}</div>
													</div>
												</td>
												<td>
													<div class="media">
														<span class="media-meta" id="content${GroupRoomDto.groupId}">${GroupRoomDto.content}</span>
													</div>
												</td>
												<td>
													<div class="media">
														<span class="media-meta">${GroupRoomDto.name}</span>
													</div>
												</td>
												<td>
													<div class="media">
														<span class="media-meta">${GroupRoomDto.nowCount} / ${GroupRoomDto.gCount} 명</span>
													</div>
												</td>
												<td>
													<p align="center" data-placement="top" data-toggle="tooltip" title="Edit">
														<button type="button" id="joinGroup" class="btn btn-danger"
														 onclick="javascript:joinGroup(${GroupRoomDto.groupId});">
											    			<span class="glyphicon glyphicon-thumbs-up"></span>
											    		</button>
											    	</p>
											    </td>
											</tr>
										</c:forEach>
										</tbody>
									</table>
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
<%@include file="/user/group/create.jsp"%>
<%@include file="/user/group/join.jsp"%>
</body>
</html>