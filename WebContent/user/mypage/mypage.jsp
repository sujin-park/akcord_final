<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<%@include file="/common/template/head_include.jsp" %>
<%@ include file="/common/template/nav.jsp" %>   
<script>
$(document).ready(function() {
$(document).on('click', '#mymodify', function() {
      var id = document.getElementById("id").value;
      $(location).attr('href','${root}/mypage/mypagemodify.akcord?id='+id);
   });
$(document).on('click', '#myArticleBtn', function() {

   $(location).attr('href','${root}/mypage//myarticle.akcord');
   });
});

</script>
<!-- 회원가입 Modal-->
 	<div class="container akcord">
		<div class="col-sm-12">
				<div class="page-header titleinfo">
					    <h2 id="container"><i class="fa fa-id-badge"></i>  &nbsp;<b>회원정보 수정</b></h2><h5>개인 회원정보를 수정할 수 있습니다.</h5>
				</div>
      <div>
         <div style="margin-right:80px;">
            <form class="form-horizontal" id="joinForm" name="joinForm" method="post" action="">
            <input type="hidden" name="name" value="${user.name}">
            <input type="hidden" name="id" value="${user.id}">
            <input type="hidden" name="pg" value="1">
            <input type="hidden" name="key" value="">
            <input type="hidden" name="word" value="">
            <input type="hidden" name="" value="">

               <fieldset>
                  <div class="form-group">
                     <label class="col-sm-3 control-label">이름</label>
                     <div class="col-sm-4">
                        <input type="text" id="name" name="name" value="${user.name}" class="form-control" readonly="readonly">
                        <div id="nameView" class="col-sm-11" style="text-align: center;"></div>
                     </div>
                                          
                     <label class="col-sm-2 control-label">성별</label>
                  <div>
                  <c:choose>
                     <c:when test="${user.gender eq 0}">
                        <input type="radio" id="gender" name="gender" value="" checked="checked" readonly="readonly">남성
                     </c:when>
                     <c:when test="${user.gender eq 1}">
                        <input type="radio" id="gender" name="gender" value="" checked="checked" readonly="readonly">여성
                     </c:when>
                     
                  </c:choose>

                  </div>
                               
                  </div>


                  <div class="form-group">
                     <label class="col-sm-3 control-label">아이디</label>
                     <div class="col-sm-8">
                        <input type="text" id="id" name="id" class="form-control" value="${user.id}" readonly="readonly">
                     </div>
                     <div id="result" class="col-sm-11" style="text-align: center;"></div>
                     <div id="idView" class="col-sm-11" style="text-align: center;"></div>
                  </div>
                  
                    <!-- 
                  <div class="form-group">
                     <label class="col-sm-3 control-label">비밀번호</label>
                     <div class="col-sm-8">                  
                        <input type="password" id="password" name="password" value="" class="form-control">
                     </div>
                     <div id="pwView" class="col-sm-11" style="text-align: center;"></div>
                  </div>
                  
                 
                  <div class="form-group">
                     <label class="col-sm-3 control-label">비밀번호확인</label>
                     <div class="col-sm-8">
                        <input type="password" id="pwcheck" name="pwcheck" value="" class="form-control" >
                     </div>
                     <div id="pwcheckView" class="col-sm-11" style="text-align: center;"></div>
                  </div>
                  -->
                  
                  <div class="form-group" id="phoneNum">
                     <label class="col-sm-3 control-label">휴대전화</label>
                     <div class="col-sm-2">
                        <input type="text" id="tel1" name="tel1" readonly="readonly"
                           class="form-control" maxlength="3" value="${user.tel1}" placeholder="010">                        
                     </div>
                     
                     <div class="col-sm-3">
                        <input type="text" id="tel2" name="tel2" maxlength="4" value="${user.tel2}" readonly="readonly"
                           class="form-control">                        
                     </div>
                     
                     <div class="col-sm-3">
                        <input type="text" id="tel3" name="tel3" maxlength="4" value="${user.tel3}" readonly="readonly"
                           class="form-control">                        
                     </div>
                     <div id="telView" class="col-sm-11" style="text-align: center;"></div>
                  </div>
                  
                  <div class="form-group">
                     <label class="col-sm-3 control-label">생년월일</label>
                     <div class="col-sm-3">
                        <input type="text" id="birth1" name="birth1" maxlength="4" value="${user.birth1}" 
                              class="form-control" maxlength="4" readonly="readonly">
                     </div>
                     <div class="col-sm-2">
                      <input type="text" id="birth2" name="birth2" maxlength="4" value="${user.birth2}" 
                            class="form-control" maxlength="3" readonly="readonly">
                     </div>   
                     <div class="col-sm-3">
                        <input type="text" id="birth3" name="birth3" maxlength="4" value="${user.birth3}" 
                              class="form-control" maxlength="3" readonly="readonly">
                     </div>                  
                  </div>
                  
                  <div class="form-group">
                     <label class="col-sm-3 control-label">전공</label>
                     <div class="col-sm-8">
                        <select class="form-control" id="major_id" name="major_id" >
                           <option value="0">인문계열</option>
                           <option value="1">사회계열</option>
                           <option value="2">교육계열</option>
                           <option value="3">공학계열</option>
                           <option value="4">자연계열</option>
                           <option value="5">의약계열</option>
                           <option value="6">예체능계열</option>
                        </select>
                     </div>                  
                  </div>
                  
                  
                  <div class="form-group">
                     <label class="col-sm-3 control-label">우편번호</label>
                     <div class="col-sm-5">
                        <input type="text" id="sample6_postcode" name="zipcode" value="${user.zipcode}"
                                 placeholder="우편번호" readonly="readonly" class="form-control">
                     </div>
                  </div>
                  
                  <div class="form-group">
                     <label class="col-sm-3 control-label">주소</label>
                     <div class="col-sm-8">
                        <input type="text" id="sample6_address" name="addr1" placeholder="주소" value="${user.addr1}"
                              class="form-control" readonly="readonly">
                     </div>
                  </div>
                  
                  <div class="form-group">
                     <label class="col-sm-3 control-label"></label>
                     <div class="col-sm-8">
                        <input type="text" id="sample6_address2" name="addr2" class="form-control"  value="${user.addr2}"
                              placeholder="상세주소" readonly="readonly">
                     </div>
                  </div>
         <div align="right" style="margin-right:50px;">
            <button id="mymodify" type="button" class="btn btn-danger">정보 수정</button>
         </div>
                  
                  
            </fieldset>
            </form>
                  </div>
            
         </div>
      </div>
   </div>