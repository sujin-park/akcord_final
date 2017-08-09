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
var obj;
	$.ajax({
			type : 'GET',
			dataType : 'json',
			url : '${root}/groupmain/calendar.akcord',
			data : {'groupId' : '${gInfo.groupId}'},
			 success: function (data) {
				obj =  JSON.stringify(data.schedule);
				//alert(JSON.stringify(data.schedule2));
		}
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
	
			editable: true,
	        eventLimit : true,
		    eventClick : function(event, element) {
	            if (event.title) {
					var sday;
					var eday;
					var d = new Date();
					if (moment(event.start).format('dddd') == 'Monday') {
						sday = '월';
					} else if (moment(event.start).format('dddd') == 'Tuesday') {
						sday = '화';
					} else if (moment(event.start).format('dddd') == 'Wednesday') {
						sday = '수';
					} else if (moment(event.start).format('dddd') == 'Thursday') {
						sday = '목';
					} else if (moment(event.start).format('dddd') == 'Friday') {
						sday = '금';
					} else if (moment(event.start).format('dddd') == 'Saturday') {
						sday = '토';
					} else {
						sday = '일';
					}
					
					if (moment(event.end).format('dddd') == 'Monday') {
						eday = '월';
					} else if (moment(event.end).format('dddd') == 'Tuesday') {
						eday = '화';
					} else if (moment(event.end).format('dddd') == 'Wednesday') {
						eday = '수';
					} else if (moment(event.end).format('dddd') == 'Thursday') {
						eday = '목';
					} else if (moment(event.end).format('dddd') == 'Friday') {
						eday = '금';
					} else if (moment(event.end).format('dddd') == 'Saturday') {
						eday = '토';
					} else {
						eday = '일';
					}
					var startTime = moment(event.start).format('YYYY/MM/DD ' + sday + ' hh:mm');
					var endTime = moment(event.end).format('YYYY/MM/DD ' + eday +' hh:mm');
					
	               $("#scheduleModal").modal({"show" : true});
	               $('#sModifyBtn').val(event.scheduleId);
	               $('#sDeleteBtn').val(event.scheduleId);
	               //$('#deadspan').val(event.deadline);
	               $('#scheduleModal #deadspan').val(event.deadline);
	               $("#scheduleModal #modalTitle").text(event.title);
	               $("#scheduleModal #contenttext").text(event.content);
	               $("#scheduleModal #startDate").text(event.start);
	               $("#scheduleModal #endDate").text(event.end);
	               $("#scheduleModal #scheduleName").val(event.title);
	               $("#scheduleModal #detail").val(event.content);
	               $("#scheduleModal #startDate").val(startTime);
	               $("#scheduleModal #endDate").val(endTime);
	               $('#deadspan').empty();
	               var dead = $('#deadspan').val();
		       		var output = "";
		       		if (dead > 0) {
		       			output = "마감일 : " + dead + " 일 전";
		       		} else if (dead == 0 ){
		       			output = "당일 마감";
		       		} else {
		       			output = "일정 마감";
		       		}
		       		$('#deadspan').append(output);
	               
					}
		    }, 
			events: 	JSON.parse(obj)
				
	
				
	/* 			 [
				 <c:forEach var="schedule" items='${slist}'>
					{
     	                 start : '${schedule.startDate}',
		                 end : '${schedule.endDate}',
   		                 title : '${schedule.scheduleName}',
		                 content : '${schedule.detail}',
		                 },
		                 
		                 ]
				</c:forEach>  */
				
			
		    });
		
		
		$('#scheduleBtn').on('click', function(){
		     var eventData1 = {
		             start : HOstart,
		             end : HOend,
		             title : $("#scheduleInsert #scheduleName").val(),
		             content : $("#scheduleInsert #detail").val(),
		             color: "#d34e4c"
		          };
		     
		          //$('form[name=sRegisterForm]').attr('action','${root}/groupmain/schedule.akcord').attr('method', 'post').submit();
		          	$.ajax({
							type : 'POST',
							dataType : 'json',
							url : '${root}/groupmain/schedule.akcord',
							data : {'groupId' : '${gInfo.groupId}', 'startDate' : $("#scheduleInsert #startDate").val(),
										'endDate' : $("#scheduleInsert #endDate").val(), 'scheduleName' : $("#scheduleInsert #scheduleName").val(),
										'detail' : $("#scheduleInsert #detail").val()
							},
							 success: function (data) {
								obj =  JSON.stringify(data.schedule);
								//callback(obj);
						}
					});
		
		          $('#calendar').fullCalendar('renderEvent', eventData1, true);
		          $("#scheduleInsert").modal('hide');
		          $("#scheduleInsert #scheduleName").val("");
		          $("#scheduleInsert #detail").val("");
		          $('#calendar').fullCalendar('unselect');
			
		});
		
		$('#sModifyBtn').on('click', function(){
		     var eventData1 = {
		             start : HOstart,
		             end : HOend,
		             title : $("#scheduleModal #scheduleName").val(),
		             content : $("#scheduleModal #detail").val(),
		             color: "#d34e4c"
		          };
		     
		          	$.ajax({
							type : 'POST',
							dataType : 'json',
							url : '${root}/groupmain/modify.akcord',
							data : {'groupId' : '${gInfo.groupId}', 'startDate' : $("#scheduleModal #startDate").val(),
										'endDate' : $("#scheduleModal #endDate").val(), 'scheduleName' : $("#scheduleModal #scheduleName").val(),
										'detail' : $("#scheduleModal #detail").val(), 'scheduleId' : $("#sModifyBtn").val()
							},
							 success: function (data) {
								obj =  JSON.stringify(data.schedule);
								//callback(obj);
						}
					});
		          $("#scheduleModal").modal('hide');
		          $('#calendar').fullCalendar('renderEvent', eventData1, true);
		          $("#scheduleModal #scheduleName").val("");
		          $("#scheduleModal #detail").val("");
		          $('#calendar').fullCalendar('unselect');
	
		});
		
		$('#sDeleteBtn').on('click', function(){
		          	$.ajax({
							type : 'POST',
							dataType : 'json',
							url : '${root}/groupmain/delete.akcord',
							data : { 'scheduleId' : $("#sDeleteBtn").val(), 'groupId' : '${gInfo.groupId}'},
							 success: function (data) {
								obj =  JSON.stringify(data.schedule);
								callback(obj);
						}
					});
		          $("#scheduleModal").modal('hide');
		          //$('#calendar').fullCalendar('renderEvent', eventData1, true);
		          $("#scheduleModal #scheduleName").val("");
		          $("#scheduleModal #detail").val("");
		          $('#calendar').fullCalendar('unselect');
		});
		
		$('#deletegroup').click(function(){
			$('#groupD').modal();
		});
	
		$('#outgroup').click(function(){
			$('#groupO').modal();
		});
		
		$('#contentlist').on('click', function() {
			$(location).attr('href', '${root}/groupmain/list.akcord?groupId=${gInfo.groupId}&scheduleId=');
		});
		
		$('#Gmemberlist').on('click', function() {
			$(location).attr('href', '${root}/groupmain/group.akcord?groupId=${gInfo.groupId}&pg=1&key=&word=&order=');
		});
		
		$('#scheduleListBtn').on('click', function(){
			var scheduleId = $('#sModifyBtn').val();
			var startDate = $("#scheduleModal #startDate").val();
			var endDate = $("#scheduleModal #endDate").val();
			$(location).attr('href', '${root}/groupmain/list.akcord?groupId=${gInfo.groupId}&scheduleId='+scheduleId +'&startDate=' +startDate + '&endDate=' + endDate);
		});
		
		$('#groupDelete').on('click',function(){
			
			if(confirm("그룹방을 삭제하시겠습니까?")){
				$(location).attr('href','${root}/groupmain/out.akcord?groupId=${gInfo.groupId}');
			}
		});
		
		$('#outgroup').on('click', function(){
			
			if (confirm("그룹방을 탈퇴하시겠습니까?")) {
				$(location).attr('href', '${root}/groupmain/outgroup.akcord?groupId=${gInfo.groupId}')
			}
		});
		
		


	});
	

</script>
<style>

	body {
		padding: 0;
		font-family: "Lucida Grande",Helvetica,Arial,Verdana,sans-serif;
		font-size: 14px;
	}
	

	#calendar {
		margin: 0 auto;
		display: inline;
		width: 60%;
		float:left;
	}
	.groupinfo {
		padding-left:10px; 
		border: 1px solid #ddd; 
		margin-right:10%; 
		margin-bottom:10px; 
		height:100px;
		background-color:#eee;
	}
	
	.groupinfo>h3 {
		text-align:center;
	}
	
	.groupinfo>h4 {
		text-align:center;	
	}
	.form-control{ box-shadow:none; border-color:#eee;}
	.form-control:focus{ box-shadow:none; border-color:#d34e4c;}
</style>
<%@ include file="/common/template/nav.jsp" %>
<div class="col-sm-10 col-sm-push-1">
	<div class="container akcord">
		<div class="row" style="margin:30px;">
					<div class="row"></div>
						<div class="groupinfo">
							<h3>${gInfo.groupName}</h3>
							<h4>${gInfo.majorName}</h4>
							<h4>리더 : ${gInfo.name}</h4>
						</div>
					<div class="row">
						<div class="col-sm-6" style="border:5px; margin-bottom:20px;">
							<button type="button" class="btn btn-sm btn-danger" id="contentlist">그룹방 글 목록</button>
						<c:if test="${gInfo.leaderId == user.user_id}">
							<button type="button" class="btn btn-sm btn-danger" id="Gmemberlist">그룹원 관리</button>
							<button type="button" class="btn btn-sm btn-default" id="deletegroup">그룹 삭제</button>
						</c:if>
						<c:if test="${gInfo.leaderId != user.user_id}">
							<button type="button" class="btn btn-sm btn-default" id="outgroup">그룹 탈퇴</button>
						</c:if>
						</div>
					</div>

			<div id='calendar' class="col-sm-8">
			</div>
			<div class="col-sm-4">
				<div class="row">
					<div class="userlist" style="background-color:#eee; height:150px; width:90%;"></div>
					<%@ include file="/user/group/main/chatting.jsp" %>
				</div>
			</div>
		</div>
	</div>
</div>
<%@ include file="/user/group/main/schedule.jsp" %>
<%@ include file="/user/group/delete.jsp" %>
</body>
</html>