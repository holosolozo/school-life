<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

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
<meta charset="EUC-KR">
<title>JSP 게시판 웹 사이트</title>
<style>
    .table {
      border-collapse: collapse;
      border-top: 3px solid #168;
      width:80%;
      margin:20px;
      
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
<form action="grade.jsp" method="post">
  <center>
  <table class="table" row=100 cals=100>
    <caption>표 제목</caption>
    <tr><th width="300" align=center>과목명</th><th width="10">학점</th><th width="10">성적</th></tr>
    <tr><td><input type="text" size="50" style="width:100%; border: 0;"name="obj1"></td><td><input type="text" size="10" style="width:100%; border: 0;" name ="grade1"></td><td align=center><select name="record1">
    <option value=" "> </option>
    <option value="A+">A+</option>
    <option value="A0">A0</option>
    <option value="B+">B+</option>
    <option value="B0">B0</option>
    <option value="C+">C+</option>
    <option value="C0">C0</option>
    <option value="D+">D+</option>
    <option value="D0">D0</option>
    <option value="F">F</option>
</select></td></tr>
    <tr><td><input type="text" size="50" style="width:100%; border: 0;"name="obj2" ></td><td><input type="text" size="10" style="width:100%; border: 0;" name ="grade2"></td><td align=center><select name="record2">
    <option value=" "> </option>
    <option value="A+">A+</option>
    <option value="A0">A0</option>
    <option value="B+">B+</option>
    <option value="B0">B0</option>
    <option value="C+">C+</option>
    <option value="C0">C0</option>
    <option value="D+">D+</option>
    <option value="D0">D0</option>
    <option value="F">F</option>
</td></tr>
    <tr><td><input type="text" size="50" style="width:100%; border: 0;"name="obj3"></td><td><input type="text" size="10" style="width:100%; border: 0;" name ="grade3"></td><td align=center><select name="record3">
    <option value=" "> </option>
    <option value="A+">A+</option>
    <option value="A0">A0</option>
    <option value="B+">B+</option>
    <option value="B0">B0</option>
    <option value="C+">C+</option>
    <option value="C0">C0</option>
    <option value="D+">D+</option>
    <option value="D0">D0</option>
    <option value="F">F</option>
</td></tr>
    <tr><td><input type="text" size="50" style="width:100%; border: 0;"name="obj4"></td><td><input type="text" size="10" style="width:100%; border: 0;" name ="grade4"></td><td align=center><select name="record4">
    <option value=" "> </option>
    <option value="A+">A+</option>
    <option value="A0">A0</option>
    <option value="B+">B+</option>
    <option value="B0">B0</option>
    <option value="C+">C+</option>
    <option value="C0">C0</option>
    <option value="D+">D+</option>
    <option value="D0">D0</option>
    <option value="F">F</option>
</td></tr>
        <tr><td><input type="text" size="50" style="width:100%; border: 0;"name="obj5"></td><td><input type="text" size="10" style="width:100%; border: 0;" name ="grade5"></td><td align=center><select name="record5">
    <option value=" "> </option>
    <option value="A+">A+</option>
    <option value="A0">A0</option>
    <option value="B+">B+</option>
    <option value="B0">B0</option>
    <option value="C+">C+</option>
    <option value="C0">C0</option>
    <option value="D+">D+</option>
    <option value="D0">D0</option>
    <option value="F">F</option>
</td></tr>
       <tr><td><input type="text" size="50" style="width:100%; border: 0;"name="obj6"></td><td><input type="text" size="10" style="width:100%; border: 0;" name ="grade6"></td><td align=center><select name="record6">
    <option value=" "> </option>
    <option value="A+">A+</option>
    <option value="A0">A0</option>
    <option value="B+">B+</option>
    <option value="B0">B0</option>
    <option value="C+">C+</option>
    <option value="C0">C0</option>
    <option value="D+">D+</option>
    <option value="D0">D0</option>
    <option value="F">F</option>
</td></tr>
       <tr><td><input type="text" size="50" style="width:100%; border: 0;"name="obj7"></td><td><input type="text" size="10" style="width:100%; border: 0;" name ="grade7"></td><td align=center><select name="record7">
    <option value=" "> </option>
    <option value="A+">A+</option>
    <option value="A0">A0</option>
    <option value="B+">B+</option>
    <option value="B0">B0</option>
    <option value="C+">C+</option>
    <option value="C0">C0</option>
    <option value="D+">D+</option>
    <option value="D0">D0</option>
    <option value="F">F</option>
</td></tr>
       <tr><td><input type="text" size="50" style="width:100%; border: 0;"name="obj8"></td><td><input type="text" size="10" style="width:100%; border: 0;" name ="grade8"></td><td align=center><select name="record8">
    <option value=" "> </option>
    <option value="A+">A+</option>
    <option value="A0">A0</option>
    <option value="B+">B+</option>
    <option value="B0">B0</option>
    <option value="C+">C+</option>
    <option value="C0">C0</option>
    <option value="D+">D+</option>
    <option value="D0">D0</option>
    <option value="F">F</option>    
</td></tr>
    <tr><td colspan='3' align=center><input type="submit" value="계산">&nbsp;&nbsp;&nbsp;<input type="reset" value="초기화"></td></tr>
  </table>
  </center>  
  
</form>
</body>
</html>