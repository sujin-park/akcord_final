<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/common/template/head_include.jsp"%>
<link rel="stylesheet" href="/akcord_project/user/group/css/group.css">
<%@ include file="/common/template/nav.jsp" %>
		<section class="content page-top row">
			<div class="col-sm-10 col-sm-push-1">
			<h2>MY ARTICLE LIST</h2>
				<div class="panel panel-default">
					<div class="panel-body">
						<div class="row" style="padding-bottom:10px;">
							<div class="col-sm-6 pull-left">
							<!-- 
								<button type="button" id="create" class="btn btn-sm btn-danger">그룹방 개설</button>
								<button type="button" id="accept" class="btn btn-sm btn-default">승인 리스트</button>
							-->
							</div>
							<div class="row">
								<div class="form-group form-inline">
									<div class="col-sm-6 pull-right">
										<div class="col-sm-3"></div>
										<div class="col-sm-9">
											<select class="form-control" name="key">
												<option value="title">전공명</option>
												<option value="QNA">지식인</option>
												<option value="GROUP">그룹방</option>
											</select>
												<input type="text" class="form-control" name="word" placeholder="검색어 입력" size="25">
												<button type="button" class="btn btn-sm btn-danger">SEARCH</button>
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
												<td width="15%">글 번호</td>
												<td width="10%">분류</td>
												<td width="15%">글 제목</td>
												<td width="20%">글 내용</td>
												<td width="15%">작성자</td>
												<td width="10%">생성일</td>
												<td width="15%">JOIN</td>
											</tr>
											<input type="hidden" id="" value="">
										<c:forEach var="GroupRoomDto" items="${mypage} varStatus="i" ">
											<input type="hidden" id="" name="category" value="${mypage.category}">
											<input type="hidden" id="" name="seq" value="${mypage.seq}">
											<input type="hidden" id="" name="group_id" value="${group.group_id}">
											<tr>
												<td>
													<div class="media">
														<p class="media-meta">0</p>
													</div>
												</td>
												<td>
													<div class="media">
													<c:choose>
														<c:when test="${mypage.category eq 1}">
																<c:choose>
																	<c:forEach var="group" items="${group}">
																		<c:if test="${mypage.category eq group.group_id}">
																			<p class="media-meta" id="">그룹(${group.group_name})</p>
																			
																		</c:if>
																	</c:forEach>
																	<c:when test="${mypage.category eq group.group_id}">
																		<p class="media-meta" id="">그룹(${group.group_name})</p>
																	</c:when>
																</c:choose>
															
															</c:when>
														
														<c:when test="${mypage.category eq 2}">
															<p class="media-meta" id="">지식인</p>
															</c:when>
														
														<c:when test="${mypage.category eq 3}">
															<p class="media-meta" id="">답변</p>
															</c:when>
													</c:choose>
														
													</div>
												</td>
												<td>
													<div class="media">
														<div class="media-meta" id="">${mypage.subject}</div>
													</div>
												</td>
												<td>
													<div class="media">
														<span class="media-meta" id="">${mypage.content}</span>
													</div>
												</td>
												<td>
													<div class="media">
														<span class="media-meta">${userInfo.name}</span>
													</div>
												</td>
												<td>
													<div class="media">
														<span class="media-meta">${mypage.reg_date}</span>
													</div>
												</td>
												<td>
													<p align="center" data-placement="top" data-toggle="tooltip" title="Edit">
														<button type="button" id="deleteBtn" class="btn btn-danger"
														 onclick="#">
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
		</section>
	</body>
</html>