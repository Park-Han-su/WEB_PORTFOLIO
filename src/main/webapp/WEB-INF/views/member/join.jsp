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
			<div class="py-5 text-center">
				<img class="d-block mx-auto mb-4"
					src='<c:url value="/resources/img/spring.png"></c:url>'
					alt="" width="72" height="72">
				<h2>회원가입</h2>
			</div>
			<div class="col-md-12 order-md-1">
				<h4 class="mb-3">회원정보</h4>
				<br>
				<form action="join" method="post">
					<div class="mb-3">
						<label for="email">이메일</label>
						<input type="email" id="checkEmail" class="form-control" name="email" placeholder="you@example.com" maxlength="30" required/>
						<div class="mb-3" id="checkMsg" style="display:none;"></div>
					</div>
					<br>
					<div class="mb-3">
						<label for="password">비밀번호</label> 
						<input type="password" class="form-control" name="password" required/>
					</div>
					<br>
					<div class="mb-3">
						<label for="firstName">이름</label>
						 <input type="text" class="form-control" name="name" required/>
					</div>
		
					<div class="mb-4">
					<button class="btn btn-primary btn-lg btn-block" type="submit">가입하기</button>
					</div>
					<div class="mb-4">
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> 
					</div>
				</form>
			</div>
		</div>
	</div>
	
	<script type="text/javascript">
		$("#checkEmail").on("blur",function (){
			var email = $('[name=email]').val();
			var regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
			if(email != "" && email.match(regExp) != null){
				$.ajax({
			        type : 'get'
			        ,url : './emailCheck'
			        ,dataType : 'json'
			        ,data :{'email' : email}
			    }).done(function(data){
			    	if(data){
			    		$('#checkMsg').html('<p style="color:red">이미 사용중인 E-MAIL 입니다.</p>');
			    		$('#checkMsg').css('display','block');
			    	}else{
			    		$('#checkMsg').html('<p style="color:blue">사용 가능한 E-MAIL 입니다.</p>');
			    		$('#checkMsg').css('display','block');
			    	}
			    })
			}else{
				alert('올바른 email 주소를 입력해주세요');
			}
		});
	</script>
</body>
</html>