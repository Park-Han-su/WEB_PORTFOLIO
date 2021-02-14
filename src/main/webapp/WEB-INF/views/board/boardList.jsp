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
	<!-- 전체 리스트 출력 -->
	<section class="page-section">
		<div class="container">
			<div class="table-responsive">
				<table class="table table-hover">
					<thead>
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>작성자</th>
							<th>등록일</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="boardList" items="${boardList}">
							<tr>
								<td width="15%"><c:out value="${boardList.seq }"></c:out></td>
								<td width="50%"><a href='detail?seq=${boardList.seq }'><c:out value="${boardList.title }"></c:out></a></td>
								<td width="15%"><c:out value="${boardList.name}"></c:out></td>
								<td width="25%"><fmt:formatDate value="${boardList.reg_date}" pattern="yyyy/ MM/ dd/ HH:MM" /></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
		<div class="container">
			<div class="row">
				<div class="col">
				
					<!-- 글작성 -->
					<div class="form-row float-right">
						<sec:authorize access="isAuthenticated()">
							<button class="btn btn-primary" id="advanced-set-submit" onclick="location.href='<c:url value="/board/write"></c:url>'" >작성</button>
						</sec:authorize>
					</div>
					
					<!-- 검색창 -->
					<div class="form-group row justify-content-center">
						<div class="w100" style="padding-right: 10px">
							<select class="form-control form-control-sm" name="searchType" id="searchType">
								<option value="title">제목</option>
								<option value="content">본문</option>
								<option value="writer">작성자</option>
							</select>
						</div>
						<div class="w300" style="padding-right: 10px">
							<input type="text" class="form-control form-control-sm" name="keyword" id="keyword">
						</div>
						<div>
							<button class="btn btn-sm btn-primary" name="btnSearch" id="btnSearch">검색</button>
						</div>
					</div>
					
					<!-- 페이징 -->
					<div class="justify-content-center">
						<ul class="pagination justify-content-center">
							<c:if test="${page.pageNo > 1 and keyword eq null}">
								<li class="page-item"><a class="page-link" href="list?pageNo=${page.pageNo-1 }">Previous</a></li>
							</c:if>
							<c:forEach var="pNo" begin="1" end="${page.pageCnt }">
									<c:choose>
										<c:when test="${keyword != null}">
											<li class="page-item"><a class="page-link" href="list?pageNo=${pNo }&searchType=${searchType }&keyword=${keyword}">${pNo}</a></li>
										</c:when>	
										<c:otherwise>
										<li class="page-item"><a class="page-link" href="list?pageNo=${pNo }">${pNo}</a></li><br>
										</c:otherwise>
									</c:choose>
							</c:forEach>
							<c:if test="${page.pageNo < page.pageCnt and keyword eq null }">
								<li class="page-item"><a class="page-link" href="list?pageNo=${page.pageNo+1 }">Next</a></li>
							</c:if>
							<c:if test="${keyword != null}">
								<li class="page-item "><a class="page-link float-right" href="list?">전체목록</a>
							</c:if>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</section>
</body>

<c:url var="listUrl" value="/board/list"></c:url>

<script type="text/javascript">

	$('#btnSearch').on('click', function(e) {
		e.preventDefault();
		var url = "${listUrl}";
		url = url + "?searchType=" + $('#searchType').val();
		url = url + "&keyword=" + $('#keyword').val();
		location.href = url;
	});
</script>

</html>