<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/common/template/head_include.jsp" %>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Bootstrap 3, from LayoutIt!</title>

    <meta name="description" content="Source code generated using layoutit.com">
    <meta name="author" content="LayoutIt!">

    <link href="css/bootstrap.min.css" rel="stylesheet">
<%@ include file="/common/template/nav.jsp" %>
	<div class="container-fluid">
	<div class="row">
        <div class="col-sm-5">
            <h1>투표생성</h1>
            <div class="panel panel-default">
                <div class="panel-body form-horizontal payment-form">
                    <div class="form-group">
                        <label for="subject" class="col-sm-3 control-label">투표주제</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" id="subject" name="subject">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="startdate" class="col-sm-3 control-label">투표시작일</label>
                        <div class="col-sm-9">
                            <input type="date" class="form-control" id="startdate" name="startdate">
                        </div>
                    </div>
					 <div class="form-group">
                        <label for="enddate" class="col-sm-3 control-label">투표마감일</label>
                        <div class="col-sm-9">
                            <input type="date" class="form-control" id="enddate" name="enddate">
                        </div>
                    </div>   
                  <div class="form-group">
                        <label for="status" class="col-sm-3 control-label">그래프형식</label>
                        <div class="col-sm-9">
                            <select class="form-control" id="status" name="status">
                                <option>바그래프</option>
                                <option>파이그래프</option>
                                <option>도넛그래프</option>
                            </select>
                        </div>
                    </div> 
                    
                    <div class="form-group">
                        <label for="subject" class="col-sm-3 control-label">문항</label>
                        <div class="col-sm-9">
                            <input type="text" class="form-control" id="subject" name="subject">
                        </div>
                    </div>
                   
                    <div class="form-group">
                    	<div class="col-sm-6 text-center">
                    	</div>
                        <div class="col-sm-6 text-right">
                            <button type="button" class="btn btn-lg">
                                <span class="glyphicon glyphicon-plus"></span>문항추가하기
                            </button>
                       
                            <button type="button" class="btn btn-lg">
                                <span class="glyphicon glyphicon-minus"></span>문항제거하기
                            </button>
                        </div>
                    </div>
                </div>
            </div>            
        </div> 
	  </div>
	</div>
 <script src="js/jquery.min.js"></script>
 <script src="js/bootstrap.min.js"></script>
 <script src="js/scripts.js"></script>
</html>