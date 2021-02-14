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
	<div class="page-section">
		<div class="container">
			<c:forEach var="boardDetail" items="${detail}">
			<script>
				console.log('${boardDetail.name}');
			</script>
			<form action='modify/check?${_csrf.parameterName}=${_csrf.token}' method="post" enctype="multipart/form-data">
				<div class="form-group">
					<label for="exampleFormControlInput1">제목</label> <input type="text"
						class="form-control" id="exampleFormControlInput1" name="title"
						value="${boardDetail.title }">
				</div>
				
				<div class="form-group">
					<label for="exampleFormControlInput1">작성자</label> <input type="text"
						class="form-control" id="exampleFormControlInput1" name="name"
						value="${boardDetail.name }" readonly>
				</div>
				
				<div class="form-group">
					<label for="exampleFormControlTextarea1">내용</label>
					<textarea class="form-control" 
						rows="10" name="content">${boardDetail.content }</textarea>
					<input type="file" name="file1">
				</div>
				
				<input type="hidden" name="seq" value="${boardDetail.seq }">
				<button type="submit" class="btn btn-info float-right" style="margin-left:5px;">수정하기</button>
				<input type="button" onclick="javascript:history.back();" class="btn btn-primary btn-xs" id="boardListBtn" style="float: right;" value="돌아가기">
			</form>
			</c:forEach>
		</div>
	</div>
</body>
</html>