<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/common/template/head_include.jsp"%>
<link rel="stylesheet" href="/akcord_project/user/group/css/group.css">
<%@include file="/common/template/nav.jsp"%>
<script type="text/javascript">
	function cancel(seq) {
		document.location.href ="${root}/group/cancel.akcord?seq="+seq;
	}
	
	function accept(seq) {
		document.location.href ="${root}/group/accept.akcord?seq="+seq;
	}
	
	$(document).ready(function(){
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
	
	});
</script>
	<div class="container akcord">
		<div class="col-sm-12">
		<h2>Waiting LIST</h2>
			<div class="panel panel-default">
				<div class="panel-body">
					<div class="row">
						<div class="table-container table-responsive" style="margin-left: 20px; margin-right: 20px">
							<table class="table table-filter" id="extable">
								<tbody>
									<tr align="center">
										<td width="15%">요청일</td>
										<td width="15%">전공</td>
										<td width="20%">그룹방명</td>
										<td width="20%">그룹방내용</td>
										<td width="15%">리더</td>
										<td width="15%">승인/취소</td>
									</tr>
								<c:if test="${waitlist.size() == 0}">
									<tr>
										<td colspan="6">
											<div class="media-meta">가입 대기중인 그룹방이 없습니다.</div>
										</td>
									</tr>
								</c:if>
								<c:if test="${waitlist.size() != 0}">
								<c:forEach var="WaitDto" items="${waitlist}">
									<input type="hidden" id="cancelSeq" value="${WaitDto.groupId}">
									<tr>
										<td>
											<div class="media">
												<p class="media-meta">${WaitDto.waitingDate}</p>
											</div>
										</td>
										<td>
											<div class="media">
												<p class="media-meta">${WaitDto.majorName}</p>
											</div>
										</td>
										<td>
											<div class="media">
												<div class="media-meta">${WaitDto.groupName}</div>
											</div>
										</td>
										<td>
											<div class="media">
												<span class="media-meta">${WaitDto.content}</span>
											</div>
										</td>
										<td>
											<div class="media">
												<span class="media-meta">${WaitDto.name}</span>
											</div>
										</td>
										<td align="center">
												<button class="btn btn-danger" id="accept${WaitDto.groupId}" onclick="javascript:accept(${WaitDto.groupId});">
													<span class="glyphicon glyphicon-heart">
													</span>
												</button>
												<button class="btn btn-default" id="cancel${WaitDto.groupId}" onclick="javascript:cancel(${WaitDto.groupId});">
													<span class="glyphicon glyphicon-remove">
													</span>
												</button>
									    </td>
									</tr>
								</c:forEach>
								</c:if>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
			<div align="center" style="clear:both;">
				${navigator.navigator}
			</div>
			<div class="col-md-6"></div>
		</div>
	</div>
 <%@include file="/common/template/footer.jsp"%>