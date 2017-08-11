<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">
<head>
<title>Bootstrap Example</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
   src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
   .form-control{ box-shadow:none; border-color:#eee;}
   .form-control:focus{ box-shadow:none; border-color:#d34e4c;}
</style>
</head>
<body>
   <div align="center">
   <img src="${root}/doc/img/404error.jpg"width="50%" height="50%">
   </div>
   <div align="center">
   <a href="${root}/user/login/loginmain.jsp"><img src="${root}/doc/img/404errorbutton.jpg" style="width: 50%;"></a>
   </div>
</body>
</html>