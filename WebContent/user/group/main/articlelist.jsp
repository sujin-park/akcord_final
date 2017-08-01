<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/common/template/head_include.jsp"%>
<link rel="stylesheet" href="/akcord_project/user/group/css/list.css">
<%@include file="/common/template/nav.jsp"%>
<script type="text/javascript">
	$(document).ready(function(){
		$('#listBtn_G').click(function(){
			$(location).attr('href','${root}/group/list.akcord?pg=1&key=word=');
		});
	});
</script>
    <div class="container-fluid">
        <div class="container container-pad" id="property-listings">
            
            <div class="row">
              <div class="col-sm-12  style="padding-bottom:10px;">
                <h1>GROUP HOMEWORK</h1>
                <p>2017/07/19 ~ 2017/07/26</p>
              </div>
            </div>
            <div class="row"  style="padding-bottom:10px;">
				<div class="col-sm-10">
					<button type="button" class="btn btn-md btn-danger" id="listBtn_G">
					<span class="glyphicon glyphicon-arrow-left" aria-hidden="true"></span>
					</button>
				</div>
	            <div class="col-sm-2">
						<select class="form-control">
							<option>글정렬</option>
							<option></option>
							<option>3</option>
						</select>
				</div>
			</div>              
			<%
			
			for (int i=0; i<4; i++) {
				
			%>
            <div class="row">
                <div class="col-sm-6"> 
                    <div class="brdr bgc-fff pad-10 box-shad btm-mrg-20 property-listing">
                        <div class="media">
                            <div class="media-body fnt-smaller">
                                <a href="#" target="_parent"></a>
                                <h4 class="media-heading">
                                  <a href="#" target="_parent">JAVA 공부하기<small class="pull-right">2017.07.20</small></a></h4>
								<span class="list-inline mrg-0 btm-mrg-10 clr-535353">박수진</span>
                                <p class="hidden-xs">이번에는 java로 간단한 이미지속 방해 요소를 지워보는 방법을 알아보고자... 
                                	그럼 이러한 특징을 java에서 일어내려면 어떻게 하는 것이 좋을까요? 바로 타겟...</p>
                                <span class="glyphicon glyphicon-remove pull-right" aria-hidden="true"></span>
                        	</div>
                       </div>
                   </div>
                </div><!-- End Listing-->
 				<div class="col-sm-6">  
                    <!-- Begin Listing: 1220-32 N HOWARD ST-->
                    <div class="brdr bgc-fff pad-10 box-shad btm-mrg-20 property-listing">
                        <div class="media">
                            <a class="pull-left" href="#" target="_parent">
                            <div class="clearfix visible-sm"></div>

                            <div class="media-body fnt-smaller">
                                <a href="#" target="_parent"></a>

                                <h4 class="media-heading">
                                  <a href="#" target="_parent">JAVA 공부하기<small class="pull-right">2017.07.20</small></a></h4>
								<span class="list-inline mrg-0 btm-mrg-10 clr-535353">황혜정</span>
                                <p class="hidden-xs">이번에는 java로 간단한 이미지속 방해 요소를 지워보는 방법을 알아보고자... 
                                	그럼 이러한 특징을 java에서 일어내려면 어떻게 하는 것이 좋을까요? 바로 타겟...</p>
                                 <span class="glyphicon glyphicon-remove pull-right" aria-hidden="true"></span>
                            </div>
                        </div>
                       </div>
                     </div>
                 </div>
               <%
               }
               
               %>
               </div><!-- End Listing-->
          </div><!-- End Col -->
</body>
</html>