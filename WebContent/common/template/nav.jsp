 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<div class="headline">
    
    <!-- nav -->

   <!-- collapse -->
   <div class="panel-group">

         <div class="panel-heading">
            <h4 class="panel-title">
               <a data-toggle="collapse" href="#collapse-1">
               <img alt=""   src="${root}/doc/img/icon.png" height="35" width="35">
              	
               </a>
            </h4>
         </div>
         
         <div id="collapse-1" class="panel-collapse collapse">
				 <div class="input-group">
				      <input type="text" class="form-control" placeholder="단어를 입력해주세요">
				      <span class="input-group-btn">
				        <button class="btn btn-danger" type="button">
				        	SEARCH
	                  	</button>
				      </span>
			    </div>
            <ul class="list-group">
               <li class="list-group-item">
               	  <div class="list-heading">
                     <h4 class="list-title">
                        <a href="${root }/notice/mvnoticelist.akcord">공지사항</a>
                     </h4>
                  </div> 
                  <div class="list-heading1">
                     <h4 class="list-title" style="padding-top:20px;">
                        <a href="">MY ROOM</a>
                     </h4>
                  </div>
                  <div class="list-heading">
                     <h4 class="list-title">
                        <a href="#collapse-2" a data-toggle="collapse">GROUP ROOM</a>
                     </h4>
                  </div> <!-- more menu for ONE -->
                  <div id="collapse-2" class="panel-collapse collapse">
                     <ul>
                        <li><a href="#">전체 그룹방</a></li>
                        <li><a href="#">내 그룹방</a></li>
                     </ul>
                  </div>
                  <div class="list-heading1">
                     <h4 class="list-title" style="padding-top:20px;">
                        <a href="">지식인</a>
                     </h4>
                  </div>
               	   <div class="list-heading">
                     <h4 class="list-title">
                        <a href="">STUDY CAFE</a>
                     </h4>
                  </div>
                  <div class="list-heading1">
                     <h4 class="list-title" style="padding-top:20px;"> 
                        <a href="">MY PAGE</a>
                     </h4>
                  </div> 
                  <div class="list-heading">
                     <h4 class="list-title">
                        <a href="#collapse-3" a data-toggle="collapse">관리</a>
                     </h4>
                  </div>
                  <div id="collapse-3" class="panel-collapse collapse">
                     <ul>
                        <li><a href="${root }/usermanager/mvmemberlist.akcord">회원관리</a></li>
                        <li><a href="#">통계</a></li>
                     </ul>
                  </div> 
               </li>
            </ul>
         </div>
      </div>
    
<!-- HEAD -->
	<div class="container-head">
	
	           <div class="c_01 c">
	              <h3 id="logo"><a href="">AKCORD</a></h3>
	           </div>
	           
	           
	            <div class="c_03 c pull-right">
	               <a href=""><img alt="" src="${root}/doc/img/bell-icon.png" width="20" height="20"><span class="badge">5</span></a>
	           </div>
	           <div class="login_info pull-right">
	              	박수진님 환영합니다
	           </div>
	           
	</div>
</div>