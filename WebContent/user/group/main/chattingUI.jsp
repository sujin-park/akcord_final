<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div id="_chatbox" style="display: none; height:80px; ">
   <fieldset>
       <div id="messageWindow"></div>
       <br /> 
       <input id="inputMessage" class="form-control" type="text" onkeyup="enterkey()" />
       <input type="submit" value="send" onclick="send()" class="btn btn-warning" />
    </fieldset>
</div>