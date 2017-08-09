<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}"/>

<div class="modal fade" id="scheduleModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
     <input type="hidden" name="title" id ="title" value="">
     <input type="hidden" name="content" id="content" value="">
     <input type="hidden" name="startDate" id="startDate" value="">
     <input type="hidden" name="endDate" id="endDate" value="">
		  <div class="modal-dialog modal-lg" style="width:40%">
		        <div class="modal-content">
		             <div class="modal-header">
		                <button type="button" class="close" data-dismiss="modal">
		                   <span aria-hidden="true">X</span> <span class="sr-only">close</span>
		                </button>
			             <div class="row" style="clear:both;">
		              		<div class="col-sm-6">
			              			<span class="fa fa-calendar-check-o" style="color:#d34e4c;"></span>
						                시작일  &nbsp&nbsp
						             <input type="text" class="form-control" name="startDate" id="startDate" style="text-align: center;">
				            </div>
				            <div class="col-sm-6">
					            	<span class="fa fa-calendar-check-o" style="color:#d34e4c;"></span>
						                 마감일  &nbsp&nbsp
						            <input type="text"  class="form-control" name="endDate" id="endDate"  style="text-align: center;0">
				            </div>
						</div>
		            </div>
		           <div id="modalBody" class="modal-body">
		           		<div class="row">
		           		  <div class="col-sm-6">
					           	 <div class="input-group">
					              <h3>과제명 </h3>
					                 <input type="text" class="form-control" size="25" name="scheduleName"   id="scheduleName" value="">
					             </div>
					            <div class="input-group">
					              <h3>할일</h3>
					              <textarea id="detail"  class="form-control" name="detail" cols="38"></textarea>
					           </div>
			           </div>
			           <div class="col-sm-6">
			          			 <div class="pull-right" style="padding-top:30px;">
						         	<span class="glyphicon glyphicon-time" aria-hidden="true" style="color:#d34e4c;"></span><span id="deadspan" value=""></span>
					           		 <button type="button" class="btn btn-danger btn-block" id="scheduleListBtn"><span class="fa fa-list"></span>&nbsp;&nbsp;과제목록</button>
					           		 <button type="button" class="btn btn-danger btn-block" id="sModifyBtn" value=""><span class="fa fa-cut"></span>&nbsp;&nbsp;  수정</button>
					           		 <button type="button" class="btn btn-default btn-block" id="sDeleteBtn" value=""><span class="fa fa-pencil fa-fw"></span>&nbsp;&nbsp;  삭제</button>
						         </div>
			           </div>
			        </div>
				          <div class="modal-footer">
						              <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				           </div>
		          </div>
		     </div>
</div>
</div>

<input type="hidden" id="groupId" name="groupId" value="${gInfo.groupId}">

<div class="modal fade" id="scheduleInsert"  tabindex="-1" role="dialog"aria-hidden="true">
   <div class="modal-dialog modal-lg" style="width:40%">
        <div class="modal-content">
           <div class="modal-header">
              <button type="button" class="close" data-dismiss="modal">
                 <span aria-hidden="true">X</span> <span class="sr-only">close</span>
              </button>
              <div class="row" style="clear:both;">
              		<div class="col-sm-6">
	              			<span class="fa fa-calendar-check-o" style="color:#d34e4c;"></span>
				                시작일  &nbsp&nbsp
				             <input type="text" class="form-control" name="startDate" id="startDate" style="text-align: center;">
		            </div>
		            <div class="col-sm-6">
		            	<span class="fa fa-calendar-check-o" style="color:#d34e4c;"></span>
			                 마감일  &nbsp&nbsp
			            <input type="text"  class="form-control" name="endDate" id="endDate"  style="text-align: center;0">
		            </div>
				</div>
           </div>
           
           <div id="modalBody" class="modal-body">
           <div class="input-group">
              <h3>과제명 </h3>
                 <input type="text" class="form-control" size="25" name="scheduleName"   id="scheduleName" value="">
             </div>
            <div class="input-group">
              <h3>할일</h3>
              <textarea id="detail"  class="form-control" name="detail" cols="38"></textarea>
           </div>

           <div class="modal-footer">
              <button class="btn btn-danger" type="button"
                 id="scheduleBtn">등록</button>
              <button type="button" class="btn btn-default"
                 data-dismiss="modal">Close</button>
           </div>
        </div>
     </div>
</div>
</div>