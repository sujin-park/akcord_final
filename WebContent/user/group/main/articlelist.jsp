<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/common/template/head_include.jsp"%>
<%@include file="/common/template/nav.jsp"%>
<link rel="stylesheet" href="/akcord_project/user/group/css/list.css">
<%@include file="/common/public.jsp" %>
<script type="text/javascript">
	$(document).ready(function(){
	var groupId = $('#groupInfo').val();
		$('#listBtn_G').click(function(){
			$(location).attr('href','${root}/groupmain/main.akcord?groupId='+groupId);
		});
		
		$('.viewBtn').click(function(){
			var num = $(this).attr('data-num');
			
			$(location).attr('href', '${root}/groupmain/view.akcord?groupId='+groupId+'&articleseq='+num);
		});
		
		$('.deleteMyroom').on('click', function() {
			var number = $(this).attr('data-number');
			var scheduleId = $(this).attr('data-sc');
			$(location).attr('href', '${root}/groupmain/deleteA.akcord?groupId='+groupId+'&articleseq='+number + '&scheduleId=' + scheduleId);
		})
	});
</script>
<input type="hidden" id="groupInfo" value="${groupId}">
    <div class="container akcord">
    	<div class="col-sm-12">
        <div id="property-listings">
            <div class="row">
              <div class="page-header titleinfo" style="padding-bottom:10px;">
                <h2 id="container"><i class="fa fa-edit"></i>&nbsp; <b>GROUP HOMEWORK</b></h2>
                <c:if test="${not empty startDate && not empty endDate}">
                	<p>${startDate} ~ ${endDate}</p>
                </c:if>
                <c:if test="${empty startDate && empty endDate}">
                	<p>그룹방에 공유 된 전체 과제 목록입니다.</p>
                </c:if>
              </div>
            </div>
            <div class="row"  style="padding-bottom:10px;">
				<div class="col-sm-6" style="padding-top:20px;">
					<button type="button" class="btn btn-md btn-danger" id="listBtn_G">
					<span class="glyphicon glyphicon-arrow-left" aria-hidden="true"></span>&nbsp;BACK
					</button>
				</div>
				<div class="col-sm-3"></div>
	            <div class="col-sm-3">
					<h5 align="right"><i class="fa fa-book"></i>&nbsp;과제 제출 현황</h5>
					<div class="progress" >
						  <div class="progress-bar progress-bar-danger progress-bar-striped active" role="progressbar"
						  aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width:${percent}%">
						    ${percent}%
						  </div>
					</div>
				</div>
			</div>
			 <c:forEach var="article" items="${alist}" varStatus="i">
					 <c:if test="${i.index%2 != 1}">
		            <div class="row">
					 </c:if>
		                <div class="col-sm-6"> 
		                    <div class="brdr bgc-fff pad-10 box-shad btm-mrg-20 property-listing">
		                        <div class="media">
		                            <div class="media-body fnt-smaller">
		                                <a href="#" target="_parent"></a>
		                                <h4 class="media-heading">
		                                  <a href="#" class="viewBtn" data-num="${article.myroomNextId}">${article.mysubject}<small class="pull-right">${article.regDate}</small></a></h4>
										<span class="list-inline mrg-0 btm-mrg-10 clr-535353">${article.name}</span>
		                                <p class="hidden-xs">${article.mycontent}</p>
		                                <c:if test="${user.user_id == article.userid}">
		                               	 	<a href="#" class="deleteMyroom"  data-number="${article.myroomNextId}" data-sc="${scheduleId}"><span class="glyphicon glyphicon-remove pull-right" aria-hidden="true" value=""></span></a>
		                                </c:if>
		                        	</div>
		                       </div>
		                   </div>
		                </div><!-- End Listing-->
         			</div>
						<c:if test="${i.index%2 == 1}">
		                 </div>
		                 </c:if>
				 </c:forEach>
               </div><!-- End Listing-->
          </div><!-- End Col -->
