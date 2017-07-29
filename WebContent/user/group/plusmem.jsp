<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<c:forEach var="searchDto" items="${slist}">
	<tr class="invite">
		<td>
			<div class="media">
				<div class="media-meta" id="aaa">${searchDto.majorName}</div>
			</div>
		</td>
		<td>
			<div class="media">
				<div class="media-meta" id="bbb">${searchDto.userId}</div>
			</div>
		</td>
		<td>
			<div class="media">
				<div class="media-meta" id="ccc">${searchDto.name}</div>
			</div>
		</td>
		<td>
			<button type="button" class="btn btn-md btn-danger" id="inviteBtn" onclick="javascript:invite(${searchDto.seq});">
				<span class="glyphicon glyphicon-thumbs-up"></span>
			</button>
		</td>
	</tr>
</c:forEach>