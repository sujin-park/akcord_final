<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/public.jsp" %>
<div class="panel-body">
						<div class="row" style="padding-bottom:10px;">
							<div class="row">
								<div class="form-group form-inline">
									<div class="col-sm-6 pull-right"  style="padding-right:70px;">
										<h6 class="order" data-order="major" align="right">전공순 <span class="glyphicon glyphicon-chevron-down" aria-hidden="true"></span></h6>
										<h6 class="order" data-order="regdate" align="right">대기순 <span class="glyphicon glyphicon-chevron-down" aria-hidden="true"></span></h6>
									</div>
								</div>
							</div>
							<div class="col-sm-6 pull-left">
								<button type="button" class="btn btn-md btn-danger" onclick="javascript:plusMember();">
									<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
								</button>
								<span>그룹원 추가</span>
							</div>
							<div class="row">
								<div class="form-group form-inline">
									<div class="col-sm-6 pull-right">
										<div class="col-sm-3"></div>
										<div class="col-sm-9">
											<select class="form-control" name="skey" id="skey">
												<option value="id">아이디</option>
												<option value="majorName">전공명</option>
											</select>
												<input type="text" class="form-control" name="sword" id="sword" placeholder="검색어 입력" size="25">
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
											<tr class="danger" align="center">
												<td width="10%">
													<div class="ckbox">
														<input type="checkbox" id="checkedAll">
														<label for="checkedAll"></label>
													</div>
												</td>
												<td width="15%">가입일</td>
												<td width="15%">전공</td>
												<td width="20%">아이디</td>
												<td width="20%">이름</td>
												<td width="10%">ACCEPT</td>
												<td width="10%">DELETE</td>
											</tr>
										<c:forEach var="listDto" items="${glist}">
											<input type="hidden" id="groupid" value="${listDto.groupId}">
											<tr class="Wlist">
												<td>
													<div class="ckbox">
														<input type="checkbox" class="checkthis" id="checkbox" name ="checkbox" value=""> <label
															for="checkbox"></label>
													</div>
												</td>
												<td>
													<div class="media">
														<p class="media-meta" id="waitDate">${listDto.regDate}</p>
													</div>
												</td>
												<td>
													<div class="media">
														<p class="media-meta" id="waitMajor">${listDto.majorName}</p>
													</div>
												</td>
												<td>
													<div class="media">
														<div class="media-meta" id="waitId">${listDto.userId}</div>
													</div>
												</td>
												<td>
													<div class="media">
														<span class="media-meta" id="waitName">${listDto.name}</span>
													</div>
												</td>
												<td align="center">
													<button type="button" class="btn btn-sm btn-danger" id="acceptG"
													onclick="javascript:acceptM(${listDto.seq})">
										    			<span class="glyphicon glyphicon-heart"></span>
										    		</button>
											    </td>
												<td align="center">
													<button type="button" class="btn btn-sm btn-default" id="deleteM"
													onclick="javascript:deleteM(${listDto.seq})">
										    			<span class="glyphicon glyphicon-remove"></span>
										    		</button>
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