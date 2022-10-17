<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
  	<%@include file="/views/head/linkhead.jsp"%>
    <%@include file="/views/head/headlogin.jsp"%>
    <title>Index</title>
</head>

<body>
    <div class="main">
        <!-- Sign up form -->
 
    
        <section class="signup">
            <div class="container">
                <div class="signup-content">
                    <div class="signup-form">
                        <h2 class="form-title">Sign up</h2>
                        <form method="POST" action="/register" class="register-form" id="register-form">
                            <div class="form-group">
                                <label for="name"><i class="fas fa-user"></i></label>
                                <input type="text" name="tentk" id="name" placeholder="Your Name" />
                            </div>
                            <div class="form-group">
                                <label for="email"><i class="fas fa-envelope"></i></label>
                                <input type="email" name="email" id="email" placeholder="Your Email" />
                            </div>
                            <div class="form-group">
                                <label for="pass"><i class="fas fa-lock"></i></label>
                                <input type="password" name="matkhau" id="pass" placeholder="Password" />
                            </div>
                            <div class="form-group">
                                <label for="re-pass"><i class="fas fa-key"></i></label>
                                <input type="password" name="re_pass" id="re_pass" placeholder="Repeat your password" />
                            </div>
                            <div class="form-group">
                                <input type="checkbox" name="agree" id="agree-term" class="agree-term"/>
                                <label for="agree-term" class="label-agree-term"><span><span></span></span>I agree all
                                    statements in <a href="#" class="term-service">Terms of service</a></label>
                            </div>
                            <div class="form-group form-button">
                                <input type="submit" name="signup" id="signup" class="form-submit" value="Register" />
                            </div>
                        </form>
                        <!-- Thông báo -->
                        <c:if test="${!messageS.contains('thành công')}">
                        	<div class="px-2 text-center text-white bg-danger">${messageS}</div>
                        </c:if>
                        <c:if test="${messageS.contains('thành công')}">
                        	<div class="px-2 text-center text-white bg-success">${messageS}</div>
                        </c:if>
                    </div>
                    <div class="signup-image">
                        <img src="<c:url value='../images/Slide/login.png'/>" alt="sing up image">
                    </div>
                </div>
            </div>
        </section>

        <!-- Sing in  Form -->
        <section class="sign-in">
            <div class="container">
                <div class="signin-content">
                    <div class="signin-image">
                        <img src="<c:url value='../images/Slide/4.jpg'/>" alt="sing up image">
                    </div>

                    <div class="signin-form">
                        <h2 class="form-title">Sign in</h2>
                        <form method="POST" action="/login" class="register-form" id="login-form">
                            <div class="form-group">
                                <label for="your_name"><i class="fas fa-user"></i></label>
                                <input type="text" name="your_name" id="your_name" placeholder="Your Name" value="hung123"/>
                            </div>
                            <div class="form-group">
                                <label for="your_pass"><i class="fas fa-lock"></i></label>
                                <input type="password" name="your_pass" id="your_pass" placeholder="Password" value="Hung123"/>
                            </div>
                            <div class="form-group">
                                <input type="checkbox" name="remember" id="remember" class="agree-term" />
                                <label for="remember" class="label-agree-term"><span><span></span></span>Remember
                                    me</label>
                            </div>
                            <div class="form-group form-button">
                                <input type="submit" name="signin" id="signin" class="form-submit" value="Log in" />
                            </div>
                        </form>
                        <!-- Thông báo -->
                        <div class="px-2 text-center text-white bg-danger">${message}${param.error}</div>
                        
                        <div class="social-login">
                            <span class="social-label">Or login with</span>
                            <ul class="socials">
                                <li><a href="#"><i class="fa-brands fa-facebook"></i></a></li>
                                <li><a href="#"><i class="fa-brands fa-google"></i></a></li>
                                <li><a href="#"><i class="fa-brands fa-twitter"></i></a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </section>

    </div>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
    <script src="<c:url value='/OwlCarousel2-2.3.4/dist/owl.carousel.min.js'/>"></script>
    <script src="<c:url value='/css/script.js'/>"></script>
</body>

</html>