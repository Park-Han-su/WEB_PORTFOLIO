<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
<title>Insert title here</title>
</head>
<body>
	<!-- Contact 리스트 -->
	<section class="page-section">
		<div class="container">
		<c:forEach var="list" items="${test }">
			<div class="card gedf-card">
				<div class="card-header">
					<div class="d-flex justify-content-between align-items-center">
						<div class="d-flex justify-content-between align-items-center">
							<div class="mr-2">
								<img class="rounded-circle" width="45"
									src="https://picsum.photos/50/50" alt="">
							</div>
							<div class="ml-2">
								<div class="h5 m-0"><c:out value="${list.name }"></c:out> </div>
								<div class="h7 text-muted"><c:out value="${list.phone }"></c:out></div>
							</div>
						</div>
						<div>
							<div class="dropdown">
								<button class="btn btn-link dropdown-toggle" type="button"
									id="gedf-drop1" data-toggle="dropdown" aria-haspopup="true"
									aria-expanded="false">
									<i class="fa fa-ellipsis-h"></i>
								</button>
								<div class="dropdown-menu dropdown-menu-right"
									aria-labelledby="gedf-drop1">
									<form action='<c:url value="/contact/delete?seq=${list.seq}&${_csrf.parameterName}=${_csrf.token}"></c:url>' id="delete" method="post">
										<p class="dropdown-item" onclick="document.getElementById('delete').submit();">삭제</p>
									</form>
								</div>
							</div>
						</div>
					</div>

				</div>
				<div class="card-body">
					<div class="text-muted h7 mb-2">
						<p><fmt:formatDate value="${list.reg_date }" pattern="yyyy/ MM/ dd/ HH:MM"/></p>
					</div>
					<a class="card-link" href="#">
						<h5 class="card-title"><c:out value="${list.email}"></c:out></h5>
					</a>

					<p class="card-text" style="white-space: pre;"><c:out value="${list.message }"></c:out></p>
				</div>
				<div class="card-footer">
				</div>
			</div>
			<br>
		</c:forEach>
		</div>
	</section>
	
	
</body>
</html>