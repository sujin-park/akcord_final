<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<div class="modal fade" id="joingroupM" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg" style="width:40%">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close btn-danger" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">그룹방 가입 요청</h4>
      </div>
      <div class="modal-body">
      	<div class="row">
      		<form class="form-horizontal" action="">
      		<input type="hidden" id="joinseq" value="">
		      <div class="form-group">
	            <label for="concept" class="col-sm-3 control-label">전공</label>
	            <div class="col-sm-8">
	            	 <input type="text" class="form-control" id="major" name="major" readonly="readonly">
	            </div>
	          </div>
	          <div class="form-group">
	              <label for="description" class="col-sm-3 control-label">그룹방 이름</label>
	              <div class="col-sm-8">
	                  <input type="text" class="form-control" id="groupN" name="groupN" readonly="readonly">
	              </div>
	          </div> 
	          <div class="form-group">
	              <label for="amount" class="col-sm-3 control-label">그룹방 소개</label>
	              <div class="col-sm-8">
	                  <textarea class="form-control" id="Jcontent" name="Jcontent" rows="5" cols="46.5" readonly="readonly">
</textarea>
	              </div>
	          </div>
	          <div class="form-group">
	              <label for="status" class="col-sm-3 control-label">현재 인원</label>
	              <div class="col-sm-8" style="padding-top:10px;">
	                  <label for="count" id="nowCount" class="count-label"></label>
	                  <label for="count" id="fullCount" class="count-label"></label>
	              </div>
	          </div>
	       </form>
       </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" id="joinG">JOIN</button>
        <button type="button" class="btn btn-default" data-dismiss="modal">CLOSE</button>
      </div>
    </div>
  </div>
</div>
