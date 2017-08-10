<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<script>
var output = "";
var nr = 0;
var name = "";
	$(document).ready(function() {
	    
	    
		$.ajax({
			type : 'GET',
			dataType : 'json',
			url : '${root}/alarm/alarm.akcord',
			//data : {'data', data},

			success : function(data) {
				//getHidden(data);

				setVal(data);
				listCall(data)
			}

		});

	});

	function setVal(data) {
		nr = data.nr;
		name = data.name;

		$('.badge').text(nr);
		$('#username').text(name);
	}
	
	function listCall(data) {
		var resultView = $('#collapse-alarm');
		// 콜랩스 디브 시작부분
		output += '<ul class="list-group">';
		output += '<li class="list-group-item">';
		output += '<div class="list-heading1">';
		output += '<h4 class="list-title">';
		output += '<a href="#">&nbsp;내용</a>';
		output += '</h4></div>';
		
		for (var i = 0; i < data.list0.length; i++) {
			if(data.list0[i].key == 1){
				output += '<div class="list-heading1">';
				output += '<h4 class="list-title">';
				output += '<a href="#">&nbsp;';
				output += '그룹에 초대되었습니다!';
				output += '</a></h4></div>';
			} else if(data.list0[i].key == 2){
				output += '<div class="list-heading1">';
				output += '<h4 class="list-title">';
				output += '<a href="#">&nbsp;';
				output += '그룹에 가입되었습니다!';
				output += '</a></h4></div>';
			} else if(data.list0[i].key == 3){
				output += '<div class="list-heading1">';
				output += '<h4 class="list-title">';
				output += '<a href="#">&nbsp;';
				output += '지식인에 답변이 달렸습니다!';
				output += '</a></h4></div>';
			} else if(data.list0[i].key == 4){
				output += '<div class="list-heading1">';
				output += '<h4 class="list-title">';
				output += '<a href="#">&nbsp;';
				output += '지식인에 덧글이 달렸습니다!';
				output += '</a></h4></div>';
			} else if(data.list0[i].key == 5){
				output += '<div class="list-heading1">';
				output += '<h4 class="list-title">';
				output += '<a href="#">&nbsp;';
				output += '지식인에 좋아요가 표시가 되었습니다!';
				output += '</a></h4></div>';
			} else if(data.list0[i].key == 6){
				output += '<div class="list-heading1">';
				output += '<h4 class="list-title">';
				output += '<a href="#">&nbsp;';
				output += '지식인에 싫어요 표시가 생겼습니다ㅠ';
				output += '</a></h4></div>';
			} else if(data.list0[i].key == 7){
				output += '<div class="list-heading1">';
				output += '<h4 class="list-title">';
				output += '<a href="#">&nbsp;';
				output += '공지사항이 등록되었습니다!';
				output += '</a></h4></div>';
			} else {
				output += '<div class="list-heading1">';
				output += '<h4 class="list-title">';
				output += '<a href="#">&nbsp;';
				output += '서버에 오류가 발생했습니다.';
				output += '</a></h4></div>';
			}
		}
		
		output += '</li></ul>';
		resultView.empty();
		resultView.append(output);
	}

$(function(){
	$('#toggleSidebar').on('click', function(){
		$('#sidebar').toggleClass('on');
	})
})
</script>

<body>
<div class="headline">
    
		<!-- collapse -->
		<div class="panel-group" id="sidebar">

 			<div class="panel-heading" style="padding-left: 30%;">
			</div>
			<div id="collapse-1" class="panel-collapse collapse in">
				<div class="input-group">
					<input type="text" class="form-control" placeholder="단어를 입력해주세요">
					<span class="input-group-btn">
						<button class="btn btn-danger" type="button">SEARCH</button>
					</span>
				</div>
				<ul class="list-group">
               <li class="list-group-item">
               	  <div class="list-heading">
                     <h4 class="list-title">
                     <c:if test="${user.type !=0 }">
                        <a href="${root }/notice/userNoticelist.akcord?pg=1&key=&word=&order="><i class="fa fa-bullhorn"></i>&nbsp;공지사항</a>
                      </c:if>
                      <c:if test="${user.type == 0 }">
                        <a href="${root }/notice/mvnoticelist.akcord?pg=1&key=&word=&order="><i class="fa fa-bullhorn"></i>&nbsp;공지사항</a>
                      </c:if>
                     </h4>
                  </div> 
                  <div class="list-heading1">
                     <h4 class="list-title" style="padding-top:20px;">
                        <a href="${root}/myroom/myroomlist.akcord?ch=1&pg=1&key=&word=&order="><i class="fa fa-book fa-fw"></i>&nbsp;MY ROOM</a>
                     </h4>
                  </div>
                  <div class="list-heading">
                     <h4 class="list-title">
                        <a href="#collapse-2" a data-toggle="collapse"><i class="fa fa-comments"></i>&nbsp;GROUP ROOM</a>
                     </h4>
                  </div> <!-- more menu for ONE -->
                  <div id="collapse-2" class="panel-collapse collapse">
                     <ul>
                        <li><a href="${root}/group/list.akcord?pg=1&key=&word=&order=">전체 그룹방</a></li>
                        <li><a href="#collapse-4" a data-toggle="collapse"> 내 그룹방</a></li>
                     </ul>
                  </div>
                   <div id="collapse-4" class="panel-collapse collapse">
                     <ul>
                     	<c:forEach var="g_list" items="${group_list}">
	                        <li><a href="${root}/groupmain/main.akcord?groupId=${g_list.groupId}"> ${g_list.majorName}  : ${g_list.groupName}</a></li>
	                     </c:forEach>
                     </ul>
                  	</div>
                  <div class="list-heading1">
                     <h4 class="list-title" style="padding-top:20px;">
                        <a href="${root}/in/list.akcord?major_id=${user.major_id}"><i class="fa fa-question-circle-o"></i>&nbsp;RECORDER</a>
                     </h4>
                  </div>
               	   <div class="list-heading">
                     <h4 class="list-title">
                        <a href="${root}/cafe/studycafe.akcord?pg=1&key=&word=&order="><i class="fa fa-coffee"></i>&nbsp;STUDY CAFE</a>
                     </h4>
                  </div>
                  <div class="list-heading1">
                     <h4 class="list-title" style="padding-top:20px;"> 
                        <a href=""><i class="fa fa-id-badge"></i>&nbsp; MY PAGE</a>
                     </h4>
                  </div> 
                  <div class="list-heading">
                     <h4 class="list-title">
                        <a href="#collapse-3" a data-toggle="collapse"><i class="fa fa-cog fa-fw"></i>&nbsp;관리</a>
                     </h4>
                  </div>
                  <div id="collapse-3" class="panel-collapse collapse">
                     <ul>
                        <li><a href="${root }/usermanager/mvmemberlist.akcord?pg=1&key=&word=&order=">회원관리</a></li>
                        <li><a href="${root }/poll/list.akcord?pg=1&key=&word=&order=">온라인 투표 관리</a></li>
                     </ul>
                  </div> 
               </li>
            </ul>
         </div>
      </div>
		<!-- //sidebar -->


		<!-- HEAD -->
		<div class="container-head">
			<div class="container">
				<%-- <a href="#;" id="toggleSidebar"><img alt="" src="${root}/doc/img/icon.png" height="35" width="35"></a> --%>
				<a href="#" id="toggleSidebar" style="text-decoration:none"><i class="fa fa-gear fa-2x" style="color:black;"></i></a>
				<a href="${root}/index.jsp" class="logo" >Akashic Records</a>
				<div class="c_03 c pull-right">
					<div class="dropdown">
						<a href="#"  class="dropdown-toggle" data-toggle="dropdown">
							<span class="fa fa-bell fa-2x" style="color: #d34e4c;"></span>
							<span class="badge"></span>
						</a>
					    <ul class="dropdown-menu dropdown" style="right:0; left:unset;">
					      <li><a href="#">HTML</a></li>
					      <li><a href="#">CSS</a></li>
					      <li><a href="#">JavaScript</a></li>
					      <li class="divider"></li>
					      <li><a href="#">About Us</a></li>
					    </ul>
				  	</div>
						
						
				</div>

				</div>
				<!-- 알람창 -->
				
			</div>
		</div>
