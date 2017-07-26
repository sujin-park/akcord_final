<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="modal fade" id="joingroupM" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg" style="width:40%">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close btn-danger" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">그룹방 가입 요청</h4>
      </div>
      <div class="modal-body">
      	<div class="row">
      		<form class="form-horizontal" action="">
		      <div class="form-group">
	            <label for="concept" class="col-sm-3 control-label">전공</label>
	            <div class="col-sm-8">
	            	<select class="form-control" id="status" name="status">
	                    <option>컴퓨터공학과</option>
	                    <option>산업공학과</option>
	                </select>
	            </div>
	          </div>
	          <div class="form-group">
	              <label for="description" class="col-sm-3 control-label">그룹방 이름</label>
	              <div class="col-sm-8">
	                  <input type="text" class="form-control" id="name" name="name">
	              </div>
	          </div> 
	          <div class="form-group">
	              <label for="amount" class="col-sm-3 control-label">그룹방 소개</label>
	              <div class="col-sm-8">
	                  <textarea class="form-control" id="description" name="description" rows="5" cols="46.5"></textarea>
	              </div>
	          </div>
	          <div class="form-group">
	              <label for="status" class="col-sm-3 control-label">현재 인원</label>
	              <div class="col-sm-8" style="padding-top:10px;">
	                  <label for="count" class="count-label">4 명 /</label>
	                  <label for="count" class="count-label">8 명</label>
	              </div>
	          </div>
	       </form>
       </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-danger">JOIN</button>
        <button type="button" class="btn btn-default" data-dismiss="modal">CLOSE</button>
      </div>
    </div>
  </div>
</div>
