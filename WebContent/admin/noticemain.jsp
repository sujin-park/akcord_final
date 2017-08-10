<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.akcord.admin.model.UserManageDto"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"/>
    
<%@include file="/common/template/head_include.jsp" %>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>akcord-notxice-pazge</title>

    <meta name="description" content="Source code generated using layoutit.com">
    <meta name="author" content="LayoutIt!">

<%@ include file="/common/template/nav.jsp" %>

<section class="content page-top row">
			<div class="col-sm-10 col-sm-push-1" style="padding-top: 60px;">
				<div class="col-sm-10 col-sm-push-1">
					<a href="${root }/notice/mvnoticelist.akcord">공지사항 목록으로이동</a>
					<a href="${root }/usermanager/mvmemberlist.akcord">회원 목록으로이동</a>
				</div>
			
			</div>
			</section>
  <%@include file="/common/template/footer.jsp"%>