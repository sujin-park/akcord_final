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
            	
            	$('#searchBtn').click(function(){
    				$('#pg').val('1');
    				$('#word').val($('#sword').val());
    				$('#commonForm').attr('action','${root}/poll/list.akcord').submit();		
    			});  	  
    		  
    			$('#firstBtn').click(function(){
    				$('#pg').val('1');
    				$('#word').val('${query.word}');
    				$('#commonForm').attr('action', '${root}/poll/list.akcord').submit();
    			});
    			
    			$('.pagemove').click(function(){
    				$('#pg').val($(this).attr('data-page'));
    				$('#word').val('${query.word}');
    				$('#commonForm').attr('action', '${root}/poll/list.akcord').submit();
    			});
    			
    			$('#lastBtn').click(function(){
    				$('#pg').val($(this).attr('data-last'));
    				$('#word').val('${query.word}');
    				$('#commonForm').attr('action', '${root}/poll/list.akcord').submit();
    			});
            	
            	 
                     	//결과보기
            	$('.btn.btn-xs.btn-primary').click(function() {
							
            		var pseq = $(this).parents('td').siblings().eq(0).text();
            		
            		/* $('#pollResultModal').on('show.bs.modal', function(event) {
              		});          	
              		$('#pollResultModal').modal(); */
            		$('#pseq').attr('value', pseq);
            		//$(location).attr('href','${root}/poll/modify.akcord?pseq='+pseq);
            		$.ajax({
       				 type: 'GET', 
       				 dataType: 'json',
       				 url: '${root}/poll/result.akcord?pseq='+pseq,
       				 //data : {'data', data},
       				 
       				 success : function(data){
       				 
       					 resultModal(data);
       				 
       				 }
       				});
              		
            	});
           function resultModal(cdata){
        	   var myChart;
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
        	 
        			 $('#myChart').remove(); // this is my <canvas> element
        	      	  $('#graph-container').append('<canvas id="myChart"><canvas>');
        	      
        	      	
                  var ctx = document.getElementById("myChart").getContext("2d");
					if( cdata.ChartType == "pie"){
						myChart=new Chart(ctx, {
	      					type: 'pie',
	      				    data: {
	      				        labels: label,
	      				        datasets: [{
	      				            label: cdata.Subject,
	      				            data:value,
	      				          fillColor: bgcolor,
	      				        strokeColor: bgcolor,
	      				      pointColor: bgcolor,
	      				    backgroundColor:bgcolor
	      				        }]
	      				    },
	      				    options: {
	      				    	responsive: true
	      				    }
	      				});
					}
					else if( cdata.ChartType == "line"){
						myChart=new Chart(ctx, {
	      					type: 'line',
	      				    data: {
	      				        labels: label,
	      				        datasets: [{
	      				            label: cdata.Subject,
	      				        	data:value,
	      				        	 backgroundColor: '#FFB6C1',
	      		                    borderColor: '#FFB6C1',
	      				          fill: false,
	      				        }]
	      				    },
	      				  options: {
	      			        scales: {
	      			            yAxes: [{
	      			                stacked: true
	      			            }]
	      			        }
	      			    }
	      					});
						}
					
					else{
					myChart=new Chart(ctx, {
      					type: cdata.ChartType,
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
					}
        			modal.find('#pollcontent').val(myChart);
      				modal.find('#pollsubject').val(cdata.Subject);
    		});
    			
    			$('#pollResultModal').modal();
    			
            }

          //투표종료
        	$('.btn.btn-xs.btn-danger').click(function() {
        		var pseq = $(this).parents('td').siblings().eq(0).text();
        		$(location).attr('href','${root}/poll/delete.akcord?pseq='+pseq);
        		alert(pseq + "번 투표 종료!!!");
        	});
        	
        });
        
        function upModal(data){        	
        		$('#pollModifyModal').on('show.bs.modal', function(event) {
    			var modal = $(this)
      		  	modal.find('#startDate').val(data.StartDate);
        		modal.find('#endDate').val(data.EndDate);
        		modal.find('#chart_type').val(data.ChartType);
        		modal.find('#question').val(data.Subject);
        		modal.find('#poll_id').val(data.poll_id);
        		modal.find('#answerDivM').empty();
        		for(var i=0;i<data.contlist.length;i++) {        			
        			var lab = $('<label class="col-sm-3"></label>');
            		var inp = $('<div class="col-sm-8">')
            					.append('<input type="text" name="answer" class="answerInp form-control" value="'+data.contlist[i]+'" readonly="readonly">');
            		modal.find('#answerDivM').append(lab).append(inp);
    			}
      		});
        		
      		$('#pollModifyModal').modal();
      		
		}
        $(document).on('click','.btn.btn-xs.btn-info',function(){
         	var pseq = $(this).parents('td').siblings().eq(0).text();
        	//$(location).attr('href','${root}/poll/modify.akcord?pseq='+pseq);
        	$.ajax({
        	 type: 'GET', 
        	 dataType: 'json',
        	 url: '${root}/poll/modify.akcord?pseq='+pseq,
        	 //data : {'data', data},
        	 
        	 success : function(data){
        		 upModal(data);

        	 }
        	});
        });

            </script>
            
			<div class="col-sm-12">
 				<div class="table-responsive">
 				   <form id="modifyForm" name="modifyForm">
 				<div id="attach_file_hdn"></div>	
			    <input type="hidden" name="pseq" value="" id="pseq">
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
                        <tr data-pseq="2">
                            <td class="text-center">${list.poll_id}</td>
                            <td class="subject">${list.subject}</td>
                            <td class="text-center">${list.cnt}</td>
                            <td class="text-center">${list.startDate} ~ ${list.endDate}</td>
                            <td class="etc text-center">
                            	<button type="button" id="pollResultBtn" class="btn btn-xs btn-primary" data-backdrop="static">결과보기</button>
            					<button type="button" id="pollModifyBtn" class="btn btn-xs btn-info" data-pbtn="${list.poll_id}" data-backdrop="static">기간변경</button>
            					<button type="button" id="pollStopBtn" class="btn btn-xs btn-danger" data-backdrop="static">투표종료</button>
                            </td>
                        </tr>
                        </c:forEach>
                        
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
	                <input type="text" class="form-control" placeholder="제목"  id="sword" name="sword">
	                <span class="input-group-btn">
	                    <button type="button" class="btn btn-primary" id="searchBtn" data-pg="1">검색</button>
	                </span>
	            </div>
	        </form>
		</div>
		
       
       	<div align="center" style="clear:both;">
			${navigator.navigator}
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
	                        <select id="chart_type" name="chart_type" class="form-control">
	                        	<option value="1">막대그래프
	                        	<option value="2">파이그래프
	                        	<option value="3">라인그래프
	                        <!-- 	<option value="4">라인차트
	                             <option value="5">버블차트 -->
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
							<div style="width:100%">
      					  <div id="graph-container" >
        		    <canvas id="myChart" height="500" width="500"></canvas>
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
	$(document).on('click', '#modifyPollBtn', function() {
		if($('#startDay').val() > $('#endDay').val()) {
			alert("투표기간 오류!!");
			return;
		} else {
			alert("투표수정!!!");
        	//투표 기간 변경 ㄱㄱ
			$('#dateForm').attr('method','post').attr('action','${root}/poll/modifydate.akcord').submit();
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
			    <form class="form-horizontal" action="" id="dateForm" name="dateForm" >
			    	<fieldset>
			    	<div class="form-group">
			    	    <div style="display:none" ><input type="text"  name="poll_id" id="poll_id"  value=""></div>   
				    	<label class="col-sm-3 control-label">투표기간</label>
	
	                    <div class="col-sm-8">
	                        <input type="date" name="startDate" id="startDate" class="form-control" placeholder="시작일">
	                        <input type="date" name="endDate" id="endDate" class="form-control" placeholder="종료일">
	                    </div>
	                </div>
	                <div class="form-group">
				    	<label class="col-sm-3 control-label">그래프형식</label>
	
	                    <div class="col-sm-8">
	                        <select id="chart_type" name="chart_type" class="form-control">
	                        	<option value="1">막대그래프
	                        	<option value="2">파이그래프
	                        	<option value="3">라인그래프
	                        </select>
	                    </div>
	                </div>
			    	<div class="form-group">
				    	<label class="col-sm-3 control-label">주제</label>
	
	                    <div class="col-sm-8">
	                        <input type="text" name="subject" id="subject" class="form-control" placeholder="주제" readonly="readonly">
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
	      		<button type="button" id="modifyPollBtn" class="btn btn-info">투표수정</button>
	        	<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
	      	</div>
	    </div>
	</div>
</div>