<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/common/template/head_include.jsp"%>
<link href='/akcord_project/user/group/css/fullcalendar.css' rel='stylesheet' />
<link href='/akcord_project/user/group/css/fullcalendar.print.css' rel='stylesheet' media='print' />
<script src='/akcord_project/js/lib/moment.min.js' charset="utf-8"></script>
<script src='/akcord_project/js/lib/jquery-ui.min.js' charset="utf-8"></script>
<script src='/akcord_project/js/lib/fullcalendar.js' charset="utf-8"></script>
<%@ include file="/common/public.jsp" %>
<script>
var eventData;
var eventallData;
		$.ajax({
			type : 'GET',
			dataType : 'json',
			url : '${root}/groupmain/calendar.akcord',
			data : {'groupId' : '${gInfo.groupId}'},
			success : function(data) {
				eventallData = data;
			}
		});
		
		$('#calendar').fullCalendar({
		    events :  eventallData
		});
	$(document).ready(function() {
		
	      var eventData;
	      var HOstart;
	      var HOend;
	      
		$('#calendar').fullCalendar({
		
			header: {
				left: 'prev,next today',
				center: 'title',
				right: 'month,agendaWeek,agendaDay'
			},
			defaultDate:  new Date().getTime(),
			
			navLinks: true, // can click day/week names to navigate views
			selectable: true,
			selectHelper: true,
			
			select: function(start, end) {
				HOstart = start;
				HOend = end;
				var sday;
				var eday;
				var d = new Date();
				if (moment(start).format('dddd') == 'Monday') {
					sday = '월';
				} else if (moment(start).format('dddd') == 'Tuesday') {
					sday = '화';
				} else if (moment(start).format('dddd') == 'Wednesday') {
					sday = '수';
				} else if (moment(start).format('dddd') == 'Thursday') {
					sday = '목';
				} else if (moment(start).format('dddd') == 'Friday') {
					sday = '금';
				} else if (moment(start).format('dddd') == 'Saturday') {
					sday = '토';
				} else {
					sday = '일';
				}
				
				if (moment(end).format('dddd') == 'Monday') {
					eday = '월';
				} else if (moment(end).format('dddd') == 'Tuesday') {
					eday = '화';
				} else if (moment(end).format('dddd') == 'Wednesday') {
					eday = '수';
				} else if (moment(end).format('dddd') == 'Thursday') {
					eday = '목';
				} else if (moment(end).format('dddd') == 'Friday') {
					eday = '금';
				} else if (moment(end).format('dddd') == 'Saturday') {
					eday = '토';
				} else {
					eday = '일';
				}
				var startTime = moment(start).format('YYYY/MM/DD ' + sday + ' hh:mm');
				var endTime = moment(end).format('YYYY/MM/DD ' + eday +' hh:mm');
				$('#scheduleInsert').modal({'show' : true});
				
				$('#scheduleInsert #startDate').val(startTime);
				$('#scheduleInsert #endDate').val(endTime);
			},
	/* 		
			editable: true,
			eventLimit: true, // allow "more" link when too many events

		    eventClick : function(event, element) {
	            if (event.title) {
	               $("#scheduleModal").modal({"show" : true});
	               $("#scheduleModal #modalTitle").text(event.title);
	               $("#scheduleModal #contenttext").text(event.content);
	               $("#scheduleModal #startDate").text(event.start);
	               $("#scheduleModal #endDate").text(event.end);
	               $("#showForm #title").val(event.title);
	               $("#showForm #content").val(event.content);
	               $("#showForm #startDate").val(event.start);
	               $("#showForm #endDate").val(event.end);
				
					}
		    }, */
			events: [
				 /* <c:forEach var="schedule" items='${slist}'>
					{
     	                 start : '${schedule.startDate}',
		                 end : '${schedule.endDate}',
   		                 title : '${schedule.scheduleName}',
		                 content : '${schedule.detail}',
		                 color : "#d34e4c"
		                 },
				</c:forEach>  */
				
			]
		    });
		
		
		$('#scheduleBtn').on('click', function(){
		     var eventData1 = {
		             start : HOstart,
		             end : HOend,
		             title : $("#scheduleInsert #scheduleName").val(),
		             content : $("#scheduleInsert #detail").val(),
		          
		          };
		          $('#calendar').fullCalendar('renderEvent', eventData1, true);
		          $("#scheduleInsert").modal('hide');
		          $('form[name=sRegisterForm]').attr('action','${root}/groupmain/schedule.akcord').attr('method', 'post').submit();
		          $("#scheduleInsert #scheduleName").val("");
		          $("#scheduleInsert #detail").val("");
		          $('#calendar').fullCalendar('unselect');
			
		});
		
		$('#deletegroup').click(function(){
			$('#groupD').modal();
		});
	
		$('#contentlist').on('click', function() {
			$(location).attr('href', '${root}/groupmain/list.akcord?groupId=${groupId}');
		});
		
		$('#Gmemberlist').on('click', function() {
			$(location).attr('href', '${root}/groupmain/group.akcord?groupId=${gInfo.groupId}&pg=1&key=&word=&order=');
		});
		
		
	});
	

</script>
<style>

	body {
		padding: 0;
		font-family: "Lucida Grande",Helvetica,Arial,Verdana,sans-serif;
		font-size: 14px;
	}
	
	.container {
		padding-top:60px;
	}
	#calendar {
		margin: 0 auto;
		display: inline;
		width: 60%;
		float:left;
	}
	.form-control{ box-shadow:none; border-color:#eee;}
	.form-control:focus{ box-shadow:none; border-color:#d34e4c;}
</style>
<%@ include file="/common/template/nav.jsp" %>
<div class="col-sm-10 col-sm-push-1">
	<div class="container">
		<div class="row">
			<div class="row"></div>
			<div style="padding-left:10px; border: 1px solid #ddd; margin-right:10%; margin-bottom:10px;">
				<h2>${gInfo.groupName}</h2><h4>${gInfo.majorName}</h4>
				<h4>리더 : ${gInfo.name}</h4>
			</div>
			<div class="col-sm-6" style="border:5px;">
				<button type="button" class="btn btn-sm btn-danger" id="contentlist">그룹방 글 목록</button>
			<c:if test="${gInfo.leaderId == user.user_id}">
				<button type="button" class="btn btn-sm btn-danger" id="Gmemberlist">그룹원 관리</button>
				<button type="button" class="btn btn-sm btn-default" id="deletegroup">그룹 삭제</button>
			</c:if>
			<c:if test="${gInfo.leaderId != user.user_id}">
				<button type="button" class="btn btn-sm btn-default" id="deletegroup">그룹 탈퇴</button>
			</c:if>
			</div>
			
		</div>
		<div class="row" style="margin:30px;">
			<div id='calendar' class="col-sm-8"></div>
			<div class="col-sm-4">채팅부분</div>
		</div>
	</div>
</div>
<%@ include file="/user/group/main/schedule.jsp" %>
<%@ include file="/user/group/delete.jsp" %>
</body>
</html>