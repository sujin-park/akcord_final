<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/common/template/head_include.jsp"%>
<link href='/akcord_project/user/group/css/fullcalendar.css' rel='stylesheet' />
<link href='/akcord_project/user/group/css/fullcalendar.print.css' rel='stylesheet' media='print' />
<script src='/akcord_project/js/lib/moment.min.js' charset="utf-8"></script>
<script src='/akcord_project/js/lib/jquery-ui.min.js' charset="utf-8"></script>
<script src='/akcord_project/js/lib/fullcalendar.js' charset="utf-8"></script>
<script>
	$(document).ready(function() {
		
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
				var title = prompt('Event Title:');
				var content = prompt('Event Content');
				var eventData;
				if (title) {
					eventData = {
						title: title,
						content:content,
						start: start,
						end: end
					};
					$('#calendar').fullCalendar('renderEvent', eventData, true); // stick? = true
				}
				$('#calendar').fullCalendar('unselect');
			},
			editable: true,
			eventLimit: true, // allow "more" link when too many events
			events: [
				{
					title: 'All Day Event',
					start: '2017-05-01'
				},	
				{
					title: 'Long Event',
					start: '2017-05-07',
					end: '2017-05-10'
				},
				{
					id: 999,
					title: 'Repeating Event',
					start: '2017-05-09T16:00:00'
				},
				{
					id: 999,
					title: 'Repeating Event',
					start: '2017-05-16T16:00:00'
				},
				{
					title: 'Conference',
					start: '2017-05-11',
					end: '2017-05-13'
				},
				{
					title: 'Meeting',
					start: '2017-05-12T10:30:00',
					end: '2017-05-12T12:30:00'
				},
				{
					title: 'Lunch',
					start: '2017-05-12T12:00:00'
				},
				{
					title: 'Meeting',
					start: '2017-05-12T14:30:00'
				},
				{
					title: 'Happy Hour',
					start: '2017-05-12T17:30:00'
				},
				{
					title: 'Dinner',
					start: '2017-05-12T20:00:00'
				},
				{
					title: 'Birthday Party',
					start: '2017-05-13T07:00:00'
				},
				{
					title: 'Click for Google',
					url: 'http://google.com/',
					start: '2017-05-28'
				}
			]
		});
		
		$('#deletegroup').click(function(){
			$('#groupD').modal();
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
		padding-top:20px;
	}
	#calendar {
		margin: 0 auto;
		display: inline;
		width: 60%;
		float:left;
	}
</style>
<%@ include file="/common/template/nav.jsp" %>
<div class="container">
	<div class="row">
		<div class="col-sm-6" style="border:5px;">
			<button type="button" class="btn btn-sm btn-danger">그룹방 글 목록</button>
			<button type="button" class="btn btn-sm btn-danger">그룹원 관리</button>
			<button type="button" class="btn btn-sm btn-default" id="deletegroup">그룹 탈퇴</button>
		</div>
	</div>
	<div class="row" style="margin:30px;">
		<div id='calendar' class="col-sm-8"></div>
		<div class="col-sm-4">채팅부분</div>
	</div>
</div>
<%@ include file="/user/group/delete.jsp" %>
</body>
</html>

