<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="modal fade" id="plusmember" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg" style="width:40%">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close btn-danger" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">그룹원 초대</h4>
      </div>
     <div class="modal-body">
		<div class="row table-responsive">
			<table id="info" class="table table-bordered">
				<thead>
					<tr>
						<th>전공명</th>
						<th>아이디</th>
						<th>이름</th>
						<th>초대</th>
					</tr>
				</thead>
					<tbody id="tbodyselect" name="tbodyselect">
					<tr id="" name="">
						<td colspan="3">팔로우 할 사람을 검색하세요.</td>
						<td>
							<button type="button" class="btn btn-md btn-danger">
								<span class="glyphicon glyphicon-thumbs-up"></span>
							</button>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
      <div class="modal-footer">
      	<div class="row">
      		<div class="col-sm-6"></div>
      		<div class="input-group">
	      		<input type="text" class="form-control" size="25"  placeholder="아이디를 입력하세요">
	      		<div class="input-group-btn">
	        	<button type="button" class="btn btn-md btn-danger">검색</button>
	        	<button type="button" class="btn btn-default" data-dismiss="modal">CLOSE</button>
	        	</div>
        	</div>
        </div>
      </div>
    </div>
  </div>
</div>
