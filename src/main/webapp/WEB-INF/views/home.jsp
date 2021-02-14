<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>    
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<meta id="_csrf" name="_csrf" content="${_csrf.token}" /> 
<meta id="_csrf_header" name="_csrf_header" content="${_csrf.headerName}" />
<!-- Font Awesome icons (free version)-->
<script src="https://use.fontawesome.com/releases/v5.15.1/js/all.js"></script>
<!-- Google fonts-->
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css" />
<link href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic" rel="stylesheet" type="text/css" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="${CONTEXT }/css/styles.css" rel="stylesheet" />
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet">
<meta charset="UTF-8">
<title>home</title>
</head>
    <body id="page-top">
        <!-- Navigation-->
        <nav class="navbar navbar-expand-lg bg-secondary text-uppercase fixed-top" id="mainNav">
            <div class="container">
                <a class="navbar-brand js-scroll-trigger" href="#page-top">WEB Portfolio</a>
                <button class="navbar-toggler navbar-toggler-right text-uppercase font-weight-bold bg-primary text-white rounded" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                    Menu
                    <i class="fas fa-bars"></i>
                </button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav ml-auto">
                        <li class="nav-item mx-0 mx-lg-1"><a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href='<c:url value="main"></c:url>'>HOME</a></li>
                        <li class="nav-item mx-0 mx-lg-1"><a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="#contact">Contact</a></li>
                        <li class="nav-item mx-0 mx-lg-1"><a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href='<c:url value="chat"></c:url>'>Chat</a></li>
                        <li class="nav-item mx-0 mx-lg-1"><a class="nav-link py-3 px-0 px-lg-3 rounded" href='<c:url value="/board/list"></c:url>'>BOARD</a></li>
                        <sec:authorize access="isAnonymous()">
	                        <li class="nav-item mx-0 mx-lg-1"><a class="nav-link py-3 px-0 px-lg-3 rounded" href='<c:url value="/member/join"></c:url>'>JOIN</a></li>
	                        <li class="nav-item mx-0 mx-lg-1"><a class="nav-link py-3 px-0 px-lg-3 rounded" href='<c:url value="/member/login"></c:url>'>LOGIN</a></li>
                        </sec:authorize>
                        <sec:authorize access="isAuthenticated()">
                        <sec:authorize access="hasRole('ROLE_ADMIN')">
                        <li class="nav-item mx-0 mx-lg-1"><a class="nav-link py-3 px-0 px-lg-3 rounded" href='<c:url value="/contactList"></c:url>' >ADMIN</a></li>
                        </sec:authorize>
                       	 	<li class="nav-item mx-0 mx-lg-1"><a class="nav-link py-3 px-0 px-lg-3 rounded" href="#" onclick="document.getElementById('logout-form').submit();">LOGOUT</a></li>
                        </sec:authorize>
                    </ul>
                </div>
            </div>
        </nav>
        
        <!-- logout -->
        <form action='<c:url value="/logout"></c:url>' method="post" id="logout-form">
    	  <input name="${_csrf.parameterName}" type="hidden" value="${_csrf.token}"/>
        </form>
        
        <!-- Masthead-->
        <header class="masthead bg-color text-white text-center">
            <div class="container d-flex align-items-center flex-column">
                <!-- Masthead Avatar Image-->
                <img class="masthead-avatar mb-5" src="./resources/img/myphoto.jpg" alt=""/>
                <!-- Masthead Heading-->
                <h1 class="masthead-heading text-uppercase mb-0">신입 웹개발자</h1>
                <!-- Icon Divider-->
                <div class="divider-custom divider-light">
                    <div class="divider-custom-line"></div>
                    <div class="divider-custom-icon"><i class="fas fa-star"></i></div>
                    <div class="divider-custom-line"></div>
                </div>
                <!-- Masthead Subheading-->
                <p class="masthead-subheading font-weight-light mb-0">BACK-END</p>
                <br>
                <div class="skill">
                   <h6>JAVA, JSP, SPRING</h6>
                   <h6>MY-SQL, ORACLE</h6>
                   <h6>HTML5, CSS, JAVASCRIPT</h6>
                </div>
 
            </div>
        </header>
 
        <!-- Contact Section-->
        <section class="page-section" id="contact">
            <div class="container">
                <!-- Contact Section Heading-->
                <h2 class="page-section-heading text-center text-uppercase text-secondary mb-0">Contact Me</h2>
                <!-- Icon Divider-->
                <div class="divider-custom">
                    <div class="divider-custom-line"></div>
                    <div class="divider-custom-icon"><i class="fas fa-star"></i></div>
                    <div class="divider-custom-line"></div>
                </div>
                <!-- Contact Section Form-->
                <div class="row">
                    <div class="col-lg-8 mx-auto">
                        <!-- To configure the contact form email address, go to mail/contact_me.php and update the email address in the PHP file on line 19.-->
                            <div class="control-group">
                                <div class="form-group floating-label-form-group controls mb-0 pb-2">
                                    <label>Name</label>
                                    <input class="form-control" id="name" type="text" placeholder="Name" required="required" />
                                    <p id="nameValid" style="color:red;"></p>
                                </div>
                            </div>
                            <div class="control-group">
                                <div class="form-group floating-label-form-group controls mb-0 pb-2">
                                    <label>Email Address</label>
                                    <input class="form-control" id="email" type="email" placeholder="Email Address" required="required" />
                                    <p id="emailValid" style="color:red;"></p>
                                </div>
                            </div>
                            <div class="control-group">
                                <div class="form-group floating-label-form-group controls mb-0 pb-2">
                                    <label>Phone Number</label>
                                    <input class="form-control" id="phone" type="tel" placeholder="Phone Number" required="required" />
                                    <p id="phoneValid" style="color:red;"></p>
                                </div>
                            </div>
                            <div class="control-group">
                                <div class="form-group floating-label-form-group controls mb-0 pb-2">
                                    <label>Message</label>
                                    <textarea class="form-control" id="message" rows="5" placeholder="Message" required="required"></textarea>
                                    <p id="messageValid" style="color:red;"></p>
                                </div>
                            </div>
                            <br />
                            <div id="success"></div>
                            <div class="form-group"><button class="btn btn-primary btn-xl" id="sendMessageButton" type="submit">Send</button></div>
                    </div>
                </div>
            </div>
        </section>

        <!-- Copyright Section-->
        <div class="copyright py-4 text-center text-white">
            <div class="container"><small>Copyright © 2021-02</small></div>
        </div>
        <!-- Scroll to Top Button (Only visible on small and extra-small screen sizes)-->
        <div class="scroll-to-top d-lg-none position-fixed">
            <a class="js-scroll-trigger d-block text-center text-white rounded" href="#page-top"><i class="fa fa-chevron-up"></i></a>
        </div>
   
        <!-- Bootstrap core JS-->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Third party plugin JS-->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.min.js"></script>
        <!-- Contact form JS-->
        <!-- Core theme JS-->
        <script src="${CONTEXT }/js/scripts.js"></script>
        
        <script type="text/javascript">
        
        $('#sendMessageButton').on('click',function(){
	    	var token = $("meta[name='_csrf']").attr("content");
	    	var header = $("meta[name='_csrf_header']").attr("content");
	    	
	    	/* input value */
	    	var name = $('#name').val();
	    	var email = $('#email').val();
	    	var phone = $('#phone').val();
	    	var message = $('#message').val();
	    	
	    	/*정규표현식*/
	    	var regExpPhone = /^\d{3}-\d{3,4}-\d{4}$/;
	    	var regExpEmail = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
	    	var regExp = /^\s+|\s+$/g;
	    	
	    	if(!phone.match(regExpPhone)){
	    		$('#phoneValid').show();
	    		$('#phoneValid').text("ex)010-0000-0000");
	    	}else if(!email.match(regExpEmail)){
	    		$('#emailValid').show();
	    		$('#emailValid').text("ex)test@test.com");
	    	}else if(name==""){
	    		$('#nameValid').show();
	    		$('#nameValid').text("ex)홍길동");
	    	}else if(message==""){
	    		$('#messageValid').show();
	    		$('#messageValid').text("메세지를 작성해주세요");
	    	}else{
		    	var url = "./contact";
		    	$.ajax({
					async : true
					,method: "post"
					,beforeSend: function(xhr){
						xhr.setRequestHeader(header, token);
					    }
					,url: url
					,data: JSON.stringify({
							"name" : name
							,"email" : email
							,"phone" : phone
							,"message" : message
						}),
						contentType : 'application/json'
					}).done(function(data){
						if(data==1){
							alert('전송완료');
							$('#name').val(''); $('#nameValid').hide();    
							$('#email').val(''); $('#emailValid').hide();  
							$('#phone').val('');  $('#phoneValid').hide();  
							$('#message').val(''); $('#messageValid').hide();      
						}
					})
	    	}
	    	
	    	
        })
        
        </script>
    </body>
</html>