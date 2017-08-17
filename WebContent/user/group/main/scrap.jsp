<%@ page language="java" contentType="application/vnd.word; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />

<%
	response.setHeader("Content-Disposition","attachment;filename=grouparticle.doc");
	response.setHeader("Content-Description", "JSP Generated Data");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>GROUP HOMEWORK</h3>
<table border="1">
		<thead>
				<tr align="center">
					<td colspan="4">
						${groupHwDto.mysubject}
					</td>
				</tr>
				<tr>
					<td><strong>전공</strong></td>
					<td>컴퓨터공학과</td>
					<td><strong>작성일</strong></td>
					<td>2017.07.23</td>
				</tr>
		</thead>
		<tbody>
				<tr align="center">
					<td><strong>아이디</strong></td>
					<td colspan="3">${groupHwDto.id}</td>
				</tr>
				<tr align="center">
					<td><strong>이름</strong></td>
					<td colspan="3">${groupHwDto.name}</td>
				</tr>
				<tr align="center">
					<td><strong>내용</strong></td>
					<td colspan="3" >${groupHwDto.mycontent}</td>
                          <td></td>
				</tr>
		</tbody>
</table>
</body>
</html>

