<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg" style="width:40%">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close btn-danger" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">새 그룹방 개설</h4>
      </div>
      <div class="modal-body">
      	<div class="row">
	      	<form class="form-horizontal" action="" method="post" name="createG">
		      		<div class="form-group">
	                  <label for="concept" class="col-sm-3 control-label">전공</label>
	                  	<div class="col-sm-8">
	                  	<select class="form-control" id="majorId" name="majorId">
	                      <c:forEach var="majorDto" items="${mList}">
	                          <option value="${majorDto.majorId}">${majorDto.majorName}</option>
	                      </c:forEach>
	                      </select>
	                  	</div>
	                </div>
	                 <div class="form-group">
	                      <label for="description" class="col-sm-3 control-label">그룹방 이름</label>
	                      <div class="col-sm-8">
	                          <input type="text" class="form-control" id="groupName" name="groupName">
	                      </div>
	                 </div> 
	                 <div class="form-group">
	                      <label for="status" class="col-sm-3 control-label">최대 인원</label>
	                      <div class="col-sm-8">
	                          <select class="form-control" id="gCount" name="gCount">
	                          	  <option>최소 4명 / 최대 40명</option>
	                              <option value="4">4</option>
	                              <option value="8">8</option>
	                              <option value="12">12</option>
	                              <option value="16">16</option>
	                              <option value="20">20</option>
	                              <option value="24">24</option>
	                              <option value="28">28</option>
	                              <option value="32">32</option>
	                              <option value="36">36</option>
	                              <option value="40">40</option>
	                          </select>
	                      </div>
	                 </div>
	                 <div class="form-group">
	                      <label for="amount" class="col-sm-3 control-label">그룹방 소개</label>
	                      <div class="col-sm-8">
	                          <textarea  class="form-control" id="content" name="content" rows="5" cols="46.5"></textarea>
	                      </div>
	                 </div>
               </form>
            </div>
      	</div>
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" id="creategroup">CREATE</button>
        <button type="button" class="btn btn-default" data-dismiss="modal">CLOSE</button>
      </div>
    </div>
  </div>
</div>