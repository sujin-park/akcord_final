<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg" style="width:40%">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close btn-danger" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">새 그룹방 개설</h4>
      </div>
      <div class="modal-body">
      	<div class="row">
	      	<form class="form-horizontal" action="" method="post" name="createG">
		      		<div class="form-group">
	                  <label for="concept" class="col-sm-3 control-label">전공</label>
	                  	<div class="col-sm-8">
	                  	<select class="form-control" id="status" name="status">
	                          <option value="컴퓨터공학과">컴퓨터공학과</option>
	                          <option value="산업공학과">산업공학과</option>
	                      </select>
	                  	</div>
	                </div>
	                 <div class="form-group">
	                      <label for="description" class="col-sm-3 control-label">그룹방 이름</label>
	                      <div class="col-sm-8">
	                          <input type="text" class="form-control" id="groupName" name="groupName">
	                      </div>
	                 </div> 
	                 <div class="form-group">
	                      <label for="status" class="col-sm-3 control-label">최대 인원</label>
	                      <div class="col-sm-8">
	                          <select class="form-control" id="count" name="count">
	                              <option value="4">4</option>
	                              <option value="8">8</option>
	                          </select>
	                      </div>
	                 </div>
	                 <div class="form-group">
	                      <label for="amount" class="col-sm-3 control-label">그룹방 소개</label>
	                      <div class="col-sm-8">
	                          <textarea  class="form-control" id="comment" name="comment" rows="5" cols="46.5"></textarea>
	                      </div>
	                 </div>
               </form>
            </div>
      	</div>
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" id="creategroup">CREATE</button>
        <button type="button" class="btn btn-default" data-dismiss="modal">CLOSE</button>
      </div>
    </div>
  </div>
</div>