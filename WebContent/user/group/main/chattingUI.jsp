<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div id="_chatbox" style="display: none; height:80px; margin-top:30px;">
   <fieldset>
       <div id="messageWindow" style="overflow:scroll; height:150px; width:300px;"></div>
       <br />
       <div class="col-sm-10">
	       <div class="input-group">
	       		<div class="input-group-btn">
	       		<input id="inputMessage" class="form-control" type="text" onkeyup="enterkey()" />
	       			<input type="submit" value="send" onclick="send()" class="btn btn-warning" />
	       		</div>
	       </div>
       </div>
    </fieldset>
</div>