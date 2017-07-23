<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/common/template/head_include.jsp"%>
<link rel="stylesheet" href="/akcord/css/list.css">
<%@ include file="/common/template/nav.jsp" %>
<style>
	.btn {
		background-color: #346969;
		color: white;
	}
</style>
   <div class="container">
     <div class="container container-pad" id="property-listings">
       <div class="row">
         <div class="col-sm-12  style="padding-bottom:50px;">
           <h1>GROUP HOMEWORK</h1>
                <p>2017/07/19 ~ 2017/07/26</p>
         </div>
       </div>
		<div class="row">
          <div class="row">
          	<div class="col-sm-1"></div>
      		<div class="col-sm-4">
        		<div class="form-group">
                 <h2>제목</h2>
        		</div>
        	</div>
          	<div class="col-sm-7">
        		<div class="form-group">
                  <input type="email" class="form-control" name="email" autocomplete="off" id="email" placeholder="E-mail">
        		</div>
        	</div>
         </div>
         <div class="row">
        	<div class="col-sm-12">
        		<div class="form-group">
                  <textarea class="form-control textarea" rows="3" name="Message" id="Message" placeholder="Message"></textarea>
        		</div>
        	</div>
          </div>
          <div class="row">
          	<div class="col-sm-12">
        		<button type="submit" class="btn main-btn pull-right">Send a message</button>
        	</div>
		</div>
	</div>
  </div>
</div>
</body>
</html>