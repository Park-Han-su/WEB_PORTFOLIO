<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<title>home2</title>
</head>
        <!-- Contact Section-->
        <section class="page-section">
            <div class="container col-lg-3">
	            <div class="jumbotron" style="padding-top: 20px;">
					<form  action="./login-processing" method="post">
						<h3 style="text-align: center;">로그인</h3>
						<div class="form-group">
							<input type="text" class="form-control" placeholder="email" name="email" maxlength="30" required="required">
						</div>
						<div class="form-group">
							<input type="password" class="form-control" placeholder="password" name="password" maxlength="20" required="required">
						</div>
						<input name="${_csrf.parameterName}" type="hidden" value="${_csrf.token}"/>
						<input type="submit" class="btn btn-primary form-control" value="로그인">
						<div>
							<c:if test="${not empty SPRING_SECURITY_LAST_EXCEPTION}">
								<font color="red">
									<p>${sessionScope["SPRING_SECURITY_LAST_EXCEPTION"].message}</p> 
									<c:remove var="SPRING_SECURITY_LAST_EXCEPTION" scope="session" />
								</font>
							</c:if>
						</div>
					</form>
				</div>
         	</div>
        </section>
    </body>
</html>

