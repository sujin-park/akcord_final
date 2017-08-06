<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/common/template/head_include.jsp"%>
<link rel="stylesheet" href="/akcord_project/user/group/css/list.css">
<%@include file="/common/template/nav.jsp"%>
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
	});
</script>
<input type="hidden" id="groupInfo" value="${groupId}">
    <div class="container-fluid">
        <div class="container container-pad" id="property-listings">
            
            <div class="row">
              <div class="col-sm-12  style="padding-bottom:10px;">
                <h1>GROUP HOMEWORK</h1>
                <c:if test="${not empty startDate && not empty endDate}">
                	<p>${startDate} ~ ${endDate}</p>
                </c:if>
                <c:if test="${empty startDate && empty endDate}">
                	<p>그룹방에 공유 된 전체 과제 목록입니다.</p>
                </c:if>
              </div>
            </div>
            <div class="row"  style="padding-bottom:10px;">
				<div class="col-sm-10">
					<button type="button" class="btn btn-md btn-danger" id="listBtn_G">
					<span class="glyphicon glyphicon-arrow-left" aria-hidden="true"></span>&nbsp;BACK
					</button>
				</div>
	            <div class="col-sm-2">
						<select class="form-control">
							<option>글정렬</option>
							<option>최신순</option>
							<option>3</option>
						</select>
				</div>
			</div>
			 <c:forEach var="article" items="${alist}" varStatus="i">
			 <input type="hidden" id="">
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
		                               	 	<span class="glyphicon glyphicon-remove pull-right" aria-hidden="true" value=""></span>
		                                </c:if>
		                        	</div>
		                       </div>
		                   </div>
		                </div><!-- End Listing-->
						<c:if test="${i.index%2 == 1}">
		                 </div>
		                 </c:if>
				 </c:forEach>
               </div><!-- End Listing-->
          </div><!-- End Col -->
</body>
</html>