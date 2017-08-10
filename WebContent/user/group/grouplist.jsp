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
		$(location).attr('href','${root}/group/waitinglist.akcord?pg=1');
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
	
	
	$('#searchBtn').click(function(){
		if ($('#sword').val() == "") {
			alert("검색어를 입력해주세요.");
		} else {
		$('#pg').val('1');
		$('#key').val($('#skey').val());
		$('#word').val($('#sword').val());
		$('#order').val('${query.order}');
		$('#commonForm').attr('action', '${root}/group/list.akcord').submit();
		}
		
		});
	
	$('#firstBtn').click(function(){
		$('#pg').val('1');
		$('#key').val('${query.key}');
		$('#word').val('${query.word}');
		$('#order').val('${query.order}');
		$('#commonForm').attr('action', '${root}/group/list.akcord').submit();
	});
	
	$('.pagemove').click(function(){
		$('#pg').val($(this).attr('data-page'));
		$('#key').val('${query.key}');
		$('#word').val('${query.word}');
		$('#order').val('${query.order}');
		$('#commonForm').attr('action', '${root}/group/list.akcord').submit();
	});
	
	$('#lastBtn').click(function(){
		$('#pg').val($(this).attr('data-last'));
		$('#key').val('${query.key}');
		$('#word').val('${query.word}');
		$('#order').val('${query.order}');
		$('#commonForm').attr('action', '${root}/group/list.akcord').submit();
	});
	
	$('.order').click(function(){
		$('#pg').val('1');
		$('#key').val('${query.key}');
		$('#word').val('${query.word}');
		$('#order').val($(this).attr('data-order'));
		$('#commonForm').attr('action', '${root}/group/list.akcord').submit();
	});
	
	var count = $("#count").val();
	var countG = $("#countG").val();
 	if (count != 0) {
		alert("그룹방이 삭제되었습니다. 새로운 그룹방을 개설해보세요.");
	} 
 	
 	if (countG != 0) {
		alert("그룹방을 탈퇴하였습니다. 새로운 그룹방을 찾아보세요.");
	}
 	
	var state = $('#create').attr('data-state');
 	if (state == 100) {
 		alert("그룹방이 개설되었습니다.");
 	} else if (state ==200) {
 		alert("그룹방 가입요청이 되었습니다.");
 	} else {}
 	
	$('#joinG').click(function(){
		var nowcount = $('#now').val();
		var fullcount = $('#full').val();
		if (nowcount == fullcount) {
			alert("인원 초과이므로 다른 그룹방을 선택해주세요.");	
		} else {
			var joinseq = $('#joinseq').val();
			$(location).attr('href', '${root}/group/join.akcord?seq='+joinseq);
		}
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
	$('#now').val($('#nowCount'+seq).val());
	$('#full').val($('#gCount'+seq).val());
	$('#joingroupM').modal({
		show : true
	});
}
</script>
<input type="hidden" id="count" value="${count}">
<input type="hidden" id="countG" value="${countG}">
<input type="hidden" id="now" valule="">
<input type="hidden" id="full" valule="">

<!-- 	<section class="content page-top row"> -->
	<div class="container akcord">
		<div class="col-sm-12">
				<div class="page-header titleinfo">
					    <h2 id="container"><i class="fa fa-comments"></i>  &nbsp;<b>GROUP LIST</b></h2><h5>그룹원들과 소통하며 일정을 효율적으로 관리할 수 있습니다.</h5>
				</div>
				<div class="panel panel-default">
					<div class="panel-body">
						<div class="row" style="padding-bottom:10px;">
							<div class="row">
								<div class="form-group form-inline">
									<div class="col-sm-6 pull-right"  style="padding-right:70px;">
										<h6 class="order" data-order="gname" align="right">그룹방명순<span class="glyphicon glyphicon-chevron-down" aria-hidden="true"></span></h6>
										<h6 class="order" data-order="major" align="right">전공순 <span class="glyphicon glyphicon-chevron-down" aria-hidden="true"></span></h6>
										<h6 class="order" data-order="regdate" align="right">최신순 <span class="glyphicon glyphicon-chevron-down" aria-hidden="true"></span></h6>
									</div>
								</div>
							</div>
							<div class="col-sm-6 pull-left">
								<button type="button" id="create" class="btn btn-sm btn-danger" data-state="${state}">그룹방 개설</button>
								<button type="button" id="accept" class="btn btn-sm btn-default">승인 리스트</button>
							</div>
							<div class="row">
								<div class="form-group form-inline">
									
									<div class="col-sm-6">
										<div class="col-sm-3"></div>
										<div class="col-sm-9 pull-right">
											<select class="form-control" name="skey" id="skey">
												<option value="majorName">전공명</option>
												<option value="groupName">그룹방명</option>
											</select>
												<input type="text" class="form-control" id="sword" name="sword" placeholder="검색어 입력">
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
											<tr align="center">
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
											    			<span class="fa fa-thumbs-o-up"></span>
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
			<div align="center" style="clear:both;">
			${navigator.navigator}
			</div>
			<div class="col-md-6"></div>
				</div>
			</div>
			</div>
	<!-- </section> -->
<%@include file="/user/group/create.jsp"%>
<%@include file="/user/group/join.jsp"%>
<%@include file="/common/template/footer.jsp"%>