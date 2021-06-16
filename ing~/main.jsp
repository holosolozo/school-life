<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<!DOCTYPE html>
 <html lang="ko">
  <head> <!-- meta 선언 -->

   <meta charset="UTF-8">
   <meta name="viewport" content="width=device-width, initial-scale=1.0"> 

   <!-- link 선언 --> 
   <link rel="stylesheet" href="style.css">
   <link rel="stylesheet" href="style_index.css"> 
   <style>
	body {
 		 font: 12px "Lucida Grande", Helvetica, Arial, sans-serif;
	}
  </style>
   <!-- script 선언 --> 
   <script src="https://kit.fontawesome.com/e1bd1cb2a5.js">
   </script> <script src="https://code.jquery.com/jquery-3.4.1.js">
   </script> <script src="script.js">
   </script>
    <title>슬기로운 학교생활</title>
     </head>
    
      <body> 

      <!-- 여기서부터 main메뉴바 -->
      <header>
       <div class="header_container">
        <div class="logo_container">
         <a href="./main.jsp"><img src="img/logo1.png" width="220px" height="50" alt="=슬기로운 학교생활"></a>
          </div> 
          <div class="nav_container" id="nav_menu"> 
          <div class="menu_container"> 
          <ul class="menu">
<li class="menu_1">
 <a class="menu_title">Study room</a>
 <ul class="menu_1_content">
  <li><a class="menu_index" href="write.jsp">My note</a></li> 
  <li><a class="menu_index" href="white.jsp">백색 소음</a></li>
 </ul></li> 
 <li class="menu_2">
 <a class="menu_title" href="timetable.jsp">시간표</a></li> 
<li class="menu_3"> 
 <a class="menu_title">성적관리</a>
 <ul class="menu_3_content">
 <li><a class="menu_index" href="ScoreCalc.jsp">성적 기입</a></li> 
 <li><a class="menu_index" href="grademain.jsp">학점 계산기</a></li>
 </ul> </li>
 <li class="menu_4"> 
 <a class="menu_title">정보공유</a>
 <ul class="menu_4_content">
 <li><a class="menu_index" href="board.jsp">자유 게시판</a></li> 
 </ul> </li>
  <li class="menu_5"> 
 <a class="menu_title">About us</a>
 <ul class="menu_5_content">
 <li><a class="menu_index" href="Team.jsp">팀 소개</a></li> 
 <li><a class="menu_index" href="Organization.jsp">조직도</a></li>
 <li><a class="menu_index" href="Tel.jsp">연락처</a></li>
 </ul> 
 </li> 
 </ul> 
 </div> 
 <div class="login_container">
 
 <%
	String userID = null;
	if(session.getAttribute("userID")!=null){
		userID = (String)session.getAttribute("userID");
	
%> 
  <ul class="login">
   		<li class="menu_login">
   			<a class="menu_title" href="LoginJoin.jsp">로그인&nbsp;&nbsp;<%=userID %></a>
  		</li> 
   </ul> 
   <%
	}
   %>
    <%
    if(session.getAttribute("userID")==null){
%> 
  <ul class="login">
   		<li class="menu_login">
   			<a class="menu_title" href="LoginJoin.jsp">로그인</a>
  		</li> 
   </ul> 
   <%
	}
   %>
   </div> 
   </div> 
   </div> 
   </header> 
<!-- 여기까지 main메뉴바 -->
   
   <div class="main_container"> 
   <div class="conA"> <!-- 무슨사진 넣징.. -->
   <div class="slide img1"><img width="100%" height="100%" src="img/slide1.png" alt="=슬기로운 학교생활"></div>
   <div class="slide img2"><img width="100%" height="100%" src="img/slide2.png" alt="=슬기로운 학교생활"></div>
   <div class="slide img3"><img width="100%" height="100%" src="img/slide3.PNG" alt="=슬기로운 학교생활"></div> 
   </div>
   <div class="conB"> 
   <div class="conB_title"> 
   <h3></h3> 
   </div> 
   <div class="conB_container">
   <div class="conB_small_container"> 
   <div class="conB_icon"> 
   <a href="grademain.jsp"><i class="fas fa-calculator icon"></i></a> 
   </div> <div class="conB_content"> 
   <h3>학점계산기</h3> 
   <p>바로가기</p> 
   </div> </div> 
   <div class="conB_small_container"> 
   <div class="conB_icon"> 
   <a href="white.jsp"><i class="fas fa-play-circle icon"></i></a>
   </div> <div class="conB_content"> 
   <h3>백색소음</h3> 
   <p>바로가기</p> 
   </div> </div> 
   <div class="conB_small_container"> 
   <div class="conB_icon"> 
   <a href="write.jsp"><i class="fas fa-sticky-note icon"></i> </a>
   </div> <div class="conB_content"> 
   <h3>메모장</h3> 
   <p>바로가기</p> 
   </div> </div> </div> </div> 
   <footer> <div class="footer_container"> 
   <div class="footA"> HoloSoloJo... </div> 
   <div class="footB"> Team Project </div> 
   </div> </footer> 
</body> 
</html>
