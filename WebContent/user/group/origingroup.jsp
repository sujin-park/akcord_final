<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<div class="panel-body">
	<div class="row" style="padding-bottom:10px;">
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
						<select class="form-control" name="key">
							<option value="title">아이디</option>
							<option value="name">전공명</option>
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
					<c:forEach var="GlistDto" items="${oglist}">
						<input type="hidden" id="groupid" value="${GlistDto.groupId}">
						<tr class="Wlist">
							<td>
								<div class="ckbox">
									<input type="checkbox" class="checkthis" id="checkbox" name ="checkbox" value=""> <label
										for="checkbox"></label>
								</div>
							</td>
							<td>
								<div class="media">
									<p class="media-meta" id="waitDate">${GlistDto.regDate}</p>
								</div>
							</td>
							<td>
								<div class="media">
									<p class="media-meta" id="waitMajor">${GlistDto.majorName}</p>
								</div>
							</td>
							<td>
								<div class="media">
									<div class="media-meta" id="waitId">${GlistDto.userId}</div>
								</div>
							</td>
							<td>
								<div class="media">
									<span class="media-meta" id="waitName">${GlistDto.name}</span>
								</div>
							</td>
							<td align="center">
								<button type="button" class="btn btn-sm btn-danger" id="acceptG"
								onclick="javascript:acceptM(${GlistDto.seq})">
					    			<span class="glyphicon glyphicon-heart"></span>
					    		</button>
						    </td>
							<td align="center">
								<button type="button" class="btn btn-sm btn-default" id="exitM"
								onclick="javascript:exitM(${GlistDto.seq})">
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