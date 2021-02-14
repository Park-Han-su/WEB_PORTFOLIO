<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ include file="../common/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset = UTF-8" />
    <title></title>
</head>
<body>

<div class="page-section">
	<div class="container">
		<div id = "space" class="portlet-body chat-widget" style="overflow-y : auto; width:auto; width:500px; height:500px;">
		</div>
		
		<div class="form-group">
			<div class="form-group col-xs-8">
				<textarea style="height:80px;" id="message" class="form-control" placeholder="메세지를 입력하세요." maxlength="100" onkeydown="if(event.keyCode==13) return send()"></textarea>
			</div>
		</div>
	</div>
</div>
    
</body>

<script>
	
	window.onload = connect();
	
	<!-- spring security session property -->
	<sec:authentication property="principal" var="user"/>
			var webSocket;
	function connect(){
		wsUri = "ws://54.180.124.64:8080/portfolio";
	    webSocket = new WebSocket(wsUri+"/chat/websocket");
	    webSocket.onopen = onOpen;
	    webSocket.onclose = onClose;
	    webSocket.onmessage = onMessage;
	}
	function disconnect(){
		webSocket.close();
	}
	function send(){
		<sec:authorize access="isAuthenticated() and !isAnonymous()">
			var nickname = '${user.name}';
		    var msg = $('#message').val();
		    webSocket.send(nickname+":" + msg);
		    $('#message').val('');
		</sec:authorize>
	}
	function onOpen(){
		<sec:authorize access="isAuthenticated() and !isAnonymous()">
			var nickname = '${user.name}';
	   	    webSocket.send(nickname+ "님이 입장하셨습니다.");
		</sec:authorize>
	}
	function onMessage(e){
	    data = e.data;
	    chatroom = document.getElementById("space");
	    chatroom.innerHTML = chatroom.innerHTML + "<br>" + data;
	}
	function onClose(){
		webSocket.close();
	}
</script>

</html>