<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/common/template/head_include.jsp" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>My Library</title>
    <script src="${root }/admin/Chart.js"></script>
    <!-- <script src="/cafeproject/js/bootswatch.js"></script> -->

	
	<!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond./cafeproject/js/1.4.2/respond.min.js"></script>
    <![endif]-->


<%@ include file="/common/template/nav.jsp" %>
<%@ include file="/common/public.jsp" %>

<!-- Main Navigation ========================================================================================== -->
<!-- <div class="navbar navbar-default navbar-fixed-top">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-responsive-collapse">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#">My Library</a>
        </div>
        <div class="navbar-collapse collapse navbar-responsive-collapse">
            <ul class="nav navbar-nav">
                <li id="amember">
                	<a href="#" class="dropdown-toggle" data-toggle="dropdown">회원</a>
                	<ul class="dropdown-menu">
                        <li><a href="#">회원 리스트</a></li>
                    </ul>
                </li>
                <li id="anotice">
                	<a href="#" class="dropdown-toggle" data-toggle="dropdown">공지사항</a>
                	<ul class="dropdown-menu">
                        <li><a href="#">공지사항 리스트</a></li>
                    </ul>
                </li>
                <li id="aboard">
                	<a href="#" class="dropdown-toggle" data-toggle="dropdown">게시판</a>
                	<ul class="dropdown-menu">
                        <li><a href="#">게시판형식생성</a></li>
                        <li><a href="#">카테고리생성</a></li>
                        <li><a href="#">게시판생성</a></li>
                    </ul>
                </li>
                <li id="apoll">
                	<a href="#" class="dropdown-toggle" data-toggle="dropdown">POLL</a>
                	<ul class="dropdown-menu">
                        <li><a href="#">poll생성</a></li>
                        <li><a href="#">이전 poll 리스트</a></li>
                    </ul>
                </li>
                <li id="astats">
                	<a href="#" class="dropdown-toggle" data-toggle="dropdown">통계</a>
                	<ul class="dropdown-menu">
                        <li><a href="#">회원 거주지 분포</a></li>
                        <li><a href="#">게시판별 등록글</a></li>
                        <li><a href="#">등록글별 댓글</a></li>
                    </ul>
                </li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <li><a href="/cafeproject/">로그아웃 (userId)</a></li>
            </ul>
        </div>
    </div>
</div>
 -->


<!-- Container ======================================================================================= -->
<section>
<div class="container">
    <div class="row">

<!-- Center ======================================================================================= -->
        <div class="col-sm-12"></div>
        <div class="col-sm-12"></div>
        <div class="col-sm-12"></div>
        
        <div class="col-sm-12" style="padding-top: 20px;">     
			
			<div class="page-header" style="padding-top: 20px;">
			    <h2 id="container">온라인투표</h2>
			</div>
			<div class="pull-right">
				<a class="pill" data-toggle="modal" data-target="#pollWriteModal" data-backdrop="static">
           		<button type="button" id="newBtn" class="btn btn-sm btn-default" data-backdrop="static">투표생성</button>
           		</a>
           	</div>
           	
           	<script type="text/javascript">
 
            $(document).ready(function() {
            	//네비바 체크
            	/* $('#apoll').addClass('active'); */
			
				// Request Method :: GET 
				/* 
				$.ajax({
				 type: 'GET', 
				 dataType: 'json',
				 url: '${root}/poll/list.akcord',
				 data: “id=”+id.val()+”&password=”+password.val()+”&name=”+name.val(),
				 
				});
            	 */
            	//결과보기
            	$('.btn.btn-xs.btn-primary').click(function() {
							
            		var seq = $(this).parents('td').siblings().eq(0).text();
            		alert(seq + "번 투표 결과보기 이동!!!");
            		
            		/* $('#pollResultModal').on('show.bs.modal', function(event) {
              		});          	
              		$('#pollResultModal').modal(); */
            		$('#seq').attr('value', seq);
            		//$(location).attr('href','${root}/poll/modify.akcord?seq='+seq);
            		$.ajax({
       				 type: 'GET', 
       				 dataType: 'json',
       				 url: '${root}/poll/result.akcord?seq='+seq,
       				 //data : {'data', data},
       				 
       				 success : function(data){
       				 	resultModal(data);
       					 }
       				});
              		
            	});
            	 
           function resultModal(cdata){
    			$('#pollResultModal').on('show.bs.modal', function(event) {
    				var data=new Array('FFB6C1', 'FFCFDA ','FFD0CD','FAEB78 ','FFE650','FFC6A5','FF9696','6EE5A3','73E1E1',
    						'96F56E','84FB84','52E252','8C8CFF','64AAFF','5AD2FF');
    				//txt초기화
    				//var len = data.pollresult.length;
        			var modal = $(this)

        			var label = [];
        			var value=[];
        			var bgcolor=[];

        			for(var i=0;i<cdata.pollresult.length;i++) {
				        	label[i] = cdata.pollresult[i].content;
				        	value[i] = cdata.pollresult[i].cnt;
				        	bgcolor[i]= "#"+data[Math.floor(Math.random()*data.length)];
				        	
			     }
        			var ctx = document.getElementById("myChart").getContext("2d");
      				var myChart=new Chart(ctx, {
      					type: 'bar',
      				    data: {
      				        labels: label,
      				        datasets: [{
      				            label: cdata.Subject,
      				            data:value,
      				            backgroundColor: bgcolor,
      				            borderColor: bgcolor,
      				            borderWidth: 1
      				        }]
      				    },
      				    options: {
      				        scales: {
      				            yAxes: [{
      				                ticks: {
      				                    beginAtZero:true
      				                }
      				            }]
      				        }
      				    }
      				});
        			modal.find('#pollcontent').val(myChart);
      				modal.find('#pollsubject').val(cdata.Subject);
    		});
    			
    			$('#pollResultModal').modal();
            }
 
	//투표수정
	$('.btn.btn-xs.btn-info').click(function() {
    	var seq = $(this).parents('td').siblings().eq(0).text();

		$('#seq').attr('value', seq);
		//$(location).attr('href','${root}/poll/modify.akcord?seq='+seq);
		$.ajax({
		 type: 'GET', 
		 dataType: 'json',
		 url: '${root}/poll/modify.akcord?seq='+seq,
		 //data : {'data', data},
		 
		 success : function(data){
			//getHidden(data);
			 upModal(data);

		 }
		});
	});
	
          //투표종료
        	$('.btn.btn-xs.btn-danger').click(function() {
        		var seq = $(this).parents('td').siblings().eq(0).text();
        		$(location).attr('href','${root}/poll/delete.akcord?seq='+seq);
        		alert(seq + "번 투표 종료!!!");
        	});
        	
        });
        
        function upModal(data){
			$('#pollResultModal').on('show.bs.modal', function(event) {
    			var modal = $(this)
      		  	modal.find('#startDay').val(data.StartDate);
        		modal.find('#endDay').val(data.EndDate);
        		modal.find('#charttype').val(data.ChartType);
        		modal.find('#question').val(data.Subject);
        		modal.find('#poll_id').val(data.poll_id);
        		for(var i=0;i<data.contlist.length;i++) {
        			var lab = $('<label class="col-sm-3"></label>');
            		var inp = $('<div class="col-sm-8">')
            					.append('<input type="text" name="answer" class="answerInp form-control" value="'+data.contlist[i]+'" readonly="readonly">');
            		modal.find('#answerDivM').append(lab).append(inp);
    			}
      		});          	
      		$('#pollModifyModal').modal();
		}
        
        
            </script>
            
			<div class="col-sm-12">
 				<div class="table-responsive">
 				   <form id="modifyForm" name="modifyForm">
 				<div id="attach_file_hdn"></div>	
			    <input type="hidden" name="seq" value="" id="seq">
			    <input type="hidden" name="" value="">
				<input type="hidden" name="" value="">
            		<table class="table table-hover">
                    	<colgroup>
                        <col width="80">
                        <col width="*">
                        <col width="80">
                        <col width="220">
                        <col width="220">
                    </colgroup>
                    <thead>
                    <tr><th colspan="5"></th></tr>
                    <tr>
                        <th class="text-center">번호</th>
                        <th class="text-center">질문</th>
                        <th class="text-center">참여수</th>
                        <th class="text-center">투표기간</th>
                        <th class="text-center">비고</th>
                    </tr>
                    </thead>
                 
                    <tbody class="notice_list">
                        <!--<tr><td colspan="5" class="text-center">가입한 회원이 없습니다.</td></tr>-->
                        <c:forEach var="list" items="${list}">
                        <tr data-seq="2">
                            <td class="text-center">${list.poll_id}</td>
                            <td class="subject">${list.subject}</td>
                            <td class="text-center">${list.count}</td>
                            <td class="text-center">${list.startDate} ~ ${list.endDate}</td>
                            <td class="etc text-center">
                            	<button type="button" id="pollResultBtn" class="btn btn-xs btn-primary" data-backdrop="static">결과보기</button>
            					<button type="button" id="pollModifyBtn" class="btn btn-xs btn-info" data-backdrop="static">기간변경</button>
            					<button type="button" id="pollStopBtn" class="btn btn-xs btn-danger" data-backdrop="static">투표종료</button>
                            </td>
                        </tr>
                        </c:forEach>
                        <tr data-seq="1">
                            <td id="seq" class="text-center">13</td>
                            <td class="subject">가장 좋아하는 과목은 무엇입니까??</td>
                            <td class="text-center">1867</td>
                            <td class="text-center">17.06.01 ~ 17.06.15</td>
                            <td class="etc text-center">
                            	<button type="button" id="pollResultBtn" class="btn btn-xs btn-primary" data-backdrop="static">결과보기</button>
            					<button type="button" id="pollModifyBtn" class="btn btn-xs btn-info" data-backdrop="static">기간변경</button>
            					<button type="button" id="pollStopBtn" class="btn btn-xs btn-danger" data-backdrop="static">투표종료</button>
                            </td>
                        </tr>
                        </tbody>
                        
                    </table>
                    </form>
                </div>
			</div>
        </div>
    
        <div class="col-sm-12" style="height: 5px;"></div>
        
        <div class="col-sm-12">
	        <form class="form-search">
	            <div class="input-group">
	                <input type="text" class="form-control" placeholder="제목">
	                <span class="input-group-btn">
	                    <button type="submit" class="btn btn-primary">검색</button>
	                </span>
	            </div>
	        </form>
		</div>
		
        <div class="col-sm-12" style="text-align: center;">
          	<ul class="pagination">
          		<li class="firstpage">
          			<a href="#" aria-label="Previous">
          				<span aria-hidden="true">최신</span>
          			</a>
		    	</li>
          		<li class="page" data-page="0">
          			<a href="#" aria-label="Previous">
          				<span aria-hidden="true">이전</span>
          			</a>
			    </li>
				<li class="page" data-page="1"><a href="#">1</a></li>
				<li class="page active" data-page="2"><a href="#">2</a></li>
				<li class="page" data-page="3"><a href="#">3</a></li>
				<li class="page" data-page="4"><a href="#">4</a></li>
				<li class="page" data-page="5"><a href="#">5</a></li>
				<li class="page" data-page="6"><a href="#">6</a></li>
				<li class="page" data-page="7"><a href="#">7</a></li>
				<li class="page" data-page="8"><a href="#">8</a></li>
				<li class="page" data-page="9"><a href="#">9</a></li>
				<li class="page" data-page="10"><a href="#">10</a></li>
				<li class="page" data-page="11">
	          		<a href="#" aria-label="Next">
	          			<span aria-hidden="true">다음</span>
	          		</a>
			    </li>
			    <li class="page" data-page="100">
	          		<a href="#" aria-label="Next">
	          			<span aria-hidden="true">마지막</span>
	          		</a>
			    </li>
			</ul>
       	</div>
</div>
</div>

<!-- 공지사항 작성 Modal -->

<script type="text/javascript">
var answer = new Array();	// 문항 내용을 담을 배열

$(document).ready(function() {
	var answerCount = 1;
	$('#answerPlusBtn').click(function() {
		var inp = $('<div class="col-sm-11">').append('<input type="text" name="answer" class="answerInp form-control" placeholder="문항">');
		var btn = $('<div class="col-sm-1">').append('<button type="button" class="answerMinusBtn btn btn-md btn-warning">문항제거</button>');
		$('<div id="answerD" class="col-sm-10">').append(inp).append(btn).appendTo('#answerDiv');
		answerCount++;
	});
	
	$(document).on('click', '.answerMinusBtn', function() {
		//$(this).parents('#answerD').css('border', '2px solid blue');
		$(this).parents('#answerD').remove();
		answerCount--;
	});
	
	$(document).on('click', '#writeBtn', function() {
		//http://naradesign.net/wp/2011/07/20/1663/ << 유효성검사
		if($('#startDay').val() > $('#endDay').val()) {
			alert("투표기간 오류!!");
			return;
		} else if(answerCount < 2) {
			alert("설문 문항 오류!!");
			return;
		}  else {
			answer = document.getElementsByClassName(".answerInp form-control");
			$('#makeForm').attr('method','post').attr('action','${root}/poll/make.akcord').submit();
		}
	});
});

</script>
<div id="pollWriteModal" class="modal fade" role="dialog">
	<div class="modal-dialog" style="width: 50%;">
	    <!-- Modal content-->
	    <div class="modal-content">
	    	<div class="modal-header">
	        	<button type="button" class="close" data-dismiss="modal">&times;</button>
	        	<h4 class="modal-title">투표생성</h4>
	      	</div>
	      	<div class="modal-body">
			    <form class="form-horizontal" action="" id="makeForm" name="makeForm">
			    	<fieldset>
			    	<div class="form-group">
				    	<label class="col-sm-3 control-label">투표기간</label>
	
	                    <div class="col-sm-8">
	                        <input type="date" name="startDate" id="startDay" class="form-control" placeholder="시작일">
	                        <input type="date" name="endDate" id="endDay" class="form-control" placeholder="종료일">
	                    </div>
	                </div>
	                <div class="form-group">
				    	<label class="col-sm-3 control-label">그래프형식</label>
	
	                    <div class="col-sm-8">
	                        <select id="charttype" name="chartType" class="form-control">
	                        	<option value="1">바차트
	                        	<option value="2">파이차트
	                        	<option value="3">꺽은선차트
	                        	<option value="4">라인차트
	                        	<option value="5">버블차트
	                        </select>
	                    </div>
	                </div>
			    	<div class="form-group">
				    	<label class="col-sm-3 control-label">주제</label>
	
	                    <div class="col-sm-8">
	                        <input type="text" name="subject" id="subject" class="form-control" placeholder="주제">
	                    </div>
	                </div>
			        <div class="form-group">
				    	<label class="col-sm-3 control-label">문항</label>
				    	
	
	                    <div class="col-sm-8">
	                    	<button type="button" id="answerPlusBtn" class="btn btn-md btn-warning">문항추가</button>
	                    </div>
	                </div>
	                <div id="answerDiv" class="form-group">
                    	<div id="answerD" class="col-sm-10">
	                    	<div class="col-sm-11">
	                        	<input type="text" id="answer" name="answer" class="answerInp form-control" placeholder="문항">
	                        </div>
	                        <div class="col-sm-1">
								<button type="button" class="answerMinusBtn btn btn-md btn-warning">문항제거</button>
							</div>
                        </div>
	                </div>
			        </fieldset>
			       <div id="attach_file_hdn"></div>	
			    <input type="hidden" name="answer" value="${answer}">
			    <input type="hidden" name="" value="">
				<input type="hidden" name="" value="">
			        
			    </form>
			</div>
	      	<div class="modal-footer">
	      		<button type="button" id="writeBtn" class="btn btn-info">투표생성</button>
	        	<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
	      	</div>
	    </div>
	</div>
</div>
</section>
<!-- 공지사항 보기 Modal -->

<div id="pollResultModal" class="modal fade" role="dialog">
	<div class="modal-dialog" style="width: 40%;">
	    <!-- Modal content-->
	    <div class="modal-content">
	    	<div class="modal-header">
	        	<button type="button" class="close" data-dismiss="modal">&times;</button>
	        	<h4 class="modal-title">투표결과</h4>
	      	</div>
	      	<div class="modal-body">
		    	<div class="row">
			    	<div class="col-sm-12" style="margin: 10px;">
				    	<label class="col-sm-2 control-label">제목</label>
		                        <input type="text" name="pollsubject" id="pollsubject" class="form-control" placeholder="주제"  value="">
		                        
	
	                    <div class="col-sm-10">
	                        <label id="subject" class="col-sm-12 control-label"></label>
	                    </div>
	                </div>
			        <div class="col-sm-12" style="margin: 10px;">
				    	<label class="col-sm-2 control-label">내용</label>
							<div style="width:65%">
      					  <div>
        		    <canvas id="myChart" height="350" width="350"></canvas>
        					</div>
  					  </div>
	                    <div class="col-sm-10">
	                        <label id="content" class="col-sm-12 control-label"></label>
	                    </div>
	                </div>
                </div>
			</div>
	      	<div class="modal-footer">
	        	<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
	      	</div>
	    </div>
	</div>
</div>

<!-- 공지사항 수정 Modal -->

<script type="text/javascript">
$(document).ready(function() {
	$(document).on('click', '#modifyBtn', function() {
		if($('#startDay').val() > $('#endDay').val()) {
			alert("투표기간 오류!!");
			return;
		} else {
			alert("투표수정!!!");
        	//투표 기간 변경 ㄱㄱ
			$('#dateForm').attr('method','post').attr('action','${root}/poll//modifydate.akcord').submit();
		}
	});
});
</script>
<div id="pollModifyModal" class="modal fade" role="dialog">
	<div class="modal-dialog" style="width: 50%;">
	    <!-- Modal content-->
	    <div class="modal-content">
	    	<div class="modal-header">
	        	<button type="button" class="close" data-dismiss="modal">&times;</button>
	        	<h4 class="modal-title">투표수정</h4>
	      	</div>
	      	<div class="modal-body">
			    <form class="form-horizontal" action="#" id="dateForm">
			    	<fieldset>
			    	<div class="form-group">
			    	    <div style="display:none" ><input type="text"  name="poll_id" id="poll_id" ></div>   
				    	<label class="col-sm-3 control-label">투표기간</label>
	
	                    <div class="col-sm-8">
	                        <input type="date" name="startDate" id="startDay" class="form-control" placeholder="시작일">
	                        <input type="date" name="endDate" id="endDay" class="form-control" placeholder="종료일">
	                    </div>
	                </div>
	                <div class="form-group">
				    	<label class="col-sm-3 control-label">그래프형식</label>
	
	                    <div class="col-sm-8">
	                        <select id="charttype" name="charttype" class="form-control">
	                        	<option value="1">바차트
	                        	<option value="2">파이차트
	                        	<option value="3">꺽은선차트
	                        	<option value="4">라인차트
	                        	<option value="5">버블차트
	                        </select>
	                    </div>
	                </div>
			    	<div class="form-group">
				    	<label class="col-sm-3 control-label">주제</label>
	
	                    <div class="col-sm-8">
	                        <input type="text" name="subject" id="question" class="form-control" placeholder="주제" readonly="readonly">
	                    </div>
	                </div>
			        <div class="form-group">
				    	<label class="col-sm-3 control-label">문항</label>
	                </div>
	                <div id="answerDivM" class="form-group"></div>
			        </fieldset>
			    </form>
			</div>
	      	<div class="modal-footer">
	      		<button type="button" id="modifyBtn" class="btn btn-info">투표수정</button>
	        	<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
	      	</div>
	    </div>
	</div>
</div>