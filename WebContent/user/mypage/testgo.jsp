<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="root" value="${pageContext.request.contextPath}" />
<%@include file="/common/template/head_include.jsp" %>
<%@ include file="/common/template/nav.jsp" %>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript">
var id = 'dongdong2';
var user_id = '5';

$(document).ready(function() {
$(document).on('click', '#mypageBtn', function() {

		$(location).attr('href','${root}/mypage/mypage.akcord?id='+id);
	});
$(document).on('click', '#myArticleBtn', function() {

		$(location).attr('href','${root}/mypage/myarticle.akcord?user_id='+user_id);
	});
});

</script>

<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<center>
<br><br><br><br><br><br><br><br><br><br><br><br><br><br>
이건 마이페이지로 보내는 버튼입니다.<br>
<input type="button" id="mypageBtn" value="내 신상정보"><br>
그리고 이건 내 글보기로 보내는 버튼입니다.<br>
<input type="button" id="myArticleBtn" value="내 끌끌끌"><br>

<br>
지금 id는 
<input type="text" value="${id}" readonly="readonly">
요거 입니다.
지금 user_id는 
<input type="text" value="${user_id}" readonly="readonly">
요거 입니다.
</center>
</body>
</html>