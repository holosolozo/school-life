<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
    <head>
        <title>로그인&회원가입 </title>
        <meta charset="EUC-KR">
        <link rel="stylesheet" href="loginstyle.css">
    </head>
    <body>
    <% session.invalidate(); %>
        <div class="wrap">
            <div class="form-wrap">
                <div class="button-wrap">
                    <div id="btn"></div>
                    <button type="button" class="togglebtn" onclick="login()">Login</button>
                    <button type="button" class="togglebtn" onclick="register()">Join</button>
                </div>
                <div class="social-icons"> 
                	<!-- 뭐넣징.. -->
                    <img src="img/logo.png" alt="=슬기로운 학교생활">    
                </div>
                
                <!-- 로그인 -->
                <form method="post" id="login" action="loginAction.jsp" class="input-group">
                    <div class="form-group">
                    <input type="text" name="userID" class="input-field" placeholder="UserID" required>
                    </div>
                    <div class="form-group">
                    <input type="password" name="userPassword" class="input-field" placeholder="Password" required>
                    </div>
                    <div>
                    <br>
                    <p style="color:gray;"><small>Thank you for visiting.</small></p>
                    <br>
                    </div>
                    <input type="submit" class="submit" value="LOGIN">
                </form>
                
                
                <!-- 회원가입 -->
                <form id="register" method="post" action="joinAction.jsp" class="input-group">
                    <div class="form-group">
                    <input type="text" name="userName" class="input-field" placeholder="User name" >
                    </div>
                    <div class="form-group">
                    <input type="text" name="userID" class="input-field" placeholder="UserID" >
                    </div>
                    <div class="form-group">
                    <input type="password" name="userPassword" class="input-field" placeholder="Password" >
                    </div>
                    <div class="form-group">					
					<input type="text" name="userMail" class="input-field" placeholder="Email@mail.com">
                    </div>
                    <div>
                    <br>
                    </div>
                    <div class="form-group">                    
                    <input type="submit" class="submit" value="JOIN">
                	</div>
                </form>
            </div>
        </div>
        <script>
            var x = document.getElementById("login");
            var y = document.getElementById("register");
            var z = document.getElementById("btn");
            
            
            function login(){
                x.style.left = "50px";
                y.style.left = "450px";
                z.style.left = "0";
            }

            function register(){
                x.style.left = "-400px";
                y.style.left = "50px";
                z.style.left = "110px";
            }
        </script>
    </body>
</html> 