<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="root" value="${pageContext.request.contextPath}" />
<%@include file="/common/template/head_include.jsp" %>
<%@ include file="/common/template/nav.jsp" %>	
<script>

var count = 1;

$("#zipsearch").click(function(){
    $("#zipsearchModal").modal();
});

$(document).ready(function (){
	
	$("#id").click(function(){
	   alert("아이디는 변경 할 수 없습니다.");
	});

/*    $('#id').keyup(function(){
      var output = '4자이상 12자 이하로 입력해주세요.'
      var resultView = $('#result');
      var sid = $(this).val();//document.getElementById("id").value;
//      alert(sid.length);
      if(sid.length > 3 && sid.length < 13){
         $.ajax({
            type : 'GET',
            dataType : 'json',
            url : '${root}/user/idCheck.akcord',
            data : {'sid' : sid},
            success : function(data){
               if(data.count == 0){
                  output = '<font color="blue">' + data.sid + '</font>는 사용가능한 아이디입니다.';
                  count = 0;
               }else{
                  output = '<font color="red">' + data.sid + '</font>는 사용불가능한 아이디입니다.';
               }
               resultView.empty();
               resultView.append(output);
               }
   });
   }
   }); */
   
   $('#name').keyup(function(){
      if($('#name').val() == ""){
         $('#nameView').empty();
         $('#nameView').append('<font color="red">이름을 꼭 입력해주세요!</font>');
      } else {
         $('#nameView').empty();
      }
   });
   
   $('#id').keyup(function(){         
    if($('#id').val() == ""){
         $('#nameView').empty();
         $('#idView').empty();
         $('#idView').append('<font color="red">아이디를 꼭 입력해주세요!</font>');
       }
    });
   
   $('#password').keyup(function(){
      if($('#password').val() == "" ){
         $('#idView').empty();
         $('#pwView').empty();
         $('#pwView').append('<font color="red">비밀번호를 꼭 입력해주세요!</font>');
      }else if($('#password').val().length > 4 && $('#password').val().length < 19 ){
         $('#idView').empty();
         $('#pwView').empty();
         $('#pwView').append('<font color="blue">비밀번호를 사용하실 수 있습니다!</font>');
      } else    if($('#password').val() == "" || $('#password').val().length <= 4 || $('#password').val().length >= 19 ){
         $('#idView').empty();
         $('#pwView').empty();
         $('#pwView').append('<font color="red">비밀번호를 5자리이상 18자리 이하로 입력해주세요!</font>');
      } 
   });
   
   $('#pwcheck').keyup(function(){
      if($('#pwcheck').val() == ""){
         $('#pwView').empty();
         $('#pwcheckView').empty();
         $('#pwcheckView').append('<font color="red">비밀번호확인을 꼭 입력해주세요!</font>');
      } else    if($('#password').val() == $('#pwcheck').val()){      
         $('#pwView').empty();
         $('#pwcheckView').empty();
         $('#pwcheckView').append('<font color="blue">비밀번호를 사용하실 수 있습니다!</font>');
      
      } else    if($('#password').val() != $('#pwcheck').val()){      
         $('#pwView').empty();
         $('#pwcheckView').empty();
         $('#pwcheckView').append('<font color="red">비밀번호가 일치하지 않습니다!</font>');
      
      }
   });
      
   $('#phoneNum').keyup(function(){
      if($('#tel1').val() == "" || $('#tel2').val() == "" || $('#tel3').val() == ""){
         $('#pwcheckView').empty();
         $('#telView').empty();
         $('#telView').append('<font color="red">전화번호를 꼭 입력해주세요!</font>');
      } else{
         $('#telView').empty();
      }
   });
   
   
   $('#mymodify').click(function(){
      $('#joinForm').attr('method', 'post').attr('action', '${root}/mypage/mypagemodify.akcord').submit();
   });
   
});

function appendYear(){

   var date = new Date();
   var year = date.getFullYear();
   var selectValue = document.getElementById("birth1");
   var optionIndex = 0;

   for(var i=year-100;i<=year;i++){

         selectValue.add(new Option(i+"년",i),optionIndex++);                        

   }
}

function appendDay(){

   var selectValue = document.getElementById("birth3");
   var optionIndex = 0;

   for(var i=1;i<=31;i++){

         selectValue.add(new Option(i+"일",i),optionIndex++);
   }
} 



</script>
<!-- 회원가입 Modal-->
 	<div class="container akcord">
		<div class="col-sm-12">
				<div class="page-header titleinfo">
					    <h2 id="container"><i class="fa fa-comments"></i>  &nbsp;<b>GROUP LIST</b></h2><h5>그룹원들과 소통하며 일정을 효율적으로 관리할 수 있습니다.</h5>
				</div>
      <div>
      <!-- Modal content-->
         <div >
            <form class="form-horizontal" id="joinForm" name="joinForm" method="post" action="">
               <fieldset>
                  <div class="form-group">
                     <label class="col-sm-3 control-label">이름</label>
                     <div class="col-sm-4">
                        <input type="text" id="name" name="name" value="${user.name}" class="form-control" >
                        <div id="nameView" class="col-sm-11" style="text-align: center;"></div>
                     </div>
                                          
                     <label class="col-sm-2 control-label">성별</label>
                  <div class="radio-inline col-sm-1 control-label" >
                      <label><input type="radio" id="gender" name="gender" value="0" checked="checked">남</label>
                   </div>
                   <div class="radio-inline col-sm-1 control-label" >
                       <label><input type="radio" id="gender" name="gender" value="1">여</label>
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
                  
                  <div class="form-group">
                     <label class="col-sm-3 control-label">비밀번호</label>
                     <div class="col-sm-8">                  
                        <input type="password" id="password" name="password" value="${user.password}" class="form-control">
                     </div>
                     <div id="pwView" class="col-sm-11" style="text-align: center;"></div>
                  </div>
                  
                  <div class="form-group">
                     <label class="col-sm-3 control-label">비밀번호확인</label>
                     <div class="col-sm-8">
                        <input type="password" id="pwcheck" name="pwcheck" value="${user.password}" class="form-control" >
                     </div>
                     <div id="pwcheckView" class="col-sm-11" style="text-align: center;"></div>
                  </div>
                     
                  <div class="form-group" id="phoneNum">
                     <label class="col-sm-3 control-label">휴대전화</label>
                     <div class="col-sm-2">
                        <input type="text" id="tel1" name="tel1" 
                           class="form-control" maxlength="3" value="" placeholder="${user.tel1}">                        
                     </div>
                     
                     <div class="col-sm-3">
                        <input type="text" id="tel2" name="tel2" class="form-control" maxlength="4" value="${user.tel2}">                        
                     </div>
                     
                     <div class="col-sm-3">
                        <input type="text" id="tel3" name="tel3" class="form-control" maxlength="4" value="${user.tel3}">                        
                     </div>
                     <div id="telView" class="col-sm-11" style="text-align: center;"></div>
                  </div>
                  
                  <div class="form-group">
                     <label class="col-sm-3 control-label">생년월일</label>
                     <div class="col-sm-3">
                        <select class="form-control" id="birth1" name="birth1" onclick="javascript:appendYear();">
                        </select>
                     </div>
                     <div class="col-sm-3">
                        <select class="form-control" id="birth2" name="birth2" >
                           <option value="1">01월</option>
                           <option value="2">02월</option>
                           <option value="3">03월</option>
                           <option value="4">04월</option>
                           <option value="5">05월</option>
                           <option value="6">06월</option>
                           <option value="7">07월</option>
                           <option value="8">08월</option>
                           <option value="9">09월</option>
                           <option value="10">10월</option>
                           <option value="11">11월</option>
                           <option value="12">12월</option>
                        </select>
                     </div>   
                     <div class="col-sm-3">
                        <select class="form-control" id="birth3" name="birth3" onclick="javascript:appendDay();">
                        
                        </select>
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
                        <input type="text" id="sample6_postcode" name="zipcode" placeholder="우편번호" readonly="readonly" class="form-control" value="${user.zipcode}">
                     </div>
                     <div class="col-sm-3">
                     <a href="#zipsearchModal" id="zipsearch" name="zipsearch" class="btn btn-danger" data-toggle="modal" aria-hidden="true" value="우편번호 찾기" onclick="sample6_execDaumPostcode()">우편번호검색</a>
                     </div>
                  </div>
                  
                  <div class="form-group">
                     <label class="col-sm-3 control-label">주소</label>
                     <div class="col-sm-8">
                        <input type="text" id="sample6_address" name="addr1" placeholder="주소" class="form-control" value="${user.addr1}">
                     </div>
                  </div>
                  
                  <div class="form-group">
                     <label class="col-sm-3 control-label"></label>
                     <div class="col-sm-8">
                        <input type="text" id="sample6_address2" name="addr2" class="form-control"  placeholder="상세주소" value="${user.addr2}">
                     </div>
                  </div>
         <div>
            <button id="mymodify" type="button" class="btn btn-danger">정보 수정</button>
            <a href="javascript:history.back()"><button id="closeBtn" type="button" class="btn btn-danger">
            		수정 취소</button></a>
         </div>
                  
                  
            </fieldset>
            </form>
                  </div>
            
         </div>
      </div>
   </div>
