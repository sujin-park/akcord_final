<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page session="true"%>
<link href='/akcord_project/user/group/css/chatting.css' rel='stylesheet' />
    <!-- 로그인한 상태일 경우와 비로그인 상태일 경우의 chat_id설정 -->
    <c:if test="${(user.name ne '') and !(empty user.id)}">
        <input type="hidden" value='${user.name }' id='chat_id' />
    </c:if>

      <div class="round hollow text-center">
           <a href="#" class="chatting"><span class="glyphicon glyphicon-comment" data-state="open"></span></a>
      </div>
<%@include file="/user/group/main/chattingUI.jsp" %>
<!--     <div id="_chatbox" style="display: none; height:80px;">
        <fieldset>
            <div id="messageWindow"></div>
            <br /> <input id="inputMessage" type="text" onkeyup="enterkey()" />
            <input type="submit" value="send" onclick="send()" />
        </fieldset>
    </div> -->
</body>
<script>
	$('.chatting').children().text('Open');
    $(".chatting").on({
        "click" : function() {
            if ($(this).children().attr('data-state') == "open") {
            	$(this).children().attr('data-state', 'close');
            	$(this).children().text('');
            	$(this).children().text('Close');
                $("#_chatbox").css("display", "block");
            } else if ($(this).children().attr('data-state') == "close") {
            	$(this).children().attr('data-state', 'open');
            	$(this).children().text('');
            	$(this).children().text('Open');
            	$("#_chatbox").css("display", "none");
                
            }
        }
    });
</script>
<script type="text/javascript">
	var state;
    var textarea = document.getElementById("messageWindow");
    var webSocket = new WebSocket('ws://192.168.0.4:80/akcord_project/broadcasting');
    var inputMessage = document.getElementById('inputMessage');
    
    
    webSocket.onerror = function(event) {
        onError(event)
    };
    webSocket.onopen = function(event) {
        onOpen(event)
    };
    webSocket.onmessage = function(event) {
        onMessage(event)
    };
    webSocket.onclose = function(event) {
        onClose(event)
    };
    
    
    function onMessage(event) {
        var message = JSON.parse(event.data);
        
        var sender = message.name;
       
/*         var ul = "";
        alert(message.users.length);
        for (i=0; i < message.users.length; i++) {
          ul += message.users[i] + "<br>";
        } */
   
	        
        var content = message.txt;
        if (content == "") {
            
        } else {
            if (content.match("/")) {
                if (content.match(("/" + $("#chat_id").val()))) {
                    var temp = content.replace("/" + $("#chat_id").val(), "(귓속말) :").split(":");
                    if (temp[1].trim() == "") {
                    } else {
                        $("#messageWindow").html($("#messageWindow").html() + "<p class='whisper'>"
                            + sender + content.replace("/" + $("#chat_id").val(), "(귓속말) :") + "</p>");
                    }
                } else {
                }
                
                
            } else if (content.match("채팅에 참여하였습니다"))  {
            	makelist(sender);
            	$("#messageWindow").html($("#messageWindow").html()
                        + "<p class='chat_content'>" + sender + content + "</p>");	
            	
            } else {
                    $("#messageWindow").html($("#messageWindow").html()
                        + "<p class='chat_content'>" + sender + " : " + content + "</p>");
                }
            } 
    }
	        
        
    function onOpen(event) {
        $("#messageWindow").html("<p class='chat_content'>" + $('#chat_id').val() +"님이 채팅에 참여하였습니다.</p>");
        makelist($('#chat_id').val());
        $('.userlist').html($('.userlist').html());
        send("in");
    }
    
    function onClose(event) {
    	send("out");
    	webSocket.close();
    }

    function onError(event) {
        alert(event.data);
    }
    
    function send(state) {
    	  var msg;
        if (state == "in") {
        	inputMessage.value = "님이 채팅에 참여하였습니다.";
/*         	  $("#messageWindow").html($("#messageWindow").html()
                     + "<p class='chat_content'>나 : " + inputMessage.value + "</p>");  */
            var userli = [];
            var index = 0;
            
            userli[index] = $('#chat_id').val();
            index += index + 1; 
            //alert(userli);
            msg = {
					type: "user",                    		 
    			    name: $("#chat_id").val(),
					users: userli, 
    			    txt: inputMessage.value
    			  };

        } else if (state == "out" ) {
        		inputMessage.value = "님이 퇴장하였습니다.";
        } else if (inputMessage.value == "") {
        	
        } else {
            $("#messageWindow").html($("#messageWindow").html()
                + "<p class='chat_content'>나 : " + inputMessage.value + "</p>");
            
        /*     var userli = [];
            var index = 0;
            
            userli[index] = $('#chat_id').val();
            index += index + 1; 
            alert(userli); */
            msg = {
					type: "user",                    		 
    			    name: $("#chat_id").val(),
					users: userli, 
    			    txt: inputMessage.value
    			  };
        }
        webSocket.send(JSON.stringify(msg));
        inputMessage.value = "";
    }
    //     엔터키를 통해 send함
    function enterkey() {
        if (window.event.keyCode == 13) {
            send("txt");
        }
    }
    
    function makelist(username) {
    	 $('.userlist').html($('.userlist').html() + "<p class='chat_content'>" + username+ "</p>");
    }
    //     채팅이 많아져 스크롤바가 넘어가더라도 자동적으로 스크롤바가 내려가게함
    window.setInterval(function() {
        var elem = document.getElementById('messageWindow');
        elem.scrollTop = elem.scrollHeight;
    }, 0);
</script>