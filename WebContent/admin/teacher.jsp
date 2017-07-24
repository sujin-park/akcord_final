<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/common/template/head_include.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>My Library</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">
    <script src="/akcord/js/lib/jquery.min.js"></script>
    <script src="/akcord/js/lib/bootstrap.min.js"></script>
    <!-- <script src="/cafeproject/js/bootswatch.js"></script> -->

	
	<!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond./cafeproject/js/1.4.2/respond.min.js"></script>
    <![endif]-->


<%@ include file="/common/template/nav.jsp" %>
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
<div class="container">
    <div class="row">

<!-- Center ======================================================================================= -->
        <div class="col-sm-12">
			<div class="page-header">
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
            	
            	//결과보기
            	$('.btn.btn-xs.btn-primary').click(function() {
            		var seq = $(this).parents('td').siblings().eq(0).text();
            		alert(seq + "번 투표 결과보기 이동!!!");
            		$('#pollResultModal').on('show.bs.modal', function(event) {
                		
              		});          	
              		$('#pollResultModal').modal();
            	});
            	
            	//투표수정
            	$('.btn.btn-xs.btn-info').click(function() {
            		var seq = $(this).parents('td').siblings().eq(0).text();
            		alert(seq + "번 투표 기간변경 이동!!!");
            		$('#pollModifyModal').on('show.bs.modal', function(event) {
            			var modal = $(this)
              		  	modal.find('#startDay').val('2017-07-01');
                		modal.find('#endDay').val('2017-07-25');
                		modal.find('#charttype').val('p');
                		modal.find('#question').val('질문이 나와요!!!!');
                		for(var i=1;i<5;i++) {
                			var lab = $('<label class="col-sm-3"></label>');
	                		var inp = $('<div class="col-sm-8">')
	                					.append('<input type="text" name="answer" class="answerInp form-control" value="답변문항' + i + '입니다." readonly="readonly">');
	                		modal.find('#answerDivM').append(lab).append(inp);
            			}
              		});          	
              		$('#pollModifyModal').modal();
            	});
            	
            	//투표종료
            	$('.btn.btn-xs.btn-danger').click(function() {
            		var seq = $(this).parents('td').siblings().eq(0).text();
            		alert(seq + "번 투표 종료!!!");
            	});
            	
            });
            </script>
            
			<div class="col-sm-12">
 				<div class="table-responsive">
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
                        <tr data-seq="2">
                            <td class="text-center">2</td>
                            <td class="subject">이번 여름 휴가지로 가고싶은곳은?</td>
                            <td class="text-center">3258</td>
                            <td class="text-center">17.07.01 ~ 17.07.30</td>
                            <td class="etc text-center">
                            	<button type="button" id="pollResultBtn" class="btn btn-xs btn-primary" data-backdrop="static">결과보기</button>
            					<button type="button" id="pollModifyBtn" class="btn btn-xs btn-info" data-backdrop="static">기간변경</button>
            					<button type="button" id="pollStopBtn" class="btn btn-xs btn-danger" data-backdrop="static">투표종료</button>
                            </td>
                        </tr>
                        <tr data-seq="1">
                            <td class="text-center">1</td>
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

<!-- 공지사항 작성 Modal -->

<script type="text/javascript">
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
		alert(">>>> " + $('.answerInp').length);
		if($('#startDay').val() > $('#endDay').val()) {
			alert("투표기간 오류!!");
			return;
		} else if(answerCount < 2) {
			alert("설문 문항 오류!!");
			return;
		} else {
			alert("투표생성!!!");
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
			    <form class="form-horizontal" action="#">
			    	<fieldset>
			    	<div class="form-group">
				    	<label class="col-sm-3 control-label">투표기간</label>
	
	                    <div class="col-sm-8">
	                        <input type="date" id="startDay" class="form-control" placeholder="시작일">
	                        <input type="date" id="endDay" class="form-control" placeholder="종료일">
	                    </div>
	                </div>
	                <div class="form-group">
				    	<label class="col-sm-3 control-label">그래프형식</label>
	
	                    <div class="col-sm-8">
	                        <select id="charttype" class="form-control">
	                        	<option value="b">바차트
	                        	<option value="p">파이차트
	                        	<option value="g">꺽은선차트
	                        	<option value="l">라인차트
	                        	<option value="b">버블차트
	                        </select>
	                    </div>
	                </div>
			    	<div class="form-group">
				    	<label class="col-sm-3 control-label">주제</label>
	
	                    <div class="col-sm-8">
	                        <input type="text" id="question" class="form-control" placeholder="주제">
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
	                        	<input type="text" name="answer" class="answerInp form-control" placeholder="문항">
	                        </div>
	                        <div class="col-sm-1">
								<button type="button" class="answerMinusBtn btn btn-md btn-warning">문항제거</button>
							</div>
                        </div>
	                </div>
			        </fieldset>
			    </form>
			</div>
	      	<div class="modal-footer">
	      		<button type="button" id="writeBtn" class="btn btn-info">투표생성</button>
	        	<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
	      	</div>
	    </div>
	</div>
</div>

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
	
	                    <div class="col-sm-10">
	                        <label id="subject" class="col-sm-12 control-label"></label>
	                    </div>
	                </div>
			        <div class="col-sm-12" style="margin: 10px;">
				    	<label class="col-sm-2 control-label">내용</label>
	
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
			    <form class="form-horizontal" action="#">
			    	<fieldset>
			    	<div class="form-group">
				    	<label class="col-sm-3 control-label">투표기간</label>
	
	                    <div class="col-sm-8">
	                        <input type="date" id="startDay" class="form-control" placeholder="시작일">
	                        <input type="date" id="endDay" class="form-control" placeholder="종료일">
	                    </div>
	                </div>
	                <div class="form-group">
				    	<label class="col-sm-3 control-label">그래프형식</label>
	
	                    <div class="col-sm-8">
	                        <select id="charttype" class="form-control">
	                        	<option value="b">바차트
	                        	<option value="p">파이차트
	                        	<option value="g">꺽은선차트
	                        	<option value="l">라인차트
	                        	<option value="b">버블차트
	                        </select>
	                    </div>
	                </div>
			    	<div class="form-group">
				    	<label class="col-sm-3 control-label">주제</label>
	
	                    <div class="col-sm-8">
	                        <input type="text" id="question" class="form-control" placeholder="주제" readonly="readonly">
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