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
	<sec:authentication property="principal" var="user"/>
	<div class="page-section">
		<div class="container">
			<!-- spring security 사용시 파일 업로드 할때 action 에 토큰값 안보내주면 무한로그인창 ${_csrf.parameterName}=${_csrf.token} -->
			<form action='./insert?${_csrf.parameterName}=${_csrf.token}' method="post" enctype="multipart/form-data">
				<div class="form-group">
					<label for="exampleFormControlInput1">제목</label> <input type="text"
						class="form-control" id="exampleFormControlInput1" name="title" required="required">
				</div>
				<div class="form-group">
					<label for="exampleFormControlInput1">작성자</label> <input type="text"
						class="form-control" id="exampleFormControlInput1" name="writer" value='<c:out value="${user.name }"></c:out>' readonly>
				</div>
				<div class="form-group">
					<label for="exampleFormControlTextarea1">내용</label>
					<textarea class="form-control" rows="20" name="content" wrap="hard"></textarea>
					<input type="file" name="file1">
				</div>
				<input type="hidden" name="m_id" value='<c:out value="${user.code }"></c:out>'>
				<button type="submit" class="btn btn-info float-right" style="margin-left:5px;" >작성완료</button>
				<input type="button" onclick="javascript:history.back();" class="btn btn-primary btn-xs" id="boardListBtn" style="float: right;" value="돌아가기">
			</form>
		</div>
	</div>

</body>
</html>