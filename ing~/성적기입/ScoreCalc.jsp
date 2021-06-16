<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<jsp:useBean id="myscore" class="score.Scorebean"/>
<jsp:setProperty name="myscore" property="*"/>
<%myscore.ScoreCalc(); %>
<!DOCTYPE html>
<html>
<head>


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
<style>
	body {
 	  font: 15px "Lucida Grande", Helvetica, Arial, sans-serif;
	}
    .table {
      border-collapse: collapse;
      border-top: 3px solid #168;
      width:80%;
      
    }      
    .table th {
      color: #168;
      background: #f0f6f9;
    }
    .table th, .table td {
      padding: 10px;
      border: 1px solid #ddd;
    }
    .table th:first-child, .table td:first-child {
      border-left: 1;
    }
    .table th:last-child, .table td:last-child {
      border-right: 1;
    }
    .table tr td:first-child{
    }
    .table caption{caption-side: bottom; display: none;}
  </style>
<meta charset="EUC-KR">
<title>성적기입란</title>
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
<div class="score" align="center" style="margin:20px;">
      <form action="ScoreCalc2.jsp" method="post">     
	  <table class="table" row=100 cals=100>
			<tr>
				<th colspan="2">1학년</th>
				<th colspan="2">2학년</th>
				<th colspan="2">3학년</th>
				<th colspan="2">4학년</th>
			</tr>
			<tr>
				<th>1학기</th>
				<th>2학기</th>
				<th>1학기</th>
				<th>2학기</th>
				<th>1학기</th>
				<th>2학기</th>
				<th>1학기</th>
				<th>2학기</th>
			</tr>
			<tr>
				<th><input type=number id="num1_1" name="num1_1" step="any"></th>
				<th><input type=number id="num1_2" name="num1_2" step="any"></th>
				<th><input type=number id="num2_1" name="num2_1" step="any"></th>
				<th><input type=number id="num2_3" name="num2_2" step="any"></th>
				<th><input type=number id="num3_1" name="num3_1" step="any"></th>
				<th><input type=number id="num3_2" name="num3_2" step="any"></th>
				<th><input type=number id="num4_1" name="num4_1" step="any"></th>
				<th><input type=number id="num4_2" name="num4_2" step="any"></th>
			</tr>					
	  </table>
	  </div>
	
	  <center>
		  <input type="submit" id="submit" value="계산하기">
		  <input type="reset"  value="취소">
	  </center>
	  </form>
 	 <br>
 	 <br><br>
 	 <center>
 	 <form>
			  <table class="table" row=100 cals=100>
			  	<tr width= "200">
			  		<th>평점</th>
			  	</tr>
			  	<tr>
			  		<th> 0.0점/ 4.5 만점 </th>
			  	
			  	</tr>
			  </table>
	 </form>
	 </center>
	  	<div class = 'scorelist' align="center"> 
	  	<br><br>
	  	<h3 style="color:#168;">성적표</h3>
	 	<br>
		<iframe src = "Scorelist.jsp" width="80%" height="300" frameborder=0 framespacing=0 marginheight=0 marginwidth=0 scrolling=yes vspace=0></iframe>
	</div>  
</body>
</html>