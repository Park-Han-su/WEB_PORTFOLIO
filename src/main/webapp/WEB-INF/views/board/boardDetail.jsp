<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<!-- spring security session property -->
	<sec:authentication property="principal" var="user" />
		
	<!-- 게시판 상세보기 -->
	<section class="page-section">
		<div class="container">
			<table class="table table-hover center-blcok">
				<c:forEach var="board" items="${detail }">
					<thead>
					<!-- Board Content -->
						<tr>
							<th scope="col" class="align-middle" style="background-color: #ececf6; width: 15%;">작성자</th>
							<td scope="col" style="width: 35%;">${board.name }</td>
							<th scope="col" class="align-middle" style="background-color: #ececf6; width: 15%;">작성일</th>
							<td scope="col" style="width: 35%;"><fmt:formatDate value="${board.reg_date}" pattern="yyyy/ MM/ dd/ HH:MM" /></td>
						</tr>
					</thead>
					<thead>
						<tr>
							<th scope="col" class="align-middle" style="background-color: #ececf6;">제목</th>
							<td scope="col" colspan="3" style="text-align: left;">${board.title }</td>
						</tr>
					</thead>
					<thead>
						<tr>
							<th scope="col" class="align-middle" style="background-color: #ececf6;">내용</th>
							<th scope="col" colspan="3" style="text-align:left; font-weight:normal; white-space: pre;">
							<p>${board.content }</p>
							<c:if test="${board.file1SName ne null }">
								<p><img width="200" height="200" src='<c:url value="/resources/upload/${board.file1SName }"></c:url>' alt="${board.file1Name }"></p>
							</c:if>
							</th>
						</tr>
						
						<!-- File  Download -->
						<c:if test="${board.file1SName ne null}">
							<tr>
								<th scope="col" class="align-middle" style="background-color: #ececf6;">첨부파일</th>
								<th scope="col" colspan="3" style="text-align: left;">
									<a href="download?file1Name=${board.file1Name }&file1SName=${board.file1SName }" 
										id='download' onclick="loginCheck()" style="color:#F39123;">${board.file1Name }</a>
								</th>
							</tr>
						</c:if>
					</thead>
				</c:forEach>
			</table>
		</div>
		
		<!-- Board Form Data -->
		<c:forEach var="board" items="${detail }">
			<input type="hidden" id="b_seq" value='<c:out value="${board.seq }"></c:out>'>
		</c:forEach>
		
		<!-- Reply -->
		<div class="container">
			<div class="comment_title" align="center"><h6>Comment</h6></div>
			<div class="commentList"></div>
		</div>

		<!-- Reply Form -->
		<div class="container">
			<table class="table table-bordered">
				<tr>
					<td>
						<div class="commentForm">
							<textarea class="form-control" rows="5" id="comment" placeholder="댓글을 입력하세요"></textarea>
							<button type="button" class="btn btn-primary btn-block" onclick="commentInsert()">저장</button>
						</div>
					</td>
				</tr>
			</table>
		</div>
		<!-- Button -->
		<div class="container">
			<c:forEach var="board" items="${detail}">
			<sec:authorize access="isAuthenticated() and !isAnonymous()">
	 			<sec:authentication property="principal" var="user"/>
	 				<c:if test="${user.code eq board.m_id}">
			 			<form action='<c:url value="/board/modify?seq=${board.seq}&${_csrf.parameterName}=${_csrf.token}"></c:url>' method="post">
							<input type="submit" class="btn btn-primary btn-xs" id="modifyBtn" style="float: left; margin-right: 3px;" value="수정하기"> 
			 			</form>
						<form action='<c:url value="/board/delete?seq=${board.seq}&${_csrf.parameterName}=${_csrf.token}"></c:url>' method="post" onsubmit="return confirm('정말 삭제 하시겠습니까?')">
							<input type="submit" class="btn btn-primary btn-xs" id="deleteBtn" style="float: left;" value="삭제하기"> 
						</form> 
	 				</c:if>
	 		</sec:authorize>		
			</c:forEach>
					<input type="button" onclick="javascript:history.back();" class="btn btn-primary btn-xs" id="boardListBtn" style="float: right;" value="목록">
		</div>
	</section>
	
<script type="text/javascript">

	var token = $("meta[name='_csrf']").attr("content");
	var header = $("meta[name='_csrf_header']").attr("content");

	//Comment List
	window.onload = readComment();
	
	<sec:authorize access="isAuthenticated() and !isAnonymous()">
		var userCode = '${user.code}';
		var m_name = '${user.name}';
	</sec:authorize>
	
	//Comment Insert
	
	function commentInsert(){
		var userCode = null;
		<sec:authorize access="isAuthenticated() and !isAnonymous()">
		var userCode = '${user.code}';
		</sec:authorize>
		
		if(userCode == null){
			alert('로그인후 이용 가능합니다.')
		}else if($('#comment').val() == '' ){
			alert('내용을 입력해주세요')
		}else{
			var url = './insertComment'
 			$.ajax({
				async : true
				,method: "post"
				,beforeSend: function(xhr){
					xhr.setRequestHeader(header, token);
				    }
				,url: url
				,data: JSON.stringify({
						m_id: userCode
						,b_seq: $('#b_seq').val()
						,comment:$('#comment').val()
						,m_name: m_name
					}),
					contentType : 'application/json'
				}).done(function(data){
					$('#comment').val('');
					readComment();
				})
		}
	}
	
	//Comment read
	
	function readComment(){
		var url = './readComment'
		var b_seq = $('#b_seq').val();
		$.ajax({
			type : "get"
			,url : url
			,dataType : "json"
			,data: {
				"b_seq" : b_seq
			}
		}).done(function(data){
			var a =''; 
			$.each(data,function(idx,data){
		        a += '<div style="border-top: 0.01rem solid;" class="commentInfo'+data.seq+'">';
		        a += '<img src="<c:url value="/resources/img/usericon.png"></c:url>" alt="photo" width="36" height="36">';
		        a += '<div class="comment_box">';
		        a += '<div class="comment_nick_box">';
		        a += '<div class="comment_nick_info">';
		        a += '<a href="#" role="button" aria-haspopup="true" aria-expanded="false" class="comment_nickname" style="font-size:13px; color:black; font-weight:bold;">'+data.m_name+'</a>';
		        a += '</div></div>';
		        a += '<div class="commentContent'+data.seq+'">';
		        a += '<p class="comment_text_view"><br>';
		        a += '<span class="text_comment" id="commentContent" style="font-size:13px;white-space: pre;">'+data.comment +'</span>';
		        a += '</p></div>';
		        a += '<div class="comment_info_box">';
		        a += '<span class="comment_info_date" style="font-size:13px">'+data.reg_date+'</span><br>';
		        a += '<sec:authorize access="isAuthenticated() and !isAnonymous()">'
		        a += '<a href="#" role="button" class="comment_info_button" style="font-size:13px; color:#2D55DC; font-weight:bold" onclick="commentUpdate('+data.seq+',\''+data.comment+'\',\''+data.m_id+'\')">수정</a>';
		        a += '&nbsp';
		        a += '<a href="#" role="button" class="comment_info_button" style="font-size:13px; color:#2D55DC; font-weight:bold" onclick="commentDelete('+data.seq+',\''+data.m_id+'\')">삭제</a>';
		        a += '</sec:authorize>'
		        a += '</div></div></div></div>';
			})
			$(".commentList").html(a);
		}).fail(function(err){
			console.log(err)
		});
	}
	
	//Comment Update
	function commentUpdate(seq,comment,m_id){
		
        <sec:authentication property="principal" var="user"/>
        <sec:authorize access="isAuthenticated() and !isAnonymous()">
    	var userCode = ${user.code};
	    var a ='';
	    if(userCode == m_id){
		    a += '<div class="input-group">';
		    a += '<input type="text" class="form-control" name="Modifycomment'+seq+'" value="'+comment+'"/>';
		    a += '<span class="input-group-btn"><button class="btn btn-default" type="button" onclick="commentUpdateProc('+seq+');">수정</button> </span>';
		    a += '</div>';
		    $('.commentContent'+seq).html(a);
	    }else{
	    	alert('내가 작성한 댓글만 수정할 수 있습니다.')
	    }
	    </sec:authorize>
	}
	
	function commentUpdateProc(seq){
	    var modifyComment = $('[name=Modifycomment'+seq+']').val();
	    $.ajax({
	        type : "post"
	        ,url : './modifyComment'
	        ,datatype : 'json'
	        ,data : {'comment' : modifyComment
	        		, 'seq' : seq}
	    	,beforeSend: function(xhr){
    		xhr.setRequestHeader(header, token);
    		}
	    }).done(function(data){
	    	alert('수정완료')
	    	if(data==1) readComment();
	    }).fail(function(){
	    	alert('수정실패')
	    })
	}
	
	//Comment Delete
	function commentDelete(seq,m_id){
        <sec:authentication property="principal" var="user"/>
        <sec:authorize access="isAuthenticated() and !isAnonymous()">
			var userCode = ${user.code};
			if(userCode == m_id){
				var check = confirm("정말 삭제 하시겠습니까?");
				if(check == true){
				    $.ajax({
				        type : 'post'
				        ,url : './deleteComment'
				        ,data :{'seq' :seq}
				    	,beforeSend: function(xhr){
				    		xhr.setRequestHeader(header, token);
				    	}
				    }).done(function(data){
				    	if(data==1) readComment();
				    }) .fail(function(err){
				    	alert(err)
				    });
				}else{
					readComment();
				}
			}else {
				alert('내가 작성한 댓글만 삭제할 수 있습니다.')
			}	
        </sec:authorize>
	}
	
</script>
</body>
</html>